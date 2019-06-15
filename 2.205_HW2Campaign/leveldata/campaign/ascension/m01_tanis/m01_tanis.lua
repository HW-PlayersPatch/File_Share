--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M01_Tanis
--  Purpose:  Mission 1 Mission Script
----------------------------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")

-- objectives
obj_prim_beginharvesting= "$40500"
obj_prim_beginharvesting_id = 0

obj_sec_buildcollector = "$40501"
obj_sec_buildcollector_id = 0

obj_prim_buildfightersubsystem = "$40502"
obj_prim_buildfightersubsystem_id = 0

obj_prim_buildtwointerceptors = "$40503"
obj_prim_buildtwointerceptors_id = 0

obj_prim_researchplasmabomb = "$40504"
obj_prim_researchplasmabomb_id = 0

obj_prim_buildtwobombers = "$40505"
obj_prim_buildtwobombers_id = 0

obj_prim_defeatvaygratchimera = "$40506"
obj_prim_defeatvaygratchimera_id = 0

obj_prim_movetochimera = "$40507"
obj_prim_movetochimera_id = 0

obj_prim_eliminatevaygratxanhus = "$40508"
obj_prim_eliminatevaygratxanhus_id = 0

obj_prim_destroyvaygrgates = "$40509"
obj_prim_destroyvaygrgates_id = 0

obj_prim_protectmothership = "$40510"
obj_prim_protectmothership_id = 0

obj_prim_enterhyperspace = "$40511"
obj_prim_enterhyperspace_id = 0

-- pings
ping_resource_operation = "$40800"
ping_resource_operation_id = 0

ping_targetdrones = "$40801"
ping_targetdrones_id = 0

ping_vaygrbombers = "$40802"
ping_vaygrbombers_id = 0

ping_vaygrattackeratxanhus = "$40803"
ping_vaygrattackeratxanhus_id = 0

ping_vaygrhyperspacegate_waveone = "$40804"
ping_vaygrhyperspacegate_waveone_id = {0,0,0,0}

-- global vars
g_eventisdone = 1

g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_pointer_default = 0
g_waitID = 0

g_MSAttackersGate = 0

-- for tracking the attacks issued for wave 1
g_WaveOne_AttacksIssued = 0
g_WaveOne_HyperspaceIssued = 0
g_WaveOne_GatesDestroyed = 0

g_WaveTwo_HyperspaceIssued = 0
g_WaveTwo_AttacksIssued = 0

g_WaveTwo_OutpostHyperspaceIssued = 0
g_WaveTwo_OutpostAttacksIssued = 0

g_playerBegunPlasma_id = 0
g_gatesdeployed_id = 0
g_playerBegunAttackBombers_id = 0

g_gatedeployed= 0

g_mothershiplaunched = 0
g_gatejustopened = ""
g_dronecount = 0
g_probesdeployed = 0

g_save_id = 0


buildinginterceptors = 0

g_chimeradisabled = 0
g_healthofchimera = SobGroup_HealthPercentage("Station_Chimera")
SobGroup_Create( "Vgr_MothershipAttackers" )

g_vaygrexithyperspace = 0

-- MISSION RULES

-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end

-- this function must be here - this is the mission start point
function OnInit()
	SPRestrict()
	print("oninit issued" )	
	Rule_Add("Rule_Init")
	Rule_Add( "Animate_MothershipDoorOpen" )
	Sound_SetMuteActor( "All_")
	Sound_EnableAllSpeech( 0 )
end

function testit()
	--Sound_StingerPlay( "data:sound/music/battle/battle_01" )
	Event_Start( "autofocus_mothershiplaunches" )
	--Rule_Add( "Rule_MothershipHasLaunched" )
	--Timer_Start( 0, 120 )
	--Subtitle_TimeCounter( 0, 40521 )
end

function test1()
	--Sound_StingerPlay( "data:sound/music/battle/battle_01" )
	Event_Start( "intelevent_mothershipjumps" )
	Rule_Add( "Rule_VaygrEnterHyperspace" )
	--Rule_Add( "Rule_MothershipHasLaunched" )
	--Timer_Start( 0, 120 )
	--Subtitle_TimeCounter( 0, 40521 )
end



-- this group of functions handles the defence fleet, making them move around and act defensive
function DisableMothership()
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense1", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense2", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense3", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense4", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense5", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense6", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense7", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense8", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense9", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense10", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense11", 0 )
	SobGroup_ChangePower( "Mothership", "Weapon_HullDefense12", 0 )
	
	-- grant the research subsystem to the mothership
	SobGroup_CreateSubSystem("Mothership", "Hgn_MS_Module_Research" )
	SobGroup_SetSpeed("Mothership", 0.5)
	
	Player_GrantResearchOption( 0, "SensorsDowngrade1" )
	Player_GrantResearchOption( 0, "SensorsDowngrade2" )
	Player_GrantResearchOption( 0, "SensorsDowngrade3" )
	
	SobGroup_AbilityActivate( "Mothership", AB_Dock, 0 )
	
	SobGroup_AbilityActivate( "Mothership", AB_Move, 0 )
end


function Animate_MothershipDoorOpen()
	if ( Universe_GameTime() >= 1 ) then
        SobGroup_SetMadState("Mothership", "NIS00" )
		Rule_Remove( "Animate_MothershipDoorOpen" )
	end
end

function Animate_MothershipDoorClose()
	if ( Universe_GameTime() >= 67 ) then
        SobGroup_SetMadState("Mothership", "NIS01" )
		Rule_Remove( "Animate_MothershipDoorClose" )
	end
end

-- player is skipping NIS so instant close the MS door
function skippingNIS()
	-- quick close the MS door
    SobGroup_SetMadState("Mothership", "Normal" )
	UI_UnBindKeyEvent(ESCKEY)
	Rule_Remove( "Animate_MothershipDoorClose" )
    Rule_Remove( "Animate_MothershipDoorOpen" )
end

function Rule_monitorBuildBtn()
	if (UI_IsScreenActive("NewBuildMenu")==1) then
		UI_StopFlashButton("NewTaskbar", "btnBuild")
		Rule_Remove("Rule_monitorBuildBtn")
	end
end

g_ipressed = 0
g_cpressed = 0
g_dpressed = 0
g_epressed = 0
g_apressed = 0
g_ppressed = 0
g_opressed = 0
g_lpressed = 0

function cheat_i()
	if g_ipressed > 1 then
		g_ipressed = 0
	else
		g_ipressed = g_ipressed + 1
	end
--~ 	print( "i pressed" )
end
function cheat_c()
	g_cpressed = g_cpressed + 1
	print( "c pressed" )
end
function cheat_d()
	g_dpressed = g_dpressed + 1
--~ 	print( "d pressed" )
end
function cheat_e()
	g_epressed = g_epressed + 1
--~ 	print( "e pressed" )
end
function cheat_a()
	g_apressed = g_apressed + 1
--~ 	print( "a pressed" )
end
function cheat_p()
	g_ppressed = g_ppressed + 1
--~ 	print( "p pressed" )
end
function cheat_o()
	g_opressed = g_opressed + 1
--~ 	print( "o pressed" )
end
function cheat_l()
	g_lpressed = g_lpressed + 1
--~ 	print( "l pressed" )
end

function icdeadpeople()
	if ( g_ipressed == 1 ) and
	  ( g_cpressed == 1 ) and
	  ( g_dpressed == 2 ) and
	  ( g_epressed == 3 ) and
	  ( g_apressed == 1 ) and
	  ( g_ppressed == 2 ) and
	  ( g_opressed == 1 ) and
	  ( g_lpressed == 1 ) then
		Event_Start( "speechevent_ic" )
		g_ipressed = 0
		g_cpressed = 0
		g_dpressed = 0
		g_epressed = 0
		g_apressed = 0
		g_ppressed = 0
		g_opressed = 0
		g_lpressed = 0
	end
end

