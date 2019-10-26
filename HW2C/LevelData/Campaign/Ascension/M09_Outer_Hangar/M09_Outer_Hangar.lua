-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

g_save_id = 0
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
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
g_now_time = Universe_GameTime()
g_dread_repair_time = 900
g_dread_repaired = 0
g_gate_status = 1
g_second_shipyard_obj_added = 0
g_timer_started = 0
g_gate_deploy_time = 180
g_gate_second_wave_time = 120
g_shipyard_time = 80
g_carrier_first_arrival_time = 180
g_time_to_second_carrier = 420
g_dreadnaught_repair_interval = 300
ping_vaygr_1 = "$44155"
ping_vaygr_1_id = 0
ping_vaygr_2 = "$44155"
ping_vaygr_2_id = 0
ping_vaygr_3 = "$44155"
ping_vaygr_3_id = 0
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
g_gate_1_ping_state = 0
g_gate_2_ping_state = 0
g_gate_3_ping_state = 0
g_gate_4_ping_state = 0
g_gate_5_ping_state = 0
g_pointer_default = 0
g_pointer_default_1 = 0
g_pointer_default_2 = 0

function OnInit()
	NISSetSkippable(0)
	Rule_Add("Rule_PlayNIS")
	Rule_Add("Rule_NISIsPlaying")
	Rule_Add("Rule_Init")
end

function Enable_ResearchOptions()
	Player_UnrestrictResearchOption(0, "IonCannonFrigateHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "IonCannonFrigateMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "ShipyardHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "ShipyardMAXSPEEDUpgrade1")
end

function Rule_Move_Back_On()
	SobGroup_AbilityActivate("Player_Ships0", AB_Move, 1)
	Rule_Remove("Rule_Move_Back_On")
end

function Setup_AI()
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SetAlliance(1, 5)
	SetAlliance(5, 1)
	SetAlliance(5, 2)
	SetAlliance(2, 5)
	CPU_Enable(1, 0)
	CPU_Enable(2, 1)
	CPU_RemoveSobGroup(1, "Carrier_1")
	CPU_RemoveSobGroup(1, "Carrier_2")
	CPU_RemoveSobGroup(1, "Carrier_3")
	CPU_RemoveSobGroup(1, "Carrier_4")
	CPU_RemoveSobGroup(1, "Carrier_5")
	CPU_RemoveSobGroup(1, "Gate_1_A")
	CPU_RemoveSobGroup(1, "Gate_2_A")
	CPU_RemoveSobGroup(1, "Gate_3_A")
	CPU_RemoveSobGroup(1, "Gate_4_A")
	CPU_RemoveSobGroup(1, "Gate_5_A")
	CPU_RemoveSobGroup(1, "Gate_1_B")
	CPU_RemoveSobGroup(1, "Gate_2_B")
	CPU_RemoveSobGroup(1, "Gate_3_B")
	CPU_RemoveSobGroup(1, "Gate_4_B")
	CPU_RemoveSobGroup(1, "Gate_5_B")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_1")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_2")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_3")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_4")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_5")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_Second_1")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_Second_2")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_Second_3")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_Second_4")
	CPU_RemoveSobGroup(1, "Vgr_Gate_Attack_Second_5")
	SobGroup_CreateSubSystem("Carrier_1", "Vgr_C_Production_Fighter")
	SobGroup_CreateSubSystem("Carrier_2", "Vgr_C_Production_Corvette")
	SobGroup_CreateSubSystem("Carrier_3", "Vgr_C_Production_Frigate")
	SobGroup_CreateSubSystem("Carrier_4", "Vgr_C_Production_Corvette")
	SobGroup_CreateSubSystem("Carrier_5", "Vgr_C_Production_Frigate")
	SobGroup_DockSobGroupInstant("dockgroup_1", "Carrier_1")
	SobGroup_DockSobGroupInstant("dockgroup_2", "Carrier_2")
	SobGroup_DockSobGroupInstant("dockgroup_3", "Carrier_3")
	SobGroup_DockSobGroupInstant("dockgroup_4", "Carrier_4")
	SobGroup_DockSobGroupInstant("dockgroup_5", "Carrier_5")
	SobGroup_Despawn("Carrier_1")
	SobGroup_Despawn("Carrier_2")
	SobGroup_Despawn("Carrier_3")
	SobGroup_Despawn("Carrier_4")
	SobGroup_Despawn("Carrier_5")
	Player_GrantResearchOption(2, "CorvetteTech")
	Player_GrantResearchOption(2, "FrigateTech")
	Player_GrantResearchOption(2, "LanceBeams")
	Player_GrantResearchOption(2, "PlasmaBombs")
	Player_GrantResearchOption(2, "CorvetteLaser")
	Player_GrantResearchOption(2, "FrigateAssault")
	Player_GrantResearchOption(2, "DestroyerGuns")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "FighterProduction")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "CorvetteProduction")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "FrigateProduction")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "CapShipProduction")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "PlatformProduction")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "Research")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "Hyperspace")
	SobGroup_CreateSubSystem("Vgr_Shipyard", "AdvancedArray")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_Second_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_Second_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_Second_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_Second_1", "Fighter Screen")
	SobGroup_FormStrikeGroup("Vgr_Gate_Attack_Second_1", "Fighter Screen")
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	Player_SetDefaultShipTactic(2, AggressiveTactics)
	Player_SetRU(2, 10000)
