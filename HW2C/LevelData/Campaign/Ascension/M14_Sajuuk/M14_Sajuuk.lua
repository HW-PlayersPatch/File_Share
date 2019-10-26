-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
ShipToParadeRoundTypeName = "Hgn_MotherShip"
obj_prim_destroymakaan = "$46500"
obj_prim_destroymakaan_id = 0
obj_sec_destroyShipyard = "$46501"
obj_sec_destroyShipyard_id = 0
obj_prim_protectMothership = "$46502"
obj_prim_protectMothership_id = 0
ping_makaan = "$46900"
ping_makaan_id = 0
ping_shipyard = "$46901"
ping_shipyard_id = 0
pointer_makaan_id = 0
pointer_shipyard_id = 0
EventPlaying = 0
NIS14BOver = 0
letMakaanDie = 0
startMakaanFinalWordsONCE = 0
g_now_time = Universe_GameTime()
g_save_id = 0
g_attack_1 = 50
g_attack_2 = 50
g_attack_4 = 150
g_attack_5 = 200
g_shipyard_timer = 400
g_carrier_timer = 200
g_makaan_desperate = 600
PlayerHasDiscoveredShipyard = 0
PlayerHasDiscoveredCarrier = 0
initialAttackDestroyed = 0
shipyardDestroyed = 0
RemoveKamikazeRule = 0
KillMakaan = 0

function OnInit()
	SobGroup_Despawn("HSCore")
	SobGroup_AbilityActivate("Vgr_Makaan", AB_Move, 0)
	SobGroup_AbilityActivate("Vgr_Makaan", AB_Hyperspace, 0)
	SobGroup_SetTeamColours("Vgr_Makaan", {0.9, 0.9, 0.9}, {0.1, 0.1, 0.1}, "DATA:Badges/Vaygr.tga")
	Rule_Add("Rule_Init_1")
end

function Rule_Init_1()
	Rule_Add("Rule_DisableSpeech")
	Rule_Add("Rule_setAlliances")
	Sound_SpeechSubtitlePath("speech:missions/m_14/")
	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS14A")
	NISDisableInterface(1)
	NISOver = 0
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_watchForNISDoneFromTimer", 55)
	Rule_Add("Rule_watchForNISDone")
	Rule_Remove("Rule_PlayNIS")
	Rule_Remove("Rule_Init_1")
end

function Rule_DisableSpeech()
	Sound_EnableAllSpeech(0)
	Rule_Remove("Rule_DisableSpeech")
end

function Rule_setAlliances()
	if (NISComplete(g_currentNISPlaying_id) == 1) then
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SetAlliance(0, 3)
	SetAlliance(3, 0)
	FOW_RevealGroup("Sajuuk", 1)
	FOW_RevealGroup("Vgr_Group_1", 1)
	Rule_Remove("Rule_setAlliances")
	end
end

function Rule_watchForNISDoneFromTimer()
	if (NISOver == 0) then
	NISOver = 1
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Rule_AddInterval("Rule_NIS14AHasFinished", 31)
	Rule_AddInterval("Rule_Init", 32)
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	Rule_Remove("Rule_watchForNISDone")
	elseif (NISOver == 1) then
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	Rule_Remove("Rule_watchForNISDone")
	end
end

function Rule_watchForNISDone()
	if (NISOver == 0 and NISComplete(g_currentNISPlaying_id) == 1) then
	NISOver = 1
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Rule_AddInterval("Rule_Init", 1)
	Rule_AddInterval("Rule_NIS14AHasFinished", 5)
	Rule_Remove("Rule_watchForNISDone")
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	elseif (NISOver == 1) then
	Rule_Remove("Rule_watchForNISDone")
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	end
end

function Rule_watchForLastNISDone()
	if (NIS14BOver == 0 and NISComplete(n_currentNISPlaying_id) == 1) then
	NIS14BOver = 1
	Event_Start("intelevent_endLevel")
	Rule_Remove("Rule_watchForLastNISDone")
	end
end

