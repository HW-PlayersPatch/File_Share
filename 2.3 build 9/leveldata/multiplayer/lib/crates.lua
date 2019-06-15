--Crates--------------------------------------------------------

CrateExclusions =
{
		"Meg_Crate_HW1Container",
		"Meg_Relic_RUGenerator",				
}

CRATES_PlayerNearRadius = 800.0 --radius in which a player must get of the crate before receiving the crate item
CRATES_ExpiryTime	= 300.0 --life span of crate in seconds before it expires
CRATES_RandomLowDistance, CRATES_RandomHighDistance = 7000.0, 20000.0
CRATES_MaxRUsGiven, CRATES_MinRUsGiven = 1000, 500 --probabilities of getting any of these items (if less than or equal to the first value, else it moves onto the next value)
CRATES_AddACrateProb = 0.66
CRATES_GetAShip, CRATES_GetResearch, CRATES_GetRUs = 0.6, 0.8, 1.00 --crate dynamic data
CRATES_DetectPlayerIndex = 0
CRATES_NumberCrates = 0
CRATES_SpawnTime = {0,0,0,0,0,0,0,0,}
my_seed = {763261} --seed used for random functions except crates
crate_seed = {763261}	--seed used for random functions for crates, this should be the one and only instance of the default random() function being called
volumePositionCounter	= 0
Player_RestrictedBuilds	= {{},{},{},{},{},{},{},{},}

if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\crates.dat")
end

--See if a position is OK for spawning crate.
function CratePositionIsOK(posTable)
		local result = 1
		--create a volume at the given location
		Volume_AddSphere("CrateDetectVolumeTest" .. volumePositionCounter, posTable, CRATES_PlayerNearRadius * 2)
		--for each player...
		for iPlayer = 0, (Universe_PlayerCount() - 1) do
				--fill a sobgroup with all ships belonging to the player that are inside the volume
				SobGroup_FillSobGroupInVolume("CrateMothership", "Player_Ships" .. iPlayer, "CrateDetectVolumeTest" .. volumePositionCounter)
				--if the sobgroup is not empty, the result is failure
				if (SobGroup_Empty("CrateMothership") == 0) then
						result = 0
						break
				end
		end
		--delete the volume
		Volume_Delete("CrateDetectVolumeTest" .. volumePositionCounter)
		volumePositionCounter = volumePositionCounter + 1
		--return the result
		return result
end

