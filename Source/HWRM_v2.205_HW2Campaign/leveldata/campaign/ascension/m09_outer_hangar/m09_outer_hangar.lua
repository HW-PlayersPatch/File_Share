--  SCAR SCRIPT  -------------------------------------------------------------
--  Name: M09_Outer_Hanger
--  Purpose:  Mission 9 Mission Script
--
----------------------------------------------------------------------------------
-- NOTES : 
-- The location cards are currently used to display a "X minutes until dread repaired" etc msg.  Much better to do this with an actual timer.

-- for storing saves
g_save_id = 0

-- import library files
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")

-- objectives
obj_prim_destroyvaygr = "$44000"
obj_prim_destroyvaygr_id = 0

obj_prim_dreadprotect = "$44001"
obj_prim_dreadprotect_id = 0

obj_sec_repairdread = "$44002"
obj_sec_repairdread_id = 0

obj_prim_buildshipyard_repairdread = "$44006"
obj_prim_buildshipyard_repairdread_id = 0 

obj_prim_repairengines = "$44003"
obj_prim_repairengines_id = 0

obj_sec_destroygates = "$44004"
obj_sec_destroygates_id = 0

obj_sec_destroy_carriers = "$44005"
obj_sec_destroy_carriers_id = 0

-- global vars
g_now_time = Universe_GameTime()

g_dread_repair_time = 900

g_dread_repaired = 0

g_gate_status = 1

g_second_shipyard_obj_added = 0

-- Has the timer started?
g_timer_started = 0

-- TIMING FOR VAYGR ATTACKS



-- The gates will be deployed, and the first group sent from them, this long after the end of the intro intelevent.
g_gate_deploy_time = 180

-- The second wave will be sent through the gates this long after the first wave
g_gate_second_wave_time = 120

-- The shipyard will arrive this long after the Dreadnaughts engines have been repaired
g_shipyard_time = 80

-- The carriers will arrive this long after the Dreadnaught is docked
g_carrier_first_arrival_time = 180

-- Time to the arrival of the second carrier
g_time_to_second_carrier = 420

-- TIMING FOR DREADNAUGHT REPAIR
-- Should be 300 seconds to work with the current text

g_dreadnaught_repair_interval = 300


-- PINGS
ping_vaygr_1 = "$44155"
ping_vaygr_1_id = 0

ping_vaygr_2 = "$44155"
ping_vaygr_2_id = 0

ping_vaygr_3 = "$44155"
ping_vaygr_3_id = 0

-- All three carriers have the same ping text - "carrier"
ping_carrier_1 = "$44156"
ping_carrier_1_id = 0

ping_carrier_2 = "$44156"
ping_carrier_2_id = 0

ping_carrier_3 = "$44156"
ping_carrier_3_id = 0

ping_gate_1 = "$44157"
ping_gate_id_1 = 0

ping_gate_2 = "$44157"
ping_gate_id_2 = 0

ping_gate_3 = "$44157"
ping_gate_id_3 = 0

ping_gate_4 = "$44157"
ping_gate_id_4 = 0

ping_gate_5 = "$44157"
ping_gate_id_5 = 0

-- Store status of groups to go through gates
g_vgr_gate_attack_1 = 0
g_vgr_gate_attack_2 = 0
g_vgr_gate_attack_3 = 0
g_vgr_gate_attack_4 = 0
g_vgr_gate_attack_5 = 0

g_vgr_gate_attack_second_1 = 0
g_vgr_gate_attack_second_2 = 0
g_vgr_gate_attack_second_3 = 0
g_vgr_gate_attack_second_4 = 0
g_vgr_gate_attack_second_5 = 0

-- Store status of each gates ping
g_gate_1_ping_state = 0
g_gate_2_ping_state = 0
g_gate_3_ping_state = 0
g_gate_4_ping_state = 0
g_gate_5_ping_state = 0

-- POINTER VARIABLES
g_pointer_default = 0

g_pointer_default_1 = 0

g_pointer_default_2 = 0



function OnInit()


	SPRestrict()
--~ 	UI_BindKeyEvent( IKEY, "cheat" )
--	UI_BindKeyEvent( ESCKEY, 'skippingNIS' )


	NISSetSkippable( 0 ) 
	Rule_Add("Rule_PlayNIS")
		
	-- Rule_AddInterval("Rule_Start_Player_Ships_Moving", 37)
		
	Rule_Add( "Rule_NISIsPlaying" )
	
	Rule_Add("Rule_Init")
	--Rule_Remove("OnInit")
end

-- Techtree setup
function Enable_ResearchOptions()
	-----RESEARCH DATA----- 
	Player_UnrestrictResearchOption( 0, "IonCannonFrigateHealthUpgrade1" ) --IonCannonFrigateHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "IonCannonFrigateMAXSPEEDUpgrade1" ) --IonCannonFrigateMAXSPEEDUpgrade1 
	Player_UnrestrictResearchOption( 0, "ShipyardHealthUpgrade1" ) --ShipyardHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "ShipyardMAXSPEEDUpgrade1" ) --ShipyardMAXSPEEDUpgrade1 
end


function Rule_Move_Back_On()
	
	SobGroup_AbilityActivate("Player_Ships0", AB_Move, 1)

	Rule_Remove("Rule_Move_Back_On")
end

-- Disable AI player for script controlled Sobgroups.
function Setup_AI()

	SetAlliance( 1, 2)
	SetAlliance( 2, 1)
	
	SetAlliance( 1, 5)
	SetAlliance( 5, 1)
	
	SetAlliance( 5, 2)
	SetAlliance( 2, 5)
	
	
	CPU_Enable(1, 0)
	CPU_Enable(2, 1)
	
	CPU_RemoveSobGroup( 1, "Carrier_1" )
	CPU_RemoveSobGroup( 1, "Carrier_2" )
	CPU_RemoveSobGroup( 1, "Carrier_3" )
	CPU_RemoveSobGroup( 1, "Carrier_4" )
	CPU_RemoveSobGroup( 1, "Carrier_5" )
	CPU_RemoveSobGroup( 1, "Gate_1_A" )
	CPU_RemoveSobGroup( 1, "Gate_2_A" )
	CPU_RemoveSobGroup( 1, "Gate_3_A" )
	CPU_RemoveSobGroup( 1, "Gate_4_A" )
	CPU_RemoveSobGroup( 1, "Gate_5_A" )
	CPU_RemoveSobGroup( 1, "Gate_1_B" )
	CPU_RemoveSobGroup( 1, "Gate_2_B" )
	CPU_RemoveSobGroup( 1, "Gate_3_B" )
	CPU_RemoveSobGroup( 1, "Gate_4_B" )
	CPU_RemoveSobGroup( 1, "Gate_5_B" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_1" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_2" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_3" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_4" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_5" )	
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_Second_1" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_Second_2" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_Second_3" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_Second_4" )
	CPU_RemoveSobGroup( 1, "Vgr_Gate_Attack_Second_5" )
	
	-- Setup AI Carriers with Subsystems, load them w/ appropriate strikeforces and put them into Hyperspace
	SobGroup_CreateSubSystem( "Carrier_1", "Vgr_C_Production_Fighter" ) 
	SobGroup_CreateSubSystem( "Carrier_2", "Vgr_C_Production_Corvette" )
	SobGroup_CreateSubSystem( "Carrier_3", "Vgr_C_Production_Frigate" )
	SobGroup_CreateSubSystem( "Carrier_4", "Vgr_C_Production_Corvette" )
	SobGroup_CreateSubSystem( "Carrier_5", "Vgr_C_Production_Frigate" )
	
	SobGroup_DockSobGroupInstant("dockgroup_1","Carrier_1")
	SobGroup_DockSobGroupInstant("dockgroup_2","Carrier_2")
	SobGroup_DockSobGroupInstant("dockgroup_3","Carrier_3")
	SobGroup_DockSobGroupInstant("dockgroup_4","Carrier_4")
	SobGroup_DockSobGroupInstant("dockgroup_5","Carrier_5")



	SobGroup_Despawn("Carrier_1")
	SobGroup_Despawn("Carrier_2")
	SobGroup_Despawn("Carrier_3")
	SobGroup_Despawn("Carrier_4")
	SobGroup_Despawn("Carrier_5")
	
	
	-- Pregrant research