end

function Rule_NISIsPlaying()
	if (NISComplete(g_currentNISPlaying_id) == 0) then
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	ShipToParadeRoundTypeName = "Players_Mothership"
	SobGroup_ParadeSobGroup("Player_Ships0", "Players_Mothership", 2)
	Sound_MusicPlayType("data:sound/music/battle/BATTLE_01", MUS_Battle)
	Player_SetDefaultShipTactic(0, PassiveTactics)
	Rule_Remove("Rule_NISIsPlaying")
	end
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Init()
	Sound_EnterIntelEvent()
	Player_SetPlayerName(0, "$44150")
	Player_SetPlayerName(1, "$44151")
	Player_SetPlayerName(2, "$44151")
	Player_SetPlayerName(5, "$44151")
	HW2_SetResearchLevel(9)
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	g_now_time = Universe_GameTime()
	Sound_SpeechSubtitlePath("speech:missions/m_09/")
	SobGroup_SetDisplayedRestrictedHardpoint(Players_Mothership, 0)
	Setup_Shipyard();
	Setup_AI();
	SobGroup_SetSwitchOwnerFlag("Shipyard", 0)
	SobGroup_Create("Vgr_Spawned_Group")
	SobGroup_SetSwitchOwnerFlag("Carrier_1", 0)
	SobGroup_SetSwitchOwnerFlag("Carrier_2", 0)
	SobGroup_SetSwitchOwnerFlag("Carrier_3", 0)
	SobGroup_SetSwitchOwnerFlag("Carrier_4", 0)
	SobGroup_SetSwitchOwnerFlag("Carrier_5", 0)
	Rule_AddInterval("Rule_Spawn_Constant_Vaygr", 30)
	Rule_Add("Rule_PlayerLose")
	Rule_Remove("Rule_Init")
end

function Rule_Spawn_Constant_Vaygr()
	Spawn_Annoying_Vaygr_Ships();
end

function Rule_PlayNIS()
	NISLoad("nis/NIS09A")
	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS09A")
	NISDisableInterface(1)
	Rule_Add("Rule_NISCompleted")
	Rule_Remove("Rule_PlayNIS")
end

function Rule_PlayNIS2()
	NISLoad("nis/NIS09B")
	NISDisableInterface(1)
	g_currentNISPlaying_2_id = NISPlay("nis/NIS09B")
	Rule_Add("Rule_NIS2Completed")
	Rule_Remove("Rule_PlayNIS2")
end

function Rule_NISCompleted()
	if (NISComplete(g_currentNISPlaying_id) == 1) then
	NISSetSkippable(1)
	Event_Start("intelevent_destroyvaygr")
	Rule_Add("Rule_EnableResearchAfterIntelevent")
	Player_SetDefaultShipTactic(0, AggressiveTactics)
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	print("Trying to call reactiveinfo")
	HW2_ReactiveInfo()
	Rule_Add("Rule_Dreadnaught_Destroyed")
	Rule_Add("Rule_Dreadnaught_Engine_Repaired")
	SobGroup_SetHealth("vaygr_ambush", 0.8)
	SobGroup_Create("Bomber_1")
	SobGroup_Create("Interceptor_1")
	SobGroup_Create("MissileCorvette_1")
	SobGroup_Create("LaserCorvette_1")
	SobGroup_Create("HeavyMissileFrigate_1")
	SobGroup_Create("AssaultFrigate_1")
	SobGroup_Create("Temp_Squad_1")
	SobGroup_Create("Temp_Squad_2")
	SwitchOffDread();
	Rule_Remove("Rule_NISCompleted")
	end
end

function Rule_EnableResearchAfterIntelevent()
	if (Event_IsDone("intelevent_destroyvaygr") == 1) then
	Enable_ResearchOptions();
	Rule_AddInterval("Rule_Dispatch_Gates", g_gate_deploy_time)
	Rule_Remove("Rule_EnableResearchAfterIntelevent")
	end
