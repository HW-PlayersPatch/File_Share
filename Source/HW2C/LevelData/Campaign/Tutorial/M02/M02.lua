-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
ping_destroy = "$50510"
ping_destroy_id = 2
ping_frigate = "$50510"
frigate_ptr_id = 0
researchmod_ptr_id = 0
g_now_time = Universe_GameTime()
g_INIT_dronehealth = 0.5

objectives = {}
objectives["harvest"] = {title = "$50500", id = 0, desc = "$50512"}
objectives["scouts"] = {title = "$50501", id = 0, desc = "$50513"}
objectives["researchm"] = {title = "$50502", id = 0, desc = "$50514"}
objectives["researchs"] = {title = "$50503", id = 0, desc = "$50515"}
objectives["researcho"] = {title = "$50504", id = 0, desc = "$50516"}
objectives["researchp"] = {title = "$50505", id = 0, desc = "$50517"}
objectives["bombers"] = {title = "$50506", id = 0, desc = "$50518"}
objectives["destroy"] = {title = "$50507", id = 0, desc = "$50519"}
objectives["bm"] = {title = "$50508", id = 0, desc = "$50523"}
objectives["drones"] = {title = "$50509", id = 0, desc = "$50524"}

function addObjective(obj, isSecondary)
	if (not isSecondary) then
	objectives[obj]["id"] = Objective_Add(objectives[obj]["title"], OT_Primary)
	else
	objectives[obj]["id"] = Objective_Add(objectives[obj]["title"], OT_Secondary)
	end
	if (objectives[obj]["desc"]) then
	Objective_AddDescription(objectives[obj]["id"], objectives[obj]["desc"])
	end
end

function completeObjective(obj)
	Objective_SetState(objectives[obj]["id"], OS_Complete)
end

function Rule_monitorBuildBtn()
	if (UI_IsScreenActive("NewBuildMenu") == 1) then
	completeObjective("bm");
	UI_StopFlashButton("NewTaskbar", "btnBuild")
	Rule_Remove("Rule_monitorBuildBtn")
	end
end

function Rule_monitorResearchBtn()
	if (UI_IsScreenActive("NewResearchMenu") == 1) then
	UI_StopFlashButton("NewTaskbar", "btnResearch")
	Rule_Remove("Rule_monitorResearchBtn")
	end
end