--~ 	Player_GrantResearchOption( 2, "InstaCapShipTech" )
--~ 	Player_GrantResearchOption( 2, "InstaAdvancedCapShipTech" )
	Player_GrantResearchOption( 2, "CorvetteTech" )
	Player_GrantResearchOption( 2, "FrigateTech" )
	Player_GrantResearchOption( 2, "LanceBeams" )
	Player_GrantResearchOption( 2, "PlasmaBombs" )
	Player_GrantResearchOption( 2, "CorvetteLaser" )
	Player_GrantResearchOption( 2, "FrigateAssault" )
	Player_GrantResearchOption( 2, "DestroyerGuns" )
	
	-- create all the subsystems needed for production on the Vgr Shipyard:
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "FighterProduction" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "CapShipProduction" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "PlatformProduction" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "Research" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "Hyperspace" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard", "AdvancedArray" )
	
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_Second_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_Second_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_Second_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_Second_1", "Vgr_Dart")
	SobGroup_FormStrikeGroup( "Vgr_Gate_Attack_Second_1", "Vgr_Dart")
	
	
	-- Make the ships aggressive
	Player_SetGlobalROE( 1, OffensiveROE )
 		Player_SetGlobalStance( 1, AggressiveStance )
	Player_SetGlobalROE( 2, OffensiveROE )
 		Player_SetGlobalStance( 2, AggressiveStance )	
	
	-- Give them some money to work with
	Player_SetRU (2, 10000)
	
	
end

function Rule_NISIsPlaying()

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

	if ( NISComplete( g_currentNISPlaying_id ) == 0 ) then
		-- Load persistent fleet
		SobGroup_LoadPersistantData("Hgn_Mothership")	
		
		Players_Mothership = "Players_Mothership"
		SobGroup_Create(Players_Mothership)
		SobGroup_FillShipsByType( Players_Mothership, "Player_Ships0", "Hgn_MotherShip" )
		ShipToParadeRoundTypeName = "Players_Mothership"	
		SobGroup_ParadeSobGroup ("Player_Ships0", "Players_Mothership", 2)

		-- Start the Music Maestro
		Sound_MusicPlayType( "data:sound/music/battle/BATTLE_01", MUS_Battle )
		
		Player_SetGlobalROE( 0, PassiveROE )
		
		Rule_Remove( "Rule_NISIsPlaying" )
	end
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Init()	
	
	-- turn off regular gameplay speech to avoid hearing speech right at the beginning of mission
	Sound_EnterIntelEvent()

	-- Setup Player Names
	Player_SetPlayerName( 0,"$44150" )
	Player_SetPlayerName( 1,"$44151" )
	Player_SetPlayerName( 2,"$44151" )
	Player_SetPlayerName( 5,"$44151" )
		
	-- Set research level
	HW2_SetResearchLevel( 9 )
	
	-- Disable build capable enemy ships on capture
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval( "Rule_DisableBuilderInterval", 20 )
	
	-- Set timer
	g_now_time = Universe_GameTime()
	
	Sound_SpeechSubtitlePath("speech:missions/m_09/")
		
	-- Restrict mover display	
	SobGroup_SetDisplayedRestrictedHardpoint(Players_Mothership,0)

	
	Setup_Shipyard()
	
	-- Set up patroling scout groups
	--Add_Patrols()
	
	-- Disable AI control for script controlled sobs
	Setup_AI()
	
	-- Make sure the Shipyard stays in its SobGroup
	SobGroup_SetSwitchOwnerFlag( "Shipyard", 0)
	
	SobGroup_Create("Vgr_Spawned_Group")
	
	-- Same deal for the Carriers, as they are switched over to the AI
	SobGroup_SetSwitchOwnerFlag( "Carrier_1", 0)
	SobGroup_SetSwitchOwnerFlag( "Carrier_2", 0)
	SobGroup_SetSwitchOwnerFlag( "Carrier_3", 0)
	SobGroup_SetSwitchOwnerFlag( "Carrier_4", 0)
	SobGroup_SetSwitchOwnerFlag( "Carrier_5", 0)
	
	Rule_AddInterval("Rule_Spawn_Constant_Vaygr", 30)
	
	Rule_Add( "Rule_PlayerLose" )
	
	-- Set starting Camera (looking at where the Dreadnaught will be)
	-- Camera_UseCameraPoint("Camera_Dreadnaught")

	-- Play Starting NIS
	--Rule_Add("Rule_PlayNIS")
	
--	--NISLoad( "nis/NIS09A" )
--	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS09A")
--	NISDisableInterface(1)
--	Rule_Add( "Rule_NISCompleted" )
	
	Rule_Remove("Rule_Init")
end

function Rule_Spawn_Constant_Vaygr()

	Spawn_Annoying_Vaygr_Ships()
	
end

function Rule_PlayNIS()
	NISLoad( "nis/NIS09A" )
	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS09A")
	NISDisableInterface(1)
	Rule_Add( "Rule_NISCompleted" )
	Rule_Remove( "Rule_PlayNIS" )
end

function Rule_PlayNIS2()
	NISLoad( "nis/NIS09B" )
	NISDisableInterface(1)
	g_currentNISPlaying_2_id = NISPlay( "nis/NIS09B" )
	Rule_Add( "Rule_NIS2Completed" )
	Rule_Remove( "Rule_PlayNIS2" )
end