end

function Rule_Dreadnaught_Engine_Repaired()
	if (SobGroup_HealthPercentage("Dreadnaught") >= 0.3) then
	Event_Start("speechevent_enginesonline")
	SobGroup_SetSpeed("Dreadnaught", 1)
	Rule_Add("Rule_Dreadnaught_Damaged")
	Rule_AddInterval("Rule_Shipyard_RocksUp", g_shipyard_time)
	Objective_SetState(obj_prim_repairengines_id, OS_Complete)
	Rule_Remove("Rule_Dreadnaught_Engine_Repaired")
	end
end

function Rule_Dispatch_Gates()
	for i = 1, 5 do
	SobGroup_Move(1, "Gate_"..i.."_B", "Gate_"..i.."_Open")
	end
	Rule_AddInterval("Rule_Deploy_Gates", 30)
	Rule_AddInterval("Rule_Gate_Speech", 28)
	Rule_Remove("Rule_Dispatch_Gates")
end

function Rule_Deploy_Gates()
	for i = 1, 5 do
	if (SobGroup_Empty("Gate_"..i.."_B") == 0) then
	SobGroup_FormHyperspaceGate("Gate_"..i.."_A", "Gate_"..i.."_B")
	end
	end
	Rule_AddInterval("Rule_Gate_Send_First", 4)
	Rule_Remove("Rule_Deploy_Gates")
end

function Rule_Gate_Send_First()
	for i = 1, 5 do
	if (SobGroup_IsGateDeployed("Gate_"..i.."_A", "Gate_"..i.."_B") == 1) then
	SobGroup_UseHyperspaceGate("Vgr_Gate_Attack_"..i, "Gate_"..i.."_A")
	else
	SobGroup_AttackPlayer("Vgr_Gate_Attack_"..i, 0)
	end
	end
	Rule_AddInterval("Rule_Gate_Send_Second", g_gate_second_wave_time)
	Rule_AddInterval("Rule_Gate_First_Attack", 10)
	Rule_Remove("Rule_Gate_Send_First")
end

function Rule_Gate_First_Attack()
	for i = 1, 5 do
	SobGroup_AttackPlayer("Vgr_Gate_Attack_"..i, 0)
	end
	Rule_Remove("Rule_Gate_First_Attack")
end

function Rule_Gate_Send_Second()
	for i = 1, 5 do
	if (SobGroup_IsGateDeployed("Gate_"..i.."_A", "Gate_"..i.."_B") == 1) then
	SobGroup_UseHyperspaceGate("Vgr_Gate_Attack_Second_"..i, "Gate_"..i.."_A")
	else
	SobGroup_AttackPlayer("Vgr_Gate_Attack_Second_"..i, 0)
	end
	end
	Rule_AddInterval("Rule_Gate_Second_Attack", 20)
	Rule_Remove("Rule_Gate_Send_Second")
end

function Rule_Gate_Second_Attack()
	for i = 1, 5 do
	SobGroup_AttackPlayer("Vgr_Gate_Attack_Second_"..i, 0)
	end
	Rule_Remove("Rule_Gate_Second_Attack")
end

function Rule_Gate_Speech()
	Event_Start("speechevent_vaygrgate")
	Rule_Remove("Rule_Gate_Speech")
end

function Rule_Gate_Objective()
	ping_gate_id_1 = HW2_PingCreateWithLabel(ping_gate_1, "Gate_1_B")
	Ping_AddDescription(ping_gate_id_1, 0, "$44172")
	ping_gate_id_2 = HW2_PingCreateWithLabel(ping_gate_2, "Gate_2_B")
	Ping_AddDescription(ping_gate_id_2, 0, "$44172")
	ping_gate_id_3 = HW2_PingCreateWithLabel(ping_gate_3, "Gate_3_B")
	Ping_AddDescription(ping_gate_id_3, 0, "$44172")
	ping_gate_id_4 = HW2_PingCreateWithLabel(ping_gate_1, "Gate_4_B")
	Ping_AddDescription(ping_gate_id_4, 0, "$44172")
	ping_gate_id_5 = HW2_PingCreateWithLabel(ping_gate_5, "Gate_5_B")
	Ping_AddDescription(ping_gate_id_5, 0, "$44172")
	g_gate_1_ping_state = 1
	g_gate_2_ping_state = 1
	g_gate_3_ping_state = 1
	g_gate_4_ping_state = 1
	g_gate_5_ping_state = 1
	obj_sec_destroygates_id = Objective_Add(obj_sec_destroygates, OT_Secondary)
	Objective_AddDescription(obj_sec_destroygates_id, "$44015")
	Objective_AddDescription(obj_sec_destroygates_id, "$44016")
	Rule_Add("Rule_Gates_Destroyed")
	Rule_Add("Rule_Remove_Gate_Pings")
	Rule_Remove("Rule_Gate_Objective")
