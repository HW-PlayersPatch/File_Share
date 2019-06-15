--
--
-- Event Helper functions
--
function HW2_rgb( r, g, b)
        return r*(65536)+g*256+b;
end

function HW2_SubTitleEvent(actor, text, time)
        local newTable = {}
        newTable[1] = "Subtitle_Add("..actor..",\""..text.."\","..time..")";
        newTable[2] = "Subtitle_IsDone("..actor..")";
        return newTable;
end

function HW2_LocationCardEvent( text, time)
        local newTable = {}
        newTable[1] = "LocationCard(\""..text.."\","..time..")";
        newTable[2] = "LocationCard_IsDone()";
        return newTable;
end

function HW2_CameraRotated()
        local newTable = {}
        newTable[1] = "Camera_ResetRotated()";
        newTable[2] = "Camera_HasRotated()";
        return newTable;
end

function HW2_CameraPanned()
        local newTable = {}
        newTable[1] = "Camera_ResetPanned()";
        newTable[2] = "Camera_HasPanned()";
        return newTable;
end

function HW2_Wait( time )
        local newTable = {}
        newTable[1] = "wID = Wait_Start("..time..")";
        newTable[2] = "Wait_End( wID )";
        return newTable;
end

function HW2_PingCreateWithLabel( name, location )
        pingid = Ping_AddSobGroup( name, "anomaly", location )
        Ping_LabelVisible( pingid, 1 )
        return pingid
end

function HW2_PingCreateWithLabelPoint( name, point )
        pingid = Ping_AddPoint( name, "anomaly", point )
        Ping_LabelVisible( pingid, 1 )
        return pingid
end

function HW2_CreateEventPointerSobGroup( group )
	pointerID = EventPointer_AddSobGroup( group, HW2_rgb( 230, 230, 230), 0)
	return pointerID
end

function HW2_CreateEventPointerVolume( volume )
	pointerID = EventPointer_AddVolume( volume, HW2_rgb( 230, 230, 230), 0)
	return pointerID
end

function HW2_CreateEventPointerSubSystem( subsystem, group )
	pointerID = EventPointer_AddSubSystemFromSobGroup( subsystem, group, HW2_rgb( 230, 230, 230), 0)
	return pointerID
end

function HW2_Letterbox( state )
	local newTable = {}
	newTable[1] = "Camera_SetLetterboxStateNoUI("..state..", 2 )";
	newTable[2] = "";
	return newTable;
end

function HW2_Pause( state )
	local newTable = {}
	newTable[1] = "Universe_Pause("..state..", 2)";
	newTable[2] = "";
	return newTable;
end

function HW2_Fade( state )
	local newTable = {}
	newTable[1] = "Universe_Fade( "..state..", 1 )";
	newTable[2] = "";
	return newTable;
end

function instantParadeOnSkip( sobgroupname )
	SobGroup_FillShipsByType( sobgroupname, "Player_Ships0", "Hgn_MotherShip" )
	SobGroup_ParadeSobGroup( "Player_Ships0", sobgroupname, 2)
	UI_UnBindKeyEvent(ESCKEY)
end


function HW2_DisableBuilderOnCapture( sobgroupname )
	for i=1,(Universe_PlayerCount()-1) do
		if ( "Player_Ships"..i )  then
			-- get all the players builders and disable on capture
			SobGroup_FillShipsByType ( sobgroupname, "Player_Ships"..i, "Vgr_Carrier" )
			SobGroup_SetCaptureAlwaysDisables( sobgroupname, 1 )
			
			SobGroup_FillShipsByType ( sobgroupname, "Player_Ships"..i, "Vgr_Shipyard" )
			SobGroup_SetCaptureAlwaysDisables( sobgroupname, 1 )
		end
	end	
end

--
-- Temporary AI functions
--

