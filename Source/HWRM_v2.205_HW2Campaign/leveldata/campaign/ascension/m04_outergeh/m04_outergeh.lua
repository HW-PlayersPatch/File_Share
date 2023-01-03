--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M04_Outer_Gehenna
--  Purpose:  Mission 4 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")

-- BALANCE/TUNING TIMERS

-- First attack group will start this long after first intelevent
g_Carrier_3_Launches_First_Attack = 60

-- Second attack group will start this long after second intelevent
g_Carrier_3_Launches_Second_Attack = 180

-- AI_1 steps up attack pacing this long after the initial intel
g_AI_1_Gets_Aggressive = 400

-- AI_2 picks up the pace this long after the player encounters it
g_Comm_Defenders_Get_Aggressive = 300

-- The Comm Station will build a unit of interceptors at this interval ONCE the player has encountered the station
g_Comm_Station_Interceptor_Build_Frequency = 120

-- The frequency with which the Vaygr Carrier will build ships to send via gates
g_Vaygr_Carrier_Build_Frequency = 100

-- Interval with which the built ships are sent via the gate (if there are any such)
g_use_gate_interval = 20

g_playerInCombat = 0

-- Interval with which ships that have been sent through a gate are given an order to either guard the inhibitors or attack the player
g_protect_inhibitor_interval = 50

-- Time after which ships sent via the hyperspace gates will chose to attack the player rather than defend the inhibitors
g_time_before_defenders_become_attackers = 300

-- It takes this long until the communications station is repaired
g_communications_subsystem_repair_time = 900

-- How much time you have left when the first warning regarding running out of time plays
g_first_repair_warning = 480

-- How much time you have left when the second warning regarding running out of time plays
g_second_repair_warning = 240

-- This much time gets added to the clock once you destroy the carrier providing repairs
g_carrier_destruction_add_time = 240

-- OBJECTIVES
obj_prim_destroy_inhibitors = "$41500"
obj_prim_destroy_inhibitors_id = 0

obj_prim_destroy_comms_subsystem = "$41501"
obj_prim_destroy_comms_subsystem_id = 0

obj_sec_capture_gate = "$41502"
obj_sec_capture_gate_id = 0		

obj_sec_prim_clearmines = "$41504"
obj_sec_prim_clearmines_id = 0

obj_prim_destroyvaygr = "$41503"
obj_prim_destroyvaygr_id = 0

obj_sec_build_minelayer = "$41505"
obj_sec_build_minelayer_id = 0

obj_sec_destroy_carrier = "$41506"
obj_sec_destroy_carrier_id = 0


-- pings
ping_hyperspace_inhibitor_1 = "$41900"
ping_hyperspace_inhibitor_id = {0,0,0}

ping_hyperspace_inhibitor_2 = "$41901"
--ping_hyperspace_inhibitor_2_id = 0

ping_hyperspace_inhibitor_3 = "$41902"
--ping_hyperspace_inhibitor_3_id = 0

ping_communications_station = "$41903"
ping_communications_station_id = 0

ping_vaygrcarriergroup = "$41905"
ping_vaygrcarriergroup_id = 0

-- events
evt_speechevent_onedown_started = 0
evt_intelevent_tacjumpon_started = 0

evt_isplaying = 0

g_AI_inhibitor_defend_id_1 = 0
g_AI_inhibitor_defend_id_2 = 0
g_AI_inhibitor_defend_id_3 = 0

-- pointers
g_pointer_default = 0
g_pointer_inhibitor1_id = 0
g_pointer_inhibitor2_id = 0
g_pointer_inhibitor3_id = 0
g_pointer_comm_station_id = 0

-- Timestamper
g_now_time = Universe_GameTime()

g_playerID = Universe_CurrentPlayer()

g_inhibitor_state = { 1,1,1 }

g_rein_1_sent = 0
g_rein_2_sent = 0
g_rein_3_sent = 0

g_timesreinforced = 0

-- this keeps track of whether a mine can be laid and when to relay them
g_mineState = { 0,0,0 }

-- place to store the name of the gate that was discovered so we can focus on it.
g_firstgateseen = 0

-- Keeps track of which gate the player is near
g_gatediscovered = 0

-- place to store the name of the minefield that was discovered so we can focus on it.
g_minediscovered = 0

-- If the player has destroyed the inhibitors or destroyed/captured the gates, then attack the player instead.
g_reinforcementsattackplayer = 0

-- This is a sobgroup to store everyone except the mothership in
g_all_ships_not_ms = 0

-- Are the communications station carriers dead?
g_Comm_Carriers_Dead = 0

-- Is the communications subsystem destroyed
g_Comm_Subsystem_Dead = 0

g_TacticalHyperspace = 1

ShipToParadeRoundTypeName = "Hgn_MotherShip"

-- Sobgroup storage to put players ships into for final Hyperspace
g_Players_Ships_Hyperspace = ""
g_Players_Ships_Docked = ""
g_Ships_To_Exit_Hyperspace = "Ships_To_Exit_Hyperspace"


evt_intelevent_tacjumpon_ended = 0

g_save_id = 0


function Enable_ResearchOptions()

	-----BUILD DATA----- 
	Player_UnrestrictBuildOption( 0, "Hgn_C_Sensors_AdvancedArray" ) --Hgn_C_Sensors_AdvancedArray 
	Player_UnrestrictBuildOption( 0, "Hgn_MS_Sensors_AdvancedArray" ) --Hgn_MS_Sensors_AdvancedArray 
	Player_UnrestrictBuildOption( 0, "Hgn_MinelayerCorvette" ) --Hgn_MinelayerCorvette 
	Player_UnrestrictBuildOption( 0, "Hgn_TorpedoFrigate" ) --Hgn_TorpedoFrigate 
	Player_UnrestrictBuildOption( 0, "Hgn_IonTurret" ) --Hgn_IonTurret 
	Player_UnrestrictBuildOption( 0, "Hgn_ProximitySensor" ) --Hgn_ProximitySensor 
	
	-----RESEARCH DATA----- 
	Player_UnrestrictResearchOption( 0, "GraviticAttractionMines" ) --GraviticAttractionMines 
	Player_UnrestrictResearchOption( 0, "PlatformIonWeapons" ) --PlatformIonWeapons 
	Player_UnrestrictResearchOption( 0, "InterceptorMAXSPEEDUpgrade1" ) --InterceptorMAXSPEEDUpgrade2 
	Player_UnrestrictResearchOption( 0, "AttackBomberMAXSPEEDUpgrade1" ) --AttackBomberMAXSPEEDUpgrade2 
	Player_UnrestrictResearchOption( 0, "TorpedoFrigateHealthUpgrade1" ) --TorpedoFrigateHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "TorpedoFrigateMAXSPEEDUpgrade1" ) --TorpedoFrigateMAXSPEEDUpgrade1 
	Player_UnrestrictResearchOption( 0, "IonTurretHealthUpgrade1" ) --IonTurretHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "ResourceCollectorHealthUpgrade1" ) --ResourceCollectorHealthUpgrade2 

end

-- Initialise all settings
function OnInit()
	SPRestrict()
	Rule_Add("Rule_Init")	
	Camera_Interpolate( 'here', 'Camera_Startpos', 0 )
	
end

-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end


function cheat()
	SobGroup_SetHardPointHealth ("inhibitor_1", "Generic 1", 0)
	SobGroup_SetHardPointHealth ("inhibitor_1", "Generic 4", 0)
	SobGroup_SetHardPointHealth ("inhibitor_1", "Generic 3", 0)
	SobGroup_SetHardPointHealth ("inhibitor_1", "Generic 2", 0)
	
	SobGroup_SetHardPointHealth ("inhibitor_2", "Generic 1", 0)
	SobGroup_SetHardPointHealth ("inhibitor_2", "Generic 4", 0)
	SobGroup_SetHardPointHealth ("inhibitor_2", "Generic 3", 0)
	SobGroup_SetHardPointHealth ("inhibitor_2", "Generic 2", 0)
	
	SobGroup_SetHardPointHealth ("inhibitor_3", "Generic 1", 0)
	SobGroup_SetHardPointHealth ("inhibitor_3", "Generic 4", 0)
	SobGroup_SetHardPointHealth ("inhibitor_3", "Generic 3", 0)
	SobGroup_SetHardPointHealth ("inhibitor_3", "Generic 2", 0)