end

function Rule_Remove_Gate_Pings()
	if (SobGroup_Empty("Gate_1_B") == 1 and g_gate_1_ping_state == 1) then
	g_gate_1_ping_state = 0
	Ping_Remove(ping_gate_id_1)
	end
	if (SobGroup_Empty("Gate_2_B") == 1 and g_gate_2_ping_state == 1) then
	g_gate_2_ping_state = 0
	Ping_Remove(ping_gate_id_2)
	end
	if (SobGroup_Empty("Gate_3_B") == 1 and g_gate_3_ping_state == 1) then
	g_gate_3_ping_state = 0
	Ping_Remove(ping_gate_id_3)
	end
	if (SobGroup_Empty("Gate_4_B") == 1 and g_gate_4_ping_state == 1) then
	g_gate_4_ping_state = 0
	Ping_Remove(ping_gate_id_4)
	end
	if (SobGroup_Empty("Gate_5_B") == 1 and g_gate_5_ping_state == 1) then
	g_gate_5_ping_state = 0
	Ping_Remove(ping_gate_id_5)
	end
end

function Rule_Gates_Destroyed()
	if (SobGroup_Empty("Vgr_Gates_All_Ends") == 1) then
	Objective_SetState(obj_sec_destroygates_id, OS_Complete)
	for i = 1, 5 do
	if (SobGroup_IsInVolume("Vgr_Gate_Attack_"..i, "Gate_Sphere_"..i) == 1) then
	SobGroup_AttackPlayer("Vgr_Gate_Attack_"..i, 0)
	end
	if (SobGroup_IsInVolume("Vgr_Gate_Attack_Second_"..i, "Gate_Sphere_"..i) == 1) then
	SobGroup_AttackPlayer("Vgr_Gate_Attack_Second_"..i, 0)
	end
	end
	Sound_MusicPlayType("data:sound/music/battle/BATTLE_04", MUS_Battle)
	Rule_Remove("Rule_Remove_Gate_Pings")
	Rule_Remove("Rule_Gates_Destroyed")
	end
end

function Rule_Shipyard_RocksUp()
	Event_Start("intelevent_shipyardarrives")
	Rule_Add("Rule_Shipyard_Damaged")
	Rule_Add("Rule_Shipyard_Destroyed")
	Rule_Add("Rule_Dreadnaught_At_Shipyard")
	SobGroup_ExitHyperSpace("Vgr_Shipyard_Attack", "Vgr_Shipyard_Attack_Entry")
	SobGroup_Attack(1, "Vgr_Shipyard_Attack", "Shipyard")
	Player_SetRU(2, 10000)
	Player_UnrestrictBuildOption(0, "Hgn_Shipyard_SPG")
	SobGroup_ExitHyperSpace("Shipyard", "Shipyard_Entry")
	SobGroup_SwitchOwner("Shipyard", 0)
	Rule_Remove("Rule_Shipyard_RocksUp")
end

function Rule_Carrier_Arrive_1()
	SobGroup_ExitHyperSpace("Carrier_1", "Harrass_Carrier_1_Entry")
	SobGroup_ExitHyperSpace("Carrier_2", "Harrass_Carrier_2_Entry")
	SobGroup_ExitHyperSpace("Carrier_5", "Harrass_Carrier_5_Entry")
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
	Player_SetRU(2, 20000)
	Rule_Remove("Rule_Handoff_AI_1")
end

function Rule_Carrier_Arrive_2()
	SobGroup_ExitHyperSpace("Carrier_3", "Harrass_Carrier_3_Entry")
	SobGroup_ExitHyperSpace("Carrier_4", "Harrass_Carrier_4_Entry")
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
	obj_sec_destroy_carriers_id = Objective_Add(obj_sec_destroy_carriers, OT_Secondary)
	Objective_AddDescription(obj_sec_destroygates_id, "$44015")
	Rule_Remove("Rule_Carrier_Launch_2")
end

function Rule_Handoff_AI_2()
	SobGroup_SwitchOwner("Carrier_3", 2)
	SobGroup_SwitchOwner("Carrier_4", 2)
	Player_SetRU(2, 30000)
	Rule_Remove("Rule_Handoff_AI_2")
end