function Rule_watchForLastNISDoneFromTimer()
	if (NIS14BOver == 0) then
	NIS14BOver = 1
	setMissionComplete(1)
	Rule_Remove("Rule_watchForLastNISDoneFromTimer")
	elseif (NIS14BOver == 1) then
	NIS14BOver = 1
	Rule_Remove("Rule_watchForLastNISDoneFromTimer")
	end
end

function Rule_Init()
	Player_SetPlayerName(0, "$46801")
	Player_SetPlayerName(1, "$46802")
	Player_SetPlayerName(2, "$46802")
	Player_SetPlayerName(3, "$46803")
	HW2_SetResearchLevel(14)
	SobGroup_CreateSubSystem("Vgr_Makaan", "FighterProduction")
	SobGroup_CreateSubSystem("Vgr_Makaan", "CorvetteProduction")
	SobGroup_CreateSubSystem("Vgr_Makaan", "FrigateProduction")
	SobGroup_CreateSubSystem("Vgr_Makaan", "CapShipProduction")
	SobGroup_CreateSubSystem("Vgr_Makaan", "PlatformProduction")
	SobGroup_CreateSubSystem("Vgr_Makaan", "Research")
	SobGroup_CreateSubSystem("Vgr_Makaan", "AdvancedArray")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "FighterProduction")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "CorvetteProduction")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "FrigateProduction")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "CapShipProduction")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "PlatformProduction")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "Research")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "Hyperspace")
	SobGroup_CreateSubSystem("Vgr_Sob_Shipyard", "AdvancedArray")
	Player_GrantAllResearch(1)
	Player_GrantAllResearch(2)
	CPU_Enable(1, 1)
	CPU_RemoveSobGroup(1, "Vgr_Group_1")
	CPU_RemoveSobGroup(1, "Vgr_Group_2")
	SobGroup_FormStrikeGroup("Vgr_Group_1", "wall")
	Rule_AddInterval("Rule_StartInitialAttack", 5)
	SobGroup_FormStrikeGroup("Vgr_Group_2", "wall")
	Rule_AddInterval("Rule_StartInitialAttack", 5)
	DefendMakaanCPU1 = CPU_AddDefendSobGroup(1, "Vgr_Makaan", 20000)
	CPU_SetDefendTargetRadius(1, DefendMakaanCPU1, 8000)
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	Player_SetDefaultShipTactic(2, AggressiveTactics)
	g_now_time = Universe_GameTime()
	SobGroup_SetInvulnerability("Sajuuk", 1)
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	Player_FillShipsByType(Players_Mothership, 0, "Hgn_Mothership")
	Players_Dreadnaught = "Players_Dreadnaught"
	SobGroup_Create(Players_Dreadnaught)
	Player_FillShipsByType(Players_Dreadnaught, 0, "Hgn_Dreadnaught")
	SobGroup_SetDisplayedRestrictedHardpoint(Players_Mothership, 0)
	Rule_AddInterval("Rule_CheckForShipsNearShipyard", 5)
	Rule_Add("Rule_checkObjectives")
	Rule_AddInterval("Rule_makaanKamikazeDefense", 5)
	SobGroup_Create("KamikazeTargets")
	SobGroup_Create("KamikazeAttackers")
	Rule_AddInterval("Rule_PlayerLoses", 3)
	Rule_AddInterval("Rule_makaanDamaged", 3)
	Rule_AddInterval("Rule_makaanCriticallyDamaged", 3)
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	HW2_ReactiveInfo()
	Rule_Remove("Rule_Init")
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_testDespawn()
	SobGroup_Despawn("Player_Ships0")
	Rule_Remove("Rule_testDespawn")
end

function Rule_testHealth()
	makaanHealth = SobGroup_HealthPercentage("Vgr_Makaan")
	print("Makaan's health"..makaanHealth)
end

function Rule_StartInitialAttack()
	SobGroup_AttackPlayer("Vgr_Group_1", 0)
	SobGroup_AttackPlayer("Vgr_Group_2", 0)
	Rule_Remove("Rule_StartInitialAttack")
end