--~ 	
--~ 	( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 1") == 0 ) and
--~ 		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 2") == 0 ) and
--~ 		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 3") == 0 ) and
--~ 		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 4") == 0 ) then

--~ 	Event_Start("intelevent_tacjumpon")
--~ 			
--~ 			-- we need to stop checking for this here because it is here that we are moving the players fleet forward.
--~ 			Rule_Remove( "Rule_PlayerIsNearToCommStation" )
--~ 			Rule_Add("Rule_CPU_1_Leaves")
--~ 			Rule_Add("Rule_End_Tacjump")

--~ 	Event_Start( "intelevent_vayrgkilled_aftersub" )
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Init()

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

		-- temp SobGroups
	SobGroup_Create("tempSobGroup")
	SobGroup_Create(g_Ships_To_Exit_Hyperspace)
	
--~ 	UI_BindKeyEvent( IKEY, 'cheat' )
	Rule_AddInterval( "Rule_DisableBuilderInterval", 20 )
	
	Sound_SpeechSubtitlePath("speech:missions/m_04/")
	
--~ 	Sound_MusicPlay( "data:sound/music/ambient/AMB_04" )
	Sound_MusicPlayType( "data:sound/music/ambient/AMB_04", MUS_Ambient )
	
	 -- Sob Group setup
	SobGroup_LoadPersistantData("Hgn_Mothership")
	
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType( Players_Mothership, "Player_Ships0", "Hgn_MotherShip" )	
	
	Sound_EnableAllSpeech(0)	
		
	Rule_Add("Rule_AI_Init")
		
  	FOW_RevealGroup('Communications_Station', 1)
	
	HW2_SetResearchLevel( 4 )
	
	-- now we enable options that we dont want restricted
	
	
	-- make vaygr deploy mines around the asteroids
--	SobGroup_DeployMines("inhibitor_1_minelayers", "vol_inhibitor1_mines", 3.0)
 --	SobGroup_DeployMines("inhibitor_2_minelayers", "vol_inhibitor2_mines", 3.0)
 --	SobGroup_DeployMines("inhibitor_3_minelayers", "vol_inhibitor3_mines", 3.0)
 	
 --	g_mineState[1] = Wait_Start( 250 )
 --	g_mineState[2] = Wait_Start( 250 )
 --	g_mineState[3] = Wait_Start( 250 )
	
 --	Rule_AddInterval( "Rule_CheckMinelayerState", 5 )
 --	Rule_AddInterval( "Rule_RelayMines", 5 )
	
	-- Setup Vaygr gates
	SobGroup_FormHyperspaceGate( "gate_1a", "gate_1b" )
	SobGroup_FormHyperspaceGate( "gate_2a", "gate_2b" )
	SobGroup_FormHyperspaceGate( "gate_3a", "gate_3b" )
	
	-- make the carrier start building ships
	--Rule_AddInterval( "HW2_VaygrBuildShips", g_Vaygr_Carrier_Build_Frequency )
	
	
	-- Order ships to dock at Comms Station
	--SobGroup_DockSobGroupInstant("dockgroup_1","Communications_Station")

	-- do damage to the comm station
	SobGroup_TakeDamage( "Communications_Station", .6 )
	
	Rule_AddInterval( "Rule_CommStationInvulnerable", 10 )

	
	Event_Start("intelevent_clearinhibitors")
	Rule_Add( "Rule_EnableResearchAfterIntelevent" )
	
	-- Setup the warning when the player approaches the minefield
--~ 	Rule_Add("Rule_Mine_Encountered")
	
	-- Setup event to start the gates when the player destroys one of the groups of defenders OR attacks a gate.
	--Rule_Add("Rule_Start_Using_Gates")
	
	-- Setup sob for later storage of hyperspacing ships
	Rule_Add( "Rule_VaygrUsingGates" )
	
	
	SobGroup_Create("g_vaygrShipLastBuilt")
		
	-- Set up the reinforce orders for the inhibitors	
	Rule_Add("Rule_Inhibitor_Destroyed")
	
	-- when player loses
	Rule_Add( "Rule_PlayerLose" )
	Rule_Add( "Rule_PlayerWins" )
	
	Rule_Add( "Rule_PlayerIsNearToCommStation" )
	
--~ 	Rule_AddInterval( "Rule_PlayerCanBuildTorpedoFrigates", 60 )
	
	-- after 3 hours, destroy the player
	Rule_AddInterval( "Rule_DestroyPlayer", 10800 )
	Rule_AddInterval( "Rule_PlayStaging", 300 )
	Rule_Remove( "Rule_Init" )
	
	Player_SetPlayerName( 0, "$41850" )	
	-- stop comm station
	
	HW2_ReactiveInfo()
	
end

function Rule_SaveTheGameMissionStart()
	Rule_Remove ("Rule_SaveTheGameMissionStart")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6414") --.." Mission Start" )
end

function Rule_PlayStaging()
	Sound_MusicPlayType( 'data:sound/music/staging/STAGING_04', MUS_Staging )
	Rule_Remove( "Rule_PlayStaging" )
end

function Rule_EnableResearchAfterIntelevent()
	if ( Event_IsDone( "intelevent_clearinhibitors" ) == 1 ) then
		Enable_ResearchOptions()
		Rule_Remove( "Rule_EnableResearchAfterIntelevent" )
		-- Save the game
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameMissionStart", 1 )
	end
end

-- this is just to breakout all of the various CPU player set up
-- we use this funtion to stream the AI RU's, without just giving them a whack load at the start
function Rule_Grant_AI1_RU()
	Player_SetRU (1, 1000)
end

function Rule_AI_1_AttackNow()
	CPU_DoString (1, "AttackNow()")
end

-- CPU Player #1 	AI player in charge of Carriers patrolling the inhibitors
function Rule_AI_Init_1()

	Player_SetPlayerName( 1, "$41851" )	
	
	Player_SetRU (1, 7000)
	
	Rule_AddInterval( "Rule_Grant_AI1_RU", 320 )
	Rule_AddInterval( "Rule_AI_1_AttackNow", 300 )
	
	SetAlliance( 1, 2 )
	SetAlliance( 1, 3 )
	SetAlliance( 1, 4 )
	
	Player_SetGlobalROE( 1, OffensiveROE )
	Player_SetGlobalStance( 1, AggressiveStance )
	
	CPU_RemoveSobGroup( 1, "Vgr_Carrier_Patrolling" )
	CPU_RemoveSobGroup( 1, "Vgr_Carrier_Patrolling_1" )
	
	SobGroup_CreateSubSystem( "Vgr_Carrier_Patrolling", "FighterProduction" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_Patrolling", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_Patrolling", "AdvancedArray" )

	SobGroup_CreateSubSystem( "Vgr_Carrier_Patrolling_1", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_Patrolling_1", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_Patrolling_1", "AdvancedArray" )
	
	SobGroup_FollowPath( "Vgr_Carrier_Patrolling", "path_CarrierPatrol", 1, 1, 0 )
	SobGroup_FollowPath( "Vgr_Carrier_Patrolling_1", "path_CarrierPatrol", 1, 1, 0 )	
	
	AI_BulkResearchGrant( 1 )	
	
	Rule_Remove( "Rule_AI_Init_1" )
end

-- CPU Player #2 	Comm Station defence force
function Rule_AI_Init_2()

	CPU_Enable( 2, 0 )
	
	Player_SetPlayerName( 2, "$41851" )
	
	CPU_RemoveResourceBlob( 2, "vol_PlayerRU_1" )
	CPU_RemoveResourceBlob( 2, "vol_PlayerRU_2" )
	CPU_RemoveResourceBlob( 2, "vol_AIRU_3" )
	
	-- start this AI off slow
	Player_SetRU(2, 8000)

	SetAlliance( 2, 1 )
	SetAlliance( 2, 3 )
	SetAlliance( 2, 4 )
	
	AI_BulkResearchGrant( 2 )
	
	CPU_RemoveSobGroup( 2, "Comm_Carrier" )
--~ 	CPU_RemoveSobGroup( 2, "Comm_Aux_Carrier" )
--~ 	CPU_RemoveSobGroup( 2, "Comm_Station_Repair_Group" )
	
	--print("SCAR: Ordering repair of comm station" )
	SobGroup_RepairSobGroup( "Comm_Station_Repair_Group", "Communications_Station" )	
	
	SobGroup_CreateSubSystem( "Comm_Carrier", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Comm_Carrier", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Comm_Carrier", "AdvancedArray" )
	
	HW2_InitializeBuilder( "Comm_Aux_Carrier" , "tempSobGroup" )
	
	--Player_SetGlobalROE( 2, OffensiveROE )

		
--~ 	CPU_AddDefendSobGroup( 2, "Comm_Carrier", 10 )
	CPU_AddDefendSobGroup( 2, "Communications_Station", 50 )
	
	Rule_Remove( "Rule_AI_Init_2" )
	
end

-- CPU Player #3 	Statically placed defenders and script specific ships
function Rule_AI_Init_3()

	Player_SetPlayerName( 3, "$41851" )
	
	Player_SetRU(3, 9000)
	
	CPU_RemoveResourceBlob( 3, "vol_PlayerRU_1" )
	CPU_RemoveResourceBlob( 3, "vol_PlayerRU_2" )
	CPU_RemoveResourceBlob( 3, "vol_AIRU_2" )

	SetAlliance( 3, 1 )
	SetAlliance( 3, 2 )
	SetAlliance( 3, 4 )
	
	CPU_RemoveSobGroup( 3, "inhibitor_1" )
	CPU_RemoveSobGroup( 3, "inhibitor_2" )	
	CPU_RemoveSobGroup( 3, "inhibitor_3" )
	CPU_RemoveSobGroup( 3, "rein_1" )
	CPU_RemoveSobGroup( 3, "rein_2" )
	CPU_RemoveSobGroup( 3, "rein_3" )
	CPU_RemoveSobGroup( 3, "inhibitor_2_minelayers" )
	CPU_RemoveSobGroup( 3, "inhibitor_1_minelayers" )
	CPU_RemoveSobGroup( 3, "inhibitor_3_minelayers" )	
	CPU_RemoveSobGroup( 3, "Vgr_Gate_Destroyer" )
	
	SobGroup_GuardSobGroup( "Vgr_Gate_Destroyer", "Vgr_Gates_Carriers" )
	
	g_AI_inhibitor_defend_id_1 = CPU_AddDefendSobGroup( 3, "inhibitor_1", 50 )
	g_AI_inhibitor_defend_id_2 = CPU_AddDefendSobGroup( 3, "inhibitor_2", 50 )
	g_AI_inhibitor_defend_id_3 = CPU_AddDefendSobGroup( 3, "inhibitor_3", 50 )
	
	CPU_RemoveSobGroup( 3, "Vaygr_Carrier_Gate_Defend_1" )
	CPU_RemoveSobGroup( 3, "Vaygr_Carrier_Gate_Defend_2" )
	CPU_RemoveSobGroup( 3, "Vaygr_Carrier_Gate_Defend_3" )
	
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_1", "FighterProduction" )
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_1", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_1", "AdvancedArray" )

	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_2", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_2", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_2", "AdvancedArray" )

	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_3", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_3", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vaygr_Carrier_Gate_Defend_3", "AdvancedArray" )
		
	Player_SetGlobalROE( 3, OffensiveROE )	
	Player_SetGlobalStance( 3, AggressiveStance )	
	
	AI_BulkResearchGrant(3)
	
	Rule_Remove( "Rule_AI_Init_3" )