function Rule_All_Carriers_Dead()
	if (SobGroup_Empty("Carrier_1") == 1 and SobGroup_Empty("Carrier_2") == 1 and SobGroup_Empty("Carrier_3") == 1 and SobGroup_Empty("Carrier_4") == 1 and SobGroup_Empty("Carrier_5") == 1) then
	Objective_SetState(obj_sec_destroy_carriers_id, OS_Complete)
	Rule_Remove("Rule_All_Carriers_Dead")
	end
end

function Rule_Dreadnaught_Damaged()
	if (SobGroup_HealthPercentage("Dreadnaught") <= 0.2) then
	Event_Start("speechevent_dreaddamaged")
	Rule_Remove("Rule_Dreadnaught_Damaged")
	end
end

function Rule_Dreadnaught_Destroyed()
	if (SobGroup_HealthPercentage("Dreadnaught") <= 0) then
	Event_Start("intelevent_dreaddestroyed")
	Objective_SetState(obj_prim_dreadprotect_id, OS_Failed)
	Rule_Remove("Rule_Dreadnaught_Destroyed")
	end
end

function Rule_Shipyard_Damaged()
	if (SobGroup_HealthPercentage("Shipyard") <= 0.95) then
	Event_Start("speechevent_yarddamaged")
	Rule_Add("Rule_Shipyard_Damaged_More_1")
	Rule_Remove("Rule_Shipyard_Damaged")
	end
end

function Rule_Shipyard_Damaged_More_1()
	if (SobGroup_HealthPercentage("Shipyard") <= 0.5) then
	Event_Start("speechevent_yarddamaged")
	Subtitle_Message("$44147", 3)
	Rule_Add("Rule_Shipyard_Damaged_More_2")
	Rule_Remove("Rule_Shipyard_Damaged_More_1")
	end
end

function Rule_Shipyard_Damaged_More_2()
	if (SobGroup_HealthPercentage("Shipyard") <= 0.1) then
	Event_Start("speechevent_yarddamaged")
	Subtitle_Message("$44148", 3)
	Rule_Remove("Rule_Shipyard_Damaged_More_2")
	end
end

function Rule_Shipyard_Destroyed()
	if (SobGroup_HealthPercentage("Shipyard") <= 0) then
	Event_Start("speechevent_yarddestroyed")
	if (g_timer_started == 1) then
	Timer_Pause(0)
	end
	if (g_second_shipyard_obj_added == 0) then
	Objective_SetState(obj_sec_repairdread_id, OS_Failed)
	obj_prim_buildshipyard_repairdread_id = Objective_Add(obj_prim_buildshipyard_repairdread, OT_Primary)
	Objective_AddDescription(obj_prim_buildshipyard_repairdread_id, "$44018")
	Shipyard = "Shipyard"
	g_second_shipyard_obj_added = 1
	if (g_timer_started == 0) then
	g_dread_repair_time = 420
	end
	end
	Rule_AddInterval("Rule_Redocked", 5)
	Rule_AddInterval("Rule_Check_For_New_Shipyard", 5)
	print("CALLING CHECK FOR NEW SHIPYARD")
	Rule_Remove("Rule_Shipyard_Destroyed")
	end
end

function Rule_Check_For_New_Shipyard()
	SobGroup_FillShipsByType("Shipyard", "Player_Ships0", "Hgn_Shipyard_SPG")
	print("Adding to Shipyard SobGroup")
	if (SobGroup_Count("Shipyard") == 1) then
	print("The player has built another shipyard")
	Event_Start("speechevent_reminder")
	Rule_Add("Rule_Test_For_Second_Shipyard_Destruction")
	Rule_Remove("Rule_Check_For_New_Shipyard")
	end
end

function Rule_Test_For_Second_Shipyard_Destruction()
	if (SobGroup_HealthPercentage("Shipyard") <= 0) then
	Rule_AddInterval("Rule_Check_For_New_Shipyard", 10)
	print("CHECK FOR SECOND SHIPYARD")
	Rule_Remove("Rule_Test_For_Second_Shipyard_Destruction")
	end
end

function Rule_Dreadnaught_At_Shipyard()
	if (SobGroup_IsDockedSobGroup("Dreadnaught", "Shipyard") == 1) then
	Rule_AddInterval("Rule_Carrier_Arrive_1", g_carrier_first_arrival_time)
	Rule_AddInterval("Rule_Test_Lauch_Or_Destruction", 5)
	SobGroup_ForceStayDockedIfDocking("Dreadnaught")
	Event_Start("intelevent_dreadrepairstart")
	Rule_Remove("Rule_Dreadnaught_At_Shipyard")
	end
end