-- this function needs:
-- VaygrShipList - table containing 1:name of ship, 2:value of initial weight, 3:value of increment to weight
-- g_vaygrShipLastBuilt = ""  :  This is the group that will hold the ship that the vaygr last built
-- g_maxVaygrShips = 50  :  This is the total number of ships the Vaygr should build
-- g_vaygrPrimaryBuilder = "Vgr_PrimaryCarrier"  :  This is the name of the group of the ship you want the vaygr to build from
-- g_vaygrID = 1  :  This is the player ID of the vaygr

function HW2_VaygrBuildShips()

        local numberOfShipOptions = 1
        local lowestShipValue = 1000000000
        local shipToBuild = 0
        local shipsToBuild = {}

        -- if the vaygr have too many ships dont bother with this for now
        if ( SobGroup_Count( "Player_Ships"..g_vaygrID ) >= g_maxVaygrShips ) then
                return
        end

        -- if theres nothing to build from, return
        if ( SobGroup_Empty( g_vaygrPrimaryBuilder ) == 1 ) then
                return
        end

        -- each time a ship is built, we add to the weight
        -- the ship with the lowest weight is what we build next
        for i=1, getn(VaygrShipList) do
                -- get the value of the current ship
                currentShipValue = VaygrShipList[i][2]
                -- compare it to the value of the last ship
                if (currentShipValue < lowestShipValue) then
                        -- this is the lowest ship so make it the lowest ship
                        lowestShipValue = currentShipValue
                        -- this is now the ship we want to build
                        shipToBuild = i
                end

        end

        -- we now have the lowest and the highest ship
        -- build the lowest
        if ( shipToBuild ~= 0 ) then
                g_vaygrShipLastBuilt = SobGroup_CreateShip( g_vaygrPrimaryBuilder, VaygrShipList[shipToBuild][1] )
                -- increase this ships weight by the specified value
                VaygrShipList[shipToBuild][2] = VaygrShipList[shipToBuild][2] + VaygrShipList[shipToBuild][3]
        end

end

-- this function just issues this order to the last built ship
-- requires:
-- g_vaygrPrimaryBuilder = "Vgr_PrimaryCarrier"  :  This is the name of the group of the ship you want the vaygr to build from
-- g_vaygrShipLastBuilt = ""  :  This is the group that will hold the ship that the vaygr last built
-- g_vaygrCurrentOrder :  Can be VO_AttackPlayer, VO_Retreat, VO_Nothing
function HW2_VaygrOrder()
        if ( SobGroup_Empty(g_vaygrShipLastBuilt) == 0 ) then
                if ( g_vaygrCurrentOrder == "VO_AttackPlayer" ) then
                        -- attack the player
                        SobGroup_AttackPlayer( g_vaygrShipLastBuilt, Universe_CurrentPlayer() )
                elseif ( g_vaygrCurrentOrder == "VO_Retreat" ) then
                        -- just guard the primary builder
                        SobGroup_GuardSobGroup( g_vaygrShipLastBuilt, g_vaygrPrimaryBuilder )
                end
                -- clear the content of that sobgroup
                SobGroup_Clear( g_vaygrShipLastBuilt )
        end
end

-- Creates the specified subsystem
subsystemList = { "FighterProduction", "CorvetteProduction", "FrigateProduction", "CapShipProduction" }

function HW2_InitializeBuilder( builder, sobgroupname )
	SobGroup_FillShipsByType( sobgroupname, builder , "Vgr_Carrier" )
	if ( SobGroup_Empty( sobgroupname ) == 0 ) then
		print( "Error: Cannot use this function on Vaygr Carriers" )
		return
	else
		for i=1,getn(subsystemList) do
			SobGroup_CreateSubSystem( builder, subsystemList[i] )
		end
	end
end	

--
-- Generic Game Helper functions
--
function HW2_SobGroup_ReduceHealthPercentage( group, amount )
        local currentHealth = SobGroup_HealthPercentage( group )
        local newHealth = currentHealth - amount
        SobGroup_SetHealth( group, newHealth )