function Rule_keepMakaanAlive()
	if (SobGroup_Empty("Vgr_Makaan") == 1) then
	Event_Start("intelevent_makaanHasBeenDefeated")
	Rule_Remove("Rule_keepMakaanAlive")
	end
	if (SobGroup_HealthPercentage("Vgr_Makaan") < 0.05 and KillMakaan == 0) then
	SobGroup_SetHealth("Vgr_Makaan", 0.05)
	if (startMakaanFinalWordsONCE == 0) then
	Rule_Add("Rule_intelevent_makaansLastWords")
	startMakaanFinalWordsONCE = 1
	end
	elseif (KillMakaan == 1) then
	SobGroup_TakeDamage("Vgr_Makaan", 0.01)
	end
end

function Rule_intelevent_makaansLastWords()
	if (EventPlaying == 0) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_makaansLastWords")
	Rule_Remove("Rule_intelevent_makaansLastWords")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	Event_Start("intelevent_makaansLastWords")
	Rule_Remove("Rule_intelevent_makaansLastWords")
	end
	end
end

function Rule_NIS14AHasFinished()
	Sound_EnterIntelEvent()
	Event_Start("intelevent_eliminatemakaan")
	Rule_Remove("Rule_NIS14AHasFinished")
	Rule_Add("Rule_IntelEventEliminateMakaanDone")
end

function Rule_IntelEventEliminateMakaanDone()
	if (Event_IsDone("intelevent_eliminatemakaan") == 1) then
	g_now_time = Universe_GameTime()
	Rule_AddInterval("Rule_Shipyard_Warning", 3)
	Rule_Remove("Rule_IntelEventEliminateMakaanDone")
	end
end