function Rule_Start_Timer()
	Timer_Start(0, g_dread_repair_time)
	g_timer_started = 1
	Timer_Display(0)
	Subtitle_TimeCounter(0, 44146)
	Rule_Add("Rule_Dread_Repairs_Complete")
	Rule_Add("Rule_Supercapital_Threat")
	Rule_Remove("Rule_Start_Timer")
end

function Rule_Test_Lauch_Or_Destruction()
	if (SobGroup_IsDockedSobGroup("Dreadnaught", "Shipyard") == 0) then
	if (g_timer_started == 1) then
	Timer_Pause(0)
	end
	Event_Start("speechevent_reminder")
	Rule_AddInterval("Rule_Redocked", 5)
	Rule_Remove("Rule_Test_Lauch_Or_Destruction")
	end
end

function Rule_Redocked()
	if (SobGroup_IsDockedSobGroup("Dreadnaught", "Shipyard") == 1) then
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
	if (Timer_GetRemaining(0) <= 60) then
	Event_Start("speechevent_vaygrsupercapapproach")
	Rule_Remove("Rule_Supercapital_Threat")
	end
end

function Rule_Dread_Repairs_Complete()
	if (Timer_GetRemaining(0) <= 0) then
	Rule_Remove("Rule_Test_Lauch_Or_Destruction")
	Rule_Add("Rule_Destroy_Vaygr")
	SobGroup_Launch("Dreadnaught", "Shipyard")
	SwitchOnDread();
	Subtitle_TimeCounterEnd()
	if (g_second_shipyard_obj_added == 0) then
	Objective_SetState(obj_sec_repairdread_id, OS_Complete)
	else
	Objective_SetState(obj_prim_buildshipyard_repairdread_id, OS_Complete)
	end
	Event_Start("intelevent_dreadrepaired")
	SobGroup_ExitHyperSpace("Vgr_Final_Attack_1", "Final_Threat_Entry_1")
	SobGroup_ExitHyperSpace("Vgr_Final_Attack_2", "Final_Threat_Entry_2")
	SobGroup_ExitHyperSpace("Vgr_Final_Attack_3", "Final_Threat_Entry_3")
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

function Rule_Destroy_Vaygr()
	if (HW2_PlayerHasMilitary(1) == 0 and HW2_PlayerHasMilitary(2) == 0) then
	Event_Start("intelevent_nisprep")
	Objective_SetState(obj_prim_destroyvaygr_id, OS_Complete)
	Objective_SetState(obj_prim_dreadprotect_id, OS_Complete)
	Rule_Remove("Rule_Destroy_Vaygr")
	end
end

function Rule_NIS2Completed()
	if (NISComplete(g_currentNISPlaying_2_id) == 1) then
	Event_Start("intelevent_vaygrdestroyed")
	Rule_Remove("Rule_NIS2Completed")
	end
end

function SwitchOffDread()
	SobGroup_SetSpeed("Dreadnaught", 0)
	SobGroup_SetHealth("Dreadnaught", 0.2)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense1", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense2", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense3", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense4", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense5", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense6", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense7", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense8", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense9", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense10", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_DreadTurret", 0)
	SobGroup_ChangePower("Dreadnaught", "Weapon_Triton1", 0)
end

function SwitchOnDread()
	SobGroup_SetSpeed("Dreadnaught", 1)
	SobGroup_SetHealth("Dreadnaught", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense1", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense2", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense3", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense4", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense5", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense6", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense7", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense8", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense9", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_HullDefense10", 1)
	SobGroup_ChangePower("Dreadnaught", "Weapon_DreadTurret", 1)
end

function Setup_Shipyard()
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Production_Fighter")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Production_Corvette")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Production_Frigate")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Module_Research")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Module_ResearchAdvanced")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Module_PlatformControl")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_SY_Production_CapShip")
	SobGroup_Despawn("Shipyard")
end

g_maxSpawnShips = 150
g_numberOfShipsPerGroup = 2
SpawnShipList = {{"Vgr_Bomber", 20, 10}, {"Vgr_Interceptor", 20, 10}, {"Vgr_LaserCorvette", 20, 10}, {"Vgr_LanceFighter", 30, 15}, {"Vgr_MissileCorvette", 30, 15},}