end

-- CPU Player #4	Comm Station, and the ships it builds.  Only begins building (and not legitimately) after Hyperspace 
function Rule_AI_Init_4()
	
	Player_SetPlayerName( 4, "$41852" )
	
	SobGroup_SetCaptureState("Communications_Station", 0) 	
	
	SetAlliance( 4, 1 )
	SetAlliance( 4, 2 )
	SetAlliance( 4, 3 )
	
	Player_SetRU (4, 10000)
	
	CPU_RemoveSobGroup( 4, "Communications_Station")
	
	CPU_AddDefendSobGroup( 4, "Communications_Station", 10 )
	
	Rule_Remove( "Rule_AI_Init_4" )
	
end

function Rule_AI_Init()
		
	-- Enable us to keep track of the gates
	SobGroup_SetSwitchOwnerFlag( "gate_1a", 0)
	SobGroup_SetSwitchOwnerFlag( "gate_1b", 0)
	SobGroup_SetSwitchOwnerFlag( "gate_2a", 0)
	SobGroup_SetSwitchOwnerFlag( "gate_2b", 0)
	SobGroup_SetSwitchOwnerFlag( "gate_3a", 0)
	SobGroup_SetSwitchOwnerFlag( "gate_3b", 0)	
	
	-- Use the reseach grant function to give the AI something to work with
	Rule_Add( "Rule_AI_Init_1" )
	Rule_Add( "Rule_AI_Init_2" )
	Rule_Add( "Rule_AI_Init_3" )
	Rule_Add( "Rule_AI_Init_4" )
	


	Rule_Remove("Rule_AI_Init")
	
end


-- Helper Function to bring AI up to speed research wise
function AI_BulkResearchGrant (AI_Number)
	
	Player_GrantResearchOption( AI_Number, "CorvetteTech" )
	Player_GrantResearchOption( AI_Number, "CorvetteCommand" )
	Player_GrantResearchOption( AI_Number, "PlatformHeavyMissiles" )
	Player_GrantResearchOption( AI_Number, "FrigateInfiltrationTech" )
	Player_GrantResearchOption( AI_Number, "HyperspaceGateTech" )
	Player_GrantResearchOption( AI_Number, "RepairAbility" )	
	Player_GrantResearchOption( AI_Number, "FrigateTech" )
	Player_GrantResearchOption( AI_Number, "LanceBeams" )
	Player_GrantResearchOption( AI_Number, "PlasmaBombs" )
	Player_GrantResearchOption( AI_Number, "CorvetteLaser" )
	Player_GrantResearchOption( AI_Number, "FrigateAssault" )

	Player_GrantResearchOption( AI_Number, "SuperCapHealthUpgrade1" )
	Player_GrantResearchOption( AI_Number, "CarrierBUILDSPEEDUpgrade1" )
	Player_GrantResearchOption( AI_Number, "ShipyardBUILDSPEEDUpgrade1" )


	
--~ 	if ( AI_Number == 1 ) then
--~ 		Player_GrantResearchOption( AI_Number, "VaygrCarrierHealthUpgrade" )
--~ 		Player_GrantResearchOption( AI_Number, "CarrierBUILDSPEEDUpgrade1" )
--~ 	end
	
end

-- this is a function that is fired if the player has been sitting there doing nothing for way too long.  makes the AI stupidly hard, and throws tonnes of RU's at them.
function Rule_DestroyPlayer()
	
	for i=1,4 do
		Player_SetRU (i, 100000)
		CPU_DoString (i, "cp_minSquadGroupSize = 1")
		CPU_DoString (i, "cp_minSquadGroupValue = 1" )
		CPU_DoString (i, "AttackNow()")		
	end
	
	Rule_Remove( "Rule_DestroyPlayer" )
end

-- BEGIN GAME: PLAYER CAN BUILD TORPEDO FRIGATES
function Rule_PlayerCanBuildTorpedoFrigates()
	--if ( evt_speechevent_onedown_started == 1) and
	   --( Event_IsDone( "speechevent_onedown" ) == 1 ) then
	Player_UnrestrictBuildOption( 0, "Hgn_TorpedoFrigate" ) --Hgn_TorpedoFrigate
		--Event_Start( "speechevent_anticorvettefrigatesavailable" )
		
		Rule_Remove( "Rule_PlayerCanBuildTorpedoFrigates" )
	--end
end
-- END GAME: PLAYER CAN BUILD TORPEDO FRIGATES

-- this happens when the player encounters a minelayer.  
-- TODO actually we should just do this based on the inhibitor.
--~ function Rule_Mine_Encountered()
--~ 	for i=1,3 do
--~ 		if ( SobGroup_PlayerIsInSensorRange("inhibitor_"..i.."_minelayers", 0) == 1 ) then
--~ 			Event_Start("intelevent_minefield")
--~ 			
--~ 			-- when player has built minelayer
--~ 			Rule_Add("Rule_Minelayer_Built")
--~ 			Rule_Add( "Rule_MineLayersDestroyed" )
--~ 			
--~ 			-- 30 seconds after this, we show the gates
--~ 			Rule_AddInterval( "Rule_VaygrUsingGates", 50 )
--~ 			
--~ 			g_minediscovered = "Camera_Mine_"..i
--~ 			
--~ 			Rule_Remove("Rule_Mine_Encountered")
--~ 			return
--~ 		end
--~ 	end
--~ end


	
-- this happens when the player has built a minelayer
--~ function Rule_Minelayer_Built()
--~ 	
--~ 	if ( Stats_ShipsCreated( 0, GetShipId( "Hgn_MinelayerCorvette" ) ) >= 1 ) then
--~ 	
--~ 		Event_Start("autofocus_minelayerbuilt")
--~ 				
--~ 		Objective_SetState( obj_sec_build_minelayer_id, OS_Complete )
--~ 		
--~ 		Rule_Remove("Rule_Minelayer_Built")
--~ 	end
--~ 	
--~ end