--Figure out where to put a crate.
function GetBestCrateLocation()
		local universeSize = Universe_GetWorldBounds()
		local cratePosition, averageMSPosition, displacement, randPos = {0,0,0,}, {0,0,0,}, {}, {}
		local directionVectors = {{0,0,0,}, {0,0,0,}, {0,0,0,}, {0,0,0,}, {0,0,0,}, {0,0,0,}, {0,0,0,}, {0,0,0,},}
		local alivePlayers, length = 0, 0
		--do a pass to determine position of motherships and get average
		--for each other player find mothership
		for playerIndex = 0, (Universe_PlayerCount() - 1) do
				if (Player_IsAlive(playerIndex) == 1) then
						local playerPlusOne = playerIndex + 1
						local mothershipPosition = {0,0,0,}
						local theta, phi, radius = srandom(crate_seed, 360), srandom(crate_seed, 180), srandom(crate_seed, 1000)
						--keeps trying to add motherships or carriers to the sobgroup, then gets the position of the sobgroup.
						
						SobGroup_Clear("CrateMothership")
						
						crate_Motherships = nil
						crate_Carriers = nil
						
						dofilepath(PlayerRace_GetString(playerIndex, "path_crate_locate", ""))
						
						if (crate_Motherships ~= nil) then
							for k, sShip in crate_Motherships do
								Player_FillShipsByType("CrateMothership", playerIndex, sShip)
								if (SobGroup_Empty("CrateMothership") == 0) then
									break
								end
							end
							if (SobGroup_Empty("CrateMothership") == 1) then
								if (crate_Carriers ~= nil) then
									for k, sShip in crate_Carriers do
										Player_FillShipsByType("CrateMothership", playerIndex, sShip)
										if (SobGroup_Empty("CrateMothership") == 0) then
											break
										end
									end
								end
							end
							if (SobGroup_Empty("CrateMothership") == 0) then
									mothershipPosition = SobGroup_GetPosition("CrateMothership")
							end
						end
						
						crate_Motherships = nil
						crate_Carriers = nil
						
						--calculate a random position within a sphere
						displacement =
						{
								radius * cos(theta) * sin(phi),
								radius * cos(phi),
								radius * sin(theta) * sin(phi),
						}
						--We now have a position for a mothership, or at least some ship
						mothershipPosition = vaddV(mothershipPosition, displacement)
						averageMSPosition = vaddV(averageMSPosition, mothershipPosition)
						directionVectors[playerPlusOne][1] = mothershipPosition[1]
						directionVectors[playerPlusOne][2] = mothershipPosition[2]
						directionVectors[playerPlusOne][3] = mothershipPosition[3]
						alivePlayers = alivePlayers + 1
				end
		end
		--average position of players' motherships
		averageMSPosition = vdivide(averageMSPosition, alivePlayers)
		--for each other player
		for playerIndex = 0, (Universe_PlayerCount() - 1) do
				if (Player_IsAlive(playerIndex) == 1) then
						local playerPlusOne = playerIndex + 1
						local playerBounty = 1 --BOUNTY_PlayerBounties[playerPlusOne]
						--calculate the vector from the average position to this mothership's position
						local dest = vsubtractV(directionVectors[playerPlusOne], averageMSPosition)
						--calculate the length of the vector
						local length2 = sqrt(vsum(vpower(dest, 2)))
						--normalize the vector and multiply it by the inverse of the player's bounty
						dest = vdivide(dest, length2 * playerBounty * -1)
						--set the starting vector to favor the direction that weaker players are in
						cratePosition = vaddV(cratePosition, dest)
				end
		end
		--calulate the length of the crate's position
		length = sqrt(vsum(vpower(cratePosition, 2)))
		--normalize the crate's position
		cratePosition = vdivide(cratePosition, length)
		--add a large random element to the location
		randPos =
		{
				srandom(my_seed, CRATES_RandomLowDistance, CRATES_RandomHighDistance),
				srandom(my_seed, CRATES_RandomLowDistance, CRATES_RandomHighDistance),
				srandom(my_seed, CRATES_RandomLowDistance, CRATES_RandomHighDistance),
		}
		cratePosition = vmultiplyV(cratePosition, randPos)
		--add the crate's position to the motherships' average position
		cratePosition = vaddV(cratePosition, averageMSPosition)
		--add another large random element to the location
		randPos =
		{
				srandom(my_seed, universeSize[1] / -3, universeSize[1] / 3),
				srandom(my_seed, universeSize[2] / -3, universeSize[2] / 3),
				srandom(my_seed, universeSize[3] / -3, universeSize[3] / 3),
		}
		cratePosition = vaddV(cratePosition, randPos)
		--add a displacement to offset the location until it is valid. (Add a bit of randomness to the displacement vector.)
		local theta, phi, radius = srandomSet(crate_seed, 360, 180, 1000)
		displacement =
		{
				radius * cos(theta) * sin(phi),
				radius * cos(phi),
				radius * sin(theta) * sin(phi),
		}
		--keep adding the displacement until the location is OK
		while (CratePositionIsOK(cratePosition) == 0) do
				cratePosition = vaddV(cratePosition, displacement)				
		end
		--clip the location to the world bounds
		cratePosition = Universe_ClipToWorldBounds(cratePosition)
		return vfloor(cratePosition)
end

