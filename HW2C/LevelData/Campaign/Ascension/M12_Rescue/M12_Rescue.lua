-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
obj_prim_destroyvaygr = "$45500"
obj_prim_destroyvaygr_id = 0
obj_prim_rescuesoban = "$45501"
obj_prim_rescuesoban_id = 0
ping_commandstation = "$45800"
ping_commandstation_id = 0
ping_makaan = "$45801"
ping_makaan_id = 0
ping_soban = "$45802"
ping_soban_id = 0
g_pointer_default = 0
g_eventplaying = 0
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_save_id = 0

function Enable_ResearchOptions()
	Player_UnrestrictResearchOption(0, "BattlecruiserHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "BattlecruiserMAXSPEEDUpgrade2")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function testit()
	CPU_RemoveSobGroup(1, "Vaygr_MakaanMothership")
	FOW_RevealGroup("Vaygr_MakaanMothership", 1)
	Event_Start("intelevent_makaanarrives")
end

function makaanleaves()
	SobGroup_TakeDamage("Vaygr_MakaanMothership", 0.9)
	SobGroup_FillBattleScar("Vaygr_MakaanMothership", "Plasma_Bomb/Plasma_Bomb")
	Rule_Remove("makaanleaves")
end

function sobansaved()
	SobGroup_SwitchOwner("Command_Station", 0)
end

function OnInit()
	Rule_Add("Rule_Init")
end

function GrantAIResearch()
	for i = 1, 2 do
	Player_GrantResearchOption(i, "CorvetteTech")
	Player_GrantResearchOption(i, "FrigateTech")
	Player_GrantResearchOption(i, "LanceBeams")
	Player_GrantResearchOption(i, "PlasmaBombs")
	Player_GrantResearchOption(i, "CorvetteLaser")
	Player_GrantResearchOption(i, "FrigateAssault")
	Player_GrantResearchOption(i, "BattlecruiserIonWeapons")
	Player_GrantResearchOption(i, "DestroyerGuns")
	Player_GrantResearchOption(i, "MothershipBUILDSPEEDUpgrade1")
	Player_GrantResearchOption(i, "SuperCapHealthUpgrade1")
	Player_GrantResearchOption(i, "SuperCapHealthUpgrade2")
	Player_GrantResearchOption(i, "SuperCapSpeedUpgrade1")
	Player_GrantResearchOption(i, "SuperCapSpeedUpgrade2")
	Player_GrantResearchOption(i, "ShipyardBUILDSPEEDUpgrade1")
	Player_GrantResearchOption(i, "CorvetteHealthUpgrade1")
	Player_GrantResearchOption(i, "CorvetteHealthUpgrade2")
	Player_GrantResearchOption(i, "FrigateHealthUpgrade1")
	Player_GrantResearchOption(i, "FrigateHealthUpgrade2")
	end
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Init()
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	GrantAIResearch();
	CPU_RemoveSobGroup(1, "Vgr_AssaultGroup_1")
	CPU_RemoveSobGroup(1, "Vgr_AssaultGroup_2")
	CPU_RemoveSobGroup(1, "Vgr_AssaultGroup_3")
	CPU_RemoveSobGroup(1, "Vgr_CommStationDefence")
	SobGroup_SetAsDeployed("All_Platforms")
	CPU_RemoveSobGroup(1, "Vgr_Shipyard_1")
	CPU_RemoveSobGroup(1, "Vgr_Shipyard_2")
	CPU_RemoveSobGroup(2, "Vgr_Shipyard_3")
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	g_nisstate = NISGetPlayingHandle("nis/NIS12")
	NISDisableInterface(1)
	Rule_Remove("Rule_Init")
	Rule_Add("Rule_NISComplete")
	Sound_EnableAllSpeech(0)
end

function Rule_NISComplete()
	if (NISComplete(g_nisstate) == 1) then
	HW2_SetResearchLevel(12)
	SobGroup_SetSwitchOwnerFlag("Command_Station", 0)
	Player_SetRU(1, 3000)
	Player_SetRU(2, 3000)
	HW2_InitializeBuilder("Vgr_Shipyard_1", "tempSobGroup")
	HW2_InitializeBuilder("Vgr_Shipyard_2", "tempSobGroup")
	HW2_InitializeBuilder("Vgr_Shipyard_3", "tempSobGroup")
	CPU_SetAttackTargetPriority(2, TT_MotherShip, 50)
	CPU_AddDefendTarget(2, "vol_CommStationDefend", 25)
	SobGroup_DockSobGroup("Vaygr_Carrier", "Command_Station")
	Player_SetPlayerName(0, "$45790")
	Player_SetPlayerName(1, "$45793")
	Player_SetPlayerName(2, "$45791")
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	Player_SetDefaultShipTactic(2, AggressiveTactics)
	Sound_SpeechSubtitlePath("speech:missions/m_12/")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_12", MUS_Ambient)
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	Players_Dreadnaught = "Players_Dreadnaught"
	SobGroup_Create(Players_Dreadnaught)
	SobGroup_FillShipsByType(Players_Dreadnaught, "Player_Ships0", "Hgn_Dreadnaught")
	SobGroup_SetDisplayedRestrictedHardpoint("Players_Mothership", 0)
	FOW_RevealGroup("Vaygr_Carrier", 1)
	Event_Start("intelevent_savesoban")
	Sound_EnableAllSpeech(0)
	Rule_Add("Rule_OpeningIEComplete")
	Rule_AddInterval("Rule_PlayStaging", 120)
	Rule_AddInterval("Rule_MakaanArrives", 600)
	Rule_AddInterval("Rule_DockMarines", 25)
	Rule_Add("Rule_SobanSaved")
	Rule_Add("Rule_PlayerLose")
	Rule_Add("Rule_PlayerWins")
	Rule_Add("Rule_CommStationDestroyed")
	Rule_Add("Rule_DontDestroyCommStation")
	Rule_Remove("Rule_NISComplete")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameMissionStart", 1)
	end
end

function Rule_SaveTheGameMissionStart()
	Rule_Remove("Rule_SaveTheGameMissionStart")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6446")
end

function Rule_OpeningIEComplete()
	if (Event_IsDone("intelevent_savesoban") == 1) then
	Enable_ResearchOptions();
	Camera_SetLetterboxStateNoUI(0, 0)
	FOW_RevealGroup("Vaygr_Carrier", 0)
	Rule_Remove("Rule_OpeningIEComplete")
	end
end

function Rule_PlayStaging()
	Sound_MusicPlayType("data:sound/music/battle/BATTLE_06", MUS_Battle)
	Rule_Remove("Rule_PlayStaging")
end

function Rule_MakaanArrives()
	print("makaan arrives")
	SobGroup_Attack(2, "Vgr_AssaultGroup_3", Players_Mothership)
	Event_Start("intelevent_makaanarrives")
	Rule_Remove("Rule_MakaanArrives")
	Rule_Add("Rule_MakaanArrivesNIS")
end

function Rule_MakaanArrivesNIS()
	if (Event_IsDone("intelevent_makaanarrives") == 1) then
	NISLoad("nis/NIS12B")
	Sensors_EnableCameraZoom(0)
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	g_nisState = NISPlay("nis/NIS12B")
	Rule_Add("Rule_PlayEliminateMakaan")
	Rule_Remove("Rule_MakaanArrivesNIS")
	end
end

function Rule_PlayEliminateMakaan()
	if (NISComplete(g_nisState) == 1) then
	Sensors_EnableToggle(1)
	FOW_RevealGroup("Vaygr_MakaanMothership", 1)
	Rule_Add("Rule_VaygrDestroyed")
	Event_Start("intelevent_eliminate_makaan")
	Rule_Add("Rule_SaveAfterEliminateMakaan")
	Rule_Remove("Rule_PlayEliminateMakaan")
	SobGroup_GuardSobGroup("Vgr_AssaultGroup_2", "Vaygr_MakaanMothership")
	Sound_MusicPlayType("data:sound/music/BATTLE/BATTLE_01", MUS_Battle)
	HW2_InitializeBuilder("Vaygr_MakaanMothership", "tempSobGroup")
	end
end

function Rule_SaveAfterEliminateMakaan()
	if (Event_IsDone("intelevent_eliminate_makaan") == 1) then
	Rule_Remove("Rule_SaveAfterEliminateMakaan")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameMakaanArrives", 1)
	end
end

function Rule_SaveTheGameMakaanArrives()
	Rule_Remove("Rule_SaveTheGameMakaanArrives")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6447")
end

function Rule_DockMarines()
	if (Player_FillProximitySobGroup("tempSobGroup", 0, "Command_Station", 10000) == 1 and g_eventplaying == 0) then
	Event_Start("intelevent_marinesrequired")
	Rule_Remove("Rule_DockMarines")
	end
end

function Rule_SaveAfterMarinesRequired()
	if (Event_IsDone("intelevent_marinesrequired") == 1) then
	Rule_Remove("Rule_SaveAfterMarinesRequired")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameMarinesRequired", 1)
	end
end

function Rule_SaveTheGameMarinesRequired()
	Rule_Remove("Rule_SaveTheGameMarinesRequired")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6448")
end

function Rule_DontDestroyCommStation()
	if (SobGroup_HealthPercentage("Command_Station") <= 0.5 and g_eventplaying == 0) then
	Event_Start("speechevent_dontdestroycommstation")
	Rule_Remove("Rule_DontDestroyCommStation")
	end
end

abilityList = {AB_Move, AB_Attack, AB_Guard, AB_Stop, AB_Hyperspace, AB_Retire, AB_Scuttle, AB_Capture}

function Rule_SobanSaved()
	if (SobGroup_OwnedBy("Command_Station") == 0 and g_eventplaying == 0) then
	Event_Start("intelevent_sobanescapes")
	g_talornsship = SobGroup_CreateShip("Command_Station", "Hgn_MarineFrigate_Soban")
	SobGroup_SetTactics(g_talornsship, PassiveTactics)
	SobGroup_SetTeamColours(g_talornsship, {0, 0, 0}, {1, 0, 0}, "DATA:Badges/Soban.tga")
	for j = 1, getn(abilityList) do
	SobGroup_AbilityActivate(g_talornsship, abilityList[j], 0)
	end
	Rule_Add("Rule_EscortSoban")
	Rule_Remove("Rule_SobanSaved")
	Rule_Remove("Rule_CommStationDestroyed")
	Rule_Remove("Rule_DontDestroyCommStation")
	end
end

function Rule_EscortSoban()
	if (Event_IsDone("intelevent_sobanescapes") == 1 and g_eventplaying == 0) then
	Event_Start("intelevent_escortsoban")
	Rule_Add("Rule_SaveAfterSobanSafe")
	Rule_Add("Rule_SobanIsDestroyed")
	Rule_Add("Rule_SobanIsSafe")
	Rule_Remove("Rule_EscortSoban")
	end
end

function Rule_SaveAfterSobanSafe()
	if (Event_IsDone("intelevent_escortsoban") == 1) then
	Rule_Remove("Rule_SaveAfterSobanSafe")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameEscortSoban", 1)
	end
end

function Rule_SaveTheGameEscortSoban()
	Rule_Remove("Rule_SaveTheGameEscortSoban")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6449")
end

function Rule_SobanIsDestroyed()
	if (SobGroup_Empty(g_talornsship) == 1 and g_eventplaying == 0) then
	Objective_SetState(obj_prim_rescuesoban_id, OS_Failed)
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_SobanIsDestroyed")
	end
end

function Rule_SobanIsSafe()
	if (SobGroup_IsDockedSobGroup(g_talornsship, Players_Mothership) == 1 and g_eventplaying == 0) then
	Objective_SetState(obj_prim_rescuesoban_id, OS_Complete)
	Event_Start("intelevent_sobanissafe")
	Rule_Add("Rule_SaveAfterSobanDock")
	local abilityList = {AB_Move, AB_Attack, AB_Guard, AB_Stop, AB_Hyperspace, AB_Retire, AB_Scuttle}
	for j = 1, 7 do
	SobGroup_AbilityActivate(g_talornsship, abilityList[j], 1)
	end
	Rule_Remove("Rule_SobanIsSafe")
	end
end

function Rule_SaveAfterSobanDock()
	if (Event_IsDone("intelevent_sobanissafe") == 1) then
	Rule_Remove("Rule_SaveAfterSobanDock")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameSobanSafe", 1)
	end
end

function Rule_SaveTheGameSobanSafe()
	Rule_Remove("Rule_SaveTheGameSobanSafe")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6450")
end

function Rule_VaygrDestroyed()
	if (SobGroup_HealthPercentage("Vaygr_MakaanMothership") <= 0.2 and g_eventplaying == 0) then
	Objective_SetState(obj_prim_destroyvaygr_id, OS_Complete)
	FOW_RevealGroup("Vaygr_MakaanMothership", 1)
	Ping_Remove(ping_makaan_id)
	SobGroup_SetInvulnerability("Vaygr_MakaanMothership", 1)
	Event_Start("intelevent_makaanisfleeing")
	SobGroup_EnterHyperSpaceOffMap("Vaygr_MakaanMothership")
	Rule_Remove("Rule_VaygrDestroyed")
	end
end

function Rule_PlayerWins()
	if (Objective_GetState(obj_prim_destroyvaygr_id) == OS_Complete) then
	if (Objective_GetState(obj_prim_rescuesoban_id) == OS_Complete and g_eventplaying == 0) then
	Event_Start("intelevent_followmakaan")
	Rule_Remove("Rule_PlayerWins")
	end
	end
end

function Rule_PlayerLose()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	if (SobGroup_Empty(Players_Dreadnaught) == 1) then
	end
	Objective_SetState(obj_prim_destroyvaygr_id, OS_Failed)
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_PlayerLose")
	end
end

function Rule_CommStationDestroyed()
	if (SobGroup_Empty("Command_Station") == 1 and g_eventplaying == 0) then
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_CommStationDestroyed")
	end
end

Events = {}
Events["intelevent_savesoban"] = {{{"Sound_EnableAllSpeech(1)", ""}, {"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_LocationCardEvent("$45520", 5)}, {HW2_Wait(6)}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45530", 10)}, {HW2_Wait(4)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(1)", ""}, HW2_Wait(2), {"Camera_Interpolate('here', 'camera_openingSMShot', 2)", ""},}, {HW2_Wait(1)}, {{"g_pointer_default = HW2_CreateEventPointerSobGroup('Vaygr_Carrier')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45532", 10)}, {HW2_Wait(1)}, {{"EventPointer_Remove(g_pointer_default)", ""}, {"g_pointer_default = HW2_CreateEventPointerSobGroup('Command_Station')", ""}, {"Camera_Interpolate('here', 'camera_openingFocusOnStation', 2)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45533", 10)}, {HW2_Wait(1)}, {{"obj_prim_rescuesoban_id = Objective_Add(obj_prim_rescuesoban, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_rescuesoban_id, '$45855')", ""}, {"Objective_AddDescription(obj_prim_rescuesoban_id, '$45856')", ""}, {"ping_commandstation_id = HW2_PingCreateWithLabel(ping_commandstation, 'Command_Station')", ""}, {"Ping_AddDescription(ping_commandstation_id, 0, '$45900')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45534", 10)}, {{"Camera_Interpolate('here', 'camera_openingFocusOnFleet', 2)", ""}, HW2_Wait(2)}, {{"EventPointer_Remove(g_pointer_default)", ""}, {"Sensors_Toggle(0)", ""}, HW2_Wait(0.5)}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_Letterbox(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_makaanarrives"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45540", 8)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45541", 5)}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45542", 8), {"Sound_MusicPlayType('data:sound/music/battle/battle_04', MUS_Battle)", ""},}, {{"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_eliminate_makaan"] = {{{"Universe_EnableSkip(1)", ""}, {"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""},}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45547", 8), {"obj_prim_destroyvaygr_id = Objective_Add(obj_prim_destroyvaygr, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroyvaygr_id, '$45850')", ""}, {"Objective_AddDescription(obj_prim_destroyvaygr_id, '$45851')", ""}, {"ping_makaan_id = HW2_PingCreateWithLabel(ping_makaan, 'Vaygr_MakaanMothership')", ""},}, {HW2_Letterbox(0), HW2_Wait(2), {"Sensors_Toggle(0)", ""}, {"Sensors_EnableCameraZoom(1)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_marinesrequired"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45550", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45551", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_sobanescapes"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_Interpolate('here', 'camera_focusOnSobanEscape', 2)", ""}, HW2_Wait(2)}, {{"Camera_FocusSobGroupWithBuffer(g_talornsship, 800, 100, 2) ", ""}, HW2_SubTitleEvent(Actor_Talorn, "$45560", 8)}, {HW2_SubTitleEvent(Actor_Talorn, "$45561", 5), {"SobGroup_TakeDamage('Command_Station', 1)", ""},}, {HW2_Wait(2)}, {{"SobGroup_SetTactics (g_talornsship, PassiveTactics)", ""}, {"SobGroup_DockSobGroup(g_talornsship, Players_Mothership)", ""}, HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(1)", ""}, HW2_Letterbox(0), HW2_Wait(2)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_escortsoban"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"SobGroup_SetTactics (g_talornsship, PassiveTactics)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45570", 8), {"ping_soban_id = HW2_PingCreateWithLabel(ping_soban, g_talornsship)", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45571", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_sobanissafe"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45580", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45581", 8)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_followmakaan"] = {{{"g_eventplaying = 1", ""}, {"Universe_AllowPlayerOrders(0)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(3), {"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45610", 6)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45611", 6)}, {HW2_Wait(2), {"Universe_Fade(1, 1.5)", ""},}, {{"Player_InstantlyGatherAllResources(0)", ""}, {"Subtitle_Message('$3652', 2)", ""}, {"Player_InstantDockAndParade(0, Players_Mothership, 0)", ""}, {"SobGroup_Stop(0, 'Player_Ships0')", ""}, {"Camera_FocusSobGroupWithBuffer(Players_Mothership, 4000, 100, 0)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45612", 6)}, {{"Universe_Fade(0, 1.5)", ""}, HW2_Wait(2)}, {HW2_Wait(1.5)}, {{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')", ""},}, {HW2_Wait(15)}, {{"Universe_Fade(1, 2)", ""}, HW2_Wait(3)}, {HW2_LocationCardEvent("$45522", 4)}, {HW2_Wait(2)}, {{"setMissionComplete(1)", ""}, {"g_eventplaying = 0", ""},},}
Events["intelevent_makaanisfleeing"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(3)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_FocusSobGroupWithBuffer('Vaygr_MakaanMothership', 2000, 2000, 2)", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45590", 6)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45591", 6)}, {HW2_Letterbox(0), HW2_Wait(2), {"Sensors_EnableCameraZoom(1)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""},}, {{"g_eventplaying = 0", ""},},}
Events["speechevent_dontdestroycommstation"] = {{{"g_eventplaying = 1", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45600", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45601", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"g_eventplaying = 0", ""},},}
Events["speechevent_playerloses"] = {{{"g_eventplaying = 1", ""}, HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$45521", 4)}, {{"setMissionComplete(0)", ""}, {"g_eventplaying = 0", ""},},}