-- if the player has destroyed all of the mine layers then they succeed in clearing the mine fields...kinda
--~ function Rule_MineLayersDestroyed()
--~ 	if ( SobGroup_Empty( "inhibitor_1_minelayers" ) == 1 ) and
--~ 	   ( SobGroup_Empty( "inhibitor_2_minelayers" ) == 1 ) and
--~ 	   ( SobGroup_Empty( "inhibitor_3_minelayers" ) == 1 ) then
--~ 		Objective_SetState( obj_sec_prim_clearmines_id, OS_Complete )
--~ 	
--~ 		Rule_Remove( "Rule_MineLayersDestroyed" )
--~ 	end
--~ end


-- here we just show the vaygr using the gates.  screw fancy
function Rule_VaygrUsingGates()

	for i=1,3 do
		if ( SobGroup_PlayerIsInSensorRange("gate_"..i.."b", 0) == 1 ) then
			--Event_Start("intelevent_minefield")
			Sound_MusicPlayType( 'data:sound/music/staging/STAGING_04', MUS_Staging )
			--SobGroup_ExitHyperSpace("rein_1", "inhibitor_"..i.."_vol" )
			SobGroup_ExitHyperSpaceSobGroup ( "rein_1", "gate_"..i.."b", 1000 )
	
			FOW_RevealGroup( "gate_"..i.."b",1 )
			FOW_RevealGroup( "rein_1",1 )
			
			g_firstgateseen = i
			
			Event_Start("autofocus_gate")			
			
			Rule_AddInterval("Rule_Gate_Captured", 5)
			
			Rule_Remove( "Rule_VaygrUsingGates" )
			return
		end
	end
	
end

-- when the player has captured a gate
function Rule_Gate_Captured()
	
	-- rewrote function to use a for loop instead of hundreds of ifs
	for i=1,3 do
		if (SobGroup_OwnedBy("gate_"..i.."a") == 0 ) then
			Objective_SetState( obj_sec_capture_gate_id, OS_Complete )
			Rule_Remove("Rule_Gate_Captured")
		
		elseif (SobGroup_OwnedBy("gate_"..i.."b") == 0 ) then
			Objective_SetState( obj_sec_capture_gate_id, OS_Complete )
			Rule_Remove("Rule_Gate_Captured")
		end
	end
end


-- check to see if there are minelayres left at each inhibitor asteroid
--~ function Rule_CheckMinelayerState()
--~ 	for i=1, 3 do
--~ 		if ( SobGroup_Empty( "inhibitor_"..i.."_minelayers" ) == 1 ) then
--~ 			g_mineState[i] = 0
--~ 		end
--~ 	end
--~ 	
--~ 	if ( g_mineState[1] == 0 ) and
--~ 	   ( g_mineState[2] == 0 ) and 
--~ 	   ( g_mineState[3] == 0 ) then
--~ 		Rule_Remove( "Rule_CheckMinelayerState" )
--~ 	end	
--~ end

-- this rule tells the vaygr to relay the mines if the mines have expired
--~ function Rule_RelayMines()
--~ 	for i=1,3 do
--~ 		if ( g_mineState[i] ~= 0 ) and ( Wait_End( g_mineState[i] ) == 1 ) then
--~ 			--print( "laying mines: "..i )
--~ 			g_mineState[i] = Wait_Start( 250 )
--~ 			SobGroup_DeployMines("inhibitor_"..i.."_minelayers", "vol_inhibitor"..i.."_mines", 3.0)			
--~ 		end
--~ 	end
--~ end

-- END GAME : CLEAR MINEFIELDS

-- wrapping this up into 1 function.  used to be 3 for some odd reason
function Rule_Inhibitor_Destroyed()
	for i=1,3 do
		if  ( g_inhibitor_state[i] == 1 ) and
		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 1") == 0 ) and
		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 2") == 0 ) and
		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 3") == 0 ) and
		   ( SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 4") == 0 ) then
			
			print("SCAR: inhibitor destroyed "..g_inhibitor_state[i] )
			
			Ping_Remove( ping_hyperspace_inhibitor_id[i] )
			
			if ( i == 1 ) then
				CPU_RemoveDefendTarget( 3, g_AI_inhibitor_defend_id_1 )
			elseif ( i== 2 ) then
				CPU_RemoveDefendTarget( 3, g_AI_inhibitor_defend_id_2 )
			else
				CPU_RemoveDefendTarget( 3, g_AI_inhibitor_defend_id_3 )
			end
			
			g_inhibitor_state[i] = 0		
			
			if ( g_gatediscovered == "gate_"..i ) then
				g_gatediscovered =  0
			end
			
			Inhibitor_Death()
			g_mineState[i] = 0
		end
	end
end


-- an inhibitor has been destroyed
function Inhibitor_Death()
	-- one inhibitor down
	if (g_inhibitor_state[1] + g_inhibitor_state[2] + g_inhibitor_state[3] == 2) then
		Event_Start("speechevent_onedown")	
--~ 		CPU_DoString (1, "cp_attackPercent = 25")
--~ 		CPU_DoString (1, "cp_minSquadGroupSize = 6")
--~ 		CPU_DoString (1, "cp_minSquadGroupValue = 125")
	-- two inhibitors down
	elseif (g_inhibitor_state[1] + g_inhibitor_state[2] + g_inhibitor_state[3] == 1) then
		Event_Start("speechevent_twodown")
--~ 		CPU_DoString (1, "cp_attackPercent = 25")
--~ 		CPU_DoString (1, "cp_minSquadGroupSize = 3")
--~ 		CPU_DoString (1, "cp_minSquadGroupValue = 80")	
			
	-- all inhibitors destroyed
	elseif (g_inhibitor_state[1] + g_inhibitor_state[2] + g_inhibitor_state[3] == 0) then
	
		-- here the player has cleared all of the inhibitors
		-- here we should actually be checking for if the player is still in combat with any bad guys around the inhibitors or not.	
		
		Rule_Add( "Rule_BeginCheckingInCombat" )	
		
		Rule_Remove( "Rule_Inhibitor_Destroyed" )		
		-- create a save here.
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		Rule_AddInterval( "Rule_SaveTheGameInhibitorsDestroyed",1)
		
	
	end
end

function Rule_SaveTheGameInhibitorsDestroyed()
	Rule_Remove ("Rule_SaveTheGameInhibitorsDestroyed")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6415" ) --" Inhibitors Destroyed" )	
end

function Rule_BeginCheckingInCombat()
	SobGroup_RemoveType( "Player_Ships3", "Meg_Asteroid" )
	SobGroup_RemoveType( "Player_Ships3", "Vgr_HyperSpace_Platform" )
	
	if ( SobGroup_PlayerIsInSensorRange( "Player_Ships3", 0 ) == 0 ) and
	   ( SobGroup_PlayerIsInSensorRange( "Player_Ships2", 0 ) == 0 ) and
	   ( SobGroup_PlayerIsInSensorRange( "Player_Ships1", 0 ) == 0 ) then
	
		Objective_SetState( obj_prim_destroy_inhibitors_id, OS_Complete )		
		
		if ( g_TacticalHyperspace == 1 ) then
		
			Event_Start("intelevent_tacjumpon")
			
			-- we need to stop checking for this here because it is here that we are moving the players fleet forward.
			Rule_Remove( "Rule_PlayerIsNearToCommStation" )
			Rule_Add("Rule_CPU_1_Leaves")
			Rule_Add("Rule_End_Tacjump")
--~ 			Rule_Remove( "Rule_RelayMines" )
			
		end
		
		Rule_Remove( "Rule_BeginCheckingInCombat" )
		
	end
	
end

-- turns off the ai thats at the inhibitor stage.
function Rule_CPU_1_Leaves()	
	-- lets hyperspace out the carriers that are remaining at the other side of the mission.
	SobGroup_RemoveType( "Player_Ships3", "Meg_Asteroid" )
	
	SobGroup_Despawn( "Player_Ships1" )
	SobGroup_Despawn( "Player_Ships3" )

	CPU_Enable(1, 0)
	CPU_Enable(3, 0)
	Rule_Remove("Rule_CPU_1_Leaves")
end

-- this happens when the tactical jump has been completed
function Rule_End_Tacjump()
	if ( evt_intelevent_tacjumpon_ended == 1) then
		if ( SobGroup_AreAllInHyperspace(g_Ships_To_Exit_Hyperspace) == 1 ) then
			Event_Start("intelevent_tacjumpon_2")
			Rule_Add( "Rule_DestroyCommStationCompleteAfterTacJump" )
			Rule_Add( "Rule_BeginStageTwo" )
			Rule_Add( "Rule_LaunchShipsWhenOutOfHyperspace" )
			Rule_Remove("Rule_End_Tacjump")
		end
	end
end

function Rule_LaunchShipsWhenOutOfHyperspace()
	if ( SobGroup_AreAllInRealSpace ( Players_Mothership ) == 1 ) then --SobGroup_AreAllInHyperspace( "g_Players_Ships_Hyperspace" ) == 0 ) then
		SobGroup_SetAutoLaunch( Players_Mothership, ShipHoldLaunch )
		SobGroup_Launch( 'g_Players_Ships_Hyperspace', Players_Mothership )		
		
		Rule_Remove("Rule_LaunchShipsWhenOutOfHyperspace")
	end