function Rule_Init()

	--UI_BindKeyEvent( GKEY, 'testit' )
	--UI_BindKeyEvent( HKEY, 'test1' )
	
	UI_BindKeyEvent( IKEY, 'cheat_i' )
	UI_BindKeyEvent( CKEY, 'cheat_c' )
	UI_BindKeyEvent( DKEY, 'cheat_d' )
	UI_BindKeyEvent( EKEY, 'cheat_e' )
	UI_BindKeyEvent( AKEY, 'cheat_a' )
	UI_BindKeyEvent( PKEY, 'cheat_p' )
	UI_BindKeyEvent( OKEY, 'cheat_o' )
	UI_BindKeyEvent( LKEY, 'cheat_l' )
	
	Rule_Add( "icdeadpeople" )
	

	-- disable the scuttle command for this mission.
	Universe_EnableCmd(0, MUI_ScuttleCommand)
	SobGroup_AbilityActivate( "Player_Ships0", AB_Scuttle, 0 )
	SobGroup_AbilityActivate( "Player_Ships0", AB_Retire, 0 )

	-- sobgroups for query functions
	SobGroup_Create("shipsInVolume")
	SobGroup_Create("fightersInVolume")
	SobGroup_Create("tempSobGroup")
	
	UI_BindKeyEvent( ESCKEY, 'skippingNIS' )
	
	-- dock all of the ships with the ships they need to be docked with
	SobGroup_DockSobGroupInstant("Mothership","Tanis")
	-- allow the mothership to behave normally even though it is docked
	SobGroup_AllowPassiveActionsAlways("Mothership",1)
	
	Rule_Add( "Animate_MothershipDoorOpen" )
	Rule_Add( "Animate_MothershipDoorClose" )
	-- form up vaygr in strike groups
	
	-- set the sound directory
	Sound_SpeechSubtitlePath("speech:missions/m_01/")
	
   --set the player fleet's team colour to that of the player's profile
    local baseColour = {}
    local stripeColour = {}
    local badgeName = ""
    baseColour = Profile_GetTeamColourBase()
    stripeColour = Profile_GetTeamColourStripe()
    badgeName = Profile_GetTeamColourBadge()
    if (badgeName ~= "") then
        print("singlePlayerLevelLoaded: found profile team colours - setting now")
        print("WARNING: badge: "..badgeName)
        Player_SetTeamColourTheme(0, baseColour, stripeColour, badgeName, baseColour, "")
    end

	-- set the names of the players

	Player_SetPlayerName(0,"$40793")
	Player_SetPlayerName(1,"$40790")
	Player_SetPlayerName(2,"$40791")
	Player_SetPlayerName(3,"$40792")
		
	-- set the alliances for all of the hiigaran ships
	SetAlliance( 0, 1 )
	SetAlliance( 1, 0 )
	--SetAlliance( 0, 2 )
	--SetAlliance( 2, 0 )
	--SetAlliance( 1, 2 )
	--SetAlliance( 2, 1 )
	
	--SetAlliance( 2, 4 )
	--SetAlliance( 4, 2 )
	--SetAlliance( 3, 4 )
	--SetAlliance( 4, 3 )

	Player_SetGlobalROE( 1, OffensiveROE )
	Player_SetGlobalStance( 1, AggressiveStance )

	--UI_StopFlashButton("NewTaskbar", "btnDiplomacy")
	
	-- disable the AI
	CPU_Enable( 1, 0 )
	CPU_Enable( 2, 0 )
	CPU_Enable( 3, 0 )

	DisableMothership()
	
	-- this prevents the taskbar from using the taskbar state from the players profile.
	--  eg. prevents the taskbar from being hidden when it is set to hidden by the profile
	FE_TaskbarIgnoreProfilePhase(1)
			
	--SobGroup_AbilityActivate( "Tanis_Whole", AB_AcceptDocking, 0 )
	--Rule_Add( "SparkiesOnMothership" )
	
	-- begin the opening intelevent
	--NISLoad( "nis/NIS01A" )
	--g_NISState = NISPlay( "nis/NIS01A" )
	-- for seamless transition between animatic and nis, the animatic starts the NIS
	g_NISState = NISGetPlayingHandle("nis/NIS01A")
	NISDisableInterface(1) -- this disables the interface when the NIS is done playing, it needs to be re-enabled by scar
	
	Rule_Add( "Rule_NIS01AComplete" )
	
	Rule_Remove( "Rule_Init" )	
	
	Rule_Add( "Rule_PlayerWins" )
	Rule_Add( "Rule_PlayerLose" )	
	
	
	
end

function PostNISInit()

	-- grant misc research options to hack the vaygr
	Player_GrantResearchOption( 3, "HyperspaceRecoveryTimeUpgradeSPGAME" )
	Player_GrantResearchOption( 3, "HyperspaceTransitionTimeUpgradeSPGAME" )

	-- set the research levels
	HW2_SetResearchLevel( 1 )
	
	

end

-- NIS COMPLETED
function Rule_NIS01AComplete()
	if ( NISComplete( g_NISState ) == 1 ) then
		-- grant the research subsystem to the carrier
		SobGroup_SetMadState("Mothership", "Normal" )
		
		g_NISState = 0
		
		UI_UnBindKeyEvent(ESCKEY)
		--UI_SetInterfaceVisible( 0 )
		
--~ 		Sound_MusicPlay( "data:sound/music/ambient/AMB_01" )
		Sound_MusicPlayType( "data:sound/music/ambient/AMB_01", MUS_Ambient )
				
		Event_Start( "intelevent_beginharvesting" )		
		PostNISInit()

		Rule_Add( "Rule_OpeningIntelEventComplete" )
		Rule_Remove( "Rule_NIS01AComplete" )
		-- campaign quick save is done after removing the rule
		
	end
end

function Rule_OpeningIntelEventComplete()
	if ( Event_IsDone( "intelevent_beginharvesting" ) == 1 ) then
		UI_ClearEventScreen()
		
		-- here we trun the UI back on...kinda hard right now.
		Camera_SetLetterboxStateNoUI(0,0)
		
		--Rule_Add( "Rule_BeginHarvesting" )
		Rule_Add( "Rule_BuildSubsystems" )
		
		Rule_Remove( "Rule_OpeningIntelEventComplete" )
			
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameMissionStart", 1 )
		
		
	end
end

function Rule_SaveTheGameMissionStart()
	Rule_Remove ("Rule_SaveTheGameMissionStart")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6400" )	-- Mission Start
end
-- NIS COMPLETED

-- BEGIN GAME: HARVESTING REFRESHER
-- once player has enough RU's to satisfy the objective
function Rule_BeginHarvesting()
	if ( Player_GetRU( g_playerID ) >= 700 ) then
		
		Objective_SetState( obj_prim_beginharvesting_id, OS_Complete )
		Rule_Remove( "Rule_BeginHarvesting" )
		
	end
end
-- END GAME: HARVESTING REFRESHER

-- BEGIN GAME: SUBSYSTEM CONSTRUCTION
function Rule_BuildSubsystems()
	if ( Player_GetRU( g_playerID ) >= 700 ) then
		-- now we tell them to start building the fighter subsystem
		Ping_Remove( ping_resource_operation_id )
		
		Objective_SetState( obj_prim_beginharvesting_id, OS_Complete )
		
		Event_Start( "intelevent_subsystemconstruction" )
		
		Rule_Add( "Rule_HasBuiltFighterSubsystem" )
		
		Rule_Remove( "Rule_BuildSubsystems" )
		Rule_Add( "Rule_SaveAfterBuildFacility" )

	end
end

function Rule_SaveAfterBuildFacility()
	if ( Event_IsDone( "intelevent_subsystemconstruction" ) == 1 ) then
		Player_UnrestrictBuildOption( g_playerID, 'Hgn_MS_Production_Fighter' )
		UI_AddToEventScreen('STATUS_BuildAvaliable_1')
		Rule_Remove( "Rule_SaveAfterBuildFacility" )	
	end
end
-- END GAME: SUBSYSTEM CONSTRUCTION

-- BEGIN GAME: CONSTRUCT INTERCEPTORS
-- player has build fighter subsystems
function Rule_HasBuiltFighterSubsystem()
	if ( Stats_ShipsCreated( g_playerID, GetShipId( "Hgn_MS_Production_Fighter" ) ) >= 1 ) then
	
		SobGroup_SetInvulnerabilityOfHardPoint( "Mothership", "HardpointProduction1", 1 )
		
		Objective_SetState( obj_prim_buildfightersubsystem_id, OS_Complete )
		Rule_Remove( "Rule_HasBuiltFighterSubsystem" )
		
		-- now we tell them to build some interceptors		
		Event_Start( "intelevent_constructinterceptors" )
		Rule_Add( "Rule_HasBuiltInterceptors" )
		
		-- start deploying drones please
		Rule_Add( "Rule_PlayerHasBegunBuildingInterceptors" )
		Rule_Add( "Rule_SaveAfterBuildFighters" )
		
	end
end

function Rule_SaveAfterBuildFighters()
	if ( Event_IsDone( "intelevent_constructinterceptors" ) == 1 ) then
		Rule_Remove( "Rule_SaveAfterBuildFighters" )
	end
end
-- END GAME: CONSTRUCT INTERCEPTORS



-- BEGIN GAME: DEPLOY DRONES
function Rule_PlayerHasBegunBuildingInterceptors()
	if ( Player_HasQueuedBuild (0, "Hgn_Interceptor" ) == 1 ) then
		
		Rule_AddInterval( "Rule_DeployDrones", 20 )		
		Rule_Remove( "Rule_PlayerHasBegunBuildingInterceptors" )
	end
end

function Rule_DeployDrones()
	SobGroup_Create( "AllTargetDrones" )
	DeployDrones()
	Rule_AddInterval( "MoveDrones",4 )
	Rule_Remove( "Rule_DeployDrones" )
end

g_drone = {0,0,0,0,0,0,0,0,0}
g_dronemoved = {2,2,2,2,2,2,2,2,2}

function DeployDrones()
	for i=1,9 do	
		g_drone[i] = SobGroup_CreateShip("Station_Chimera", "Hgn_TargetDrone")
		--SobGroup_SwitchOwner( g_drone[i], 2 )
		g_probesdeployed = 1
		
		SobGroup_SobGroupAdd("AllTargetDrones", g_drone[i])
	end
end

g_currentdronebeingswitched = 1

function SwitchOwnerDrones()
	if ( g_currentdronebeingswitched >= 9 ) then
		Rule_Remove( "SwitchOwnerDrones" )
	end
	SobGroup_SwitchOwner( g_drone[g_currentdronebeingswitched], 2 )
	g_currentdronebeingswitched = g_currentdronebeingswitched + 1	
