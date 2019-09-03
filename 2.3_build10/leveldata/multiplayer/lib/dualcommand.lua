dofilepath("player:racelist.lua")

function DualCommand_Init()
	currentRace = ""
	masterID = nil
	slaveID = nil
	masterRace = ""
	slaveRace = ""
	masterCount = 0
	slaveCount = 0

	-- Loop through players to find master and slave
	for playerIndex = 0, Universe_PlayerCount() - 1 do
		PlayerRaceID = Player_GetRace(playerIndex)
		currentRace = Race_ID[PlayerRaceID]
		if (currentRace == "2x_Hiigaran" or currentRace == "2x_Vaygr" or currentRace == "2x_Kushan" or currentRace == "2x_Taiidan") then
			-- The master must be a player and the slave must be an AI
			if Player_GetLevelOfDifficulty(playerIndex) == 0 then -- Player is a human
				masterID = playerIndex
				masterRace = currentRace
				masterCount = masterCount + 1
			else -- Player is an AI
				slaveID = playerIndex
				slaveRace = currentRace
				slaveCount = slaveCount + 1
			end
		end
	end

	-- Error logic 1
	if (masterRace ~= slaveRace) or (masterCount ~= slaveCount) or masterCount > 1 or slaveCount > 1 then
		-- Kill all players so they can setup Dual Command correctly next time
		for playerIndex = 0, Universe_PlayerCount() - 1 do
			Player_Kill(playerIndex)
		end
		Subtitle_Message( "Dual Command not setup correctly, see 2.3 Players Patch ReadMe for instructions.", 9999 )
	
	-- Master and slave are found
	elseif masterID and slaveID then

		-- Error logic 2
		if (AreAllied(masterID, slaveID)~=1) then
			-- Not allied
			-- Kill all players so they can setup Dual Command correctly next time
			for playerIndex = 0, Universe_PlayerCount() - 1 do
				Player_Kill(playerIndex)
			end
			Subtitle_Message( "Dual Command not setup correctly, see 2.3 Players Patch ReadMe for instructions.", 9999 )
		else
			-- Give all slave units to master
			SobGroup_CreateIfNotExist("SlaveShips")
			SobGroup_CreateIfNotExist("SlaveCollectors")
			
			SobGroup_SobGroupAdd("SlaveShips", "Player_Ships" .. slaveID)
			SobGroup_GetSobGroupDockedWithGroup("SlaveShips", "SlaveCollectors") -- Player_Ships does not include these collectors
			SobGroup_SobGroupAdd("SlaveShips", "SlaveCollectors")
			
			-- Switch owner
			SobGroup_SetSwitchOwnerFlag("SlaveShips", 0)
			SobGroup_SwitchOwner("SlaveShips", masterID)
			
			-- Give player double RUs
			Player_SetRU(masterID, Player_GetRU(masterID) * 2)
		end
	end
	
	Rule_Remove("DualCommand_Init")
end