--Called when we need to actually spawn a crate.
function SelectivlyPlaceCrate()
		--for every player...
		for playerIndex = 0, (Universe_PlayerCount() - 1) do
				--if the player's crate spawn group is empty...
				if (SobGroup_Empty("CrateSpawnGroup" .. playerIndex) == 1) then
						local cratePosition = GetBestCrateLocation()						
						--create a crate detection volume at the best location
						Volume_AddSphere("CrateDetectVolume" .. playerIndex, cratePosition, CRATES_PlayerNearRadius)
						--spawn a neutral crate within the volume
						SobGroup_SpawnNewShipInSobGroup(-1, "Meg_Crate_HW1Container", "Crate", "CrateSpawnGroup" .. playerIndex, "CrateDetectVolume" .. playerIndex)
						--post a quick message (did not occur in HW1, an audio que would be nice too)
						Subtitle_Message_Handler("$14780", 2, "data:sound\\speech\\allships\\emperor\\STATUS_NEWCRATE_1", playerIndex)
						ping_c = Ping_AddSobGroup("", "circleandarrows", "CrateSpawnGroup"..playerIndex)	
						Ping_LabelVisible(ping_c,1)
						Ping_AddDescription(ping_c, 0, "$14781")   --Contents unknown
						--there's one more crate, now
						CRATES_NumberCrates = CRATES_NumberCrates + 1
						--record the time the crate was spawned
						CRATES_SpawnTime[playerIndex + 1] = Universe_GameTime()
						return
				end
		end
end

--Initialize crate stuff
function crates_init()
    crate_seed[1] = RandomIntMax(763261)
    SobGroup_Create("CrateMothership")
    Preload_Ship("Meg_Crate_HW1Container")
    for playerIndex = 0,(Universe_PlayerCount()-1) do
            SobGroup_Create("CrateSpawnGroup"..playerIndex)
    end
end

--Handles the spawning of crates.
function SpawnCratesRule()
		local Prob = srandom(my_seed)		
		if (Prob > CRATES_AddACrateProb) then
				SelectivlyPlaceCrate()
		end
end

--Choose what ship type to reward the player with.
function ChooseCrateRewardShip(iPlayer)
		local iCount, ShipName = 0, "", ""
		local Prob, Prob1, Prob2 = 1, srandom(my_seed), srandom(my_seed)
		
		crate_Ships = nil
		
		dofilepath(PlayerRace_GetString(iPlayer, "path_crate_ships", ""))
		
		if (crate_Ships ~= nil) then
			--for every class in the list of ships...
			for k, iClass in crate_Ships do
					local ClassProb = iClass.prob
					--check if the probablility for the class falls within a certain range
					if ((ClassProb <= Prob) and (ClassProb >= Prob1)) then
					Prob = ClassProb
							iCount = k
					end
			end
			Prob = 1
			--for every ship within the class...
			for k, iType in crate_Ships[iCount].types do
					local TypeProb = iType.prob
					local TypeName = iType.item
					local Localized= iType.name
					if (Localized == nil) then
						Localized = TypeName
					end
					--check if the ship's probability falls within a certain range
					if ((TypeProb <= Prob) and (TypeProb >= Prob2)) then
							Prob = TypeProb
							ShipName = TypeName
							LocalizedShipName = Localized
					end
			end
			--if the ship is restricted, then iterate through the function again
			if (IsBuildRestricted(iPlayer, ShipName) == 1) then
					ShipName, LocalizedShipName = ChooseCrateRewardShip(iPlayer)
			end
			
			crate_Ships = nil
			
			return ShipName, LocalizedShipName
		end
		
		return "", ""
end

--Choose a technology to give to the player.
function ChooseCrateRewardTech(iPlayer)
		research = nil
		
		dofilepath(PlayerRace_GetString(iPlayer, "path_research", ""))
		
		--for each research item in the research.lua
		for z, iCount in research do
				if (iCount.DoNotGrant ~= nil) then
					break
				end
										
				local HasAlready = Player_HasResearch(iPlayer, iCount.Name)
				local IsCurrently = Player_HasQueuedResearch(iPlayer, iCount.Name)
				local CanResearch = Player_CanResearch(iPlayer, iCount.Name)
				--check whether the player already has the research, is currently researching the research, or whether the research is restricted
				if ((HasAlready == 0) and (IsCurrently == 0) and (CanResearch == 1)) then
						local outName = iCount.Name
						local outDisplay = iCount.DisplayedName
						
						research = nil
						
						return outName, outDisplay
				end
		end
		
		research = nil
		
		return "", ""
end