end

-- this handles the instance where the player decides to be a smart ass and move their ships forward before the inhibitors are destroyed
function Rule_PlayerIsNearToCommStation()
	if ( SobGroup_PlayerIsInSensorRange( "Communications_Station", 0 ) == 1 ) then	
		g_TacticalHyperspace = 0
		Event_Start( "intelevent_eliminatecommstation" )		
		Rule_AddInterval( "Rule_BeginStageTwo", 5 )		
		Rule_Remove( "Rule_PlayerIsNearToCommStation" )				
	end
end

-- save when order player to destroy comm station
function Rule_DestroyCommStationComplete()
	if ( Event_IsDone( "intelevent_eliminatecommstation" ) == 1 ) then
		Rule_Remove( "Rule_DestroyCommStationComplete" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameDestroyCommandStation", 1 )
		
	end
end	

function Rule_SaveTheGameDestroyCommandStation()
	Rule_Remove ("Rule_SaveTheGameDestroyCommandStation")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6416") -- .." Destroy Command Station" )
end

-- alternate save when order player to destroy comm station
function Rule_DestroyCommStationCompleteAfterTacJump()
	if ( Event_IsDone( "intelevent_tacjumpon_2" ) == 1 ) then
		Rule_Remove( "Rule_DestroyCommStationCompleteAfterTacJump" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		Rule_AddInterval( "Rule_SaveTheGameDestroyCommandStation", 1 )		
	end
end


-- END GAME: DESTROY THE INHIBITORS
-- we call this function when we need to start all of the events that happen at the comm station
-- this is what we use to avoid the issue with the ass player who moves their ships forward before destroying the inhibitors
function Rule_BeginStageTwo()

	CPU_Enable( 2, 1 )
	Sound_MusicPlayType( 'data:sound/music/BATTLE/BATTLE_04', MUS_Battle )
	
	-- call the rule that begins the comm station being repaired
	Rule_Add( "Rule_Initialize_Comms_Station_Repairs" )
	
	-- begin checking for the vaygr carriers being destroyed.
	Rule_Add( "Rule_Vaygr_Carriers_Destroyed" )
	Rule_Add( "Rule_Ping_Carrier" )
	
	-- stop the comm station being "invulnerable"
	Rule_Remove( "Rule_CommStationInvulnerable" )
	
--~ 	Rule_AddInterval( "Rule_ReplaceCollectors", 5 )
	
	-- Add rule for launching defenders
	Rule_Add("Rule_Defend_Station" )
	
	Rule_Remove( "Rule_BeginStageTwo" )
end

function Rule_CommStationInvulnerable()
	if ( SobGroup_HealthPercentage( "Communications_Station" ) >= 0.4 ) then
		SobGroup_SetHealth( "Communications_Station", 0.4 )
	end
end


-- Defend the station by making AI 2 attack more
function Rule_Defend_Station()
	if ( Player_FillProximitySobGroup( "tempSobGroup", 0, "Communications_Station", 8000 ) == 1 ) then
				
		CPU_DoString(2, "cp_attackPercent = 50")
		CPU_DoString(2, "cp_minSquadGroupSize = 3")
		CPU_DoString(2, "cp_minSquadGroupValue = 200")
			
		Rule_Remove( "Rule_Defend_Station" )	
		
	end
end
-- END GAME: ELIMINATE VAYGR THREAT

-- BEGIN GAME : COMMS STATION REPAIRS
-- this starts the proper repairs on the communications station.
-- this function needs to be called when the player decides to get clever and move their ships to the comm station
function Rule_Initialize_Comms_Station_Repairs()		
			
--~ 	Timer_Start( 0, g_communications_subsystem_repair_time)
--~ 	Timer_Display( 0 )
--~ 	Subtitle_TimeCounter( 0, 41959 )
--~ 	Rule_Add("Rule_Carrier_Sighted")
	Rule_Add("Rule_Comms_Station_Repairs_2")
	Rule_Add("Rule_Comms_Station_Repairs_3")
	Rule_Add("Rule_Comms_Station_Repairs_Complete")
	
	Rule_Add( "Rule_Comms_Station_Destroyed" )

	Rule_Remove("Rule_Initialize_Comms_Station_Repairs")

end

-- these get played when the comm station is at a certain level of health.
function Rule_Comms_Station_Repairs_2()	
	if ( SobGroup_HealthPercentage( "Communications_Station" ) >= 0.5 ) then
		
		Event_Start("voiceover_comm_stage_2")		
		
		Rule_Remove("Rule_Comms_Station_Repairs_2")
	end
end

function Rule_Comms_Station_Repairs_3()	
	if ( SobGroup_HealthPercentage( "Communications_Station" ) >= 0.75 ) then
	
		Event_Start("voiceover_comm_stage_3")	
		
		Rule_Remove("Rule_Comms_Station_Repairs_3")
	end
end

-- when the station is fully repaired
function Rule_Comms_Station_Repairs_Complete()
	if ( SobGroup_HealthPercentage( "Communications_Station" ) >= 1 ) then
		Event_Start("intelevent_stationoperational")	
		Rule_Remove("Rule_Comms_Station_Repairs_Complete")
	end
end

-- the player has spotted the vaygr carrier that is repairing the command station
--~ function Rule_Carrier_Sighted()
--~ 	if ( SobGroup_PlayerIsInSensorRange("Comm_Carrier", 0 ) == 1 ) and ( evt_isplaying == 0 ) then
--~ 	
--~ 		-- here is where we actually tell the player to destroy the carrier
--~ 		Event_Start("voiceover_comm_stage_1")
--~ 		
--~ 		obj_sec_destroy_carrier_id = Objective_Add( obj_sec_destroy_carrier , OT_Secondary )
--~ 		Objective_AddDescription( obj_sec_destroy_carrier_id, '$41957')		
--~ 		Objective_AddDescription( obj_sec_destroy_carrier_id, '$41958')	
--~ 		
--~ 		
--~ 		
--~ 		Rule_Add("Rule_Comm_Carrier_Destroyed")
--~ 		
--~ 		Rule_Remove("Rule_Carrier_Sighted")
--~ 	end	
--~ end

-- need a function here that ensures the carrier continues to build resource collectors when there arent enough repairing the comm station
--~ function Rule_ReplaceCollectors()
--~ 	if ( SobGroup_Empty( "Comm_Carrier" ) == 0 ) and ( SobGroup_Count( "Comm_Station_Repair_Group" ) < 2 ) then
--~ 		
--~ 		-- how far under the limit is the repair group?
--~ 		local newcollectors = SobGroup_Count( "Comm_Station_Repair_Group" )
--~ 		newcollectors = 4 - newcollectors		
--~ 		
--~ 		for i=1,newcollectors do
--~ 			local createdcollector = SobGroup_CreateShip( "Comm_Carrier", "Vgr_ResourceCollector" )
--~ 			SobGroup_SobGroupAdd( "Comm_Station_Repair_Group", createdcollector )		
--~ 			CPU_RemoveSobGroup(2, createdcollector )
--~ 		end
--~ 		
--~ 		Rule_AddInterval( "Rule_OrderRepairsToNewCollectors", 4 )
--~ 	end
--~ end

--~ function Rule_OrderRepairsToNewCollectors()
--~ 	SobGroup_RepairSobGroup( "Comm_Station_Repair_Group", "Communications_Station" )
--~ 	Rule_Remove( "Rule_OrderRepairsToNewCollectors" )
--~ end

-- the carrier repairing the station has been destroyed
--~ function Rule_Comm_Carrier_Destroyed()
--~ 	if ( SobGroup_Empty( "Comm_Carrier" ) == 1) then
--~ 		
--~ 		Rule_Remove( "Rule_ReplaceCollectors" )
--~ 		
--~ 		Objective_SetState(obj_sec_destroy_carrier_id, OS_Complete)
--~ 		
--~ 		Event_Start("voiceover_carrier_destroyed")
--~ 		
--~ 		
--~ 		Rule_Remove("Rule_Comm_Carrier_Destroyed")
--~ 	end
--~ end

-- END GAME : COMMS STATION REPAIRS

-- we need this function to clear out all of the objects in the players list that we dont want to hyperspace.
function CleanPlayersGroup()

	SobGroup_Create("g_Players_Ships_Hyperspace")
	SobGroup_Create("g_Players_Ships_Docked")

	local nonHyperspaceList = { "Hgn_IonTurret", "Hgn_GunTurret", "Hgn_Probe", "Hgn_ProximitySensor", "Hgn_ECMProbe", "Vgr_HyperSpace_Platform" }
	SobGroup_SobGroupAdd('g_Players_Ships_Hyperspace', 'Player_Ships0')
	
	SobGroup_LeaveStrikeGroup('g_Players_Ships_Hyperspace', 0)
	
	for i=1,getn(nonHyperspaceList) do
		SobGroup_RemoveType( "g_Players_Ships_Hyperspace", nonHyperspaceList[i] )
	end
	
	SobGroup_SobGroupAdd('g_Players_Ships_Docked', 'g_Players_Ships_Hyperspace')
	
	local nonDockList = { "Hgn_Mothership", "Hgn_DefenseFieldFrigate", "Hgn_TorpedoFrigate", "Hgn_AssaultFrigate", "Hgn_IonCannonFrigate", "Hgn_MarineFrigate", "Hgn_Carrier", "Hgn_ResourceController", "Vgr_Destroyer", "Vgr_Carrier", "Vgr_InfiltratorFrigate", "Vgr_HeavyMissileFrigate", "Vgr_AssaultFrigate","Vgr_ResourceController" }
	
	for i=1,getn(nonDockList) do
		SobGroup_RemoveType( "g_Players_Ships_Docked", nonDockList[i] ) 
	end
	--print( SobGroup_Count( "g_Players_Ships_Docked" ) )
	--print( SobGroup_Count( "g_Players_Ships_Hyperspace" ) )
	
	SobGroup_FillSubstract( g_Ships_To_Exit_Hyperspace, "g_Players_Ships_Hyperspace", "g_Players_Ships_Docked" )
	
	--print( SobGroup_Count( "g_Players_Ships_Docked" ) )
	--print( SobGroup_Count( "g_Players_Ships_Hyperspace" ) )
end

-- Rules to cover either the subsystem or the local Vaygr being destroyed
function Rule_Comms_Station_Destroyed()
	if ( SobGroup_Empty("Communications_Station" ) == 1 ) then
	
--~ 		if (g_Comm_Carriers_Dead == 0) then
--~ 			Event_Start("speechevent_stationdown_vaygrleft")
--~ 			obj_prim_destroyvaygr_id = Objective_Add( obj_prim_destroyvaygr , OT_Primary )
--~ 			Objective_AddDescription( obj_prim_destroyvaygr_id, "$41995")
--~ 		end
		
--~ 		g_Comm_Subsystem_Dead = 1
		
		Objective_SetState( obj_prim_destroy_comms_subsystem_id, OS_Complete )
		
		Rule_Remove( "Rule_Comms_Station_Destroyed" )
		
		-- remove the objective to destroy the carrier thats repairing the comm station because the comm station has been destroyed
--~ 		Rule_Remove( "Rule_Carrier_Sighted" )
		
	end	
end	

-- this is for when the player has destroyed both of the vaygrs carriers.  this should actually just detect for military ships for player 2
function Rule_Vaygr_Carriers_Destroyed()
	if ( SobGroup_AreAnyOfTheseTypes( "Player_Ships2", "Vgr_ShipYard, Vgr_MissileCorvette, Vgr_LaserCorvette, Vgr_LanceFighter, Vgr_Interceptor, Vgr_InfiltratorFrigate, Vgr_HeavyMissileFrigate, Vgr_Carrier, Vgr_Bomber, Vgr_AssaultFrigate" ) == 0 ) then
--~ 	if ( HW2_PlayerHasMilitary( 2 ) == 0 ) then
	--if ( SobGroup_Count("Comm_Carrier") == 0 ) and ( SobGroup_Count("Comm_Aux_Carrier" ) == 0) then
		--if (g_Comm_Subsystem_Dead == 1) then
			--Event_Start("intelevent_vayrgkilled_aftersub")
		Objective_SetState( obj_prim_destroyvaygr_id, OS_Complete )
		--end
		--g_Comm_Carriers_Dead = 1
		Rule_Remove("Rule_Vaygr_Carriers_Destroyed")
	end	
end

-- creates a ping on the carriers that are remaining.
function Rule_Ping_Carrier()
	
--~ 	if (SobGroup_Count("Comm_Carrier") == 1) then

--~ 		ping_vaygrcarriergroup_id = Ping_AddSobGroup( ping_vaygrcarriergroup, "anomaly", "Comm_Carrier" )
--~ 		Ping_AddDescription(ping_vaygrcarriergroup_id, 0, '$41971')

--~ 	end	
	
--~ 	if (SobGroup_Count("Comm_Aux_Carrier") == 1) then
		
		ping_vaygrcarriergroup_id = Ping_AddSobGroup( ping_vaygrcarriergroup, "anomaly", "Player_Ships2" )
		Ping_AddDescription(ping_vaygrcarriergroup_id, 0, '$41971')
	
--~ 	end
	
	Rule_Remove("Rule_Ping_Carrier")
end

function Rule_PlayerWins()
	if ( Objective_GetState( obj_prim_destroyvaygr_id ) == OS_Complete ) and
	   ( Objective_GetState( obj_prim_destroy_comms_subsystem_id ) == OS_Complete ) and
	   ( Objective_GetState( obj_prim_destroy_inhibitors_id ) == OS_Complete )  then
		-- if (g_Comm_Subsystem_Dead == 1) then
			Event_Start("intelevent_vaygrandcommdestroyed")
			
			Rule_Remove( "Rule_PlayerWins" )
		--end
	end
end

-- BEGIN GAME: LOSE CONDITIONS
-- Lose condition
function Rule_PlayerLose()
	
	if ( SobGroup_Empty( Players_Mothership ) == 1 ) then		
		Event_Start( "speechevent_playerloses" )		
		Rule_Remove( "Rule_PlayerLose" )		
	end
	
end
-- END GAME: LOSE CONDITIONS

Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent

Events.intelevent_clearinhibitors =
{
	{
		{"Sound_EnableAllSpeech (1)",""},	
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Camera_Interpolate( 'here', 'Camera_Startpos', 0 )",""},
		HW2_Wait(5),
	},
	{	
		HW2_LocationCardEvent( "$41521", 6 ),	
	},
	{
		
		{"Sound_EnterIntelEvent()", "" },
		HW2_SubTitleEvent( Actor_FleetCommand, "$41530", 8 ),			-- Hyperspace Inhibitor detected.  We have exited Hyperspace in the outskirts of the Gehenna asteroid field.
        },
        {
                HW2_Wait ( 1 ),
        },
        {
                HW2_Letterbox ( 1 ),
                { "Universe_EnableSkip(1)", "" }, 
		HW2_Pause( 1 ),
		HW2_Wait ( 2 ),
        },
        {
		--{"Camera_FocusSave()",""},                                                      -- Enable Intel event skipping
                {"Sensors_Toggle( 1 )","" },   
	        HW2_Wait ( 2 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41532", 8 ),			-- The Vaygr's Hyperspace Inhibitors are located on asteroids throughout this sector.
		{ "Camera_Interpolate( 'here', 'Camera_Inhibitors', 3)",""},
		{ "g_pointer_inhibitor1_id = HW2_CreateEventPointerSobGroup('inhibitor_1' )", "" },
		{ "g_pointer_inhibitor2_id = HW2_CreateEventPointerSobGroup('inhibitor_2' )", "" },
		{ "g_pointer_inhibitor3_id = HW2_CreateEventPointerSobGroup('inhibitor_3' )", "" },
	},
	{
                HW2_Wait ( 1 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41533", 8 ),			-- We must destroy the Inhibitors and disable the field if we are to reach Gehenna undetected.
        },
	{
		HW2_Wait ( 1 ),
		{"ping_hyperspace_inhibitor_id[1] = Ping_AddSobGroup( ping_hyperspace_inhibitor_1, 'anomaly', 'inhibitor_1' )", ""},
		{"Ping_AddDescription(ping_hyperspace_inhibitor_id[1], 0, '$41950')",""},
		{"ping_hyperspace_inhibitor_id[2] = Ping_AddSobGroup( ping_hyperspace_inhibitor_2, 'anomaly', 'inhibitor_2' )", ""},
		{"Ping_AddDescription(ping_hyperspace_inhibitor_id[2], 0, '$41950')",""},
		{"ping_hyperspace_inhibitor_id[3] = Ping_AddSobGroup( ping_hyperspace_inhibitor_3, 'anomaly', 'inhibitor_3' )", ""},
		{"Ping_AddDescription(ping_hyperspace_inhibitor_id[3], 0, '$41950')",""},
	},
	{                
		{ "EventPointer_Remove(g_pointer_inhibitor1_id)", "" },
		{ "EventPointer_Remove(g_pointer_inhibitor2_id)", "" },
		{ "EventPointer_Remove(g_pointer_inhibitor3_id)", "" },
                HW2_Wait ( 2 ),
		{ "Camera_Interpolate( 'here', 'Camera_CommLong', 2)",""},
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41534", 8 ),			-- The Vaygr Command Station is located here.
		{ "g_pointer_comm_station_id = HW2_CreateEventPointerSobGroup('Communications_Station' )", "" },
        },
	{
		HW2_Wait( 1 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41535", 8 ),			-- It must be neutralized.
	},
	{
		HW2_Wait( 1 ),
	},
	{
		{"EventPointer_Remove(g_pointer_comm_station_id)",""},                
		HW2_SubTitleEvent( Actor_FleetIntel, "$41536", 8 ),			-- Scans are detecting heavy Vaygr activity in this region, advise caution.
        	{ "Camera_Interpolate( 'here', 'Camera_StartposLong', 6)",""},
        },
        {
        	{"Sensors_Toggle( 0 )","" },
		HW2_Wait(1),
        },
	{
		{"obj_prim_destroy_inhibitors_id = Objective_Add( obj_prim_destroy_inhibitors , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_destroy_inhibitors_id, '$41980')", ""},	
		HW2_Pause( 0 ),		
                HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },                                                     
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
        },
}

Events.intelevent_minefield =
{
	{
		HW2_Wait(2),
		{ "Sensors_Toggle( 0 )","" },
	},
	{
		{ "Universe_EnableSkip(1)", "" },
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		--{ "Camera_FocusSave()", "" },
		HW2_Wait(2),
		
	},
	{
		{ "Camera_Interpolate( 'here', g_minediscovered, 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41540", 10 ),		-- The Inhibitors are protected by minefields.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41541", 10 ),		-- Construct Minelayers to clear the mines.
	},
	{
		HW2_Wait(1),
		{"Player_UnrestrictBuildOption( 0, 'Hgn_MinelayerCorvette' )", ""},
		{"Player_UnrestrictResearchOption( 0, 'GraviticAttractionMines' )", ""},
		{"Player_GrantResearchOption( 0, 'GraviticAttractionMines' )", ""},
		--{ "Camera_FocusRestore()", "" },
	},
	{
		{"obj_sec_build_minelayer_id = Objective_Add( obj_sec_build_minelayer , OT_Secondary )", ""},
		{"Objective_AddDescription( obj_sec_build_minelayer_id, '$41955')", ""},		
		HW2_Letterbox( 0 ),
		HW2_Pause( 0 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(0)", "" },
--~ 		{"Sound_MusicPlay( 'data:sound/music/staging/STAGING_04' )","" },
		{"Sound_MusicPlayType( 'data:sound/music/staging/STAGING_04', MUS_Staging )",""},
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.autofocus_minelayerbuilt =
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$41550", 10 ),		-- Minelayer Corvette complete.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41551", 10 ),		-- Use the minelayer to clear the minefield surrounding each hyperspace inhibitor.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41552", 10 ),		-- Combat vessels must then destroy the inhibitors as soon as possible.
		{"obj_sec_prim_clearmines_id = Objective_Add( obj_sec_prim_clearmines , OT_Secondary )", ""},
		{"Objective_AddDescription( obj_sec_prim_clearmines_id, '$41975')", ""},		
		{"Objective_AddDescription( obj_sec_prim_clearmines_id, '$41976')", ""},		
		{"Objective_AddDescription( obj_sec_prim_clearmines_id, '$41977')", ""},		
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.autofocus_gate =
{
	{
		HW2_Wait(2),
	},
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		--{ "Camera_FocusSave()", "" },
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(2),
		
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		{ "Camera_Interpolate( 'here', 'Camera_Gate_'..g_firstgateseen, 2)",""},
		
		--{ "FOW_RevealGroup( 'gate_1b', 1 )",""},
		--{ "FOW_RevealGroup( 'rein_1' , 1 )", ""},
		{ "FOW_ForceUpdate()", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41560", 10 ),		-- The enemy is using Hyperspace Gates to bring in reinforcements. We can use this to our advantage.
	},
	{
		HW2_Pause( 0 ),
		HW2_SubTitleEvent( Actor_FleetIntel, "$41561", 10 ),		-- Marine Frigates will be able to capture the Gates.
	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$41564", 10 ),		-- NEW DIALOG. IF WE CAPTURE THE GATE, WE CAN DESTROY THE SOURCE OF THE REINFORCEMENTS.  NEW DIALOG.
--~ 	},
	{	
		--{ "Camera_FocusRestore()", "" },
		HW2_Wait(1),
	},
	{
		{ "FOW_RevealGroup( 'gate_'..g_firstgateseen..'b',0 )",""},
		{ "FOW_RevealGroup( 'rein_1',0 )",""},
		{"obj_sec_capture_gate_id = Objective_Add( obj_sec_capture_gate , OT_Secondary )", ""},
		{"Objective_AddDescription( obj_sec_capture_gate_id, '$41990')", ""},		
		{"Objective_AddDescription( obj_sec_capture_gate_id, '$41991')", ""},
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(0)", ""},
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.voiceover_comm_stage_1 =
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41570", 10 ),		-- The enemy Command Station is being repaired by a Carrier.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41571", 10 ),		-- We must prevent the enemy from completing these repairs before they can transmit our position.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41572", 10 ),		-- Destroy the Vaygr Carrier.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.voiceover_comm_stage_2 =
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41575", 10 ),		-- We estimate the enemy's repairs are nearing completion
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41576", 10 ),		-- Time is running out.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.voiceover_comm_stage_3 =
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41580", 10 ),		-- The repairs to the Command Station are nearly complete.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41581", 10 ),		-- Send an attack force immediately.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.voiceover_carrier_destroyed =
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41588", 10 ),		-- The Carrier has been destroyed.  This has slowed the repairs to the Communications Subsystem substantially.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_stationoperational =
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(4),
	},
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		{ "Sensors_Toggle( 0 )","" },
		--{ "Camera_FocusSave()", "" },
		HW2_Wait(2),
		
	},
	{
		{ "Camera_FocusSobGroupWithBuffer( 'Communications_Station', 2000, 2000, 2)", "" },
--~ 		{ "Camera_FocusSobGroup( 'Communications_Station', 1,500,1 )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$41585", 10 ),	-- The enemy Station has been repaired.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41586", 10 ),	-- The Vaygr have been alerted. We have failed.
	},
	{
                HW2_Fade( 1 ),
		HW2_Wait( 2 ),
        },
	{
		HW2_LocationCardEvent( "$41522", 4 ),
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}

Events.speechevent_onedown =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41590", 10 ),	-- Hyperspace Inhibitor destroyed.
	},
}

Events.speechevent_twodown =
{
	{
		{"evt_speechevent_onedown_started = 1",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41595", 5 ),		-- The second Hyperspace Inhibitor has been destroyed.
	},
}

-- Not used
Events.speechevent_alldown =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41600", 5 ),		-- The Hyperspace inhibitor field has been neutralized.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41601", 5 ),		-- Tactical hyperspace is now possible.
	},
}