end

function HW2_SobGroup_AddHealthPercentage( group, amount)
	-- increment is a variable of how much health you want to add every frame
	local currentHealth = SobGroup_HealthPercentage( group )
	local newHealth = currentHealth + amount
	SobGroup_SetHealth( group, newHealth )		
end

function HW2_IsRunTimeSobGroupEmpty( sobgroup )
        if ( sobgroup ~= NULL ) then
                return SobGroup_Empty( sobgroup )
        else
                return 0
        end
end

function HW2_IsRunTimeSobGroupAlive( sobgroup )
        if ( sobgroup ~= NULL ) then
                if ( SobGroup_Empty( sobgroup ) == 0 ) then
			return 1
		else
			return 0
		end
        else
                return 0
        end
end

	
-- this function returns true if the player has any military style ships
function HW2_PlayerHasMilitary( playerid )
	if ( SobGroup_AreAnyFromTheseAttackFamilies( "Player_Ships"..playerid, "Fighter, Corvette, Frigate, SmallCapitalShip, BigCapitalShip, Mothership" ) == 0 ) then
		return 0
	else
		return 1
	end
end


-- Logs reactive fleet info to HwRM.log if the -luatrace command line flag is used
function HW2_ReactiveInfo()

	dofilepath("data:scripts/playerspatch_util.lua")
	
	local extra_ships = ((GetActualPlayerFleetSizeInRU() - GetReactiveFleetSizeInRU())*GetMultiplierForExtraShips() )  --Add multiplier to log adequate info
	local extra_money = ((GetActualPlayerFleetExtraRU() - GetReactiveFleetExtraRU())*GetMultiplierForExtraRU() )
	
	print("*********************************************************************************************************************")
	print("************************************************ Reactive Fleet Info ************************************************")
	print("*********************************************************************************************************************")
	
	print("** The total value of the reference fleets ships is "..GetReactiveFleetSizeInRU().."RUs")	
	print("** The reference fleet has  "..GetReactiveFleetExtraRU().." RU's in its initial allocation")
	print("** The total value of the players ships is "..GetActualPlayerFleetSizeInRU().. "RUs")
	print("** The Players persistant fleet has "..GetActualPlayerFleetExtraRU().." RU's on entering the level")	

	print("** The Mission Difficulty Scale is "..GetMissionDifficultyScale())
	print("** Ship value multiplier set to "..GetMultiplierForExtraShips())	
	print("** RU multiplier set to "..GetMultiplierForExtraRU())	
	
	if (extra_ships >= 1) then 
		print("** Each AI with reactive fleet slots will receive ships to the value of "..extra_ships.." chosen from the relevant reinforce file")
	else
		print("** No reactive fleet slots will be filled")
	end
	
	if (extra_money >= 1) then 
		print("** Each AI has been given "..extra_money.." RUs.  Lets hope they dont spend it all on hookers and beer")
	else
		print("** No RUs for any of the AIs.  Player is too poor")
	end
	
	print("*********************************************************************************************************************")
	print("********************************************* End Of Reactive Fleet Info ********************************************")
	print("*********************************************************************************************************************")

end

--
-- Research Functions
--

-- restrict a list of build items
function HW2_RestrictBuild( buildItem )
        local players_ID = Universe_CurrentPlayer()
	
        for i = 1, getn( buildItem ) do
		Player_RestrictBuildOption( players_ID, buildItem[i] )
        end
end

-- grants a list of build items
function HW2_GrantBuild( buildItem )
        local players_ID = Universe_CurrentPlayer()
        for i = 1, getn( buildItem ) do
                Player_UnrestrictBuildOption( players_ID, buildItem[i] )
        end
end

-- restrict a list of research items
function HW2_RestrictResearch( researchItem )
        local players_ID = Universe_CurrentPlayer()
        for i = 1, getn( researchItem ) do
                Player_RestrictResearchOption( players_ID, researchItem[i] )
        end