end

function MoveDrones()
	
	droneslaunched = 0
	for i=1,9 do
		if (g_dronemoved[i] ~= 0 ) and ( SobGroup_IsDockedSobGroup( g_drone[i], "Station_Chimera" ) == 0 ) then
			SobGroup_Move( 2, g_drone[i], "vol_TargetDrone_"..i )
			g_dronemoved[i] = 1
			droneslaunched = droneslaunched + 1
		end
	end
	
	if ( droneslaunched == 9 ) then
		Rule_Remove( "MoveDrones" )
	end
end
-- END GAME DEPLOY DRONES

-- BEGIN GAME: INTERCEPTORS COMPLETED
-- player has built two interceptor squadrons
function Rule_HasBuiltInterceptors()
	if ( Stats_ShipsCreated( g_playerID, GetShipId( "Hgn_Interceptor" ) ) >= 5 ) and ( droneslaunched == 9 ) then
	
		Objective_SetState( obj_prim_buildtwointerceptors_id, OS_Complete )
		Event_Start( "intelevent_movetochimera" )		
		
		Rule_Remove( "Rule_HasBuiltInterceptors" )
		
		--Player_UnrestrictBuildOption( g_playerID, "Hgn_ResourceCollector" )		

		Rule_Add( "Rule_MoveToChimeraCompleted" )
		
	end
end

function Rule_MoveToChimeraCompleted()
	if ( Event_IsDone( "intelevent_movetochimera" ) == 1 ) then
	
		-- Rule_Add( "Rule_PlayerIsAtChimera" )
		-- removed the lines about incoming at chimera cause its confusing
		--Rule_Add( "Rule_ChimeraReporting" )
		Rule_Add("Rule_DronesDestroyed")
		Rule_Remove( "Rule_MoveToChimeraCompleted" )
		Player_FillShipsByType( "tempSobGroup", 2, "Hgn_TargetDrone" )
	end
end

function Rule_DronesDestroyed()
    if (SobGroup_Empty("tempSobGroup") == 1) then
		Rule_Remove("Rule_DronesDestroyed")
		Event_Start( "speechevent_chimerareporting" )
		Rule_Add("Rule_PlayerIsAtChimera")
	end
end

-- END GAME: INTERCEPTORS COMPLETED

-- BEGIN GAME: CHIMERA REPORTING
function Rule_ChimeraReporting()
	Player_FillShipsByType( "tempSobGroup", 2, "Hgn_TargetDrone" )
	if ( g_probesdeployed == 1 ) and ( SobGroup_Count( "tempSobGroup" ) == 3 ) then
		--Sound_MusicPlay( "data:sound/music/staging/STAGING_01" )
		Event_Start( "speechevent_chimerareporting" )
		Rule_Remove( "Rule_ChimeraReporting" )
	end
end
-- END GAME: CHIMERA REPORTING

-- BEGIN GAME: MOVE TO CHIMERA
function Rule_PlayerIsAtChimera()
	Player_FillShipsByType( "tempSobGroup", 2, "Hgn_TargetDrone" )
	if ( g_probesdeployed == 1 ) and ( SobGroup_Empty( "tempSobGroup" ) == 1 ) and ( Event_IsDone( "speechevent_chimerareporting" ) == 1 ) then
		
		-- removed this.  we just go straight into NIS01B now.
		--Event_Start( "speechevent_attackcomplete" )
		
		Objective_SetState( obj_prim_movetochimera_id, OS_Complete )
		Ping_Remove( ping_targetdrones_id )
		--Sensors_Toggle( 0 )
		
		Rule_AddInterval( "Rule_PlayNIS01B", 2 )
		
		Rule_Remove( "Rule_PlayerIsAtChimera" )
	end
end

function Rule_PlayNIS01B()
	if ( Event_IsDone( "speechevent_attackcomplete" ) == 1 ) and ( Event_IsDone( "speechevent_chimerareporting" ) == 1 ) then
	    SobGroup_FillShipsByType( "tempSobGroup", "Player_Ships0", "Hgn_Interceptor" )
		SobGroup_MoveToSobGroup( "tempSobGroup" , "Station_Chimera")
		
		NISLoad( "nis/NIS01B" )
		
		Sensors_EnableCameraZoom( 0 )
		Sensors_Toggle( 0 )
		Sensors_EnableToggle( 0 )
		
		g_NISState = NISPlay( "nis/NIS01B" )
	
		Rule_Add( "Rule_NIS01B_completed" )
		Rule_Remove( "Rule_PlayNIS01B" )
		Sensors_EnableCameraZoom( 1 )
	end
	
end


function SpawnMoreVaygrBombers()

	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships0", "Hgn_Interceptor" )
	numberOfInterceptors = SobGroup_Count( "tempSobGroup" )
	-- HAAAAACCCCCKKKKK: remove 5 because thats the number the NIS is partially leaving behind
	--numberOfInterceptors = numberOfInterceptors - 5
	
	print( "interceptors at chimera: "..numberOfInterceptors )
	
	if ( numberOfInterceptors >= 15 ) then
		-- spawn one more squadron
		numberOfNewAttackBombers = numberOfInterceptors / 5
		
		floor( numberOfNewAttackBombers )
		numberOfNewAttackBombers = numberOfNewAttackBombers - 2
		
		for i=1, numberOfNewAttackBombers do
			SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "Vgr_Bombers", "Vgr_Bombers", "vol_SpawnMoreBomberSquads")
		end
	end
end
-- BEGIN GAME: MOVE TO CHIMERA

-- BEGIN GAME: TANIS COMPROMISED
-- player has eliminated vaygr at nemean
function Rule_NIS01B_completed()
	if ( NISComplete( g_NISState ) == 1 ) then	
		Sensors_EnableToggle( 1 )
		SobGroup_Spawn( "Vgr_Bombers", "vol_SpawnMoreBomberSquads_1" )
--~ 		Sound_StingerPlay( "data:sound/music/battle/battle_01" )
		Sound_MusicPlayType( "data:sound/music/battle/battle_01", MUS_Battle )
		SpawnMoreVaygrBombers()
		
		Event_Start( "intelevent_perimiterbreached" )
		
		SobGroup_Attack( 3, "Vgr_Bombers", "Station_Chimera" )
		SobGroup_Create( "ChimerasInterceptors" )
		SobGroup_SpawnNewShipInSobGroup(0, "Hgn_Interceptor", "ChimeraInterceptors", "ChimerasInterceptors", "vol_ChimeraInterceptors")
		SobGroup_MoveToSobGroup( "ChimerasInterceptors", "Vgr_Bombers" )
		Rule_AddInterval( "Rule_StopNewInterceptors", 1 )
		
		
		Rule_Remove( "Rule_NIS01B_completed" )
		
		Rule_Add( "Rule_KeepChimeraAlive" )
		Rule_Add( "Rule_DisableChimera" )
		Rule_Add( "Rule_DamageChimera" )
		Rule_Add( "Rule_ChimeraAttackersEliminated" )
		
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		
		
		Rule_AddInterval( "Rule_SaveTheGameVaygrAttack",1 )
		
		
		
		
	end
end

function Rule_SaveTheGameVaygrAttack()
	Rule_Remove ("Rule_SaveTheGameVaygrAttack")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6401" )	--  Vaygr Attack
end

function Rule_StopNewInterceptors()
	SobGroup_Stop( 0, "ChimerasInterceptors")
	Rule_Remove( "Rule_StopNewInterceptors" )
end
-- once chimera is down to 10% health keep it there
function Rule_KeepChimeraAlive()
	if ( SobGroup_HealthPercentage("Station_Chimera") <= .15 ) then
		SobGroup_SetHealth( "Station_Chimera", .1 )
		g_chimeradisabled = 1
	end
end

function Rule_DamageChimera()
	-- compare the current health to the stored health
	if ( SobGroup_HealthPercentage("Station_Chimera") < g_healthofchimera ) and
	-- make sure we dont damage it too much!
	   ( SobGroup_HealthPercentage("Station_Chimera") >= .15 ) then
		-- its less, so do some extra damage
		SobGroup_TakeDamage( "Station_Chimera", .05 )
		SobGroup_FillBattleScar( "Station_Chimera", "Plasma_Bomb/Plasma_Bomb" )
		-- now update the health of chimera
		g_healthofchimera = SobGroup_HealthPercentage("Station_Chimera")
		
	end
end

-- once chimera gets to 10% helath disable it
function Rule_DisableChimera()
	if ( SobGroup_HealthPercentage("Station_Chimera") <= .5 ) then
		SobGroup_AbilityActivate( "Station_Chimera", AB_Sensors, 0 )
		SobGroup_AbilityActivate( "Station_Chimera", AB_Steering, 0 )
		Rule_Remove( "Rule_DisableChimera" )
	end
end
-- END GAME: TANIS COMPROMISED

-- BEGIN GAME: RESEARCH PLASMA BOMBS
function Rule_ChimeraAttackersEliminated()
	if ( SobGroup_Empty( "Vgr_Bombers" ) == 1 ) then
	
		Objective_SetState( obj_prim_defeatvaygratchimera_id, OS_Complete )	
		