--Gives a crate to a player.
function GivePlayerCrateReward(iPlayer, iVolume)				
		local prob = srandom(my_seed)
		if (prob <= CRATES_GetAShip) then
				local shipType, localizedShipName = ChooseCrateRewardShip(iPlayer)
				if (shipType ~= "") then
						--msg
						local subtitleMessage = Message_FormatFs("$14782", localizedShipName)
						Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\STATUS_GETCRATESHIP_1", iPlayer)
						--spawn the ship
						SobGroup_SpawnNewShipInSobGroup(iPlayer, shipType, "NewCrateShip", "Player_Ships" .. iPlayer, "CrateDetectVolume" .. iVolume)			
				end	
		--if a research item should be granted...
		elseif (prob <= CRATES_GetResearch and research == 1) then
				local techName, localizedTechName = ChooseCrateRewardTech(iPlayer)
				--if research name is not blank...
				if (techName ~= "") then
						--msg
						local subtitleMessage = Message_FormatFs("$14783", localizedTechName)
						Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\STATUS_GETCRATETECH_1", iPlayer)
						--grant the research item
						Player_GrantResearchOption(iPlayer, techName)						
				end
		--if resources should be granted...
		elseif (prob <= CRATES_GetRUs) then
				local RUs = srandom(my_seed, CRATES_MinRUsGiven, CRATES_MaxRUsGiven)
				--msg
				local subtitleMessage = Message_FormatFf("$14784", RUs)
				Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\STATUS_GETCRATERU_1", iPlayer)				
				--grant the resources
				Player_SetRU(iPlayer, Player_GetRU(iPlayer) + RUs)
				Stats_CratesRUs[iPlayer+1] = Stats_CratesRUs[iPlayer+1] + RUs				
		end		
end

--Handles checking if players get the crates.
function CheckCratesRule()
		--if there are any crates...
		if (CRATES_NumberCrates > 0) then
				--for every player...
				for playerIndex = 0, (Universe_PlayerCount() - 1) do
						--if the player's spawn group has a crate in it...
						if (SobGroup_Empty("CrateSpawnGroup" .. playerIndex) == 0) then
								--check if it's time for the crate to expire
								if ((Universe_GameTime() - CRATES_SpawnTime[playerIndex + 1]) > CRATES_ExpiryTime) then
										--kill the crate
										SobGroup_Despawn("CrateSpawnGroup" .. playerIndex)
										SobGroup_Clear("CrateSpawnGroup" .. playerIndex)
										Ping_LabelVisible(ping_c,0)
										Ping_Remove(ping_c)
										--kill the volume
										Volume_Delete("CrateDetectVolume" .. playerIndex)
										--there's one less crate, now
										CRATES_NumberCrates = CRATES_NumberCrates - 1
								--else, the crate is not dead yet
								else
										--for every player in a randomized list of players...
										for i, iPlayer in Universe_RandomPlayerList() do
												--check if the player has any ships in the crate's detection volume, then put the ships into a sobgroup
												SobGroup_FillSobGroupInVolume("CrateMothership", "Player_Ships" .. iPlayer, "CrateDetectVolume" .. playerIndex)
												--if the sobgroup is not empty...
												if (SobGroup_Empty("CrateMothership") == 0) then
														--remove any megaliths, etc.
														for k, shipType in CrateExclusions do
																SobGroup_RemoveType("CrateMothership", shipType)
														end
														--if the sobgroup is still not empty, then it means that the player's ship(s) has collided with crate's detection volume
														if (SobGroup_Empty("CrateMothership") == 0) then
																--award the crate to the player
																GivePlayerCrateReward(iPlayer, playerIndex)
																--kill the crate
																SobGroup_Despawn("CrateSpawnGroup" .. playerIndex)
																SobGroup_Clear("CrateSpawnGroup" .. playerIndex)
																Ping_LabelVisible(ping_c,0)
																Ping_Remove(ping_c)
																--kill the volume
																Volume_Delete("CrateDetectVolume" .. playerIndex)
																--there's one less crate, now
																CRATES_NumberCrates = CRATES_NumberCrates - 1
																break
														end
												end
										end
								end
						end
				end
		end
end

--Global variables used for the seeded random functions, below.
seedobja = 1103515.245
seedobjc = 12345
seedobjm = 4294967.295 --0x100000000