end

-- grants a list of research options
function HW2_GrantResearch( researchItem )
        local players_ID = Universe_CurrentPlayer()
        for i = 1, getn( researchItem ) do
                Player_UnrestrictResearchOption( players_ID, researchItem[i] )
        end
end


-- this function enables/disables based on mission id.
function HW2_SetResearchLevel( missionID )

        local players_ID = Universe_CurrentPlayer()

        if ( missionID ~= NULL ) then

                -- this new list contains two elements.  first is the build item, second is the level its available in
		-- note that "level" means that it will not be available in that level.  eg, level 1 means its abailable in level 2.  confusing, no?
		local buildList = {
						{ "Hgn_C_Production_Fighter", 1 },
						{ "Hgn_MS_Production_Fighter", 1 },
						{ "Hgn_C_Production_Corvette", 2 },
						{ "Hgn_MS_Production_Corvette", 2 },
						{ "Hgn_C_Production_Frigate", 3 },
						{ "Hgn_MS_Production_Frigate", 3 },
						{ "Hgn_MS_Production_CapShip", 3 },
						{ "Hgn_SY_Production_CapShip", 3 },
						{ "Hgn_C_Module_PlatformControl", 3 },
						{ "Hgn_MS_Module_PlatformControl", 3 },
						{ "Hgn_C_Module_Research", 1 },
						{ "Hgn_MS_Module_Research", 1 },
						{ "Hgn_C_Module_ResearchAdvanced", 3 },
						{ "Hgn_MS_Module_ResearchAdvanced", 3 },
						
						{ "Hgn_C_Module_FireControl", 7 },
						{ "Hgn_MS_Module_FireControl", 7 },
						{ "Hgn_C_Sensors_AdvancedArray", 4 },
						{ "Hgn_MS_Sensors_AdvancedArray", 4 },
						{ "Hgn_MS_Production_CorvetteMover", 7 },
						
						{ "Kpr_Mover", 7 },
						{ "Hgn_Scout", 1 },
						{ "Hgn_Interceptor", 1 },
						{ "Hgn_AttackBomber", 1 },
						{ "Hgn_AssaultCorvette", 2 },
						{ "Hgn_PulsarCorvette", 2 },
						{ "Hgn_MinelayerCorvette", 4 },
						{ "Hgn_DefenseFieldFrigate", 6 },
						{ "Hgn_TorpedoFrigate", 4 },
						{ "Hgn_AssaultFrigate", 3 },
						{ "Hgn_IonCannonFrigate", 5 },
						{ "Hgn_MarineFrigate", 3 },
						{ "Hgn_Carrier", 3 },
						{ "Hgn_Destroyer", 7 },
						
						{ "Hgn_Shipyard_SPG", 9 },
						
						{ "Hgn_Battlecruiser", 11  },
						{ "Hgn_GunTurret", 3 },
						{ "Hgn_IonTurret", 4 },
						{ "Hgn_ResourceCollector", 1 },
						{ "Hgn_ResourceController", 3 },
						{ "Hgn_Probe", 1 },
						{ "Hgn_ProximitySensor", 4 },
						{ "Hgn_ECMProbe", 6 },
						
					-- these should never be granted
						{ "Hgn_C_Module_Hyperspace", 20 },
						{ "Hgn_MS_Module_Hyperspace", 20 },
						{ "Hgn_C_Module_HyperspaceInhibitor", 20 },
						{ "Hgn_MS_Module_HyperspaceInhibitor", 20 },
						{ "Hgn_C_Module_CloakGenerator", 20 },
						{ "Hgn_MS_Module_CloakGenerator", 20 },
						{ "Hgn_C_Sensors_DetectHyperspace", 20 },
						{ "Hgn_MS_Sensors_DetectHyperspace", 20 },
						{ "Hgn_C_Sensors_DetectCloaked", 20 },
						{ "Hgn_MS_Sensors_DetectCloaked", 20 },
						{ "Hgn_Shipyard", 20 },
		}

                -- research
                local researchList = {
						{ "GraviticAttractionMines", 4 },
						{ "PlatformIonWeapons", 4 },
						{ "DestroyerTech", 7 },
						{ "BattlecruiserIonWeapons", 11 },
						{ "ECMProbe", 6 },
						{ "DamageMoverTech", 6 },
						{ "RadiationDefenseField", 11 },
						{ "RepairAbility", 3 },
						{ "ScoutPingAbility", 5 },
						{ "ImprovedTorpedo", 5 },
						{ "AttackBomberImprovedBombs", 3 },
						{ "ScoutEMPAbility", 6 },
						{ "DefenseFieldFrigateShield", 6 },
						
						{ "MothershipHealthUpgrade1", 2 },
						{ "MothershipMAXSPEEDUpgrade1", 2 },
						{ "MothershipBUILDSPEEDUpgrade1", 6 },
						
						{ "CarrierHealthUpgrade1", 3 },
						{ "CarrierMAXSPEEDUpgrade1", 3 },
						{ "CarrierBUILDSPEEDUpgrade1", 6 },
						
						{ "InterceptorMAXSPEEDUpgrade1", 2 },
						
						{ "AttackBomberMAXSPEEDUpgrade1", 2 },
						
						{ "AssaultCorvetteHealthUpgrade1", 2 },
						{ "AssaultFrigateHealthUpgrade1", 5 },
						{ "AssaultCorvetteMAXSPEEDUpgrade1", 2 },
						
						{ "PulsarCorvetteHealthUpgrade1", 2 },
						{ "PulsarCorvetteMAXSPEEDUpgrade1", 2 },
						
						{ "TorpedoFrigateHealthUpgrade1", 4 },
						{ "TorpedoFrigateMAXSPEEDUpgrade1", 4 },
						
						{ "IonCannonFrigateHealthUpgrade1", 5 },
						{ "IonCannonFrigateMAXSPEEDUpgrade1", 5 },
						
						{ "AssaultFrigateHealthUpgrade1", 3 },
						{ "AssaultFrigateMAXSPEEDUpgrade1", 3 },
						
						{ "BattlecruiserHealthUpgrade1", 11 },
						{ "BattlecruiserMAXSPEEDUpgrade1", 11 },
						
						{ "DestroyerHealthUpgrade1", 7 },
						{ "DestroyerMAXSPEEDUpgrade1", 7 },
						
						{ "GunTurretHealthUpgrade1", 3 },
						{ "IonTurretHealthUpgrade1", 4 },
						
						{ "ResourceCollectorHealthUpgrade1", 2 },
						{ "ResourceControllerHealthUpgrade1", 3 },
		
		} -- end of research list, stupid lua limited to 64
		
		local researchList2 = {
		
 						{"SensDisProbe", 2 },
						{ "InstaAdvancedFrigateTech", 2 },
						
						{ "ShipyardHealthUpgrade1", 9 },
						{ "ShipyardMAXSPEEDUpgrade1", 9 },
						{ "ShipyardBUILDSPEEDUpgrade1", 11 },
						
						
						{ "HyperspaceCostUpgrade1", 20 },
						
						-- SHIPYARD UPGRADES
						
		}		

		local printTable = {}
		printTable[1] = "-----RESTRICTION DATA-----"
		printTable[2] = "The following items need to be added:"
		printTable[getn(printTable)+1] = "-----BUILD DATA-----"
		-- restrict the build options
		if( getn( buildList ) >= 64) then
			print( "ERROR LUA IS LIMITED TO 64, THIS LUA SCRIPT WILL FAIL TO EXECUTE" )
		end

                for i = 1, getn( buildList ) do
			if ( buildList[i][2] >= missionID ) then --or  ( buildList[i][2] == 0 ) then
				Player_RestrictBuildOption( players_ID, buildList[i][1] )
			end
			-- if this is equal to the mission ID then add it to the list of things to be printed
			
			if ( buildList[i][2] == missionID ) then
				printTable[getn(printTable)+1] = "Player_UnrestrictBuildOption( 0, \""..buildList[i][1].."\" ) --" ..buildList[i][1]
			end
		end
		
 		printTable[getn(printTable)+1] = "-----RESEARCH DATA-----"
 		-- restrict the research options
		if( getn( researchList) >= 64) then
			print( "ERROR LUA IS LIMITED TO 64, THIS LUA SCRIPT WILL FAIL TO EXECUTE" )
		end

                for j = 1, getn( researchList ) do
			if ( researchList[j][2] >= missionID ) then   --or ( researchList[j][2] == 0 ) then
				Player_RestrictResearchOption( players_ID, researchList[j][1] )
			end
			-- if this is equal to the mission ID then add it to the list of things to be printed
			if ( researchList[j][2] == missionID ) then
				printTable[getn(printTable)+1] = "Player_UnrestrictResearchOption( 0, \""..researchList[j][1].."\" ) --" ..researchList[j][1]
			end
  		end
 
		if( getn( researchList2 ) >= 64) then
			print( "ERROR LUA IS LIMITED TO 64, THIS LUA SCRIPT WILL FAIL TO EXECUTE" )
		end

                for j = 1, getn( researchList2 ) do
			if ( researchList2[j][2] >= missionID ) then   --or ( researchList[j][2] == 0 ) then
				Player_RestrictResearchOption( players_ID, researchList2[j][1] )
			end
			-- if this is equal to the mission ID then add it to the list of things to be printed
			if ( researchList2[j][2] == missionID ) then
				printTable[getn(printTable)+1] = "Player_UnrestrictResearchOption( 0, \""..researchList2[j][1].."\" ) --" ..researchList2[j][1]
			end
  		end

 
 		-- now print off a list of everything that needs to be added in this mission
 		for k = 1, getn( printTable ) do
 			print( printTable[k] )
 		end

	else

                print( "ERROR: Research Level Has Not Been Set.  No Tech Restricted." )

        end