Events.intelevent_tacjumpon =
{
	{
		{ "evt_intelevent_tacjumpon_started = 1",""},
		{ "evt_isplaying = 1",""},
		HW2_Wait(4),
	},
	{
		
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41620", 10 ),	-- We can now initiate a Tactical Hyperspace jump and move our Fleet to within striking distance of the Command Station.
	},
	{
		HW2_Letterbox( 1 ),		
		{ "Camera_AllowControl(0)",""},
		{ "Universe_AllowPlayerOrders( 0 )", "" },
		{ "SobGroup_DeSelectAll()",""},
		HW2_Wait(2),		
		{ "SobGroup_SetAutoLaunch(Players_Mothership, ShipHoldStayDockedAlways)", ""},
	},	
	{
        HW2_Fade( 1 ),
		HW2_Wait( 2 ),
    },
    {
		--{ "Camera_Interpolate( 'here', 'Camera_Startpos', 0 )",""},
		{"Sensors_Toggle( 0 )",""},
		{ "Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", "" },
		{ "CleanPlayersGroup()", "" },
		{ "SobGroup_ParadeSobGroup( 'g_Players_Ships_Hyperspace', Players_Mothership, 2 )", "" },
		{ "SobGroup_DockSobGroupInstant ('g_Players_Ships_Docked', Players_Mothership)", ""},		
		--{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", ""},			
		HW2_Wait( 2 ),
	},
	{
        HW2_Fade( 0 ),
		HW2_Wait( 2 ),
		--{"SobGroup_Despawn('Player_Ships1')", ""},
		--{"CPU_Enable(1, 0)", ""},
    },
	{
		{"SobGroup_EnterHyperSpaceOffMap(g_Ships_To_Exit_Hyperspace)",""},				-- hyperspace the Mothership out
    },
	{
		HW2_Wait(10),
	},
	{
		{ "evt_intelevent_tacjumpon_ended = 1",""},
	},
}

Events.intelevent_tacjumpon_2 =
{                
        {
		{ "SobGroup_ExitHyperSpace(g_Ships_To_Exit_Hyperspace, 'HyperspaceDestination')","" },
--~ 		{ "SobGroup_Spawn('g_Players_Ships_Hyperspace', 'HyperspaceDestination')","" },
		HW2_Wait(0.5),
	},
	{        	
        	{ "Camera_Interpolate( 'here', 'Camera_HyperspaceDestination', 3)",""},		
		{ "SobGroup_ParadeSobGroup( g_Ships_To_Exit_Hyperspace, Players_Mothership, 1 )", "" },
		HW2_Wait(3),
	},
	{
		
        	HW2_Wait(5),
		{ "Sensors_EnableCameraZoom( 0 )","" },
		--{ "Player_InstantDockAndParade( 0, Players_Mothership, 1 )", ""},
        },	
	{
		{ "Sensors_Toggle( 1 )","" },
		{ "Camera_Interpolate( 'here', 'Camera_CommShort', 4)",""},
		{ "Camera_AllowControl(1)",""},
		{ "Universe_AllowPlayerOrders( 1 )", "" },
		HW2_Wait( 4 ),
	},
	{
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup( 'Communications_Station' )", "" },
		{"ping_communications_station_id = Ping_AddSobGroup( ping_communications_station, 'anomaly', 'Communications_Station' )", ""},
		{"Ping_AddDescription(ping_communications_station_id, 0, '$41960')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41534", 10 ),	 -- The Vaygr Command Station is located here.
	},
	{		
		{"obj_prim_destroy_comms_subsystem_id = Objective_Add( obj_prim_destroy_comms_subsystem , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_destroy_comms_subsystem_id, '$41985')", ""},
		{"obj_prim_destroyvaygr_id = Objective_Add( obj_prim_destroyvaygr , OT_Primary )",""},
		{"Objective_AddDescription( obj_prim_destroyvaygr_id, '$41995')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41535", 10 ),	-- It must be neutralized.  
	},
	{
		{ "EventPointer_Remove(g_pointer_default)", "" },
		HW2_Wait(1),
		{ "Sensors_EnableCameraZoom( 1 )","" },
	},
	{
		{ "Sensors_Toggle( 0 )","" },		
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
		{ "evt_isplaying = 0",""},
	},
}

Events.speechevent_stationattacks =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41640", 10 ),	-- Signals show that the enemy Station has fighter construction capabilities.
--~ 		{"Sound_MusicPlay( 'data:sound/music/BATTLE/BATTLE_04' )","" },
		{"Sound_MusicPlayType( 'data:sound/music/BATTLE/BATTLE_04', MUS_Battle )",""},
	},
}