function Rule_NISCompleted()
	if ( NISComplete( g_currentNISPlaying_id ) == 1 ) then
		
		NISSetSkippable( 1 ) 
		
		Event_Start("intelevent_destroyvaygr")

		Rule_Add( "Rule_EnableResearchAfterIntelevent" )
		-- set the AI's to aggressive
		Player_SetGlobalROE( 0, OffensiveROE )
 			Player_SetGlobalStance( 0, AggressiveStance )
		Player_SetGlobalROE( 1, OffensiveROE )
 			Player_SetGlobalStance( 1, AggressiveStance )
		
		print("Trying to call reactiveinfo")		
		-- Tell me about the reactive settings
		HW2_ReactiveInfo()		
				
		-- Setup all Dreadnaught related rules etc
		
		Rule_Add("Rule_Dreadnaught_Destroyed")
		Rule_Add("Rule_Dreadnaught_Engine_Repaired")
		SobGroup_SetHealth("vaygr_ambush", 0.8)
		
		-- Set up hostile group attack runs
--		-- Rule_AddInterval("Rule_Group_1_Attack", g_group_1_attack_time)
--		Rule_AddInterval("Rule_Group_2_Attack", g_group_2_attack_time)
--		Rule_AddInterval("Rule_Group_3_Attack", g_group_3_attack_time)
		-- Set up empty Sobs for player
		SobGroup_Create ("Bomber_1")
		SobGroup_Create ("Interceptor_1")
		SobGroup_Create ("MissileCorvette_1")
		SobGroup_Create ("LaserCorvette_1")
		SobGroup_Create ("HeavyMissileFrigate_1")
		SobGroup_Create ("AssaultFrigate_1")
		SobGroup_Create ("Temp_Squad_1")
		SobGroup_Create ("Temp_Squad_2")
		
		SwitchOffDread()
		
		Rule_Remove( "Rule_NISCompleted" )
	end
end

function Rule_EnableResearchAfterIntelevent()
	if ( Event_IsDone( "intelevent_destroyvaygr" ) == 1 ) then
		Enable_ResearchOptions()
		Rule_AddInterval("Rule_Dispatch_Gates", g_gate_deploy_time)
		Rule_Remove( "Rule_EnableResearchAfterIntelevent" )
	end
end

-- Rule that confirms the engines have been repaired
function Rule_Dreadnaught_Engine_Repaired()
	if ( SobGroup_HealthPercentage("Dreadnaught") >= 0.3 ) then
	
		Event_Start("speechevent_enginesonline")
		SobGroup_SetSpeed("Dreadnaught", 1)
		
		Rule_Add("Rule_Dreadnaught_Damaged")
		
		
		Rule_AddInterval("Rule_Shipyard_RocksUp", g_shipyard_time)
		
		Objective_SetState(obj_prim_repairengines_id , OS_Complete )
		
		Rule_Remove("Rule_Dreadnaught_Engine_Repaired")
	end
end

function Rule_Dispatch_Gates()

	for i=1,5 do
	
		SobGroup_Move(1, "Gate_"..i.."_B", "Gate_"..i.."_Open")
	end
	
	Rule_AddInterval("Rule_Deploy_Gates", 30)
	
	Rule_AddInterval("Rule_Gate_Speech", 28)
	
	Rule_Remove("Rule_Dispatch_Gates")
end

function Rule_Deploy_Gates()

	-- Perform gate linkage
	for i=1,5 do
		if (SobGroup_Empty("Gate_"..i.."_B") == 0) then
			SobGroup_FormHyperspaceGate( "Gate_"..i.."_A", "Gate_"..i.."_B" )
		end
	end
	
	
	
	Rule_AddInterval("Rule_Gate_Send_First", 4)
	Rule_Remove("Rule_Deploy_Gates")

end

function Rule_Gate_Send_First ()

	for i=1,5 do
		
		if (SobGroup_IsGateDeployed("Gate_"..i.."_A", "Gate_"..i.."_B") == 1) then
			SobGroup_UseHyperspaceGate( "Vgr_Gate_Attack_"..i, "Gate_"..i.."_A" )
		else
			SobGroup_AttackPlayer("Vgr_Gate_Attack_"..i, 0)
		end
	end
	
	Rule_AddInterval("Rule_Gate_Send_Second", g_gate_second_wave_time)
	Rule_AddInterval("Rule_Gate_First_Attack", 10)
	Rule_Remove("Rule_Gate_Send_First")
	
end

function Rule_Gate_First_Attack()
	
	for i=1, 5 do
		SobGroup_AttackPlayer("Vgr_Gate_Attack_"..i, 0)
	end

	Rule_Remove("Rule_Gate_First_Attack")
end

function Rule_Gate_Send_Second ()

	for i=1,5 do
		if (SobGroup_IsGateDeployed("Gate_"..i.."_A", "Gate_"..i.."_B") == 1) then
			SobGroup_UseHyperspaceGate( "Vgr_Gate_Attack_Second_"..i, "Gate_"..i.."_A" )
		else
			SobGroup_AttackPlayer("Vgr_Gate_Attack_Second_"..i, 0)
		end
	end
	
	Rule_AddInterval("Rule_Gate_Second_Attack", 20)
	
	Rule_Remove("Rule_Gate_Send_Second")	


end

function Rule_Gate_Second_Attack()
	
	for i=1, 5 do
		SobGroup_AttackPlayer("Vgr_Gate_Attack_Second_"..i, 0)
	end

	Rule_Remove("Rule_Gate_Second_Attack")
end

function Rule_Gate_Speech()

	Event_Start("speechevent_vaygrgate")
	
	Rule_Remove("Rule_Gate_Speech")

end

function Rule_Gate_Objective()

	ping_gate_id_1 = HW2_PingCreateWithLabel ( ping_gate_1, "Gate_1_B" )
	Ping_AddDescription(ping_gate_id_1, 0, "$44172")	

	ping_gate_id_2 = HW2_PingCreateWithLabel ( ping_gate_2, "Gate_2_B" )
	Ping_AddDescription(ping_gate_id_2, 0, "$44172")		

	ping_gate_id_3 = HW2_PingCreateWithLabel ( ping_gate_3, "Gate_3_B" )
	Ping_AddDescription(ping_gate_id_3, 0, "$44172")
	
	ping_gate_id_4 = HW2_PingCreateWithLabel ( ping_gate_1, "Gate_4_B" )
	Ping_AddDescription(ping_gate_id_4, 0, "$44172")

	ping_gate_id_5 = HW2_PingCreateWithLabel ( ping_gate_5, "Gate_5_B" )
	Ping_AddDescription(ping_gate_id_5, 0, "$44172")
	
	
	g_gate_1_ping_state = 1
	g_gate_2_ping_state = 1
	g_gate_3_ping_state = 1
	g_gate_4_ping_state = 1
	g_gate_5_ping_state = 1
	
	obj_sec_destroygates_id = Objective_Add( obj_sec_destroygates , OT_Secondary )
	Objective_AddDescription( obj_sec_destroygates_id, "$44015")
	Objective_AddDescription( obj_sec_destroygates_id, "$44016")
	Rule_Add("Rule_Gates_Destroyed")
	Rule_Add("Rule_Remove_Gate_Pings")
	Rule_Remove("Rule_Gate_Objective")