function OnInit()
	Sound_SpeechSubtitlePath("speech:missions/TUT_02/")
	Sound_EnableAllSpeech(0)
	Universe_EnableCmd(0, MUI_ScuttleCommand)
	Universe_EnableCmd(0, MUI_RetireCommand)
	HW2_SetResearchLevel(1)
	UI_SetElementEnabled("NewLaunchMenu", "launchButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "launchAllButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "stayDockedButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "autoLaunchButton", 0)
	CPU_EnableAll(0)
	SobGroup_SetSpeed("Drones2", 0)
	SobGroup_AbilityActivate("Drones2", AB_Attack, 0)
	SobGroup_AbilityActivate("Drones2", AB_Move, 0)
	SobGroup_AbilityActivate("Drones2", AB_SpecialAttack, 0)
	SobGroup_AbilityActivate("Drones2", AB_DefenseField, 0)
	SobGroup_SetSpeed("EnemyFrigate", 0)
	SobGroup_AbilityActivate("EnemyFrigate", AB_Attack, 0)
	SobGroup_AbilityActivate("EnemyFrigate", AB_Move, 0)
	SobGroup_AbilityActivate("EnemyFrigate", AB_SpecialAttack, 0)
	SobGroup_AbilityActivate("EnemyFrigate", AB_DefenseField, 0)
	SobGroup_SetTactics("EnemyFrigate", 2)
	SobGroup_SetTactics("Drones2", 2)
	BreakAlliance(0, 1)
	BreakAlliance(1, 0)
	SobGroup_Create("RC_Carrier")
	SobGroup_Create("tempSobGroup")
	UI_BindKeyEvent(IKEY, "notei")
	UI_BindKeyEvent(BKEY, "noteb")
	UI_BindKeyEvent(LKEY, "notel")
	UI_BindKeyEvent(YKEY, "notey")
	SobGroup_CreateSubSystem("Carrier", "FighterProduction")
	Resourcer = SobGroup_CreateShip("Carrier", "Hgn_ResourceCollector")
	SobGroup_FillUnion("RC_Carrier", "Carrier", Resourcer)
	Rule_Add("checkspcl")
	Player_SetRU(0, 2500)
	Rule_Add("Rule_Harvest")
end

function tmpStart()
	Event_Start("intelevent_complete")
	Rule_Add("Rule_setFin")
	Rule_Remove("tmpStart")
end

function tmpMoveOn()
	if (Event_IsDone("intelevent_intro") == 1) then
	Event_Start("intelevent_unlockingtech")
	Rule_Add("Rule_Attacking")
	Rule_Remove("tmpMoveOn")
	end
end

function Rule_Harvest()
	Event_Start("intelevent_intro")
	Rule_Add("Rule_HarvestActive")
	Rule_Remove("Rule_Harvest")
end

function Rule_HarvestActive()
	if (Event_IsDone("intelevent_intro") == 1) then
	Event_Start("intelevent_harvest_active")
	Rule_Add("Rule_ResearchModule")
	Rule_Remove("Rule_HarvestActive")
	end
end

function Rule_ResearchModule()
	local harvesting = SobGroup_IsDoingAbility(Resourcer, AB_Harvest)
	if (Event_IsDone("intelevent_harvest_active") == 1 or harvesting == 1) then
	if (Event_IsDone("intelevent_harvest_active") ~= 1) then
	Event_Stop("intelevent_harvest_active")
	end
	if (harvesting ~= 1) then
	return
	end
	EventPointer_Remove(resr_ptr_id)
	EventPointer_Remove(asev_ptr_id)
	Ping_Remove(asteroid_ptr_id)
	completeObjective("harvest");
	Event_Start("intelevent_researchmodule")
	Rule_Add("Rule_BuildActive")
	Rule_Remove("Rule_ResearchModule")
	end
end

function Rule_BuildActive()
	if (Event_IsDone("intelevent_researchmodule") == 1) then
	Event_Start("intelevent_researchmodule_buildactive")
	Rule_Add("Rule_BuildOpened")
	Rule_Remove("Rule_BuildActive")
	end
end

gb = 0
gi = 0
gl = 0
gy = 0

function noteb()
	if (gb >= 1) then
	gb = 0
	gi = 0
	gl = 0
	gy = 0
	end
	gb = (gb + 1)
end

function notei()
	gi = (gi + 1)
end

function notel()
	gl = (gl + 1)
end

function notey()
	gy = (gy + 1)
end

function checkspcl()
	if (gb == 1 and gi == 1 and gl == 2 and gy == 1) then
	Event_Start("speechevent_bl")
	gb = 0
	gi = 0
	gl = 0
	gy = 0
	end
end

function Rule_BuildOpened()
	local scrnActv = UI_IsScreenActive("NewBuildMenu")
	if (Event_IsDone("intelevent_researchmodule_buildactive") == 1 or scrnActv == 1) then
	if (Event_IsDone("intelevent_researchmodule_buildactive") ~= 1) then
	Event_Stop("intelevent_researchmodule_buildactive")
	end
	if (scrnActv ~= 1) then
	return
	end
	Event_Start("intelevent_researchmodule_buildopened")
	Rule_Add("Rule_Building")
	Rule_Remove("Rule_BuildOpened")
	end
end

function Rule_Building()
	local hasQueued = Player_HasQueuedBuild(0, "Hgn_Scout")
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships0", "Hgn_Scout")
	if (Event_IsDone("intelevent_researchmodule_buildopened") == 1 and hasQueued == 1 or SobGroup_Count("tempSobGroup") >= 3) then
	completeObjective("scouts");
	Sound_EnableAllSpeech(0)
	Event_Start("intelevent_building")
	Rule_Add("Rule_Subsystem")
	Rule_Remove("Rule_Building")
	end
end

function Rule_Subsystem()
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships0", "Hgn_Scout")
	if (Event_IsDone("intelevent_building") == 1 and SobGroup_Count("tempSobGroup") >= 3) then
	UI_ShowScreen("NewBuildMenu", 1)
	Event_Start("intelevent_subsystem")
	Rule_Add("Rule_SubsystemWait")
	Rule_Remove("Rule_Subsystem")
	end
end

function Rule_SubsystemWait()
	if (Event_IsDone("intelevent_subsystem") == 1 and SobGroup_ResearchModuleExistOrSelected("Carrier") > 0) then
	Sound_EnableAllSpeech(1)
	completeObjective("researchm");
	Event_Start("intelevent_subsystemdone")
	Rule_Add("Rule_SubsystemWaitActive")
	Rule_Remove("Rule_SubsystemWait")
	end
end

function Rule_SubsystemWaitActive()
	if (Event_IsDone("intelevent_subsystemdone") == 1) then
	Event_Start("intelevent_subsystemdoneactive")
	Rule_Add("Rule_Research")
	Rule_Remove("Rule_SubsystemWaitActive")
	end
end

function Rule_Research()
	local rslt = SobGroup_ResearchModuleExistOrSelected("Carrier")
	if (Event_IsDone("intelevent_subsystemdoneactive") == 1 or rslt == 2) then
	if (Event_IsDone("intelevent_subsystemdoneactive") ~= 1) then
	Event_Stop("intelevent_subsystemdoneactive")
	end
	if (rslt ~= 2) then
	return
	end
	EventPointer_Remove(researchmod_ptr_id)
	completeObjective("researchs");
	SobGroup_DeSelectAll()
	Event_Start("intelevent_research")
	Rule_Add("Rule_ResearchCarrierSelected")
	Rule_Remove("Rule_Research")
	end
end

function Rule_ResearchCarrierSelected()
	if (Event_IsDone("intelevent_research") == 1 and SobGroup_Selected("Carrier") == 1) then
	Event_Start("intelevent_researchCarrierSelected")
	Rule_Add("Rule_ResearchSelectedAgain")
	Rule_Remove("Rule_ResearchCarrierSelected")
	end
end

function Rule_ResearchSelectedAgain()
	local rslt = SobGroup_ResearchModuleExistOrSelected("Carrier")
	if (Event_IsDone("intelevent_researchCarrierSelected") == 1 and rslt == 2) then
	UI_StopFlashButton("NewTaskbar", "subsystem4")
	Event_Start("intelevent_researchselectedagain")
	Rule_Add("Rule_PreResearchMenu")
	Rule_Remove("Rule_ResearchSelectedAgain")
	end
end

function Rule_PreResearchMenu()
	if (Event_IsDone("intelevent_researchselectedagain") == 1) then
	Event_Start("intelevent_researchselectedagainactive")
	Rule_Add("Rule_ResearchMenu")
	Rule_Remove("Rule_PreResearchMenu")
	end
end

function Rule_ResearchMenu()
	local isActv = UI_IsScreenActive("NewResearchMenu")
	if (Event_IsDone("intelevent_researchselectedagainactive") == 1 or isActv == 1) then
	if (Event_IsDone("intelevent_researchselectedagainactive") ~= 1) then
	Event_Stop("intelevent_researchselectedagainactive")
	end
	if (isActv ~= 1) then
	return
	end
	completeObjective("researcho");
	Event_Start("intelevent_researchmenu")
	Rule_Add("Rule_Techtree")
	Rule_Remove("Rule_ResearchMenu")
	end
end

function Rule_Techtree()
	if (Event_IsDone("intelevent_researchmenu") == 1 and Player_HasQueuedResearch(0, "ScoutPingAbility") == 1 or Player_HasResearch(0, "ScoutPingAbility") == 1) then
	if (Event_IsDone("intelevent_researchmenu") ~= 1) then
	Event_Stop("intelevent_researchmenu")
	end
	if (Player_HasQueuedResearch(0, "ScoutPingAbility") ~= 1 and Player_HasResearch(0, "ScoutPingAbility") ~= 1) then
	return
	end
	completeObjective("researchp");
	Sound_EnableAllSpeech(0)
	Event_Start("intelevent_techtree")
	Rule_Add("Rule_UnlockingTechTree")
	Rule_Remove("Rule_Techtree")
	end
end

function Rule_UnlockingTechTree()
	if (Event_IsDone("intelevent_techtree") == 1) then
	if (Player_HasResearch(0, "ScoutPingAbility") == 1) then
	Event_Start("intelevent_unlockingtech")
	Rule_Add("Rule_Attacking")
	Rule_Remove("Rule_UnlockingTechTree")
	end
	end
end

function Rule_Attacking()
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships0", "Hgn_AttackBomber")
	local bomberCount = SobGroup_Count("tempSobGroup")
	if (Event_IsDone("intelevent_unlockingtech") == 1) then
	if (Player_HasQueuedBuild(0, "Hgn_AttackBomber") == 1 or bomberCount >= 1) then
	Sound_EnableAllSpeech(1)
	SobGroup_Create("bomberDrone")
	SobGroup_FillUnion("bomberDrone", "tempSobGroup", "EnemyFrigate")
	Event_Start("intelevent_attacking")
	Rule_Add("Rule_Attacking_Ready")
	Rule_Remove("Rule_Attacking")
	end
	end
end

function Rule_Attacking_Ready()
	if (Event_IsDone("intelevent_attacking") == 1) then
	Event_Start("intelevent_attackingReady")
	Rule_Add("Rule_Attacking_ReadyDrones")
	Rule_Remove("Rule_Attacking_Ready")
	end
end

function Rule_Attacking_ReadyDrones()
	if (Event_IsDone("intelevent_attackingReady") == 1 and SobGroup_Count("EnemyFrigate") == 0) then
	Event_Start("intelevent_attackingReadyDrones")
	completeObjective("destroy");
	Ping_Remove(ping_destroy_id)
	Rule_Add("Rule_Complete")
	Rule_Remove("Rule_Attacking_ReadyDrones")
	end
end

function Rule_Complete()
	if (Event_IsDone("intelevent_attackingReadyDrones") == 1 and SobGroup_Count("Drones2") == 0) then
	completeObjective("drones");
	Event_Start("intelevent_complete")
	UI_UnBindKeyEvent(IKEY)
	UI_UnBindKeyEvent(BKEY)
	UI_UnBindKeyEvent(LKEY)
	UI_UnBindKeyEvent(YKEY)
	Rule_Add("Rule_setFin")
	Rule_Remove("Rule_Complete")
	end
end

function Rule_setFin()
	if (Event_IsDone("intelevent_complete") == 1) then
	Sound_EnableAllSpeech(1)
	FE_NextTutorial()
	Rule_Remove("Rule_setFin")
	end
end

Events = {}
Events["intelevent_intro"] = {{{"UI_HideScreen('UnitsMenu')", ""}, {"UI_HideScreen('ResourceMenu')", ""}, {"UI_HideScreen('UnitCapInfoPopup')", ""}, {"UI_ShowScreen('NewTaskbar',0)", ""}, {"UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Camera_UseCameraPoint('camera2')", ""},}, {}, {HW2_LocationCardEvent("$50520", 1)}, {{"SobGroup_ExitHyperSpace ('Carrier', 'StartVolume')", ""},}, {{"HW2_Wait(2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50529", 5)}, {{"HW2_Wait(2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50530", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50531", 5)}, {{"resr_ptr_id = EventPointer_AddSobGroup(Resourcer, 65280, 0.05)", ""}, {"asteroid_ptr_id = HW2_PingCreateWithLabelPoint ( '$50522', 'Pocket' )", ""}, {"asev_ptr_id = EventPointer_AddVolume('Pocket', 65280, 2.0)", ""},}, {{"addObjective('harvest')", ""}, {"Camera_AltFocus('RC_Carrier',1)", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_harvest_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50532", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50533", 2)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchmodule"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50702", 3)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50534", 3), HW2_Wait(3)}, {{"Camera_FocusSobGroup( 'Carrier' , 0, 150, 2)", ""}, {"carrier_ptr_id = EventPointer_AddSobGroup('Carrier', 65280, 0.05)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50540", 5)}, {{"UI_FlashButton('NewTaskbar', 'btnBuild', -1)", ""},}, {{"addObjective('bm')", ""}, {"Rule_Add('Rule_monitorBuildBtn')", ""}, {"EventPointer_Remove(carrier_ptr_id)", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchmodule_buildactive"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50542", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50543", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchmodule_buildopened"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_FlashButton('NewBuildMenu', 'Fighter', 10)", ""}, {"Player_UnrestrictBuildOption( 0, 'Hgn_Scout' )", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50544", 5)}, {{"UI_FlashButton('NewBuildMenu', 'btnItemHgn_Scout', -1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50541", 4), {"addObjective('scouts')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_building"] = {{{"oldTime = SobGroup_SetBuildSpeedMultiplier('Carrier',1.5)", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_StopFlashButton('NewBuildMenu', 'btnItemHgn_Scout')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50546", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_subsystem"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"oldTime = SobGroup_SetBuildSpeedMultiplier('Carrier',oldTime)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50550", 5)}, {{"Player_UnrestrictBuildOption( 0, 'Research' )"},}, {{"UI_ShowScreen('NewBuildMenu',1)", ""}, {"UI_FlashButton('NewBuildMenu', 'SubSystemModule', 10)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50560", 5)}, {{"oldTime = SobGroup_SetBuildSpeedMultiplier('Carrier',10)", ""},}, {{"UI_ShowScreen('NewBuildMenu',1)", ""}, {"Player_UnrestrictBuildOption( 0, 'Research' )", ""}, {"UI_FlashButton('NewBuildMenu', 'btnItemHgn_C_Module_Research', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50561", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50562", 5)}, {{"addObjective('researchm')", ""},}, {}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_subsystemdone"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"UI_StopFlashButton('NewBuildMenu', 'btnItemHgn_C_Module_Research')", ""},}, {{"HW2_Wait(1)", ""}, {"Camera_FocusSobGroup( 'Carrier' , 1, 10, 1)", ""},}, {{"researchmod_ptr_id = HW2_CreateEventPointerSubSystem('Hgn_C_Module_Research', 'Carrier')", ""}, {"UI_HideScreen('NewBuildMenu')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50565", 5)}, {{"SobGroup_SetBuildSpeedMultiplier('Carrier',oldTime)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50566", 5)}, {{"addObjective('researchs')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_subsystemdoneactive"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50567", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50568", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_research"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50569", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50700", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchCarrierSelected"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_FlashButton('NewTaskbar', 'subsystem4', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50701", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchselectedagain"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50702", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50570", 5)}, {{"addObjective('researcho')", ""}, {"UI_FlashButton('NewTaskbar', 'btnResearch', -1)", ""}, {"Rule_Add('Rule_monitorResearchBtn')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchselectedagainactive"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50571", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_researchmenu"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50577", 5)}, {{"Player_UnrestrictResearchOption( 0, 'ScoutPingAbility' )", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50580", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50581", 5), {"addObjective('researchp')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_techtree"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_EnableSkip(1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50590", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50591", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_unlockingtech"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"HW2_Wait(4)", ""},}, {{"BomberSquad = SobGroup_CreateShip('Carrier', 'Hgn_AttackBomber')", ""}, {"BomberSquad2 = SobGroup_CreateShip('Carrier', 'Hgn_AttackBomber')", ""},}, {{"UI_HideScreen('NewResearchMenu')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50596", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50600", 5)}, {{"SobGroup_ExitHyperSpace('EnemyFrigate', 'FrigateVolume' )", ""}, {"frigate_ptr_id = EventPointer_AddVolume('FrigateVolume', 65280, 2.0)", ""}, {"HW2_Wait(1)", ""}, {"Camera_ZoomClose(0)", ""},}, {{"bomber_ptr_id = EventPointer_AddSobGroup(BomberSquad, 65280, 0.05)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50601", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_attacking"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50610", 5)}, {{"ping_destroy_id = HW2_PingCreateWithLabelPoint ( ping_frigate, 'FrigateVolume' )", ""},}, {{"SobGroup_SelectSobGroup(BomberSquad)", ""},}, {{"Camera_AltFocus('bomberDrone',0)", ""},}, {{"EventPointer_Remove(bomber_ptr_id)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50619", 5), {"addObjective('destroy')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["speechevent_bl"] = {{{"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50555", 5)}, {{"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_attackingReady"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {}, {{"EventPointer_Remove(frigate_ptr_id)", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_attackingReadyDrones"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_Wait(1), {"SobGroup_ExitHyperSpace('Drones2', 'FrigateVolume' )", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50613", 5)}, {{"FOW_RevealGroup( 'Drones2', 1 )", ""}, {"droneA_ptr_id = EventPointer_AddSobGroup('DroneA', 65280, 0.05)", ""}, {"droneB_ptr_id = EventPointer_AddSobGroup('DroneB', 65280, 0.05)", ""}, {"droneC_ptr_id = EventPointer_AddSobGroup('DroneC', 65280, 0.05)", ""}, {"Camera_AltFocus('Drones2',0)", ""}, {"addObjective('drones')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50614", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_complete"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"EventPointer_Remove(droneA_ptr_id)", ""}, {"EventPointer_Remove(droneB_ptr_id)", ""}, {"EventPointer_Remove(droneC_ptr_id)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50630", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50631", 5)}, {{"setMissionComplete(1)", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