--~ 		Sound_MusicPlay( "data:sound/music/ambient/AMB_01" )
--~ 		Sound_MusicPlayType( "data:sound/music/ambient/AMB_01", MUS_Ambient )
		SobGroup_AbilityActivate( "Station_Chimera", AB_Sensors, 0 )
		SobGroup_AbilityActivate( "Station_Chimera", AB_Steering, 0 )
		
		--Event_Start( "autofocus_premothershiplaunches" )
		Rule_Add( "Rule_CreateMothershipAttackers" )
		Rule_Add( "Rule_LaunchTheMothership" )
		
		Rule_Remove( "Rule_DamageChimera" )
		Rule_Remove( "Rule_KeepChimeraAlive" )
		Rule_Remove( "Rule_ChimeraAttackersEliminated" )

	end	
end

function Rule_CreateMothershipAttackers()
	
	SobGroup_Create( "MothershipAttackers" )
	SobGroup_Create( "MothershipAttackers_Bombers_1" )
	SobGroup_Create( "MothershipAttackers_Bombers_2" )
	SobGroup_SpawnNewShipInSobGroup( 3, "Vgr_HeavyMissileFrigate", "MothershipAttackers0", "MothershipAttackers", "vol_SpawnMothershipAttackers")
	for i=1,2 do
		SobGroup_SpawnNewShipInSobGroup( 3, "Vgr_Bomber", "MothershipAttackers_B1"..i, "MothershipAttackers_Bombers_1", "vol_SpawnMothershipAttackers")
	end
	for i=1,2 do
		SobGroup_SpawnNewShipInSobGroup( 3, "Vgr_Bomber", "MothershipAttackers_B2"..i, "MothershipAttackers_Bombers_2", "vol_SpawnMothershipAttackers")
	end
	
	--SobGroup_FormStrikeGroup( "MothershipAttackers", "wall" )
	
	SobGroup_Attack( 3, "MothershipAttackers", "Mothership" )
	SobGroup_Attack( 3, "MothershipAttackers_Bombers_1", "Tanis_Structure_1" )
	SobGroup_Attack( 3, "MothershipAttackers_Bombers_2", "Tanis_Structure_2" )
	FOW_RevealGroup("MothershipAttackers", 1)
	
	Rule_Remove( "Rule_CreateMothershipAttackers" )
end

function Rule_LaunchTheMothership()
	--if ( Event_IsDone( "autofocus_premothershiplaunches" ) == 1 ) then	
		SobGroup_FillShipsByType( "tempSobGroup", "Player_Ships0", "Hgn_Interceptor" )
		SobGroup_ParadeSobGroup( "tempSobGroup" , "Mothership", 0 )
		Event_Start( "autofocus_mothershiplaunches" )
		
		
		
		Rule_Add( "Rule_MothershipHasLaunched" )		
		
		Rule_Remove( "Rule_LaunchTheMothership" )
	--end	
end

function Rule_MothershipHasLaunched()
	if ( Event_IsDone( "autofocus_mothershiplaunches" ) == 1 ) then
	
		--Player_UnrestrictResearchOption( g_playerID, "PlasmaBombs" )
		Player_UnrestrictBuildOption( g_playerID, "Hgn_AttackBomber" )
		
		--Sound_StingerPlay( "data:sound/music/battle/battle_01" )
		
		Event_Start( "intelevent_chimeraissafe" )
		
		Rule_Add( "Rule_DeployGates" )
		
		--Rule_Add( "Rule_ChimeraIsSafeCompleted" )		
		
		Rule_Add( "Rule_HasBuiltAttackBombers" )
		
		Rule_Remove( "Rule_MothershipHasLaunched" )
		
		Rule_Add( "Rule_KeepTanisAlive1" )
		Rule_Add( "Rule_KeepTanisAlive2" )
	end
end

function Rule_ChimeraIsSafeCompleted()
	if ( Event_IsDone( "intelevent_chimeraissafe" ) == 1 ) then
--~ 		Rule_AddInterval( "Rule_MessageFromHiigara", 10 )
		Rule_Remove( "Rule_ChimeraIsSafeCompleted" )
		
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameProtectMothership", 1 )
		
	end
end

function Rule_SaveTheGameProtectMothership()
	Rule_Remove ("Rule_SaveTheGameProtectMothership")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6402" )	--  Protect the Mothership
end

--~ function Rule_MessageFromHiigara()
--~ 	Event_Start( "autofocus_premothershiplaunches" )
--~ 	Rule_Remove( "Rule_MessageFromHiigara" )
--~ end
-- END GAME: RESEARCH PLASMA BOMBS

-- BEGIN GAME: BUILD ATTACK BOMBERS
-- player has researched plasma bomb tech
-- this is no longer necessary
function Rule_BuildAttackBombers()
	if ( Player_HasResearch(g_playerID, "PlasmaBombs") == 1 ) then
		
		-- give player enough RU's for attack bombers
		Player_SetRU( 0, Player_GetRU( 0 ) + 700 )
		
		Objective_SetState( obj_prim_researchplasmabomb_id, OS_Complete )
		Player_UnrestrictBuildOption( g_playerID, "Hgn_AttackBomber" )
		
		Event_Start( "speechevent_buildattackbombers" )
		
		Rule_Add( "Rule_HasBuiltAttackBombers" )
		
		Rule_Remove( "Rule_BuildAttackBombers" )
	end
end

-- player has built attack bombers
function Rule_HasBuiltAttackBombers()
	if ( Stats_ShipsCreated( g_playerID, GetShipId( "Hgn_AttackBomber" ) ) >= 5 ) then
	
		Objective_SetState( obj_prim_buildtwobombers_id, OS_Complete )
		
--~ 		Event_Start( "speechevent_newbuildoptionsavailable" )
		
--~ 		Player_UnrestrictBuildOption( 0, "Research" ) --Research
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_Scout" ) --Hgn_Scout
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_ResourceCollector" ) --Hgn_ResourceCollector
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_Probe" ) --Hgn_Probe
		
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_C_Production_Fighter" ) --Hgn_C_Production_Fighter
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_MS_Production_Fighter" ) --Hgn_MS_Production_Fighter
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_Interceptor" ) --Hgn_Interceptor
--~ 		Player_UnrestrictBuildOption( 0, "Hgn_AttackBomber" ) --Hgn_AttackBomber

		Player_UnrestrictBuildOption( 0, "Hgn_C_Module_Research" ) --Hgn_C_Module_Research
		Player_UnrestrictBuildOption( 0, "Hgn_MS_Module_Research" ) --Hgn_MS_Module_Research
		Player_UnrestrictBuildOption( 0, "Hgn_Scout" ) --Hgn_Scout
		Player_UnrestrictBuildOption( 0, "Hgn_ResourceCollector" ) --Hgn_ResourceCollector
		Player_UnrestrictBuildOption( 0, "Hgn_Probe" ) --Hgn_Probe
		 -----RESEARCH DATA-----
--~ 		Player_UnrestrictResearchOption( 0, "MothershipHealthUpgrade1" ) --MothershipHealthUpgrade1
--~ 		Player_UnrestrictResearchOption( 0, "MothershipMAXSPEEDUpgrade1" ) --MothershipMAXSPEEDUpgrade1
--~ 		Player_UnrestrictResearchOption( 0, "InterceptorMAXSPEEDUpgrade1" ) --InterceptorMAXSPEEDUpgrade1
--~ 		Player_UnrestrictResearchOption( 0, "AttackBomberMAXSPEEDUpgrade1" ) --AttackBomberMAXSPEEDUpgrade1
--~ 		Player_UnrestrictResearchOption( 0, "ResourceCollectorHealthUpgrade1" ) --ResourceCollectorHealthUpgrade1
		
		Rule_Remove( "Rule_HasBuiltAttackBombers" )		
		
		Rule_AddInterval( "Rule_StartCheckingNoBombers", 5 )
	end
end

function Rule_StartCheckingNoBombers()
	Rule_Add( "Rule_PlayerHasNoBombers" )
	Rule_Remove( "Rule_StartCheckingNoBombers" )
end
-- END GAME: BUILD ATTACK BOMBERS

-- BEGIN GAME: MORE INCOMING
-- everything here is so that we can open the gates and start sending attackers through into the mothership
function Rule_KeepTanisAlive1()
	if ( SobGroup_HealthPercentage("Tanis_Structure_1") <= .15 ) then
		SobGroup_SetHealth( "Tanis_Structure_1", .2 )
	end
end

function Rule_KeepTanisAlive2()
	if ( SobGroup_HealthPercentage("Tanis_Structure_2") <= .15 ) then
		SobGroup_SetHealth( "Tanis_Structure_2", .2 )
	end
end

function Rule_DeployGates()
	-- deploy the gates
	for i=1,3 do
		SobGroup_Move( 3, "WaveOne_Gate_"..i.."b", "vol_WaveOne_Gate_"..i.."_B" )
		Rule_Add( "Rule_WaveOne_Gate"..i.."_InPosition" )
	end
	
	Rule_Add( "Rule_BeginHyperspaceAtGate" )
	Rule_Add( "Rule_AttackAtGate" )
	Rule_Add( "Rule_GateDestroyed" )
	
	for i=1,3 do
		SobGroup_Create( "waveone_tempgroup"..i )
	end
	
	--Rule_Add( "Rule_NewVaygrAttackingPlayer" )
	
	Rule_Add( "Rule_AllGatesDestroyed" )
	Rule_Add( "Rule_FirstGatesDestroyed" )
	
	Rule_Remove( "Rule_DeployGates" )