end

function Rule_Remove_Gate_Pings()

	if (SobGroup_Empty("Gate_1_B") == 1) and (g_gate_1_ping_state == 1) then
	
		g_gate_1_ping_state = 0
		
		Ping_Remove( ping_gate_id_1 )
	
	end
	if (SobGroup_Empty("Gate_2_B") == 1) and (g_gate_2_ping_state == 1) then
	
		g_gate_2_ping_state = 0
		
		Ping_Remove( ping_gate_id_2 )
	
	end
	if (SobGroup_Empty("Gate_3_B") == 1) and (g_gate_3_ping_state == 1) then
	
		g_gate_3_ping_state = 0
		
		Ping_Remove( ping_gate_id_3 )
	
	end
	if (SobGroup_Empty("Gate_4_B") == 1) and (g_gate_4_ping_state == 1) then
	
		g_gate_4_ping_state = 0
		
		Ping_Remove( ping_gate_id_4 )
	
	end
	if (SobGroup_Empty("Gate_5_B") == 1) and (g_gate_5_ping_state == 1) then
	
		g_gate_5_ping_state = 0
		
		Ping_Remove( ping_gate_id_5 )
	
	end
end

function Rule_Gates_Destroyed ()
	-- i changed this to an empty check, just for speed
	if (SobGroup_Empty("Vgr_Gates_All_Ends") == 1) then
		
		Objective_SetState( obj_sec_destroygates_id , OS_Complete )		
		
		for i=1,5 do
			
			if (  SobGroup_IsInVolume ("Vgr_Gate_Attack_"..i, "Gate_Sphere_"..i) == 1) then
				SobGroup_AttackPlayer("Vgr_Gate_Attack_"..i, 0)
			end
			
			
			if (  SobGroup_IsInVolume ("Vgr_Gate_Attack_Second_"..i, "Gate_Sphere_"..i) == 1) then
				SobGroup_AttackPlayer("Vgr_Gate_Attack_Second_"..i, 0)
			end
		end
		
		
		Sound_MusicPlayType( "data:sound/music/battle/BATTLE_04", MUS_Battle )
		
		Rule_Remove("Rule_Remove_Gate_Pings")
		Rule_Remove("Rule_Gates_Destroyed")
	end
end

-- Rule that Hyperspaces the Shipyard in and gets its boogie on
function Rule_Shipyard_RocksUp()

	Event_Start("intelevent_shipyardarrives")
		
	Rule_Add("Rule_Shipyard_Damaged")
	Rule_Add("Rule_Shipyard_Destroyed")
	Rule_Add("Rule_Dreadnaught_At_Shipyard")
	
	-- Send group to attack shipyard
	SobGroup_ExitHyperSpace ("Vgr_Shipyard_Attack", "Vgr_Shipyard_Attack_Entry")
	SobGroup_Attack(1, "Vgr_Shipyard_Attack", "Shipyard")
	
	-- RU injection for player 2
	Player_SetRU (2, 10000)
	
	-- Allow shipyard building
	Player_UnrestrictBuildOption( 0, "Hgn_Shipyard_SPG" )
	
	SobGroup_ExitHyperSpace ("Shipyard", "Shipyard_Entry") 
	
	SobGroup_SwitchOwner("Shipyard", 0)
	
	Rule_Remove("Rule_Shipyard_RocksUp")
end


	

-- incoming trouble causing Carriers

-- First two carriers appear
function Rule_Carrier_Arrive_1()
	
	SobGroup_ExitHyperSpace("Carrier_1", "Harrass_Carrier_1_Entry" )
	SobGroup_ExitHyperSpace("Carrier_2", "Harrass_Carrier_2_Entry" )
	SobGroup_ExitHyperSpace("Carrier_5", "Harrass_Carrier_5_Entry" )
	FOW_RevealGroup("Carrier_1", 1)
	FOW_RevealGroup("Carrier_2", 1)
	FOW_RevealGroup("Carrier_5", 1)
	
	Event_Start("speechevent_vaygrcarrier_1")
	
	Rule_AddInterval("Rule_Carrier_Arrive_2", g_time_to_second_carrier)
	
	Rule_AddInterval("Rule_Carrier_Launch_1", 25)
	Rule_Remove("Rule_Carrier_Arrive_1")
end
	
function Rule_Carrier_Launch_1()

		SobGroup_Launch("dockgroup_1", "Carrier_1")
		SobGroup_Launch("dockgroup_2", "Carrier_2")
		SobGroup_Launch("dockgroup_5", "Carrier_5")
		
		SobGroup_AttackPlayer("dockgroup_1", 0)
		SobGroup_AttackPlayer("dockgroup_2", 0)
		SobGroup_AttackPlayer("dockgroup_5", 0)

		Rule_AddInterval("Rule_Handoff_AI_1", 20)
		Rule_Remove("Rule_Carrier_Launch_1")

end

function Rule_Handoff_AI_1()
	
	SobGroup_SwitchOwner("Carrier_1", 2)
	SobGroup_SwitchOwner("Carrier_2", 2)
	SobGroup_SwitchOwner("Carrier_5", 2)
	
	Player_SetRU (2, 20000)

		
	Rule_Remove("Rule_Handoff_AI_1")
end

function Rule_Carrier_Arrive_2()
	
	SobGroup_ExitHyperSpace("Carrier_3", "Harrass_Carrier_3_Entry" )
	SobGroup_ExitHyperSpace("Carrier_4", "Harrass_Carrier_4_Entry" )
	Event_Start("speechevent_vaygrcarrier_2")
	FOW_RevealGroup("Carrier_3", 1)
	FOW_RevealGroup("Carrier_4", 1)
	
	Rule_AddInterval("Rule_Carrier_Launch_2", 25)
	
	Rule_Remove("Rule_Carrier_Arrive_2")
end
	
function Rule_Carrier_Launch_2()

		SobGroup_Launch("dockgroup_3", "Carrier_3")
		SobGroup_Launch("dockgroup_4", "Carrier_4")
		
		SobGroup_AttackPlayer("dockgroup_3", 0)
		SobGroup_AttackPlayer("dockgroup_4", 0)

		
		Rule_AddInterval("Rule_Handoff_AI_2", 20)
		
		Rule_Add("Rule_All_Carriers_Dead")

		obj_sec_destroy_carriers_id = Objective_Add( obj_sec_destroy_carriers , OT_Secondary )
		Objective_AddDescription( obj_sec_destroy_carriers_id, "$44171")
		
		
		
		Rule_Remove("Rule_Carrier_Launch_2")
end

function Rule_Handoff_AI_2()
	
	SobGroup_SwitchOwner("Carrier_3", 2)
	SobGroup_SwitchOwner("Carrier_4", 2)
	
	Player_SetRU (2, 30000)

	Rule_Remove("Rule_Handoff_AI_2")
end