--Works like random(), except you provide your own seed as the first argument.
--The results are that maps appear the same each time you run the game, but desyncs may possibly be avoided.
function srandom(seedobj, fVal1, fVal2)
		seedobj[1] = mod(seedobj[1] * seedobja + seedobjc, seedobjm)
		local temp_rand = seedobj[1] / (seedobjm - 1)
		if (fVal2) then
				return floor(fVal1 + 0.5 + temp_rand * (fVal2 - fVal1))
		elseif (fVal1) then
				return floor(temp_rand * fVal1) + 1
		else
				return temp_rand
		end
end

--Adds the components of the second vector to the components of the first vector, then returns the resulting vector.
function vaddV(tVec1, tVec2)
		local tmpVec = {}
		for i, tTab in tVec2 do
				tmpVec[i] = tVec1[i] + tTab
		end
		return tmpVec
end

--Divides each vector component by some amount, then returns the resulting vector.
function vdivide(tVec, fVal)
		local tmpVec = {}
		for i, tTab in tVec do
				tmpVec[i] = tTab/fVal
		end
		return tmpVec
end

--Subtracts the components of the second vector from the components of the first vector, then returns the resulting vector.
function vsubtractV(tVec1, tVec2)
		local tmpVec = {}
		for i, tTab in tVec2 do
				tmpVec[i] = tVec1[i] + tTab
		end
		return tmpVec
end

--Returns the sum of all the vector's components.
function vsum(tVec1)
		local tmpVal = 0
		for i, tTab in tVec1 do
				tmpVal = tmpVal + tTab
		end
		return tmpVal
end

--Raises each vector component to the some power, then returns the new vector.
function vpower(tVec, fVal)
		local tmpVec = {}
		for i, tTab in tVec do
				tmpVec[i] = tTab^fVal
		end
		return tmpVec
end

--Multiplies the components of the first vector by the components of the second vector, then returns the resulting vector.
function vmultiplyV(tVec1, tVec2)
		local tmpVec = {}
		for i, tTab in tVec2 do
				tmpVec[i] = tVec1[i] * tTab
		end
		return tmpVec
end

--For each argument, returns a random float value between 0 and the argument. Seeded.
function srandomSet(seedobj, ...)
		local v = {}
		for i = 1, getn(arg) do
				v[i] = srandom3(seedobj, arg[i])
		end
		if arg[5] then
				return v[1], v[2], v[3], v[4], v[5]
		elseif arg[4] then
				return v[1], v[2], v[3], v[4]
		elseif arg[3] then
				return v[1], v[2], v[3]
		elseif arg[2] then
				return v[1], v[2]
		elseif arg[1] then
				return v[1]
		end
end

--Works just like random(), but can accept zero as an argument and always returns a float value, not an integer. Seeded.
function srandom3(seedobj, fVal1, fVal2)
		if (fVal2) then
				return fVal1 + srandom(seedobj) * (fVal2 - fVal1)
		elseif (fVal1) then
				return srandom(seedobj) * fVal1
		else
				return srandom(seedobj)
		end
end

function vfloor(tVec)
		local tmpVec = {}
		for i, tTab in tVec do
				tmpVec[i] = floor(tVec[i])
		end
		return tmpVec
end

--Returns a table containing the player indices in random order
function Universe_RandomPlayerList()
		local PlayerCount, PlayerTable, PlayerIndex = Universe_PlayerCount(), {}, 1
		while (getn(PlayerTable) < PlayerCount) do
				local PlayerRandom = srandom(my_seed, 0, PlayerCount - 1)
				local PlayerAlready = 0
				for i, k in PlayerTable do
						if (k == PlayerRandom) then
								PlayerAlready = 1
								break
						end
				end
				if (PlayerAlready == 0) then
						PlayerTable[PlayerIndex] = PlayerRandom
						PlayerIndex = PlayerIndex + 1
				end
		end
		return PlayerTable
end

--checks whether a buil item has been restricted
function IsBuildRestricted(iPlayerIndex, sbuildItem)
		for n, sCheckvs in Player_RestrictedBuilds[iPlayerIndex + 1] do
				if (sbuildItem == sCheckvs) then
						return 1
				end
		end
		return 0
end

--Returns true if the player is the local player
function Player_IsLocal(iPlayer)
		if (iPlayer == FE_GetCurrentPlayerIndex()) then
				return 1
		else
				return 0
		end
end