-- this event handles the situation if the player has jumped forward without destroying the inhibitors
Events.intelevent_eliminatecommstation =
{        
        {
		{ "evt_isplaying = 1",""},
		HW2_Pause( 1 ),
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Letterbox( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		HW2_Wait(2),		
	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_CommShort', 2)",""},
		HW2_Wait(2),
	},
	{
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup( 'Communications_Station' )", "" },
		{"ping_communications_station_id = Ping_AddSobGroup( ping_communications_station, 'anomaly', 'Communications_Station' )", ""},
		{"Ping_AddDescription(ping_communications_station_id, 0, '$41960')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41534", 10 ),	-- This Communications Subsystem must be destroyed before the station is operational
	},
        {        	
        	HW2_Wait(1),
        },
	{
		{ "EventPointer_Remove(g_pointer_default)", "" },
		--{"SobGroup_Launch ('g_Players_Ships_Hyperspace', Players_Mothership)", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$41535", 10 ),	
		{"obj_prim_destroy_comms_subsystem_id = Objective_Add( obj_prim_destroy_comms_subsystem , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_destroy_comms_subsystem_id, '$41985')", ""},
		{"obj_prim_destroyvaygr_id = Objective_Add( obj_prim_destroyvaygr , OT_Primary )",""},
		{"Objective_AddDescription( obj_prim_destroyvaygr_id, '$41995')",""},
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		{ "Universe_EnableSkip(0)", "" },
		HW2_Letterbox( 0 ),
		HW2_Pause( 0 ),
		HW2_Wait(2),
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
		{ "evt_isplaying = 0",""},
	},
}

Events.intelevent_vaygrandcommdestroyed =
{
	{
		HW2_Wait(4),
	},
	{
--~ 		HW2_Pause( 1 ),
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 0 )","" },
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Letterbox( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		--{ "Camera_FocusSave()", "" },
		{ "Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", "" },
		{ "Universe_AllowPlayerOrders( 0 )", "" },		
		HW2_Wait(2),
		
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41650", 10 ),	-- The enemy Command Station has been neutralized.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41651", 10 ),	-- We can now safely move forward into the Gehenna asteroid field undetected.
	},	
	{
		
		HW2_Fade( 1 ),
		HW2_Wait( 2 ),
	},	
	{
		--HW2_Pause( 0 ),
		
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", ""},
		{ "Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", "" },
		{ "Subtitle_Message( '$3652', 2 )", "" },
		HW2_Wait( 2 ),
	},
	{	
		HW2_Fade( 0 ),
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$41652", 10 ),	-- Oracle coordinates locked in.
	},
	{
		{ "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "" },
		HW2_Wait( 12 ),
	},
	{
		{ "Universe_Fade( 1, 1.5 )","" },
		HW2_Wait( 1.5 ),
	},
	
	{
		HW2_LocationCardEvent( "$41523", 2 ),
	},
	{
		HW2_Wait( 0.5 ),
	},
	{
		{ "setMissionComplete( 1 )","" },		
	},
}

Events.speechevent_stationdown_vaygrleft =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41650", 10 ),	-- The enemy Command Station has been neutralized.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41653", 10 ),	-- We must defeat the remaining Vaygr Carriers before they can transmit our location.
		{"Rule_Add('Rule_Ping_Carrier')", ""},
	},		
}