function Rule_All_Carriers_Dead()

	if (SobGroup_Empty("Carrier_1") == 1) and (SobGroup_Empty("Carrier_2") == 1) and (SobGroup_Empty("Carrier_3") == 1) and (SobGroup_Empty("Carrier_4") == 1) and (SobGroup_Empty("Carrier_5") == 1) then

		Objective_SetState(obj_sec_destroy_carriers_id, OS_Complete)

		Rule_Remove("Rule_All_Carriers_Dead")
	end
	
end




-- removed this.  there were 2 PlayerLose functions running.
--~ -- Player loss if Mothership lost
--~ function Rule_PlayerLose()
--~ 	
--~ 	if ( SobGroup_Count( Players_Mothership ) == 0 ) then
--~ 		
--~ 		setMissionComplete(0)
--~ 		
--~ 		Rule_Remove( "Rule_PlayerLose" )
--~ 		
--~ 	end
--~ 	
--~ end


-- when Dreadnaught at 10% health
function Rule_Dreadnaught_Damaged()

	if ( SobGroup_HealthPercentage("Dreadnaught") <= 0.2 ) then
		
		Event_Start("speechevent_dreaddamaged")
		
		Rule_Remove("Rule_Dreadnaught_Damaged")
	end
	
end

-- when Dreadnaught destroyed
function Rule_Dreadnaught_Destroyed()

	if ( SobGroup_HealthPercentage("Dreadnaught") <= 0 ) then
		
		Event_Start("intelevent_dreaddestroyed")
		
		Objective_SetState(obj_prim_dreadprotect_id , OS_Failed )
		
		Rule_Remove("Rule_Dreadnaught_Destroyed")
	-- Need to fail the objective and end the mission	
		
	end
	
end

-- when Shipyward at 50% health
function Rule_Shipyard_Damaged()

	if ( SobGroup_HealthPercentage("Shipyard") <= 0.95 ) then
	
		Event_Start("speechevent_yarddamaged")
		
		Rule_Add("Rule_Shipyard_Damaged_More_1")
		
		Rule_Remove("Rule_Shipyard_Damaged")
	
	end
	
end

function Rule_Shipyard_Damaged_More_1()
	
	if ( SobGroup_HealthPercentage("Shipyard") <= 0.50 ) then
	
		Event_Start("speechevent_yarddamaged")
		
		Subtitle_Message( "$44147", 3 )
		
		Rule_Add("Rule_Shipyard_Damaged_More_2")
		
		Rule_Remove("Rule_Shipyard_Damaged_More_1")
	
	end
end

function Rule_Shipyard_Damaged_More_2()
	
	if ( SobGroup_HealthPercentage("Shipyard") <= 0.10 ) then
	
		Event_Start("speechevent_yarddamaged")
		
		Subtitle_Message( "$44148", 3 )
				
		Rule_Remove("Rule_Shipyard_Damaged_More_2")
	
	end
end

-- when Shipyard destroyed
function Rule_Shipyard_Destroyed()

	if ( SobGroup_HealthPercentage("Shipyard") <= 0 ) then
	
		Event_Start("speechevent_yarddestroyed")
		
		-- Pause the timer if its been started
		if (g_timer_started == 1) then
			Timer_Pause(0)
		end
		
		if (g_second_shipyard_obj_added == 0) then
			Objective_SetState(obj_sec_repairdread_id , OS_Failed )
			obj_prim_buildshipyard_repairdread_id = Objective_Add( obj_prim_buildshipyard_repairdread , OT_Primary )
			Objective_AddDescription( obj_prim_buildshipyard_repairdread_id, "$44018")
			
			Shipyard = "Shipyard"
		
			g_second_shipyard_obj_added = 1	
			if (g_timer_started == 0) then
				g_dread_repair_time = 420
			end
				
		end
		
		Rule_AddInterval("Rule_Redocked", 5)		
		
		Rule_AddInterval("Rule_Check_For_New_Shipyard", 5)
		print ("CALLING CHECK FOR NEW SHIPYARD")
				
		Rule_Remove("Rule_Shipyard_Destroyed")
				
	end
	
end

-- Rule checks for new shipyards and adds them into the Shipyard group
function Rule_Check_For_New_Shipyard()
	
	SobGroup_FillShipsByType( "Shipyard", "Player_Ships0", "Hgn_Shipyard_SPG" )
		print ("Adding to Shipyard SobGroup")
	if (SobGroup_Count("Shipyard") == 1) then
		
		print ("The player has built another shipyard")
		
		Event_Start("speechevent_reminder")
		
		Rule_Add("Rule_Test_For_Second_Shipyard_Destruction")
		

		Rule_Remove("Rule_Check_For_New_Shipyard")
	end
end

function Rule_Test_For_Second_Shipyard_Destruction()
	if ( SobGroup_HealthPercentage("Shipyard") <= 0 ) then
		
		Rule_AddInterval("Rule_Check_For_New_Shipyard", 10)
		print ("CHECK FOR SECOND SHIPYARD")
		Rule_Remove("Rule_Test_For_Second_Shipyard_Destruction")
	end
end


-- When Dreadnaught arrives at the Shipyard
function Rule_Dreadnaught_At_Shipyard()

	if ( SobGroup_IsDockedSobGroup( "Dreadnaught", "Shipyard" ) == 1 ) then
		
		-- Timers for Dreadnaught repairs		
	
		Rule_AddInterval("Rule_Carrier_Arrive_1", g_carrier_first_arrival_time)
		
		Rule_AddInterval("Rule_Test_Lauch_Or_Destruction", 5)
			
		SobGroup_ForceStayDockedIfDocking( "Dreadnaught" )
		
		Event_Start("intelevent_dreadrepairstart")
						
		Rule_Remove("Rule_Dreadnaught_At_Shipyard")
	end
end



function Rule_Start_Timer()

		Timer_Start( 0, g_dread_repair_time)
		
		g_timer_started = 1
		
		Timer_Display( 0 )
		Subtitle_TimeCounter( 0, 44146 )
		
		Rule_Add("Rule_Dread_Repairs_Complete")
		
		Rule_Add("Rule_Supercapital_Threat")
		
		Rule_Remove("Rule_Start_Timer")

end

function Rule_Test_Lauch_Or_Destruction()
	if ( SobGroup_IsDockedSobGroup( "Dreadnaught", "Shipyard" ) == 0 ) then
		-- Pause the timer if its been started
		if (g_timer_started == 1) then
			Timer_Pause(0)
		end
	
		Event_Start("speechevent_reminder")
	
		Rule_AddInterval("Rule_Redocked", 5)

		Rule_Remove("Rule_Test_Lauch_Or_Destruction")
	end
end

function Rule_Redocked()
	if ( SobGroup_IsDockedSobGroup( "Dreadnaught", "Shipyard" ) == 1 ) then
		
		-- Restart the timer if its been started
		if (g_timer_started == 1) then
			Timer_Resume(0)
		else
			Rule_Add("Rule_Start_Timer")
		end
		
		Rule_AddInterval("Rule_Test_Lauch_Or_Destruction", 5)

		Rule_Remove("Rule_Redocked")
	end
