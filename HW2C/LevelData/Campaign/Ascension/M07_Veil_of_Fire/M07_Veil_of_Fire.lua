-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
g_save_id = 0
g_now_time = Universe_GameTime()
g_damage_time = Universe_GameTime()
g_probe_fire = 60
g_movers_avaliable_in = 80
g_probe_fire_regardless = 300
g_probe_fired_yet = 0
g_attack_wave_1_probe_escaped = 50
g_attack_wave_2_probe_escaped = 200
g_attack_wave_3_probe_escaped = 350
g_attack_wave_1_probe_destroyed = 150
g_attack_wave_2_probe_destroyed = 350
g_attack_wave_3_probe_destroyed = 500
g_neb_1 = 1
g_neb_2 = 1
g_neb_3 = 1
g_neb_4 = 1
g_neb_5 = 1
g_neb_6 = 1
g_neb_7 = 1
g_nebula_status = {0, 0, 0, 0, 0, 0, 0, 0}
g_flake_nebula_status = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
g_radiation_investigated = 0
g_mover_investigated = 0
g_chunk_investigated = 0
obj_prim_buildsubsyst = "$43000"
obj_prim_buildsubsyst_id = 0
obj_prim_gettohanger = "$43001"
obj_prim_gettohanger_id = 0
obj_prim_investigate = "$43002"
obj_prim_investigate_id = 0
obj_prim_destroy_vaygr = "$43003"
obj_prim_destroy_vaygr_id = 0
ping_chunk_1 = "$43010"
ping_chunk_1_id = 0
ping_chunk_2 = "$43010"
ping_chunk_2_id = 0
ping_chunk_3 = "$43010"
ping_chunk_3_id = 0
ping_chunk_4 = "$43010"
ping_chunk_4_id = 0
ping_chunk_5 = "$43010"
ping_chunk_5_id = 0
ping_chunk_6 = "$43010"
ping_chunk_6_id = 0
ping_chunk_7 = "$43010"
ping_chunk_7_id = 0
ping_invesigate = "$43011"
ping_invesigate_id = 0
ping_probe = "$43013"
ping_probe_id = 0
ping_vaygr_force_1 = "$43014"
ping_vaygr_force_1_id = 0
ping_vaygr_force_2 = "$43014"
ping_vaygr_force_2_id = 0
ping_vaygr_force_3 = "$43014"
ping_vaygr_force_3_id = 0
stat_mover_controller_id = 0
g_playerID = Universe_CurrentPlayer()
EventPlaying = 0
g_vaygr_all_dead = 0
g_pointer_default_1 = 0
g_pointer_default_2 = 0
g_pointer_default_3 = 0
g_pointer_default_4 = 0
g_pointer_default_5 = 0
g_pointer_default_6 = 0
g_pointer_default_7 = 0
g_pointer_default_8 = 0
g_pointer_default_9 = 0
g_pointer_default_11 = 0
g_pointer_default_12 = 0
g_pointer_default_13 = 0
g_pointer_default_14 = 0
g_pointer_default_15 = 0
g_pointer_default_16 = 0
g_pointer_default_17 = 0
g_pointer_default_18 = 0
g_pointer_default_19 = 0
g_pointer_default_20 = 0