Events.intelevent_vayrgkilled_aftersub =
{
	{
		HW2_Wait(4),
	},
	{
		--HW2_Pause( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Letterbox( 1 ),
		--{ "Camera_FocusSave()", "" },
		{ "Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", "" },
		HW2_Wait(2),		
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41651", 10 ),	-- We can now safely move forward into the Gehenna asteroid field undetected.
	},	
	{
		{ "Universe_AllowPlayerOrders( 0 )", "" },
		HW2_Fade( 1 ),
		HW2_Wait( 2 ),
	},	
	{
		--HW2_Pause( 0 ),
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", ""},
		{ "Subtitle_Message( '$3652', 2 )", "" },
		HW2_Wait( 2 ),
	},
	{	
		HW2_Fade( 0 ),
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$41652", 10 ),	-- Oracle coordinates locked in.
	},
	{
		{ "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "" },
		HW2_Wait( 15 ),
	},
	{
		{ "Universe_Fade( 1, 2 )","" },
		HW2_Wait( 3 ),
	},
	{
		HW2_LocationCardEvent( "$41523", 4 ),
	},
	{
		HW2_Wait( 2 ),
	},
	{
		{ "setMissionComplete( 1 )","" },		
	},
}


Events.speechevent_anticorvettefrigatesavailable =
{
	{
		HW2_Wait(5),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41610", 10 ),	-- The enemy is using Corvettes effectively.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41611", 10 ),	-- Construct Torpedo Frigates to counter this threat.
	},
}

Events.speechevent_carrieravailable =
{
	{
		HW2_Wait(5),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$41630", 10 ),	-- Captial Ship Construction Facility available for construction.
	},
}

-- this is an event to say the player has lost
Events.speechevent_playerloses =
{
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Fade( 1 ),
		HW2_Wait(2),		
	},
	{
		HW2_LocationCardEvent( "$41522", 4 ),
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}