end

function Rule_Supercapital_Threat()
	if ( Timer_GetRemaining( 0 )  <= 60 ) then

		Event_Start("speechevent_vaygrsupercapapproach")

		Rule_Remove("Rule_Supercapital_Threat")

	end
end

-- When Dreadnaught has completed repairs
function Rule_Dread_Repairs_Complete()
	if ( Timer_GetRemaining( 0 )  <= 0 ) then

		Rule_Add("Rule_Destroy_Vaygr")
		
		SobGroup_Launch("Dreadnaught", "Shipyard" )
		
		SwitchOnDread()
		
		Subtitle_TimeCounterEnd()
		
		
		if (g_second_shipyard_obj_added == 0) then
		
			Objective_SetState( obj_sec_repairdread_id , OS_Complete )
		
		else
			Objective_SetState( obj_prim_buildshipyard_repairdread_id, OS_Complete )
		end
		
		Event_Start("intelevent_dreadrepaired")
	
		-- Bring in the final wave to attack the player
		SobGroup_ExitHyperSpace ("Vgr_Final_Attack_1", "Final_Threat_Entry_1") 		
		SobGroup_ExitHyperSpace ("Vgr_Final_Attack_2", "Final_Threat_Entry_2") 		
		SobGroup_ExitHyperSpace ("Vgr_Final_Attack_3", "Final_Threat_Entry_3") 
		
		
		Rule_Remove("Rule_Spawn_Constant_Vaygr")
		
		SobGroup_EnterHyperSpaceOffMap("Vgr_Shipyard")

		g_dread_repaired = 1
		
		Rule_AddInterval("Rule_All_Vaygr_Attack", 5)
		
		Rule_Remove("Rule_Dread_Repairs_Complete")
	end
end


function Rule_All_Vaygr_Attack()

	FOW_RevealGroup("Player_Ships1", 1)
	FOW_RevealGroup("Player_Ships1", 2)
	
	SobGroup_AttackPlayer("Player_Ships1", 0)
	SobGroup_AttackPlayer("Player_Ships2", 0)
	
	Rule_Remove("Rule_All_Vaygr_Attack")
	
end

-- Vaygr Destroyed - should probably be when the main Vaygr ship is destroyed
function Rule_Destroy_Vaygr()

	if (HW2_PlayerHasMilitary( 1 ) == 0) and (HW2_PlayerHasMilitary( 2 ) == 0) then
	
		Event_Start("intelevent_nisprep")
		
		Objective_SetState( obj_prim_destroyvaygr_id, OS_Complete )
		
		Objective_SetState(obj_prim_dreadprotect_id , OS_Complete )
	
		Rule_Remove("Rule_Destroy_Vaygr")
	
	end
end

function Rule_NIS2Completed()
	if ( NISComplete( g_currentNISPlaying_2_id ) == 1 ) then
		Event_Start("intelevent_vaygrdestroyed")
		Rule_Remove("Rule_NIS2Completed")
	end
end






-- Helper Functions

function SwitchOffDread()
	
	SobGroup_SetSpeed("Dreadnaught", 0)
	SobGroup_SetHealth("Dreadnaught", 0.2)
		
	-- Disable All weapons
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense1", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense2", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense3", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense4", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense5", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense6", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense7", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense8", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense9", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense10", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_DreadTurret", 0 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_Triton1", 0 )
end

function SwitchOnDread()

	-- Set engines to 100%
	SobGroup_SetSpeed("Dreadnaught", 1)
	
	SobGroup_SetHealth("Dreadnaught", 1)
	
	-- enable All weapons EXCEPT main ion cannon
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense1", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense2", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense3", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense4", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense5", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense6", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense7", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense8", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense9", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_HullDefense10", 1 )
	SobGroup_ChangePower( "Dreadnaught", "Weapon_DreadTurret", 1 )
end

function Setup_Shipyard()

	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_MS_Production_Fighter")
	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_MS_Production_Corvette")
	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_MS_Production_Frigate")
	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_MS_Module_Research")
	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_MS_Module_ResearchAdvanced")
	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_MS_Module_PlatformControl")
	SobGroup_CreateSubSystem ( "Shipyard", "Hgn_SY_Production_CapShip")
	
	
	
	SobGroup_Despawn("Shipyard")

end

-- Cap for maximum number of spawned ships
g_maxSpawnShips = 150

-- number of ships to build for each group
g_numberOfShipsPerGroup = 2

-- shiplist for spawning
SpawnShipList = 	{
				{"Vgr_Bomber", 20, 10},
				{"Vgr_Interceptor", 20, 10},
				{"Vgr_LaserCorvette", 20, 10},
				{"Vgr_LanceFighter", 30, 15},
				{"Vgr_MissileCorvette", 30, 15},
			}

-- Spawn ships at locations
function Spawn_Annoying_Vaygr_Ships()

        local shipToBuild = 0
        local shipsToBuild = {}
	local random_factor = RandomIntMax(3)

        -- if the vaygr have too many ships dont bother with this for now
        if (SobGroup_Empty("Player_Ships5") == 0 ) then 
        	if ( SobGroup_Count( "Player_Ships5") >= g_maxSpawnShips ) then
                	return
        	end	
        end

	print ("Spawning a group from sphere "..random_factor)

	-- Builds a group
	SobGroup_Clear("Vgr_Spawned_Group")
	for g=1, g_numberOfShipsPerGroup do 
		local lowestShipValue = 1000000000
        	-- each time a ship is built, we add to the weight
     	  	-- the ship with the lowest weight is what we build next
       		for i=1, getn(SpawnShipList) do
               		-- get the value of the current ship
              		currentShipValue = SpawnShipList[i][2]
                	-- compare it to the value of the last ship
                	if (currentShipValue < lowestShipValue) then
                        	-- this is the lowest ship so make it the lowest ship
                        	lowestShipValue = currentShipValue
                        	-- this is now the ship we want to build
                        	shipToBuild = i
                	end

        	end

	        -- we now have the lowest ship
	        -- build the lowest
	        if ( shipToBuild ~= 0 ) then
	        	SobGroup_SpawnNewShipInSobGroup(1, SpawnShipList[shipToBuild][1], "Vgr_Spawned_Group", "Vgr_Spawned_Group", "Vgr_Spawned_Group_Entry_"..random_factor)
	        	-- increase this ships weight by the specified value
	                SpawnShipList[shipToBuild][2] = SpawnShipList[shipToBuild][2] + SpawnShipList[shipToBuild][3]
	        end

	end
	
	-- Sends the group
	SobGroup_FormStrikeGroup( "Vgr_Spawned_Group", "Vgr_Dart")
	SobGroup_AttackPlayer( "Vgr_Spawned_Group" , 0)

end