end



-- TIMER STUFF
timer = {}
function Timer_Start(id,period)
	timer[id] = {p=period,tr=period,t=Universe_GameTime()}
	print("Timer "..id.." STARTED with period: "..period)
end

function Timer_Add(id,period)
	if(timer[id] == nil) then
		print("(Timer " ..id.. " has ended)")
	else
		timer[id].p = timer[id].p + period
	end
end	

function Timer_Pause(id)
	if (timer[id].t ~= 0)  then
		print("Timer "..id.." PAUSING now")
		timer[id].tr = max(0, timer[id].p - (Universe_GameTime() - timer[id].t))
		timer[id].t = 0
		timer[id].p = timer[id].tr;
	else
		print("Timer "..id.." PAUSE called (timer already paused)")
	end
	
end

function Timer_GetRemaining(id) 
	if (timer[id] == nil) then
		print("(Timer "..id.." has ended)")
		return 0
	end
	if (timer[id].t ~= 0) then
		timer[id].tr = max(0, timer[id].p - (Universe_GameTime() - timer[id].t))
	end
	return timer[id].tr
end 

function Timer_Resume(id)
	if (timer[id] ~= nil)  then
		timer[id].t = Universe_GameTime()
		print("Timer "..id.." RESUME called")
	else
		print("Timer "..id.." RESUME called (for an ended timer)")
	end
end

function Timer_Display(id)
	if (timer[id] == nil)  then
		print("Timer "..id.." -- ".." [timer has been ended]")
		return
	end
	dispTime =  Timer_GetRemaining(id)
	print("Timer "..id.." -- "..dispTime)
end

function Timer_End(id)
	print("Timer "..id.." END called")
	timer[id]=nil
end	