function Enable_ResearchOptions()
	Player_UnrestrictBuildOption(0, "Hgn_C_Module_FireControl")
	Player_UnrestrictBuildOption(0, "Hgn_MS_Module_FireControl")
	Player_UnrestrictBuildOption(0, "Hgn_Destroyer")
	Player_UnrestrictResearchOption(0, "DestroyerTech")
	Player_UnrestrictResearchOption(0, "AssaultFrigateHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "AssaultFrigateMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "DestroyerHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "DestroyerMAXSPEEDUpgrade1")
end

function Rule_monitorBuildBtn()
	if (UI_IsScreenActive("NewBuildMenu") == 1) then
	UI_StopFlashButton("NewTaskbar", "btnBuild")
	Rule_Remove("Rule_monitorBuildBtn")
	end
end

function OnInit()
	Rule_Add("Rule_Init")
	Camera_Interpolate("here", "Camera_Start", 0)
end

function Rule_Init()
	Sound_SpeechSubtitlePath("speech:missions/m_07/")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_07", MUS_Ambient)
	Player_SetRU(1, 5000)
	Player_SetRU(3, 5000)
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	ShipToParadeRoundTypeName = "Players_Mothership"
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	Rule_Add("Rule_PlayerLose")
	Player_SetPlayerName(0, "$43110")
	Player_SetPlayerName(1, "$43111")
	Player_SetPlayerName(2, "$43113")
	Player_SetPlayerName(3, "$43112")
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	SetAlliance(2, 3)
	SetAlliance(3, 2)
	HW2_ReactiveInfo()
	HW2_SetResearchLevel(7)
	Camera_UsePanning(0)
	Camera_Interpolate("here", "Camera_Start", 0)
	Rule_Add("Rule_ReInit")
	Rule_Add("Rule_AI_Init")
	Rule_AddInterval("Rule_Nebula_Delete", 3)
	Rule_AddInterval("Rule_Flake_Nebula_Delete", 6)
	SobGroup_SetInvulnerability("Command", 1)
	Rule_Remove("Rule_Init")
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_AI_Init()
	CPU_Enable(1, 1)
	CPU_Enable(2, 0)
	CPU_Enable(3, 1)
	Player_GrantResearchOption(1, "VaygrRadiationImmunityHack")
	Player_GrantResearchOption(2, "VaygrRadiationImmunityHack")
	for i = 1, 7 do
	SobGroup_FollowPath("Mover_"..i, "Path_"..i, 1, 1, 0)
	end
	CPU_RemoveSobGroup(1, "Carrier_Group_1")
	CPU_RemoveSobGroup(1, "Carrier_Group_2")
	CPU_RemoveSobGroup(1, "Carrier_Group_3")
	CPU_RemoveSobGroup(1, "Command")
	CPU_RemoveSobGroup(1, "Vgr_AI_Carrier_Load_1")
	CPU_RemoveSobGroup(1, "Vgr_AI_Carrier_Load_2")
	CPU_RemoveSobGroup(1, "Vgr_AI_Carrier_Load_3")
	SobGroup_AbilityActivate("Carrier_1", AB_Move, 0)
	SobGroup_AbilityActivate("Carrier_2", AB_Move, 0)
	SobGroup_AbilityActivate("Carrier_3", AB_Move, 0)
	SobGroup_CreateSubSystem("Carrier_1", "FrigateProduction")
	SobGroup_CreateSubSystem("Carrier_2", "CorvetteProduction")
	SobGroup_CreateSubSystem("Carrier_3", "FrigateProduction")
	SobGroup_CreateSubSystem("Carrier_3", "CorvetteProduction")
	CPU_DoString(1, "cp_attackPercent = 25")
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	Player_SetDefaultShipTactic(2, PassiveTactics)
	AI_BulkResearchGrant(1);
	Rule_Remove("Rule_AI_Init")
end

function Rule_AI_Enable_2()
	SobGroup_AttackPlayer("Strikegroup_1", 0)
	CPU_DoString(1, "cp_attackPercent = 100")
end

function AI_BulkResearchGrant(AI_Number)
	Player_GrantResearchOption(AI_Number, "CorvetteTech")
	Player_GrantResearchOption(AI_Number, "CorvetteCommand")
	Player_GrantResearchOption(AI_Number, "PlatformHeavyMissiles")
	Player_GrantResearchOption(AI_Number, "FrigateInfiltrationTech")
	Player_GrantResearchOption(AI_Number, "HyperspaceGateTech")
	Player_GrantResearchOption(AI_Number, "RepairAbility")
	Player_GrantResearchOption(AI_Number, "FrigateTech")
	Player_GrantResearchOption(AI_Number, "LanceBeams")
	Player_GrantResearchOption(AI_Number, "PlasmaBombs")
	Player_GrantResearchOption(AI_Number, "CorvetteLaser")
	Player_GrantResearchOption(AI_Number, "FrigateAssault")
end

function Rule_ReInit()
	Event_Start("intelevent_cleardebris")
	Rule_Add("Rule_EnableResearchAfterIntel")
	g_damage_time = Universe_GameTime()
	SobGroup_DockSobGroupInstant("Vgr_AI_Carrier_Load_1", "Carrier_1")
	SobGroup_DockSobGroupInstant("Vgr_AI_Carrier_Load_2", "Carrier_2")
	SobGroup_DockSobGroupInstant("Vgr_AI_Carrier_Load_3", "Carrier_3")
	Rule_AddInterval("Rule_HyperspaceOff", 3)
	Rule_AddInterval("Rule_Probe_Fire_Anyway", g_probe_fire_regardless)
	Rule_AddInterval("Rule_Nebula_Test", 1)
	Rule_AddInterval("Rule_Chunk_Test", 2)
	Rule_Remove("Rule_ReInit")
end

function Rule_EnableResearchAfterIntel()
	if (Event_IsDone("intelevent_cleardebris") == 1) then
	Enable_ResearchOptions();
	Rule_Remove("Rule_EnableResearchAfterIntel")
	end
end

function Rule_HyperspaceOff()
	SobGroup_EnterHyperSpaceOffMap("Carrier_Group_1")
	SobGroup_EnterHyperSpaceOffMap("Carrier_Group_2")
	SobGroup_EnterHyperSpaceOffMap("Carrier_Group_3")
	Rule_Remove("Rule_HyperspaceOff")
end

function Rule_Probe_Fire_Anyway()
	if (g_probe_fired_yet == 0) then
	g_probe_fired_yet = 1
	Rule_Add("Rule_Trigger_Probe_Event")
	end
	Rule_Remove("Rule_Probe_Fire_Anyway")
end

function Rule_Trigger_Probe_Event()
	if (EventPlaying == 0) then
	SobGroup_SetInvulnerability("Command", 0)
	Event_Start("intelevent_probe")
	Rule_Add("Rule_Probe_Captured")
	Rule_Add("Rule_Probe_Escaped")
	Rule_Remove("Rule_Trigger_Probe_Event")
	end
end

function Rule_Probe_Launch()
	if (g_probe_fired_yet == 0) then
	g_probe_fired_yet = 1
	Rule_Add("Rule_Trigger_Probe_Event")
	end
	Rule_Remove("Rule_Probe_Launch")
end

function Rule_Probe_Escaped()
	if (Player_IsShipInVolume(1, "probe_dest") == 1) then
	Event_Start("speechevent_probeaway")
	Ping_Remove(ping_probe_id)
	Rule_AddInterval("Rule_Vaygr_Attack_1", g_attack_wave_1_probe_escaped)
	Rule_AddInterval("Rule_Vaygr_Attack_2", g_attack_wave_2_probe_escaped)
	Rule_AddInterval("Rule_Vaygr_Attack_3", g_attack_wave_3_probe_escaped)
	Rule_Remove("Rule_Probe_Escaped")
	Rule_Remove("Rule_Probe_Captured")
	end
end

function Rule_Probe_Captured()
	if (SobGroup_Count("Command") == 0) then
	Event_Start("speechevent_probecaught")
	Rule_AddInterval("Rule_Vaygr_Attack_1", g_attack_wave_1_probe_destroyed)
	Rule_AddInterval("Rule_Vaygr_Attack_2", g_attack_wave_2_probe_destroyed)
	Rule_AddInterval("Rule_Vaygr_Attack_3", g_attack_wave_3_probe_destroyed)
	Rule_Remove("Rule_Probe_Escaped")
	Rule_Remove("Rule_Probe_Captured")
	end
end

function Rule_Nebula_Test()
	for i = 1, 7 do
	if (SobGroup_AreAnySquadronsInsideNebula("Player_Ships0", "Nebula_"..i) == 1) then
	Rule_Add("Rule_Nebula_Entered")
	g_radiation_investigated = 1
	Rule_Remove("Rule_Nebula_Test")
	end
	end
	for i = 1, 20 do
	if (SobGroup_AreAnySquadronsInsideNebula("Player_Ships0", "Nebula_Flake_"..i) == 1) then
	Rule_Add("Rule_Nebula_Entered")
	g_radiation_investigated = 1
	Rule_Remove("Rule_Nebula_Test")
	end
	end
end

function Rule_Nebula_Entered()
	if (EventPlaying == 0) then
	Event_Start("intelevent_radiationdamage")
	Rule_Remove("Rule_Nebula_Entered")
	end
end

function Rule_Chunk_Test()
	for i = 1, 7 do
	if (SobGroup_PlayerIsInSensorRange("Chunk_"..i, 0) == 1) then
	Rule_Add("Rule_Chunk_Intel")
	g_mover_investigated = i
	Rule_Remove("Rule_Chunk_Test")
	end
	end
end

function Rule_Chunk_Intel()
	if (EventPlaying == 0) then
	Event_Start("intelevent_chunksscouted")
	Objective_SetState(obj_prim_investigate_id, OS_Complete)
	Rule_Remove("Rule_Chunk_Intel")
	end
end

function Rule_Movers_Built()
	if (SobGroup_GetHardPointHealth("Players_Mothership", "MoverConstruction 1") > 0) then
	Player_UnrestrictBuildOption(0, "Kpr_Mover")
	Rule_Add("Rule_Movers_Actually_Built")
	Event_Start("intelevent_moversundercontrol")
	Rule_Remove("Rule_Movers_Built")
	end
end

function Rule_Movers_Actually_Built()
	if (Stats_ShipsCreated(g_playerID, GetShipId("Kpr_Mover")) >= 1) then
	Objective_SetState(obj_prim_buildsubsyst_id, OS_Complete)
	Rule_Remove("Rule_Movers_Actually_Built")
	end
end

g_chunks_destroyed = 0
g_flakes_destroyed = 0

function Rule_Nebula_Delete()
	for i = 1, 7 do
	if (g_nebula_status[i] == 0) then
	if (SobGroup_Count("Chunk_"..i) == 0) then
	Universe_NebulaDelete("Nebula_"..i, 5)
	SobGroup_AttackPlayer("Mover_"..i, 0)
	g_nebula_status[i] = 1
	g_chunks_destroyed = (g_chunks_destroyed + 1)
	Chunk_Destroyed();
	end
	end
	end
end

function Chunk_Destroyed()
	if (g_chunks_destroyed == 1) then
	Event_Start("speechevent_destroyfirstdebris")
	elseif (g_chunks_destroyed >= 7) then
	Event_Start("speechevent_clearedradiation")
	g_chunks_destroyed = 1
	Objective_SetState(obj_prim_gettohanger_id, OS_Complete)
	Rule_Remove("Rule_Nebula_Delete")
	else
	Event_Start("speechevent_destroythirddebris")
	end
end

function Rule_Flake_Nebula_Delete()
	for i = 1, 20 do
	if (g_flake_nebula_status[i] == 0) then
	if (SobGroup_Count("Flake_"..i) == 0) then
	Universe_NebulaDelete("Nebula_Flake_"..i, 5)
	g_flake_nebula_status[i] = 1
	g_flakes_destroyed = (g_flakes_destroyed + 1)
	Flake_Destroyed()
	end
	end
	end
end

function Flake_Destroyed()
	if (g_flakes_destroyed >= 20) then
	Event_Start("speechevent_destroythirddebris")
	Rule_Remove("Rule_Flake_Nebula_Delete")
	else
	Event_Start("speechevent_destroythirddebris")
	end
end

function Rule_Vaygr_Attack_1()
	Rule_Add("Rule_Play_Vaygrincoming")
	Rule_Remove("Rule_Vaygr_Attack_1")
end

function Rule_Vaygr_Launch_1()
	SobGroup_Launch("Vgr_AI_Carrier_Load_1", "Carrier_1")
	Rule_Remove("Rule_Vaygr_Launch_1")
end

function Rule_Vaygr_Attack_2()
	SobGroup_ExitHyperSpace("Carrier_Group_2", "Carrier_Entry_2")
	CPU_AddSobGroup(1, "Carrier_Group_2")
	CPU_AddSobGroup(1, "Vgr_AI_Carrier_Load_2")
	Rule_AddInterval("Rule_Vaygr_Launch_2", 15)
	Rule_Remove("Rule_Vaygr_Attack_2")
end

function Rule_Vaygr_Launch_2()
	SobGroup_Launch("Vgr_AI_Carrier_Load_2", "Carrier_2")
	Rule_Remove("Rule_Vaygr_Launch_2")
end

function Rule_Vaygr_Attack_3()
	SobGroup_ExitHyperSpace("Carrier_Group_3", "Carrier_Entry_3")
	CPU_AddSobGroup(1, "Carrier_Group_3")
	CPU_AddSobGroup(1, "Vgr_AI_Carrier_Load_3")
	Rule_AddInterval("Rule_Vaygr_Launch_3", 15)
	Rule_Add("Rule_All_Vaygr_Dead")
	Rule_Remove("Rule_Vaygr_Attack_3")
	if (g_chunks_destroyed == 1) then
	FOW_RevealGroup("Player_Ships1", 1)
	end
end

function Rule_Vaygr_Launch_3()
	SobGroup_Launch("Vgr_AI_Carrier_Load_3", "Carrier_3")
	Rule_Remove("Rule_Vaygr_Launch_3")
end

function Rule_Play_Vaygrincoming()
	if (EventPlaying == 0) then
	Event_Start("intelevent_vaygrincoming")
	SobGroup_ExitHyperSpace("Carrier_Group_1", "Carrier_Entry_1")
	CPU_AddSobGroup(1, "Carrier_Group_1")
	CPU_AddSobGroup(1, "Vgr_AI_Carrier_Load_1")
	Rule_AddInterval("Rule_AI_Enable_2", 5)
	Rule_AddInterval("Rule_Vaygr_Launch_1", 15)
	SobGroup_FormStrikeGroup("Strikegroup_1", "wall")
	Rule_Remove("Rule_Play_Vaygrincoming")
	end
end

function Rule_All_Vaygr_Dead()
	if (HW2_PlayerHasMilitary(1) == 0) then
	if (g_chunks_destroyed == 1) then
	Event_Start("intelevent_lets_go")
	Objective_SetState(obj_prim_destroy_vaygr_id, OS_Complete)
	else
	g_vaygr_all_dead = 1
	Rule_Remove("Rule_All_Vaygr_Dead")
	obj_prim_destroy_vaygr_id = Objective_Add(obj_prim_destroy_vaygr, OT_Primary)
	Objective_AddDescription(obj_prim_destroy_vaygr_id, "$43140")
	Objective_SetState(obj_prim_destroy_vaygr_id, OS_Complete)
	end
	end
end

function Rule_Post_Chunks()
	if (g_vaygr_all_dead == 1) then
	Event_Start("intelevent_lets_go")
	else
	Event_Start("speechevent_destroyvaygr")
	end
	Rule_Remove("Rule_Post_Chunks")
end

function Rule_PlayerLose()
	if (SobGroup_Count(Players_Mothership) == 0) then
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_PlayerLose")
	end
end

function Movers_Agressive()
	for i = 1, 7 do
	SobGroup_FollowPath("Mover_"..i, "Path_"..i, 1, 1, 1)
	end
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function Rule_End_Intel()
	if (g_chunk_investigated == 0) then
	Event_Start("intelevent_radiationdamage_end_without_mover")
	else
	Event_Start("intelevent_radiationdamage_end_with_mover")
	end
	Rule_Remove("Rule_End_Intel")
end

Events = {}
Events["intelevent_cleardebris"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(3)}, {HW2_LocationCardEvent("$43006", 6)}, {HW2_Wait(3)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43020", 8)}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(3)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(1)", ""}, {"Camera_Interpolate('here', 'Camera_Longview', 2)", ""}, HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43021", 8)}, {{"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Foundry')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43022", 8)}, {HW2_Wait(1)}, {{"EventPointer_Remove(g_pointer_default_1)", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43024", 8)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43025", 8), {"ping_chunk_1_id = Ping_AddSobGroup(ping_chunk_1, 'anomaly', 'Chunk_1')", ""}, {"ping_chunk_2_id = Ping_AddSobGroup(ping_chunk_2, 'anomaly', 'Chunk_2')", ""}, {"ping_chunk_3_id = Ping_AddSobGroup(ping_chunk_3, 'anomaly', 'Chunk_3')", ""}, {"ping_chunk_4_id = Ping_AddSobGroup(ping_chunk_4, 'anomaly', 'Chunk_4')", ""}, {"ping_chunk_5_id = Ping_AddSobGroup(ping_chunk_5, 'anomaly', 'Chunk_5')", ""}, {"ping_chunk_6_id = Ping_AddSobGroup(ping_chunk_6, 'anomaly', 'Chunk_6')", ""}, {"ping_chunk_7_id = Ping_AddSobGroup(ping_chunk_7, 'anomaly', 'Chunk_7')", ""},}, {{"Sensors_Toggle(0)", ""}, {"Sensors_EnableCameraZoom(0)", ""}, {"Camera_Interpolate('here', 'Camera_EndOpening', 2)", ""}, HW2_Wait(3)}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_Wait(0.3)}, {{"Universe_EnableSkip(0)", ""}, HW2_Letterbox(0), HW2_Wait(3), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""}, {"obj_prim_investigate_id = Objective_Add(obj_prim_investigate , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_investigate_id, '$43132')", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Camera_UsePanning(1)", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6429')", ""},},}
Events["intelevent_probe"] = {{HW2_Wait(1), {"EventPlaying = 1", ""},}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""}, HW2_Pause(1), {"FOW_RevealGroup('Command', 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43030", 8)}, {{"Camera_Interpolate('here', 'Camera_Probe_Long', 3)", ""}, {"SobGroup_Move(1, 'Command', 'probe_dest')", ""}, {"SobGroup_SetSpeed('Command', 0.5)", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Command')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43031", 8)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43032", 8), {"ping_probe_id = Ping_AddSobGroup(ping_probe, 'anomaly', 'Command')", ""}, {"Ping_AddDescription(ping_probe_id, 0, '$43124')", ""},}, {{"EventPointer_Remove(g_pointer_default_2)", ""}, HW2_Wait(1)}, {HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(2), {"Sensors_Toggle(0)", ""}, {"Sensors_EnableCameraZoom(1)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""},}, {{"EventPlaying = 0", ""},},}
Events["intelevent_vaygrincoming"] = {{{"FOW_RevealGroup('Carrier_Group_1', 1)", ""}, {"EventPlaying = 1", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""}, {"Sensors_EnableCameraZoom(0)", ""}, HW2_Letterbox(1), HW2_Wait(3)}, {{"Sensors_Toggle(1)", ""}, {"Camera_Interpolate('here', 'Camera_Carrier_Entry', 2)", ""}, {"Sound_MusicPlayType('data:sound/music/staging/STAGING_01', MUS_Staging)", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43045", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43046", 8)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43047", 8)}, {{"Sensors_Toggle(0)", ""}, HW2_Wait(0.3)}, {HW2_Letterbox(0), HW2_Wait(2), {"Sensors_EnableCameraZoom(1)", ""}, {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {{"EventPlaying = 0", ""},},}
Events["intelevent_radiationdamage"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), HW2_Wait(2), HW2_Pause(1), {"EventPlaying = 1", ""},}, {{"Sensors_Toggle(1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43049", 8)}, {HW2_Wait(1)}, {{"Camera_Interpolate('here', 'Camera_All_Hulks', 2)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43052", 8), {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Chunk_1')", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Chunk_2')", ""}, {"g_pointer_default_3 = HW2_CreateEventPointerSobGroup('Chunk_3')", ""}, {"g_pointer_default_4 = HW2_CreateEventPointerSobGroup('Chunk_4')", ""}, {"g_pointer_default_5 = HW2_CreateEventPointerSobGroup('Chunk_5')", ""}, {"g_pointer_default_6 = HW2_CreateEventPointerSobGroup('Chunk_6')", ""}, {"g_pointer_default_7 = HW2_CreateEventPointerSobGroup('Chunk_7')", ""},}, {HW2_Wait(4)}, {{"EventPointer_Remove(g_pointer_default_1)", ""}, {"EventPointer_Remove(g_pointer_default_2)", ""}, {"EventPointer_Remove(g_pointer_default_3)", ""}, {"EventPointer_Remove(g_pointer_default_4)", ""}, {"EventPointer_Remove(g_pointer_default_5)", ""}, {"EventPointer_Remove(g_pointer_default_6)", ""}, {"EventPointer_Remove(g_pointer_default_7)", ""}, {"Rule_Add('Rule_End_Intel')", ""},},}
Events["intelevent_radiationdamage_end_without_mover"] = {{HW2_Pause(0), HW2_Letterbox(0), {"Sensors_Toggle(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {HW2_Wait(10)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_radiationdamage_end_with_mover"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43061", 8)}, {HW2_Pause(0), HW2_Letterbox(0), {"Sensors_Toggle(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {HW2_Wait(10)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_chunksscouted"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), HW2_Wait(2), HW2_Pause(1), {"Universe_EnableSkip(1)", ""}, {"EventPlaying = 1", ""},}, {{"Sensors_Toggle(0)", ""}, {"Sensors_EnableCameraZoom(0)", ""}, {"FOW_RevealGroup('Mover_'..g_mover_investigated, 1)", ""}, {"FOW_ForceUpdate()", ""}, {"Camera_FocusSobGroupWithBuffer('Mover_'..g_mover_investigated, 3000, 100, 2)", ""}, HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(1)", ""}, {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Mover_'..g_mover_investigated)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43053", 8)}, {{"EventPointer_Remove(g_pointer_default_1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43055", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43056", 8), {"UI_FlashButton('NewTaskbar', 'btnBuild', -1)", ""}, {"g_chunk_investigated = 1", ""}, {"Rule_Add('Rule_monitorBuildBtn')", ""}, {"Rule_Add('Rule_Movers_Built')", ""}, {"Player_UnrestrictBuildOption(0, 'MoverControl')", ""}, {"Rule_AddInterval('Rule_Probe_Launch', g_probe_fire)", ""}, {"obj_prim_buildsubsyst_id = Objective_Add(obj_prim_buildsubsyst , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_buildsubsyst_id, '$43130')", ""},}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, HW2_Wait(3), {"Movers_Agressive()", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_moversundercontrol"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"EventPlaying = 1", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43060", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43057", 8)}, {{"Ping_AddDescription(ping_chunk_1_id, 0, '$43120')", ""}, {"Ping_AddDescription(ping_chunk_2_id, 0, '$43120')", ""}, {"Ping_AddDescription(ping_chunk_3_id, 0, '$43120')", ""}, {"Ping_AddDescription(ping_chunk_4_id, 0, '$43120')", ""}, {"Ping_AddDescription(ping_chunk_5_id, 0, '$43120')", ""}, {"Ping_AddDescription(ping_chunk_6_id, 0, '$43120')", ""}, {"Ping_AddDescription(ping_chunk_7_id, 0, '$43120')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43051", 8)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"obj_prim_gettohanger_id = Objective_Add(obj_prim_gettohanger , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_gettohanger_id, '$43131')", ""}, {"Objective_AddDescription(obj_prim_gettohanger_id, '$43135')", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6430')", ""},}, {HW2_Wait(15)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_destroyvaygr"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"EventPlaying = 1", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43090", 10)}, {{"obj_prim_destroy_vaygr_id = Objective_Add(obj_prim_destroy_vaygr , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroy_vaygr_id, '$43140')", ""}, {"FOW_RevealGroup('Player_Ships1', 1)", ""}, {"FOW_RevealGroup('Player_Ships3', 1)", ""},}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {HW2_Wait(15)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_probeaway"] = {{{"EventPlaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43035", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43036", 8)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {HW2_Wait(15)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_probecaught"] = {{{"EventPlaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43040", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43041", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43042", 8)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {HW2_Wait(15)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_destroyfirstdebris"] = {{{"EventPlaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43065", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43066", 8)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},}, {HW2_Wait(15)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_destroythirddebris"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43065", 8)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_clearedradiation"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Sound_MusicPlayType('data:sound/music/ambient/AMB_07', MUS_Ambient)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43075", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43076", 8)}, {HW2_Wait(5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Rule_Add('Rule_Post_Chunks')", ""},},}
Events["intelevent_lets_go"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$43080", 8)}, {HW2_Wait(1)}, {{"Universe_EnableSkip(1)", ""}, {"Sensors_Toggle(0)", ""}, HW2_Letterbox(1), HW2_Wait(2)}, {{"Camera_FocusSobGroupWithBuffer(Players_Mothership, 2000, 2000, 2)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$43081", 8)}, {HW2_Fade(1), HW2_Wait(2)}, {{"Player_InstantlyGatherAllResources(0)", ""}, {"Player_InstantDockAndParade(0, Players_Mothership, 0)", "", 0}, HW2_Wait(2)}, {HW2_Fade(0), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43082", 8)}, {{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')", ""},}, {HW2_Wait(10)}, {HW2_Fade(1), HW2_Wait(1)}, {{"Player_InstantlyGatherAllResources(0)", ""}, HW2_Wait(1)}, {{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {{"setMissionComplete(1)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$44113", 4)}, {{"setMissionComplete(0)", ""},},}