-- BEGIN GAME: LOSE CONDITIONS
-- Lose condition
function Rule_PlayerLose()
	
	if ( SobGroup_Empty( Players_Mothership ) == 1 ) then
		
		Event_Start( "speechevent_playerloses" )
		
		Camera_FocusSobGroupWithBuffer( Players_Mothership, 3000, 3000,0 )
		
		Rule_Remove( "Rule_PlayerLose" )
		
	end
	
end

-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end

-- END GAME: LOSE CONDITIONS

-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent

Events.intelevent_destroyvaygr =
{
	{	
		-- Instantly start everything, as if they move around they might see some "behind the scenes" action
	-- 	{ "Camera_Interpolate( 'here', 'Camera_Dreadnaught', 0)",""},
		{"FOW_RevealGroup('vaygr_ambush', 1)",""},
		HW2_LocationCardEvent( "$44021", 6 ),	-- VAYGR ASSEMBLY POINT	
		{ "Universe_EnableSkip(1)", "" },
	        { "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
        },
	{
		
		HW2_SubTitleEvent( Actor_FleetIntel, "$44030", 5 ),	-- The Dreadnaught has slowed the initial Vaygr assault, however it suffered heavy damage when the Phased Cannon misfired.
	},
	{
		HW2_Wait(1)
	},
	{	        
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 1 )",""},
		{ "Camera_Interpolate( 'here', 'Camera_Dreadnaught', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44034", 5 ),	-- The Dreadnaught engines are offline.
	},
	{
		HW2_Wait(1)
	},
	{
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup('Dreadnaught')", "" },
		{"SobGroup_AttackPlayer('vaygr_ambush', 0)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44035", 5 ),	-- Send resource collectors to begin preliminary repairs
	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_IntroEnd', 2)",""},
		HW2_Wait(2)
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{ "Sensors_Toggle( 0 )",""},
		HW2_Letterbox( 0 ),
		HW2_Pause( 0 ),
		HW2_Wait(3),
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{"Universe_EnableSkip(0)",""},
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
		{"obj_prim_dreadprotect_id = Objective_Add( obj_prim_dreadprotect , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_dreadprotect_id, '$44011')", ""},
		{"Objective_AddDescription( obj_prim_dreadprotect_id, '$44012')", ""},
		{"obj_prim_repairengines_id = Objective_Add( obj_prim_repairengines , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_repairengines_id, '$44014')", ""},
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6436' )", ""}, -- ..' Mission Start'
	},
}

Events.speechevent_yarddamaged =
{	
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44095", 5 ),	-- The Shipyard is under attack.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}


Events.speechevent_yarddestroyed =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},	
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44100", 5 ),	-- The Shipyard has been destroyed
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_enginesonline =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},	
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44045", 5 ),	-- The Dreadnaught's engines are now online.
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44046", 5 ),	-- Basic Movement Is Restored. However, More Extensive Repairs Are Needed.
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44033", 5 ),	-- The Shipyard Nabaal is en-route
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44036", 5 ),	-- The Dreadnaught must dock with the Shipyard to complete repairs.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_shipyardarrives =
{	
        {
        	{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
        	{ "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
                HW2_Letterbox ( 1 ),
                HW2_Wait ( 3 ),
        },
	{
		-- Will need to add a wait until the Shipyard has fully entered
		{ "Sensors_EnableCameraZoom( 0 )","" },
                {"Sensors_Toggle( 0 )","" }, 
		{ "Camera_Interpolate( 'here', 'Camera_Shipyard_Entry', 2)",""},
		HW2_Wait(2),	
	},	
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		HW2_SubTitleEvent( Actor_Shipyard, "$44050", 5 ),	-- Fleet, this is Captain Elohim.
	},
	{
		HW2_Wait(1),
	},
	{	
		HW2_SubTitleEvent( Actor_Shipyard, "$44051", 5 ),	-- Hyperspace shortjump successful. Crews are standing by to repair the Dreadnaught.
	},
	{
		HW2_Wait(1),
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
                {"Sensors_Toggle( 1 )","" }, 
		{ "Camera_Interpolate( 'here', 'Camera_Shipyard_Wideview', 3)",""},
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup('Shipyard')", "" },
		{ "g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Dreadnaught')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$44052", 5 ),	-- Dock the Dreadnaught with the Shipyard.
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44053", 5 ),	-- Repairs will commence at once.
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		HW2_Wait(1),
	},
	{
		{"obj_sec_repairdread_id = Objective_Add( obj_sec_repairdread , OT_Primary )", ""},
		{"Objective_AddDescription( obj_sec_repairdread_id, '$44013')", ""},
		{"Sensors_Toggle( 0 )",""},
		HW2_Letterbox( 0 ),
		HW2_Wait( 2 ),
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{ "EventPointer_Remove(g_pointer_default_1)", "" },
		{"Universe_EnableSkip(0)",""},
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6437' )", ""}, -- ..' Shipyard Nabaal Arrived'
	},
	{
		HW2_Wait(1),
	},
}

Events.speechevent_dreaddamaged =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},	
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44105", 5 ),	-- Dreadnaught hull integrity at 20 percent and falling.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44106", 5 ),	-- We cannot lose the Dreadnaught.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44107", 5 ),	-- Allocate combat vessels to protect it.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_dreaddestroyed =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},	
	{
		{"Sensors_Toggle( 0 )",""},
		{ "Camera_FocusSobGroupWithBuffer( 'Dreadnaught', 1500, 0,2 )", "" },
		HW2_SubTitleEvent( Actor_FleetCommand, "$44110", 5 ),	-- The Dreadnaught has been destroyed
	},
	{
		HW2_Wait(8),
	},
	{
		{"setMissionComplete(0)",""},
	},
}