end

-- when gates  in position deploy them
function Rule_WaveOne_Gate1_InPosition()
	if( SobGroup_FillSobGroupInVolume("shipsInVolume", "WaveOne_Gate_1b", "vol_WaveOne_Gate_1_B" ) == 1) then
		g_gatedeployed = g_gatedeployed + 1
		SobGroup_FormHyperspaceGate("WaveOne_Gate_1a", "WaveOne_Gate_1b")
		Rule_Remove( "Rule_WaveOne_Gate1_InPosition" )
	end
end

function Rule_WaveOne_Gate2_InPosition()
	if ( SobGroup_FillSobGroupInVolume( "shipsInVolume", "WaveOne_Gate_2b", "vol_WaveOne_Gate_2_B" ) == 1 ) then
		g_gatedeployed = g_gatedeployed + 1
		SobGroup_FormHyperspaceGate("WaveOne_Gate_2a", "WaveOne_Gate_2b")
		Rule_Remove( "Rule_WaveOne_Gate2_InPosition" )
	end
end

function Rule_WaveOne_Gate3_InPosition()
	if ( SobGroup_FillSobGroupInVolume( "shipsInVolume", "WaveOne_Gate_3b", "vol_WaveOne_Gate_3_B" ) == 1 ) then
		g_gatedeployed = g_gatedeployed + 1
		SobGroup_FormHyperspaceGate("WaveOne_Gate_3a", "WaveOne_Gate_3b")
		Rule_Remove( "Rule_WaveOne_Gate3_InPosition" )
	end
end

-- here we order wave one through their respective hyperspace gates. once they are through, we order them to attack.
WaveOne_GateAttackers = {0,0,0}
g_createattackers = 1
function Rule_BeginHyperspaceAtGate()	
	
	for i=1, getn(WaveOne_GateAttackers) do
		
		if ( WaveOne_GateAttackers[i] == 0 ) and ( SobGroup_IsGateDeployed(  "WaveOne_Gate_"..i.."a", "WaveOne_Gate_"..i.."b" ) == 1 ) then
			-- first, dynamically create more attackers.
			if ( g_createattackers == 1 ) then
				CreateMoreAttackers()
				
				g_createattackers = 0
			end
			
			SobGroup_UseHyperspaceGate( "WaveOne_Attackers_"..i, "WaveOne_Gate_"..i.."a" )
			-- mark these as moved through
			WaveOne_GateAttackers[i] = 1
			g_WaveOne_HyperspaceIssued = g_WaveOne_HyperspaceIssued + 1
			
			if ( g_WaveOne_HyperspaceIssued >= 1 ) then
				g_gatejustopened = "WaveOne_Gate_"..i.."b"
				Subtitle_TimeCounterEnd()
				--Sound_StingerPlay( "data:sound/music/battle/battle_01" )
				Event_Start( "intelevent_moreincoming" )
				--Rule_Add( "Rule_StartCheckingNoBombers" )
			end
			
		end
	end
	
	-- if this is equal to the number of attackers then remove the rule
	if ( g_WaveOne_HyperspaceIssued == getn(WaveOne_GateAttackers) ) then
		Rule_Remove( "Rule_BeginHyperspaceAtGate" )
	end
end

function Rule_AttackAtGate()
	
	for i=1, getn(WaveOne_GateAttackers) do
		if ( WaveOne_GateAttackers[i] == 1 ) and ( SobGroup_FillSobGroupInVolume( "tempSobGroup", "WaveOne_Attackers_"..i, "vol_WaveOne_Gate_"..i.."_B" ) == 1) then
		
			-- bomber group, attack structure
			if ( i == 1 ) then
				SobGroup_Attack( 3, "WaveOne_Attackers_"..i, "Tanis_Structure_1" )
			-- interceptor group, guard
			elseif ( i == 2 ) then
				--SobGroup_GuardSobGroup( "WaveOne_Attackers_"..i, "WaveOne_AllGatesB" )
				-- attack the players bombers
--~ 				Player_FillShipsByType( "tempSobGroup", 0, "Hgn_AttackBomber" )
				SobGroup_Attack( 3, "WaveOne_Attackers_"..i, "Tanis_Structure_1" )
			-- bomber group, attack structure
			elseif ( i == 3 ) then
				SobGroup_Attack( 3, "WaveOne_Attackers_"..i, "Tanis_Structure_2" )		
			end			
			
			--SobGroup_GuardSobGroup( "WaveOne_Attackers_"..i, "WaveOne_Gate_"..i.."b")			
			
			WaveOne_GateAttackers[i] = 2
			g_WaveOne_AttacksIssued = g_WaveOne_AttacksIssued + 1
			print( "attack "..i.." issued" )		
			
		end
	
	end
	-- if this is equal to the number of attackers then remove the rule
	if ( g_WaveOne_AttacksIssued == getn(WaveOne_GateAttackers) ) then
		Rule_Remove( "Rule_AttackAtGate" )
	end
end

function Rule_GateDestroyed()
	for i=1, getn( WaveOne_GateAttackers ) do
		if ( SobGroup_Empty( "WaveOne_Gate_"..i.."b" ) == 1 ) and ( WaveOne_GateAttackers[i] ~= 3 ) then
			WaveOne_GateAttackers[i] = 3
			g_WaveOne_GatesDestroyed = g_WaveOne_GatesDestroyed + 1
			print( "gate "..i.." destroyed" )
			-- if 3 are destroyed, then stop checking
			if ( g_WaveOne_GatesDestroyed == 3 ) then
				Rule_Remove( "Rule_PlayerHasNoBombers" )
				Rule_Remove( "Rule_GateDestroyed" )
			end
		end
	end
end

function Rule_AllGatesDestroyed()
	if ( g_WaveOne_GatesDestroyed == 3 ) and ( SobGroup_Empty( "Vgr_AllGateAttacks" ) == 1 ) then
	
		Objective_SetState( obj_prim_destroyvaygrgates_id, OS_Complete )
		
		-- if all of the gates have been destroyed destroy everything at the other end
		SobGroup_FillSobGroupInVolume ("tempSobGroup","Player_Ships3", "vol_GateStartPoint" )
		SobGroup_TakeDamage( "tempSobGroup", 1 )
	
		Rule_Remove( "Rule_AllGatesDestroyed" )
		Rule_Remove( "Rule_PlayerHasNoBombers" )
		--Rule_Remove( "Rule_NewVaygrAttackingPlayer" )
		
	end
end

function Rule_FirstGatesDestroyed()
	if ( g_WaveOne_GatesDestroyed == 1 ) then
		
		Event_Start( "speechevent_firstgatedestroyed" )
		
--~ 		Rule_AddInterval( "Rule_MessageFromHiigara", 25 )
		
		Rule_Remove( "Rule_FirstGatesDestroyed" )		
		
	end
end

-- here we scale the number of units that come through the gate relative to the number of units that the player has
function CreateMoreAttackers()
    SobGroup_FillShipsByType( "tempSobGroup", "Player_Ships0", "Hgn_Interceptor" )
	numberOfInterceptors = SobGroup_Count( "tempSobGroup" )
	SobGroup_FillShipsByType( "tempSobGroup", "Player_Ships0", "Hgn_AttackBomber" )
	numberOfBombers = SobGroup_Count( "tempSobGroup" )
	
	print( "interceptors: "..numberOfInterceptors )
	print( "bombers: "..numberOfBombers )
	
	if ( numberOfInterceptors >= 15 ) then
		-- spawn more squadron of bombers
		numberOfNewAttackBombers = numberOfInterceptors / 5
		numberOfNewAttackBombers = numberOfNewAttackBombers / 2
		
		floor( numberOfNewAttackBombers )
		
		if ( numberOfNewAttackBombers > 0 ) then
			print( "creating new bombers: "..numberOfNewAttackBombers )
			for i=1, numberOfNewAttackBombers do
				SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "WaveOne_Attackers_A"..i, "WaveOne_Attackers_1", "vol_WaveOne_Gate_1_A")
			end
			
			for i=1, numberOfNewAttackBombers do
				SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "WaveOne_Attackers_B"..i, "WaveOne_Attackers_3", "vol_WaveOne_Gate_3_A")
			end
		end
		
		SobGroup_SetROE( "WaveOne_Attackers_1", OffensiveROE )
		SobGroup_SetStance( "WaveOne_Attackers_1", AggressiveStance)

		SobGroup_SetROE( "WaveOne_Attackers_3", OffensiveROE )
		SobGroup_SetStance( "WaveOne_Attackers_3", AggressiveStance )
		
		SobGroup_SobGroupAdd("Vgr_MothershipAttackers", "WaveOne_Attackers_1")
		SobGroup_SobGroupAdd("Vgr_MothershipAttackers", "WaveOne_Attackers_3")
	end
	
	if ( numberOfBombers >= 10 ) then
		healthOfGates = numberOfBombers / 5
		healthOfGates = healthOfGates / 2
		-- floor( healthOfGates )
		
		for i=1,3 do
			SobGroup_SetHealth( "WaveOne_Gate_"..i.."a", healthOfGates )
		end
		
		numberOfNewInterceptors = numberOfBombers / 5
		numberOfNewInterceptors = numberOfNewInterceptors / 2
		floor( numberOfNewInterceptors )
		
		if ( numberOfNewInterceptors > 0 ) then
			print( "creating new interceptors: "..numberOfNewInterceptors )
			for i=1, numberOfNewInterceptors do
				SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Interceptor", "WaveOne_Attackers_2", "WaveOne_Attackers_2", "vol_WaveOne_Gate_2_A")
			end
		end
		
		SobGroup_SetROE( "WaveOne_Attackers_2", OffensiveROE )
		SobGroup_SetStance( "WaveOne_Attackers_2", AggressiveStance )
		
		SobGroup_SobGroupAdd("Vgr_MothershipAttackers", "WaveOne_Attackers_2")
	end