function Rule_Shipyard_Warning()
	if (EventPlaying == 0 and PlayerHasDiscoveredShipyard == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_shipyardDiscovered")
	Rule_Add("Rule_Shipyard_Destroyed")
	Rule_Remove("Rule_Shipyard_Warning")
	end
end

function Rule_Shipyard_Destroyed()
	if (EventPlaying == 0 and shipyardDestroyed == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_shipyardDestroyed")
	Rule_Remove("Rule_Shipyard_Destroyed")
	end
end

function Rule_Carrier_Warning()
	if (Universe_GameTime() >= g_carrier_timer) then
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_carrierDiscovered")
	Rule_Remove("Rule_Carrier_Warning")
	end
	end
end

function Rule_Desperate_Makaan()
	if (EventPlaying == 0 and initialAttackDestroyed == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_desperateMakaan")
	Rule_Remove("Rule_Desperate_Makaan")
	end
end

function Rule_makaanDamaged()
	if (EventPlaying == 0 and SobGroup_HealthPercentage("Vgr_Makaan") < 0.65) then
	Rule_Remove("Rule_makaanDamaged")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_makaanDamaged")
	CPU_SetDefendTargetRadius(2, DefendMakaanCPU2, 20000)
	DefendMakaanCPU2 = CPU_AddDefendSobGroup(2, "Vgr_Makaan", 99999999.0)
	end
end

function Rule_makaanCriticallyDamaged()
	if (EventPlaying == 0 and SobGroup_HealthPercentage("Vgr_Makaan") < 0.35) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_makaanCriticallyDamaged")
	Rule_Add("Rule_keepMakaanAlive")
	Rule_Remove("Rule_makaanCriticallyDamaged")
	end
end

function Rule_CheckForShipsNearShipyard()
	Player_FillProximitySobGroup("tempSobGroup", 0, "Vgr_Sob_Shipyard", 5000)
	if (SobGroup_Empty("tempSobGroup") == 0) then
	PlayerHasDiscoveredShipyard = 1
	Rule_Remove("Rule_CheckForShipsNearShipyard")
	end
end

function Rule_checkObjectives()
	if (initialAttackDestroyed == 0) then
	if (SobGroup_Empty("Vgr_Group_1") == 1) then
	if (SobGroup_Empty("Vgr_Group_2") == 1) then
	initialAttackDestroyed = 1
	Rule_AddInterval("Rule_Desperate_Makaan", 4)
	Objective_SetState(obj_prim_protectMothership_id, OS_Complete)
	end
	end
	end
	if (shipyardDestroyed == 0) then
	if (SobGroup_Empty("Vgr_Sob_Shipyard") == 1) then
	shipyardDestroyed = 1
	Objective_SetState(obj_sec_destroyShipyard_id, OS_Complete)
	end
	end
	if (shipyardDestroyed == 1 and initialAttackDestroyed == 1) then
	Rule_Remove("Rule_checkObjectives")
	end
end

function Rule_makaanKamikazeDefense()
	if (RemoveKamikazeRule == 1) then
	Rule_Remove("Rule_makaanKamikazeDefense")
	elseif (SobGroup_HealthPercentage("Vgr_Makaan") < 0.75 and SobGroup_UnderAttack("Vgr_Makaan") == 1) then
	print("Makaan is under attack!!")
	SobGroup_GetAttackers("Vgr_Makaan", "AttackingMakaan")
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_AssaultFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Assault Frigates!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_TorpedoFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Torpedo Frigates!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_MarineFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Marine Frigates!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_IonCannonFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Ion Cannon Frigates!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_DefenseFieldFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Defense Field Frigates!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_Destroyer")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Destroyers!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_BattleCruiser")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Battlecruisers!")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingMakaan", "Hgn_IonTurret")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("MakaanKamikazeDefense found some Platforms")
	SobGroup_SobGroupAdd("KamikazeTargets", "tempSobGroup")
	end
	if (SobGroup_Empty("KamikazeTargets") ~= 1) then
	print("MakaanKamikazeDefense creating a squad of suicide bombers")
	KamikazeFreshlyBuilt = SobGroup_CreateShip("Vgr_Makaan", "Vgr_Interceptor")
	Rule_AddInterval("Rule_kamikazeSetup", 5)
	end
	end
end

function Rule_kamikazeSetup()
	SobGroup_SobGroupAdd("KamikazeAttackers", KamikazeFreshlyBuilt)
	SobGroup_Attack(1, "KamikazeAttackers", "KamikazeTargets")
	Rule_AddInterval("Rule_kamikazeIntoTargets", 1)
	Rule_Remove("Rule_kamikazeSetup")
end

function Rule_kamikazeIntoTargets()
	SobGroup_Kamikaze("KamikazeAttackers", "KamikazeTargets")
	Rule_Remove("Rule_kamikazeIntoTargets")
end

function Rule_PlayerLoses()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	Sound_EnterIntelEvent()
	Event_Start("intelevent_mothershipDestroyed")
	Rule_Remove("Rule_PlayerLoses")
	end
end

function Rule_PlayAmbientMusic()
	print("trying to play ambient music!")
	Sound_MusicPlayType("data:sound/music/ambient/amb_14", MUS_Ambient)
	Rule_Remove("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	print("trying to play staging music!")
	Sound_MusicPlayType("data:sound/music/staging/staging_05", MUS_Staging)
	Rule_Remove("Rule_PlayStagingMusic")
end

function Rule_PlayBattleMusic()
	print("trying to play Battle music!")
	Sound_MusicPlayType("data:sound/music/battle/battle_04", MUS_Battle)
	Rule_Remove("Rule_PlayBattleMusic")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

Events = {}
Events["intelevent_eliminatemakaan"] = {{{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6455')", ""},}, {HW2_Wait(2)}, {HW2_LocationCardEvent("$46520", 6)}, {{"Sound_EnableAllSpeech(1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46525", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46526", 3)}, {HW2_Wait(0.5)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(2)}, {HW2_Wait(1)}, {{"Camera_FocusSobGroup('Vgr_Group_1', 1, 3500, 1.5)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$46527", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46528", 3), {"obj_prim_protectMothership_id = Objective_Add(obj_prim_protectMothership , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_protectMothership_id, '$46602')", ""},}, {HW2_Wait(1)}, {{"Universe_EnableSkip(0)", ""}, HW2_Letterbox(0)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_makaansLastWords"] = {{HW2_Letterbox(1)}, {HW2_Wait(3)}, {{"Camera_FocusSobGroup('Vgr_Makaan', 1, 1500, 1)", ""}, {"RemoveKamikazeRule = 1", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_Makaan, "$46570", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Makaan, "$46571", 4)}, {HW2_Wait(1)}, {{"KillMakaan = 1", ""},},}
Events["intelevent_makaanHasBeenDefeated"] = {{{"SobGroup_Spawn('HSCore', 'HSCoreSpawnSphere')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$46572", 4), {"Objective_SetState(obj_prim_destroymakaan_id, OS_Complete)", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46573", 4), {"Camera_FocusSobGroup('HSCore', 1, 300, 1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46574", 4)}, {HW2_Wait(0.5)}, {{"Universe_Fade(1, 3)", ""},}, {HW2_Wait(3)}, {{"Rule_Add ('Rule_DisableSpeech')", ""}, {"Rule_Remove ('Rule_PlayerLoses')", ""}, {"Player_InstantDockAndParade(0, 'Sajuuk', 0)", ""}, {"Player_InstantlyGatherAllResources(0)", ""}, {"SobGroup_Despawn('Player_Ships0')", ""}, {"SobGroup_Despawn('Player_Ships1')", ""}, {"SobGroup_Despawn('Player_Ships3')", ""}, {"SobGroup_SwitchOwner(Players_Mothership, 3)", ""}, {"NISLoad('nis/NIS14B')", ""},}, {HW2_Wait(3)}, {{"n_currentNISPlaying_id = NISPlay('nis/NIS14B')", ""}, {"Rule_Add ('Rule_watchForLastNISDone')", ""},},}
Events["intelevent_mothershipDestroyed"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$46521", 4)}, {{"setMissionComplete(0)", ""},},}
Events["intelevent_endLevel"] = {{{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {HW2_Wait(0.5)}, {HW2_LocationCardEvent("$40022", 2), {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},}, {HW2_Wait(0.5)}, {{"setMissionComplete(1)", ""},},}
Events["intelevent_desperateMakaan"] = {{HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""},}, {{"Camera_Interpolate('here', 'camera3', 1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46530", 10), {"pointer_makaan_id = HW2_CreateEventPointerSobGroup('Vgr_Makaan')", ""},}, {HW2_Wait(0.5)}, {{"ping_makaan_id = HW2_PingCreateWithLabel(ping_makaan, 'Vgr_Makaan')", ""}, {"Ping_AddDescription(ping_makaan_id, 0, '$46500')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$46531", 10), {"obj_prim_destroymakaan_id = Objective_Add(obj_prim_destroymakaan , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroymakaan_id, '$46600')", ""},}, {{"EventPointer_Remove(pointer_makaan_id)", ""}, HW2_Wait(2)}, {HW2_Letterbox(0), {"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, {"Universe_EnableSkip(0)", ""}, HW2_Pause(0)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6456')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_makaanDamaged"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46533", 10)}, {HW2_Wait(1)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6457')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_makaanCriticallyDamaged"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46535", 10)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46536", 10)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_makaanRepairing"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46540", 10)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46541", 10)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_shipyardDiscovered"] = {{HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46545", 10), {"pointer_shipyard_id = HW2_CreateEventPointerSobGroup('Vgr_Sob_Shipyard')", ""},}, {HW2_Wait(0.5)}, {{"ping_shipyard_id = HW2_PingCreateWithLabel(ping_shipyard, 'Vgr_Sob_Shipyard')", ""}, {"Ping_AddDescription(ping_shipyard_id, 0, '$46501')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$46546", 10), {"obj_sec_destroyShipyard_id = Objective_Add(obj_sec_destroyShipyard , OT_Primary)", ""}, {"Objective_AddDescription(obj_sec_destroyShipyard_id, '$46601')", ""},}, {{"EventPointer_Remove(pointer_shipyard_id)", ""}, HW2_Wait(2)}, {HW2_Letterbox(0), {"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, {"Universe_EnableSkip(0)", ""}, HW2_Pause(0)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6458')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_shipyardDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46547", 5)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6459')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_carrierDiscovered"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46550", 10)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_kamikazeAttack"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46555", 10)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46556", 10)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46558", 10)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