Events.intelevent_dreadrepairstart =
{
        {
	       	{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
        	{ "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
                HW2_Letterbox ( 1 ),
                HW2_Wait ( 3 ),
        },
        {
        	HW2_Wait(2),
        	HW2_Pause(1),
	},
        {
        	{ "Sensors_EnableCameraZoom( 0 )","" },
        	{"Sensors_Toggle( 0 )",""},
        	{ "Camera_FocusSobGroupWithBuffer( 'Shipyard', 1800, 0, 2 )", "" },
        	HW2_Wait(3),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44077", 5 ),	-- The Shipyard reports that preliminary analysis and repairs of the Dreadnaught systems will take time.
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_Shipyard, "$44088", 5 ),	-- Repairs will be complete in 15 minutes
	},
	{
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(0)", "" },  
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
		{ "Sensors_EnableCameraZoom( 1 )","" },
	},
	{
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Pause(0),
		{"Rule_Add('Rule_Start_Timer')", ""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6438' )", ""}, -- ..' Repairs Begun'
	},
	{
		HW2_Wait(1),
	},
}

Events.intelevent_dreadrepaired =
{	
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Letterbox( 1 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(1)", "" },
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
        	{"Sensors_Toggle( 0 )",""},
		{ "Camera_FocusSobGroupWithBuffer( 'Dreadnaught', 1500, 0,2 )", "" },
		HW2_SubTitleEvent( Actor_Shipyard, "$44115", 5 ),	-- Fleet, the Dreadnaught's systems are on-line.
	},
	{
		HW2_SubTitleEvent( Actor_Shipyard, "$44116", 5 ),	-- Crew has been transferred. She is ready for action.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44117", 5 ),	-- The Shipyard has restored the Dreadnaught to full combat status.  However, the Phased Array Cannon sustained irreparable damage.
	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_Battlecruiser', 3)",""},
		-- Lets ping some stuff here.
		HW2_SubTitleEvent( Actor_FleetIntel, "$44118", 5 ),	-- Multiple hyperspace signatures detected
		{"obj_prim_destroyvaygr_id = Objective_Add( obj_prim_destroyvaygr , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_destroyvaygr_id, '$44010')", ""},
		{"FOW_RevealGroup('Vgr_Final_Attack_1', 1)",""},
		{"FOW_RevealGroup('Vgr_Final_Attack_2', 1)",""},
		{"FOW_RevealGroup('Vgr_Final_Attack_3', 1)",""},
		{"ping_vaygr_1_id = Ping_AddSobGroup ( ping_vaygr_1, 'anomaly', 'Vgr_Final_Attack_1' )",""},
		{"ping_vaygr_2_id = Ping_AddSobGroup ( ping_vaygr_2, 'anomaly', 'Vgr_Final_Attack_2' )",""},
		{"ping_vaygr_3_id = Ping_AddSobGroup ( ping_vaygr_3, 'anomaly', 'Vgr_Final_Attack_3' )",""},
		{"Ping_AddDescription(ping_vaygr_1_id, 0, '$44170')",""},
		{"Ping_AddDescription(ping_vaygr_2_id, 0, '$44170')",""},
		{"Ping_AddDescription(ping_vaygr_3_id, 0, '$44170')",""},		
		{"SobGroup_Attack(2, 'Vgr_Final_Attack_1', 'Dreadnaught')", ""},
		{"SobGroup_Attack(2, 'Vgr_Final_Attack_2', 'Dreadnaught')", ""},
		{"SobGroup_Attack(2, 'Vgr_Final_Attack_3', 'Dreadnaught')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44119", 5 ),	-- The Vaygr are launching an attack.
	},
	{
		HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },
		{"SobGroup_AttackPlayer( 'Player_Ships1', 0 )",""},
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
		{ "Sensors_EnableCameraZoom( 1 )","" },
		HW2_Wait(4),
	},
	{
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6439' )", ""}, -- ..' Repairs Complete'
	},
	{
		HW2_Wait(1),
	},
}

Events.intelevent_vaygrdestroyed =
{	
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" }, -- allows the player to press the 'cancel' command to skip
		HW2_SubTitleEvent( Actor_FleetIntel, "$44125", 5 ),	-- The Vaygr have been defeated
	},
	{
--~ 		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Wait(2),
--~ 		{ "Camera_FocusSave()", "" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
        	{"Sensors_Toggle( 0 )",""},
		{ "Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 0,2 )", "" },
		{"Sound_MusicPlayType( 'data:sound/music/ambient/AMB_08', MUS_Ambient )", ""},		
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$44126", 5 ),	-- Before being captured, Captain Soban activated an emergency tracking device.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44131", 5 ),	-- Using this signal, we will be able to locate his destination point.
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$44132", 5 ),	-- Stand by for hyperspace jump.
	},
	{
		{ "Universe_AllowPlayerOrders( 0 )", "" },
	},
	{
		{ "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "" },
		HW2_Wait( 10 ),
	},
	{
		HW2_Fade( 1 ),
		HW2_Wait( 1 ),
	},	
	{
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		HW2_Wait( 1 ),
	},
	{
		{ "Subtitle_Message( '$3652', 2 )", "" },
		HW2_Wait( 2 ),
	},
	{
		--{ "Universe_EnableSkip(0)", "" }, -- not resetting the 'cancel' command
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
	{
		{"setMissionComplete(1)",""},
	},
}


Events.speechevent_vaygrgate =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44040", 5 ),	-- The Vaygr are using hyperspace gates to launch attacks upon the Dreadnaught
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44041", 5 ),	-- These gates must be destroyed
		{"Rule_Add('Rule_Gate_Objective')", ""},
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_gatedown =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44055", 5 ),	-- Gates destroyed.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_vaygrcarrier_1 =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44060", 5 ),	-- Priority alert!
	},
	{
		HW2_Letterbox( 1 ),
		{ "Universe_EnableSkip(1)", "" },
		{ "Camera_FocusSave()", "" },
	},
	{
		HW2_Wait(2)
	},
	{
		{"Sensors_Toggle( 1 )",""},
	},
	{
		{"Sound_MusicPlayType( 'data:sound/music/battle/Battle_06', MUS_Battle )", ""},
		{ "Camera_Interpolate( 'here', 'Camera_Carriers_Incoming', 0)",""},
		{ "g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Carrier_1')", "" },
		{ "g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Carrier_2')", "" },
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup('Carrier_5')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$44061", 5 ),	-- Vaygr Carriers exiting hyperspace. They have surrounded us.
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_Wait(1),
		{ "EventPointer_Remove(g_pointer_default_1)", "" },
		{ "EventPointer_Remove(g_pointer_default_2)", "" },
		{ "EventPointer_Remove(g_pointer_default)", "" },
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sensors_Toggle( 0 )",""},
	},
	{
		HW2_Pause( 0 ),
		HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Camera_FocusRestore()", "" },
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_vaygrcarrier_2 =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},
	{
		{"Sound_MusicPlayType( 'data:sound/music/battle/Battle_01', MUS_Battle )", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44065", 5 ),	-- Additonal enemy Carriers detected.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44066", 5 ),	-- The Mothership and Dreadnaught must be defended.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}


Events.speechevent_vaygrsupercapapproach =	
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},	
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44071", 5 ),	-- Vaygr super-capital ships approaching.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44072", 5 ),	-- Repairs to the Dreadnaught must be completed at once.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}



Events.speechevent_carrierdestroyed = 
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44070", 5 ),	-- Enemy Carriers eliminated.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_playerloses =
{
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Fade( 1 ),
		HW2_Wait(2),		
	},
	{
		HW2_LocationCardEvent( "$44113", 4 ),
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}

Events.intelevent_nisprep =
{
	{
		HW2_Wait(2),
	},
	{
		HW2_Fade( 1 ),
		HW2_Wait(2),		
	},
	{
		{"Rule_Add('Rule_PlayNIS2')", ""},
		{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", "" },
		{"Sensors_Toggle( 0 )",""},
	},
	{
		HW2_Fade(0),
	},
}

Events.speechevent_reminder =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44052", 5 ),	-- Dock the Dreadnaught with the Shipyard.
	},
	{
		HW2_Wait(1),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}