end

function Rule_NewVaygrAttackingPlayer()
	for i=1, 3 do
		-- clear and fill shipsInVolume
		Player_FillSobGroupInVolume("shipsInVolume", 3,  "vol_WaveOne_Gate_"..i.."_B")
		--print( "ShipsinVol Variable Created" )
	
		--	print( "shipsinVol check" )
		SobGroup_FillSubstract( "fightersInVolume", "shipsInVolume" , "WaveOne_Gate_"..i.."b" )
		--	print( "Carrier inVol Variable Created" )
		
		if ( SobGroup_Empty( "fightersInVolume" ) == 0 ) then			
				SobGroup_SobGroupAdd( "Vgr_AllGateAttacks", "fightersInVolume" )
		end
	end
end
-- END GAME: MORE INCOMING

-- GAME: PLAYER HAS NO BOMBERS
function Rule_PlayerHasNoBombers()
	if ( Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping( 0, "Hgn_AttackBomber" ) == 0 ) then
		Player_SetRU( 0, Player_GetRU( 0 ) + 700 )
		
		Event_Start( "speechevent_attackbombersdestroyed" )
		
		Rule_Remove( "Rule_PlayerHasNoBombers" )
	end
end


-- BEGIN GAME: HYPERSPACE OUT
-- once the vaygr have been eliminated, we hyperspace out
function Rule_VaygrEliminated()
	
	if ( SobGroup_Empty( "Vgr_MothershipAttackers" ) == 1 ) then
		
		Objective_SetState( obj_prim_protectmothership_id, OS_Complete )	
		
		Rule_Remove( "Rule_VaygrEliminated" )
	end
end

-- if all objectives are complete.
function Rule_PlayerWins()
	if ( Objective_GetState( obj_prim_beginharvesting_id ) == OS_Complete ) and
	( Objective_GetState( obj_prim_buildfightersubsystem_id ) == OS_Complete ) and
	( Objective_GetState( obj_prim_buildtwointerceptors_id ) == OS_Complete ) and
	--( Objective_GetState( obj_prim_researchplasmabomb_id ) == OS_Complete ) and
	--( Objective_GetState( obj_prim_buildtwobombers_id ) == OS_Complete ) and
	( Objective_GetState( obj_prim_destroyvaygrgates_id ) == OS_Complete ) and
	( g_eventisdone == 1 ) then
	
		-- turn off invulnerable subsystem
		SobGroup_SetInvulnerabilityOfHardPoint( "Mothership", "HardpointProduction1", 0 )
		
		SobGroup_AbilityActivate( "Mothership", AB_Move, 1 )
		-- reenable scuttle
		Universe_EnableCmd(1, MUI_ScuttleCommand)
	
		--Sound_MusicPlay( "data:sound/music/ambient/AMB_01" )
		Event_Start( "intelevent_mothershipjumps" )
		Rule_Add( "Rule_VaygrEnterHyperspace" )
		Rule_Remove( "Rule_PlayerWins" )
	end
end

function MothershipHasLaunchedFromTanis()
	if ( SobGroup_IsDockedSobGroup( "Mothership", "Tanis" ) == 0 ) then
		return true
	end
end


function Rule_VaygrEnterHyperspace()
	if (g_vaygrexithyperspace == 1 ) then
		Event_Start( "vaygrexithyperspace" )
		Rule_Remove( "Rule_VaygrEnterHyperspace" )
	end
end
-- END GAME: HYPERSPACE OUT

-- BEGIN GAME: LOSE CONDITIONS
-- Lose condition
function Rule_PlayerLose()
	
	if ( SobGroup_Empty( "Mothership" ) == 1 ) then
		
		Event_Start( "speechevent_playerloses" )
		
		Rule_Remove( "Rule_PlayerLose" )
		
	end
	
end
-- END GAME: LOSE CONDITIONS