function Spawn_Annoying_Vaygr_Ships()
	local shipToBuild = 0
	local shipsToBuild = {}
	local random_factor = RandomIntMax(3)
	if (SobGroup_Empty("Player_Ships5") == 0) then
	if (SobGroup_Count("Player_Ships5") >= g_maxSpawnShips) then
	return
	end
	end
	print("Spawning a group from sphere "..random_factor)
	SobGroup_Clear("Vgr_Spawned_Group")
	for g = 1, g_numberOfShipsPerGroup do
	local lowestShipValue = 1000000000.0
	for i = 1, getn(SpawnShipList) do
	currentShipValue = SpawnShipList[i][2]
	if (currentShipValue < lowestShipValue) then
	lowestShipValue = currentShipValue
	shipToBuild = i
	end
	end
	if (shipToBuild ~= 0) then
	SobGroup_SpawnNewShipInSobGroup(5, SpawnShipList[shipToBuild][1], "Vgr_Spawned_Group", "Vgr_Spawned_Group", "Vgr_Spawned_Group_Entry_"..random_factor)
	SpawnShipList[shipToBuild][2] = (SpawnShipList[shipToBuild][2] + SpawnShipList[shipToBuild][3])
	end
	end
	SobGroup_FormStrikeGroup("Vgr_Spawned_Group", "Fighter Screen")
	SobGroup_AttackPlayer("Vgr_Spawned_Group", 0)
end

function Rule_PlayerLose()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	Event_Start("speechevent_playerloses")
	Camera_FocusSobGroupWithBuffer(Players_Mothership, 3000, 3000, 0)
	Rule_Remove("Rule_PlayerLose")
	end
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