-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_beginharvesting =
{
	{					
		{ "Universe_EnableSkip(1)", "" },
		HW2_LocationCardEvent( "$40520", 4 ),
	},
	{
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Sound_EnableAllSpeech( 1 )",""},
		{ "Sound_EnterIntelEvent()","" },
		HW2_Wait( 1 ),		
	},
	{					
		
		--HW2_Letterbox( 1 ),
		HW2_Wait( 1 ),
	},	
	{
		{ "Camera_Interpolate( 'here', 'camera_focusonMothership', 3)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40530", 5 ),
	},
	{
		HW2_Wait( 1 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40531", 8 ),
	},
	{
		HW2_Wait( 1 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40532", 10 ),	
		--{ "Camera_FocusSobGroup( 'Mothership', 1,3000,1 )", "" },
	},
	{
		HW2_Wait( 1 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40533", 10 ),		
	},		
	{
		HW2_Wait( 1 ),
	},
	{				
		HW2_SubTitleEvent( Actor_FleetIntel, "$40534", 10 ),
	},	
	{
		HW2_Wait( 1 ),
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{"Sensors_Toggle( 1 )",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40535", 5 ),	
		{ "Camera_Interpolate( 'here', 'camera_FocusOnResources', 2 )",""},	
	},	
	{
		HW2_Wait( 2 ),
	},
	{	
	    { "Player_FillShipsByType('tempSobGroup', 0, 'Hgn_ResourceCollector')", "" },
		{ "g_pointer_default1 = HW2_CreateEventPointerSobGroup( 'tempSobGroup' )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$40536", 10 ),		
	},
	{
		HW2_Wait( 1 ),
	},
	{
		{ "EventPointer_Remove(g_pointer_default1)", "" },
		{ "g_pointer_default1 = HW2_CreateEventPointerVolume( 'vol_Resources' )", "" },	
		{ "obj_prim_beginharvesting_id = Objective_Add( obj_prim_beginharvesting, OT_Primary )", "" },
		{ "Objective_AddDescription( obj_prim_beginharvesting_id, '$40950')", "" },	
		{"ping_resource_operation_id = HW2_PingCreateWithLabelPoint ( ping_resource_operation, 'vol_Resources' )",""},
		{"Ping_AddDescription(ping_resource_operation_id, 0, '$40900')",""},	
		HW2_SubTitleEvent( Actor_FleetIntel, "$40537", 10 ),		
	},
	{	
		{ "EventPointer_Remove(g_pointer_default1)", "" },
		{ "Camera_Interpolate( 'here', 'camera_focusOnCollector', 2 )",""},	
		{"Sensors_Toggle( 0 )",""},		
		HW2_Wait(2),
	},
	{
		{ "Sound_ExitIntelEvent()","" },	
		{ "Sound_SetMuteActor('')", ""},
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{ "Universe_EnableSkip(0)", "" },		
	},
}

Events.intelevent_subsystemconstruction =
{
	{				
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$40540", 8 ),
	},
	{		
		HW2_Wait(1),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetCommand, "$40541", 5 ),
	},
	{		
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait(2),				
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{"Sensors_Toggle( 0 )",""},
		{ "Camera_Interpolate( 'here', 'camera_focusOnProdFacilities', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40542", 8 ),
	},
	{		
		HW2_Wait(1),
	},
	{
		{ "obj_prim_buildfightersubsystem_id = Objective_Add( obj_prim_buildfightersubsystem, OT_Primary )", "" },
		{ "Objective_AddDescription( obj_prim_buildfightersubsystem_id, '$40960')", "" },
		{ "UI_FlashButton('NewTaskbar', 'btnBuild', -1)", "" },
		{ "Rule_Add( 'Rule_monitorBuildBtn' )",""},
		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40543", 5 ),
	},
	{
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{ "Sound_SetMuteActor('')", ""},
		{ "Sound_ExitIntelEvent()","" },
		{ "Universe_EnableSkip(0)", "" },
	},
}

Events.intelevent_constructinterceptors =
{
	{		
		{ "Universe_EnableSkip(1)", "" },
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Letterbox( 1 ),
		HW2_Wait(2),
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{"Sensors_Toggle( 0 )",""},
		{ "g_pointer_default = HW2_CreateEventPointerSubSystem( 'FighterProduction', 'Mothership' )", "" },
		{ "Camera_Interpolate( 'here', 'camera_focusOnFighterSub', 2)",""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$40550", 5  ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetCommand, "$40551", 5  ),
	},
	{		
		HW2_Wait(1),
	},
	{
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{ "UI_FlashButton('NewTaskbar', 'btnBuild', -1)", "" },
		{ "Rule_Add( 'Rule_monitorBuildBtn' )",""},
		{ "obj_prim_buildtwointerceptors_id = Objective_Add( obj_prim_buildtwointerceptors, OT_Primary )", "" },
		{ "Objective_AddDescription( obj_prim_buildtwointerceptors_id, '$40965')", "" },
		{ "Objective_AddDescription( obj_prim_buildtwointerceptors_id, '$40966')", "" },
		{ "Player_UnrestrictBuildOption( g_playerID, 'Hgn_Interceptor' )",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40552", 5 ),
	},
	{
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Sound_SetMuteActor('')", ""},
		{ "Sound_ExitIntelEvent()","" },
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{ "Universe_EnableSkip(0)", "" },
	},
}

Events.intelevent_movetochimera =
{	
	{		
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(4),		
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40570", 8 ),
	},
	{
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait(2),		
	},
	{
		{"Sensors_Toggle( 1 )",""},
		HW2_Wait(1),
	},
	{	
		{ "Camera_Interpolate( 'here', 'camera_focusOnChimera', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40571", 10 ),
	},
	{
		HW2_Wait(1.5),
	},
	{
		{ "g_pointer_default = HW2_CreateEventPointerVolume( 'vol_TargetDronesLocation' )", "" },		
		{ "obj_prim_movetochimera_id = Objective_Add( obj_prim_movetochimera, OT_Primary )", "" },
		{ "Objective_AddDescription( obj_prim_movetochimera_id, '$40985')", "" },
		{ "Objective_AddDescription( obj_prim_movetochimera_id, '$40986')", "" },
		{ "Objective_AddDescription( obj_prim_movetochimera_id, '$40987')", "" },
		{ "Rule_AddInterval( 'SwitchOwnerDrones', 0.5 )",""},
		{"ping_targetdrones_id = HW2_PingCreateWithLabelPoint( ping_targetdrones, 'vol_TargetDronesLocation' )",""},
		{"Ping_AddDescription(ping_targetdrones_id, 0, '$40905')",""},
		{"Ping_AddDescription(ping_targetdrones_id, 1, '$40906')",""},
		{"Ping_AddDescription(ping_targetdrones_id, 2, '$40907')",""},
		{ "Camera_Interpolate( 'here', 'camera_focusOnDrones', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40572", 8 ),
	},
	{
		HW2_Wait(1),
	},
	{
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{ "Player_FillShipsByType('tempSobGroup',0,'Hgn_Interceptor')",""},
		{ "Camera_FocusSobGroupWithBuffer('tempSobGroup',1000,10,2 )", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40573", 8 ),
		{ "SobGroup_FillShipsByType( 'tempSobGroup', 'Player_Ships0', 'Hgn_Interceptor' )", "" },
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup( 'tempSobGroup'  )", "" },	
	},
	{
		HW2_Wait(1),
	},
	{	
		{ "EventPointer_Remove(g_pointer_default)", "" },	
		{ "Sensors_Toggle( 0 )","" },		
		HW2_Wait(1),		
	},
	{				
		HW2_Letterbox( 0 ),
		--HW2_Pause( 0 ),
		HW2_Wait(2),
		{ "Sound_SetMuteActor('')", ""},
		{ "Sound_ExitIntelEvent()","" },
		{ "Universe_EnableSkip(0)", "" },
	},
}

Events.speechevent_attackcomplete =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		
		HW2_SubTitleEvent( Actor_AllShips, "$40710", 5 ),
	},
	{
		{ "Sound_SetMuteActor('')", ""},
		{ "Sound_ExitIntelEvent()","" },
	},
}

Events.intelevent_perimiterbreached =
{
	{
		{ "Universe_EnableSkip(1)", "" },
		{ "Sound_SetMuteActor('Fleet')", ""},		
		{ "Sound_EnterIntelEvent()","" },		
		--HW2_Letterbox( 1 ),
		--HW2_Wait(2),		
	},
	{
		{"Sensors_Toggle( 1 )",""},	
		--HW2_Pause( 1 ),		
		HW2_Wait(1),	
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_focusOnVaygrBombers', 3)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40580", 8 ),
	},
	{
		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40581", 5 ),
	},
	{		
		--{ "g_pointer_default = HW2_CreateEventPointerSobGroup('ChimeraInterceptors')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$40582", 5 ),
	},
	{
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{ "g_pointer_default1 = HW2_CreateEventPointerSobGroup('Vgr_Bombers')", "" },
		{"ping_vaygrbombers_id = Ping_AddSobGroup( ping_vaygrbombers, 'anomaly', 'Vgr_Bombers' )",""},
		{"Ping_AddDescription(ping_vaygrbombers_id, 0, '$40910')",""},
		{ "obj_prim_defeatvaygratchimera_id = Objective_Add( obj_prim_defeatvaygratchimera, OT_Primary )", "" },
		{ "Objective_AddDescription( obj_prim_defeatvaygratchimera_id, '$40910')", "" },
		{ "Objective_AddDescription( obj_prim_defeatvaygratchimera_id, '$40981')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$40583", 10 ),
	},
	{
		{ "EventPointer_Remove(g_pointer_default1)", "" },
		--{ "Camera_FocusSobGroup( 'Station_Chimera', 1,1000,0.4 )", "" },
		HW2_Wait(0.4),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		--HW2_Pause( 0 ),
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
		{ "Universe_EnableSkip(0)", "" },
	},
}

Events.autofocus_premothershiplaunches  =
{
	{
		{ "g_eventisdone = 0",""},
		--{ "Universe_EnableSkip(1)", "" },	
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait( 3 ),
	},
	
	{			
		HW2_SubTitleEvent( Actor_FleetIntel, "$40651", 5 ),
	},
	{
		HW2_Wait(1),	
	},
	{			
		HW2_SubTitleEvent( Actor_AllShips, "$40652", 10 ),
	},
	{			
		HW2_SubTitleEvent( Actor_AllShips, "$40653", 5 ),
	},
	{			
		HW2_SubTitleEvent( Actor_AllShips, "$40654", 5 ),
	},
	{			
		HW2_SubTitleEvent( Actor_AllShips, "$40655", 5 ),
	},
	{			
		HW2_SubTitleEvent( Actor_FleetCommand, "$40656", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
		--{ "Universe_EnableSkip(0)", "" },
		{ "g_eventisdone = 1",""},
	},
}

Events.autofocus_mothershiplaunches  =
{
	{
		{ "g_eventisdone = 0",""},
		HW2_Wait(2),
	},
	{
		{ "Universe_EnableSkip(1)", "" },
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_AllowPlayerOrders( 0 )", "" },
		{ "Camera_AllowControl(0)",""},
		{ "SobGroup_DeSelectAll()",""},
		{ "Camera_Interpolate( 'here', 'camera_focusChimeraPostAttack', 2)",""},
		HW2_Letterbox( 1 ),
		HW2_Wait(2),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40650", 8 ),
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_focusOnMSAttackers', 2)",""},
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40666", 8 ),
	},
	{
		--{ "Sound_StingerPlay( 'data:sound/music/ambient/ADAGIO' )",""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$40667", 8 ),
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_MSLaunchCamera1', 4)",""},
		HW2_Wait(2),
	},
	{					
		HW2_SubTitleEvent( Actor_FleetCommand, "$40657", 5 ),
	},	
	{
		HW2_Wait(2),
	},
	{			
		HW2_SubTitleEvent( Actor_Tanis, "$40658", 5 ),
		{ "Camera_Interpolate( 'here', 'camera_MSLaunchCamera2', 0)",""},
	},
	{
		HW2_Wait(2),
	},
	{			
		HW2_SubTitleEvent( Actor_Tanis, "$40659", 5 ),
		--{ "FX_PlayEffect( 'ion_cannon_steam_spray', 'vol_steam_1', 5.0 )",""},
		{ "FX_PlayEffect( 'ion_cannon_steam_spray', 'vol_steam_2', 4.0 )",""},
		{ "SobGroup_Launch( 'Mothership', 'Tanis' )", "" },
	},
	{
		HW2_Wait(6),
	},
	{				
		HW2_SubTitleEvent( Actor_Tanis, "$40660", 5 ),
	},	
	{
		HW2_Wait(6),
		{ "Camera_Interpolate( 'here', 'camera_MSLaunchCamera3', 20)",""},
	},
	{			
		HW2_SubTitleEvent( Actor_Tanis, "$40661", 5 ),		
	},
	{
		HW2_Wait(2),
	},
	{			
		HW2_SubTitleEvent( Actor_Tanis, "$40662", 5 ),
	},
	{
		HW2_Wait(3),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$40663", 5 ),
--~ 		{ "Camera_Interpolate( 'here', 'camera_MSLaunchCamera4', 6)",""},
	},
	{
		HW2_Wait(3),
	},
	{			
		HW2_SubTitleEvent( Actor_FleetCommand, "$40664", 5 ),		
	},
	{
		--HW2_Letterbox( 0 ),
		--HW2_Wait(2),
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
		{ "Universe_AllowPlayerOrders( 1 )", "" },
		{ "Camera_AllowControl( 1 )",""},
		{ "Universe_EnableSkip(0)", "" },
		{ "g_eventisdone = 1",""},
	},
}

Events.intelevent_chimeraissafe =
{
	{
		{ "Universe_EnableSkip(1)", "" },
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		--HW2_Wait(3),
	},
	{
		--HW2_Letterbox( 1 ),
		HW2_Wait(2),
	},
	{
		{"Sensors_Toggle( 1 )",""},		
		HW2_Wait(1),	
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_focusOnIncomingEnemy', 2)",""},
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup('WaveOne_Gate_1b')", "" },
		{ "g_pointer_default1 = HW2_CreateEventPointerSobGroup('WaveOne_Gate_2b')", "" },
		{ "g_pointer_default2 = HW2_CreateEventPointerSobGroup('WaveOne_Gate_3b')", "" },
		{ "g_pointer_default3 = HW2_CreateEventPointerSobGroup('MothershipAttackers')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$40590", 8 ),
	},
	{		
		{ "Timer_Start( 0, 120 )",""},
		{ "Timer_Pause( 0 )","" },
		{ "Subtitle_TimeCounter( 0, 40521 )",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40691", 8 ),
	},
	{			
		HW2_SubTitleEvent( Actor_FleetIntel, "$40612", 8 ),
	},
	{	
		--{ "Camera_Interpolate( 'here', 'camera_focusOnMSAfterIncoming', 2)",""},
		{ "Camera_FocusSobGroupWithBuffer( 'MothershipAttackers', 3000, 10, 2 )", ""},
		--{ "Camera_FocusSobGroup( 'MothershipAttackers', 1,3000,2 )", "" },
		{ "UI_FlashButton('NewTaskbar', 'btnBuild', 10)", "" },
		{ "obj_prim_buildtwobombers_id = Objective_Add( obj_prim_buildtwobombers, OT_Secondary )", "" },
		{ "Objective_AddDescription( obj_prim_buildtwobombers_id, '$40975')", "" },		
		{ "obj_prim_protectmothership_id = Objective_Add( obj_prim_protectmothership, OT_Primary )", "" },
		{ "Objective_AddDescription( obj_prim_protectmothership_id, '$40998')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$40613", 8 ),
	},
	{	
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{ "EventPointer_Remove(g_pointer_default1)", "" },
		{ "EventPointer_Remove(g_pointer_default2)", "" },
		{ "EventPointer_Remove(g_pointer_default3)", "" },
		{ "Sensors_Toggle( 0 )","" },
		HW2_Wait(0.5),
	},
	{		
		
		HW2_Letterbox( 0 ),
		HW2_Pause( 0 ),
		HW2_Wait(2),
		{ "Timer_Resume(0)",""},
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
		{ "Universe_EnableSkip(0)", "" },
	},
}

Events.intelevent_moreincoming =
{
	{		
		HW2_Wait(5),
	},
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Camera_Interpolate( 'here', 'camera_focusOnGate', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40600", 5 ),
		--{ "Camera_FocusSobGroup( 'Mothership', 1,1000,1 )", "" },
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40601", 5 ),
	},	
	{
		HW2_Pause( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait(2),		
	},
	{
		{"Sensors_Toggle( 1 )",""},		
		HW2_Wait(1),	
	},	
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40602", 8 ),
	},	
	{	
		{"ping_vaygrhyperspacegate_waveone_id[1] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_1b' )",""},
		{"ping_vaygrhyperspacegate_waveone_id[2] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_2b' )",""},
		{"ping_vaygrhyperspacegate_waveone_id[3] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_3b' )",""},
		--{"ping_vaygrhyperspacegate_waveone_id[4] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_4b' )",""},
		{ "obj_prim_destroyvaygrgates_id = Objective_Add( obj_prim_destroyvaygrgates, OT_Primary )", "" },	
		{ "Objective_AddDescription( obj_prim_destroyvaygrgates_id , '$40995')", "" },		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40603", 10 ),
	},
	{	
		--{ "Camera_FocusSobGroup( 'Mothership', 1,1000,1 )", "" },
		HW2_Wait(1),
	},
	{		
		{ "Sensors_Toggle( 0 )","" },
		HW2_Letterbox( 0 ),
		HW2_Pause( 0 ),
		HW2_Wait(2),
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
		{ "Universe_EnableSkip(0)", "" },
	},
}

Events.speechevent_buildattackbombers =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "obj_prim_buildtwobombers_id = Objective_Add( obj_prim_buildtwobombers, OT_Secondary )", "" },
		{ "Objective_AddDescription( obj_prim_buildtwobombers_id, '$40975')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$40610", 7 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40611", 7 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40612", 7 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_firstgatedestroyed =
{
	{
		HW2_Wait(2),
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40560", 5 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$40561", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_attackbombersdestroyed =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40620", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40621", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_chimerareporting =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_Chimera, "$40640", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_Chimera, "$40641", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_newbuildoptionsavailable =
{
	{		
		HW2_Wait( 10 ),
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		{ "Sound_EnterIntelEvent()","" },
		
		HW2_SubTitleEvent( Actor_FleetCommand, "$40720", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_ic =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$40710", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_mothershipjumps  =
{
	{
		{ "Camera_AllowControl(0)",""},
		{ "Universe_AllowPlayerOrders( 0 )", "" },
		{ "Universe_EnableSkip(1)", "" },
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "SobGroup_SetAutoLaunch('Mothership', ShipHoldStayDockedAlways)",""},		
		{ "SobGroup_SetROE('Player_Ships0', PassiveROE)", "" },
		{ "Sensors_EnableCameraZoom( 0 )", "" },
		{ "Sensors_Toggle( 0 )", "" },
		--{ "SetTOSettings( TO_NoATIAtAll )","" },
		{ "SobGroup_DeSelectAll()",""},
		HW2_Wait( 1 ),
		HW2_Letterbox( 1 ),
	},
	{				
		HW2_SubTitleEvent( Actor_FleetIntel, "$40630", 8 ),
	},	
	{
		HW2_Wait( 1 ),
	},
	{			
		{ "Camera_Interpolate( 'here', 'camera_mothershipHyperspace', 3)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40631", 7 ),
		{ "SobGroup_DockSobGroup( 'Player_Ships0', 'Mothership')","" },		
	},
	{
		HW2_Wait( 10 ),
	},
	{
		HW2_Wait( 12 ),
		{ "g_vaygrexithyperspace = 1",""},
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
	},
	{						
		{ "Camera_Interpolate( 'here', 'camera_focusOnVaygrAttacking', 3)",""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$40632", 7 ),
	},	
	{
		HW2_Wait( 8 ),
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_focusOnVaygrAttacking2', 0)",""},
		HW2_Wait( 5 ),
	},
	{
		--{ "SobGroup_TakeDamage( 'Tanis_Structure_1',1)",""},
		HW2_Wait( 1 ),
	},
	{				
		HW2_SubTitleEvent( Actor_FleetCommand, "$40633", 7 ),
	},
	{
		HW2_Wait( 1 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetCommand, "$40634", 7 ),
		
		{ "Camera_Interpolate( 'here', 'camera_MSActuallyEntersHS', 0)",""},
		{ "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "" },
		HW2_Wait( 6 ),
	},
	{
		{ "FX_StartEvent( 'Tanis', 'Pyro' )",""},
		HW2_Wait( 3 ),
	},
	{
		{ "SobGroup_TakeDamage( 'Tanis_Structure_2',1)",""},
		HW2_Wait( 1 ),
	},
	{
		{ "Universe_Fade( 1, 2 )","" },
		HW2_Wait( 3 ),
	},
	{
		HW2_LocationCardEvent( "$40523", 4 ),
	},
	{
		HW2_Wait( 2 ),
	},
	{
		--{ "Sound_ExitIntelEvent()","" },
		--{ "Universe_EnableSkip( 0 )", "" },
		{ "Camera_AllowControl(1)",""},
		--{ "ClearTOSettings()",""},
		{ "setMissionComplete( 1 )","" },		
	},
}

Events.vaygrexithyperspace =
{
	{
		{ "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_6', 'vol_Vgr_HyperspaceExit_6' )", "" },
		HW2_Wait( 1.5 ),
	},
	{
		{ "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_2', 'vol_Vgr_HyperspaceExit_2' )", "" },
		HW2_Wait( 0.1 ),
	},
	{
		{ "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_5', 'vol_Vgr_HyperspaceExit_5' )", "" },
		HW2_Wait( 0.5 ),
	},
	{
		{ "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_1', 'vol_Vgr_HyperspaceExit_1' )", "" },
		HW2_Wait( 0.8 ),
	},
	{
		{ "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_3', 'vol_Vgr_HyperspaceExit_3' )", "" },
		HW2_Wait( 1 ),
	},
	{
		{ "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_4', 'vol_Vgr_HyperspaceExit_4' )", "" },
	},
}

-- this is an event to say the player has lost
Events.speechevent_playerloses =
{
	{
		{ "Sound_EnableAllSpeech(0)","" },
		{ "Universe_AllowPlayerOrders( 0 )", "" },
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Fade( 1 ),
		HW2_Wait(2),		
	},
	{
		HW2_LocationCardEvent( "$40522", 4 ),
	},
	{
		{ "Universe_AllowPlayerOrders( 1 )", "" },
		{ "Sound_EnableAllSpeech(1)","" },
		{ "setMissionComplete( 0 )","" },
	},
}