Events = {}
Events["intelevent_destroyvaygr"] = {{{"FOW_RevealGroup('vaygr_ambush', 1)", ""}, HW2_LocationCardEvent("$44021", 6), {"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44030", 5)}, {HW2_Wait(1)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(1)", ""}, {"Camera_Interpolate('here', 'Camera_Dreadnaught', 2)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44034", 5)}, {HW2_Wait(1)}, {{"g_pointer_default = HW2_CreateEventPointerSobGroup('Dreadnaught')", ""}, {"SobGroup_AttackPlayer('vaygr_ambush', 0)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44035", 5)}, {{"Camera_Interpolate('here', 'Camera_IntroEnd', 2)", ""}, HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(1)", ""}, {"Sensors_Toggle(0)", ""}, HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(3), {"EventPointer_Remove(g_pointer_default)", ""}, {"Universe_EnableSkip(0)", ""},}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"obj_prim_dreadprotect_id = Objective_Add(obj_prim_dreadprotect , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_dreadprotect_id, '$44011')", ""}, {"Objective_AddDescription(obj_prim_dreadprotect_id, '$44012')", ""}, {"obj_prim_repairengines_id = Objective_Add(obj_prim_repairengines , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_repairengines_id, '$44014')", ""}, {"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6436')", ""},},}
Events["speechevent_yarddamaged"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44095", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_yarddestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44100", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_enginesonline"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44045", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44046", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44033", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44036", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_shipyardarrives"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(3)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_Interpolate('here', 'Camera_Shipyard_Entry', 2)", ""}, HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_SubTitleEvent(Actor_Shipyard, "$44050", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_Shipyard, "$44051", 5)}, {HW2_Wait(1)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(1)", ""}, {"Camera_Interpolate('here', 'Camera_Shipyard_Wideview', 3)", ""}, {"g_pointer_default = HW2_CreateEventPointerSobGroup('Shipyard')", ""}, {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Dreadnaught')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44052", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44053", 5)}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_Wait(1)}, {{"obj_sec_repairdread_id = Objective_Add(obj_sec_repairdread , OT_Primary)", ""}, {"Objective_AddDescription(obj_sec_repairdread_id, '$44013')", ""}, {"Sensors_Toggle(0)", ""}, HW2_Letterbox(0), HW2_Wait(2), {"EventPointer_Remove(g_pointer_default)", ""}, {"EventPointer_Remove(g_pointer_default_1)", ""}, {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {{"Sensors_EnableCameraZoom(1)", ""}, {"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6437')", ""},}, {HW2_Wait(1)},}
Events["speechevent_dreaddamaged"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44105", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44106", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44107", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_dreaddestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {{"Sensors_Toggle(0)", ""}, {"Camera_FocusSobGroupWithBuffer('Dreadnaught', 1500, 0, 2)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$44110", 5)}, {HW2_Wait(8)}, {{"setMissionComplete(0)", ""},},}
Events["intelevent_dreadrepairstart"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(3)}, {HW2_Wait(2), HW2_Pause(1)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_FocusSobGroupWithBuffer('Shipyard', 1800, 0, 2)", ""}, HW2_Wait(3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44077", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_Shipyard, "$44088", 5)}, {HW2_Letterbox(0), HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Sensors_EnableCameraZoom(1)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Pause(0), {"Rule_Add('Rule_Start_Timer')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6438')", ""},}, {HW2_Wait(1)},}
Events["intelevent_dreadrepaired"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), HW2_Wait(2), {"Universe_EnableSkip(1)", ""},}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_FocusSobGroupWithBuffer('Dreadnaught', 1500, 0, 2)", ""}, HW2_SubTitleEvent(Actor_Shipyard, "$44115", 5)}, {HW2_SubTitleEvent(Actor_Shipyard, "$44116", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44117", 5)}, {{"Camera_Interpolate('here', 'Camera_Battlecruiser', 3)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44118", 5), {"obj_prim_destroyvaygr_id = Objective_Add(obj_prim_destroyvaygr , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroyvaygr_id, '$44010')", ""}, {"FOW_RevealGroup('Vgr_Final_Attack_1', 1)", ""}, {"FOW_RevealGroup('Vgr_Final_Attack_2', 1)", ""}, {"FOW_RevealGroup('Vgr_Final_Attack_3', 1)", ""}, {"ping_vaygr_1_id = Ping_AddSobGroup (ping_vaygr_1, 'anomaly', 'Vgr_Final_Attack_1')", ""}, {"ping_vaygr_2_id = Ping_AddSobGroup (ping_vaygr_2, 'anomaly', 'Vgr_Final_Attack_2')", ""}, {"ping_vaygr_3_id = Ping_AddSobGroup (ping_vaygr_3, 'anomaly', 'Vgr_Final_Attack_3')", ""}, {"Ping_AddDescription(ping_vaygr_1_id, 0, '$44170')", ""}, {"Ping_AddDescription(ping_vaygr_2_id, 0, '$44170')", ""}, {"Ping_AddDescription(ping_vaygr_3_id, 0, '$44170')", ""}, {"SobGroup_Attack(2, 'Vgr_Final_Attack_1', 'Dreadnaught')", ""}, {"SobGroup_Attack(2, 'Vgr_Final_Attack_2', 'Dreadnaught')", ""}, {"SobGroup_Attack(2, 'Vgr_Final_Attack_3', 'Dreadnaught')", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44119", 5)}, {HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"SobGroup_AttackPlayer('Player_Ships1', 0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Sensors_EnableCameraZoom(1)", ""}, HW2_Wait(4)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6439')", ""},}, {HW2_Wait(1)},}
Events["intelevent_vaygrdestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44125", 5)}, {HW2_Letterbox(1), HW2_Wait(2), {"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_FocusSobGroupWithBuffer(Players_Mothership, 2000, 0, 2)", ""}, {"Sound_MusicPlayType('data:sound/music/ambient/AMB_08', MUS_Ambient)", ""},}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44126", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44131", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$44132", 5)}, {{"Universe_AllowPlayerOrders(0)", ""},}, {{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')", ""}, HW2_Wait(10)}, {HW2_Fade(1), HW2_Wait(1)}, {{"Player_InstantlyGatherAllResources(0)", ""}, HW2_Wait(1)}, {{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {{"setMissionComplete(1)", ""},},}
Events["speechevent_vaygrgate"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44040", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44041", 5), {"Rule_Add('Rule_Gate_Objective')", ""},}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_gatedown"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44055", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_vaygrcarrier_1"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44060", 5)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, {"Camera_FocusSave()", ""},}, {HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""},}, {{"Sound_MusicPlayType('data:sound/music/battle/Battle_06', MUS_Battle)", ""}, {"Camera_Interpolate('here', 'Camera_Carriers_Incoming', 0)", ""}, {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Carrier_1')", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Carrier_2')", ""}, {"g_pointer_default = HW2_CreateEventPointerSobGroup('Carrier_5')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44061", 5)}, {HW2_Wait(1)}, {HW2_Wait(1), {"EventPointer_Remove(g_pointer_default_1)", ""}, {"EventPointer_Remove(g_pointer_default_2)", ""}, {"EventPointer_Remove(g_pointer_default)", ""},}, {HW2_Wait(1)}, {{"Sensors_Toggle(0)", ""},}, {HW2_Pause(0), HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Camera_FocusRestore()", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_vaygrcarrier_2"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {{"Sound_MusicPlayType('data:sound/music/battle/Battle_01', MUS_Battle)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44065", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44066", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_vaygrsupercapapproach"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44071", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44072", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_carrierdestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$44070", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$44113", 4)}, {{"setMissionComplete(0)", ""},},}
Events["intelevent_nisprep"] = {{HW2_Wait(2)}, {HW2_Fade(1), HW2_Wait(2)}, {{"Rule_Add('Rule_PlayNIS2')", ""}, {"Player_InstantDockAndParade(0, Players_Mothership, 0)", ""}, {"Sensors_Toggle(0)", ""},}, {HW2_Fade(0)},}
Events["speechevent_reminder"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$44052", 5)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
