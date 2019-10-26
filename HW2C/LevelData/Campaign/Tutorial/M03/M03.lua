-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
g_attacknum = 0
g_attackMode = 0
g_now_time = Universe_GameTime()
ping_frigate_attack = "$51005"
ping_frigate_attack_id = 0
ping_destination = "$51006"
ping_destination_id = 0

objectives = {}
objectives["selectfighters"] = {title = "$51000", id = 0, desc = "$51010"}
objectives["assign1"] = {title = "$51001", id = 0, desc = "$51011"}
objectives["assign2"] = {title = "$51002", id = 0, desc = "$51012"}
objectives["destroy"] = {title = "$51003", id = 0, desc = "$51013"}
objectives["movetoping"] = {title = "$51004", id = 0, desc = "$51014"}
objectives["cloakC"] = {title = "$51005", id = 0, desc = "$51015"}
objectives["uncloakC"] = {title = "$51017", id = 0, desc = nil}
objectives["sensors"] = {title = "$51007", id = 0, desc = nil}
objectives["selectC"] = {title = "$51008", id = 0, desc = nil}
objectives["specialA"] = {title = "$51009", id = 0, desc = nil}
objectives["capture"] = {title = "$51018", id = 0, desc = "$51019"}
objectives["select2"] = {title = "$51023", id = 0, desc = "$51025"}
objectives["strike"] = {title = "$51024", id = 0, desc = "$51026"}
objectives["exit"] = {title = "$51021", id = 0, desc = "$51022"}

function addObjective(obj, isSecondary)
	if (not (isSecondary)) then
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

function OnInit()
	Sound_SpeechSubtitlePath("speech:missions/TUT_03/")
	HW2_SetResearchLevel(2)
	CPU_EnableAll(0)
	Sound_EnableAllSpeech(0)
	Universe_EnableCmd(0, MUI_ScuttleCommand)
	Universe_EnableCmd(0, MUI_RetireCommand)
	Player_SetRU(0, 2500)
	SobGroup_CreateSubSystem("Carrier", "CloakGenerator")
	SobGroup_CreateSubSystem("EnemyCarrier", "FighterProduction")
	Rule_Add("Rule_Init_Go")
end

function Rule_Skip()
	SobGroup_ExitHyperSpace("Bombers", "BomberVolume")
	SobGroup_ExitHyperSpace("Carrier", "Destination")
	SobGroup_Create("tempSobGroup")
	SobGroup_FillUnion("tempSobGroup", "Interceptors", "Bombers")
	HW2_Wait(3)
	Event_Start("IntelEvent_Tactics")
	Rule_Add("Rule_IntelEvent_StrikeGroups")
	Rule_Remove("Rule_Skip")
end

function Rule_Init_Go()
	SobGroup_SetSwitchOwnerFlag("Frigate", 0)
	SobGroup_AbilityActivate("Frigate_2", AB_Attack, 0)
	SobGroup_AbilityActivate("Frigate_2", AB_Move, 0)
	SobGroup_SetTactics("Frigate_2", 2)
	SobGroup_SetSpeed("Frigate_2", 0)
	SobGroup_AbilityActivate("Frigate", AB_Attack, 0)
	SobGroup_AbilityActivate("Frigate", AB_Move, 0)
	SobGroup_SetHealth("Frigate", 0.75)
	UI_SetElementEnabled("NewLaunchMenu", "launchButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "launchAllButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "stayDockedButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "autoLaunchButton", 0)
	SobGroup_SetTactics("Interceptors", 2)
	SobGroup_SetTactics("Bombers", 2)
	SobGroup_Create("tempSobGroup")
	Event_Start("intelevent_controlgroups")
	Rule_Add("Rule_Group1Pre")
	Rule_Remove("Rule_Init_Go")
end

function Rule_Group1Pre()
	if (Event_IsDone("intelevent_controlgroups") == 1) then
	Event_Start("intelevent_controlgroups_active")
	Rule_Add("Rule_Group1")
	Rule_Remove("Rule_Group1Pre")
	end
end

function Rule_Group1()
	selI = SobGroup_Selected("Interceptors")
	selB = SobGroup_Selected("Bombers")
	if (Event_IsDone("intelevent_controlgroups_active") == 1 or selI == 1 and selB ~= 1) then
	if (Event_IsDone("intelevent_controlgroups_active") ~= 1) then
	Event_Stop("intelevent_controlgroups_active")
	end
	if (selI ~= 1 or selB == 1) then
	return
	end
	completeObjective("selectfighters");
	addObjective("assign1");
	SobGroup_SelectSobGroup("Interceptors")
	Event_Start("intelevent_group1")
	Rule_Add("Rule_Focus")
	Rule_Remove("Rule_Group1")
	end
end

function Rule_Focus()
	local ctrlD = SobGroup_IsInControlGroup(1, "Interceptors")
	if (Event_IsDone("intelevent_group1") == 1 or ctrlD == 1) then
	if (Event_IsDone("intelevent_group1") ~= 1) then
	Event_Stop("intelevent_group1")
	end
	if (ctrlD ~= 1) then
	return
	end
	completeObjective("assign1");
	Event_Start("intelevent_focus")
	Rule_Add("Rule_AttackPre")
	Rule_Remove("Rule_Focus")
	end
end

function Rule_AttackPre()
	if (Event_IsDone("intelevent_focus") == 1) then
	Event_Start("intelevent_focus_active")
	Rule_Add("Rule_Attack")
	Rule_Remove("Rule_AttackPre")
	end
end

function Rule_Attack()
	ctrlD = SobGroup_IsInControlGroup(2, "Bombers")
	if (Event_IsDone("intelevent_focus_active") == 1 or ctrlD == 1) then
	if (Event_IsDone("intelevent_focus_active") ~= 1) then
	Event_Stop("intelevent_focus_active")
	end
	if (ctrlD ~= 1) then
	return
	end
	completeObjective("assign2");
	Event_Start("intelevent_attack")
	addObjective("destroy");
	Rule_Add("Rule_DestroyFrigates")
	Rule_Remove("Rule_Attack")
	end
end

function Rule_DestroyFrigates()
	ctrlD = SobGroup_Empty("Frigate")
	if (Event_IsDone("intelevent_attack") == 1 and ctrlD == 1) then
	completeObjective("destroy");
	Ping_Remove(ping_frigate_attack_id)
	Event_Start("intelevent_destroy_frigates")
	Rule_Add("Rule_SpecialCommands")
	Rule_Remove("Rule_DestroyFrigates")
	end
end

function Rule_SpecialCommands()
	if (Event_IsDone("intelevent_attack") == 1) then
	Ping_Remove(ping_destination_id)
	Event_Start("intelevent_specialcommands")
	Rule_Add("Rule_CheckSpecialIcon")
	Rule_Remove("Rule_SpecialCommands")
	end
end

function Rule_CheckSpecialIcon()
	if (Event_IsDone("intelevent_specialcommands") == 1 and SobGroup_Selected("Carrier") == 1) then
	Sensors_Toggle(0)
	Event_Start("intelevent_activatecloakingOpenSpecial")
	completeObjective("selectC");
	UI_ShowScreen("NewTaskbar", 1)
	Rule_Add("Rule_ActivateCloaking")
	Rule_Remove("Rule_CheckSpecialIcon")
	end
end

function Rule_ActivateCloaking()
	if (Event_IsDone("intelevent_specialcommands") == 1 and UI_IsNamedElementVisible("NewTaskbar", "specialButtons") == 1) then
	Event_Start("intelevent_activatecloaking")
	Rule_Add("Rule_Uncloaking")
	Rule_Remove("Rule_ActivateCloaking")
	end
end

function Rule_Uncloaking()
	if (Event_IsDone("intelevent_activatecloaking") == 1 and SobGroup_IsCloaked("Carrier") == 1) then
	Event_Start("intelevent_uncloaking")
	Rule_Add("Rule_Capture")
	Rule_Remove("Rule_Uncloaking")
	end
end

function Rule_Capture()
	if (Event_IsDone("intelevent_uncloaking") == 1 and SobGroup_IsCloaked("Carrier") == 0) then
	Event_Start("intelevent_capture")
	Rule_Add("Rule_CapFin")
	Rule_Remove("Rule_Capture")
	end
end

function Rule_CapFin()
	if (SobGroup_HealthPercentage("Frigate_2") < 0.4) then
	SobGroup_SetHealth("Frigate_2", 0.75)
	end
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships0", "Vgr_AssaultFrigate")
	if (Event_IsDone("intelevent_capture") == 1 and SobGroup_Count("tempSobGroup") == 1) then
	Event_Start("intelevent_complete")
	Rule_Add("Rule_Bonus")
	Rule_Remove("Rule_CapFin")
	end
end

function Rule_Bonus()
	if (Event_IsDone("intelevent_complete") == 1) then
	Event_Start("IntelEvent_Tactics")
	Rule_Add("Rule_IntelEvent_StrikeGroups")
	Rule_Remove("Rule_Bonus")
	end
end

function Rule_IntelEvent_StrikeGroups()
	if (Event_IsDone("IntelEvent_Tactics") == 1) then
	SobGroup_FillUnion("tempSobGroup", "Interceptors", "Bombers")
	Event_Start("IntelEvent_StikeGroups")
	Rule_Add("Rule_IntelEvent_StrikeGroupsSelected")
	Rule_Remove("Rule_IntelEvent_StrikeGroups")
	end
end

function Rule_IntelEvent_StrikeGroupsSelected()
	isIn = SobGroup_Selected("tempSobGroup")
	if (Event_IsDone("IntelEvent_StikeGroups") == 1 and isIn == 1) then
	Event_Start("IntelEvent_StikeGroupsSelected")
	Rule_Add("Rule_IntelEvent_StrikeGroupsStriked")
	Rule_Remove("Rule_IntelEvent_StrikeGroupsSelected")
	end
end

function Rule_IntelEvent_StrikeGroupsStriked()
	isIn = SobGroup_InStrikeGroup("tempSobGroup")
	if (Event_IsDone("IntelEvent_StikeGroupsSelected") == 1 and isIn == 1) then
	Event_Start("IntelEvent_StikeGroupsStriked")
	Rule_Add("Rule_IntelEvent_Waypoints")
	Rule_Remove("Rule_IntelEvent_StrikeGroupsStriked")
	end
end

function Rule_IntelEvent_Waypoints()
	if (Event_IsDone("IntelEvent_StikeGroupsStriked") == 1) then
	Event_Start("IntelEvent_Waypoints")
	Rule_Add("Rule_SetFin")
	Rule_Remove("Rule_IntelEvent_Waypoints")
	end
end

function Rule_SetFin()
	if (Event_IsDone("IntelEvent_Waypoints") == 1) then
	Sound_EnableAllSpeech(1)
	UI_SetElementEnabled("NewLaunchMenu", "launchButton", 1)
	UI_SetElementEnabled("NewLaunchMenu", "launchAllButton", 1)
	UI_SetElementEnabled("NewLaunchMenu", "stayDockedButton", 1)
	UI_SetElementEnabled("NewLaunchMenu", "autoLaunchButton", 1)
	SobGroup_Clear("tempSobGroup")
	Rule_AddInterval("Rule_AttackWaves", 30)
	Rule_Remove("Rule_SetFin")
	end
end

function Rule_AttackWaves()
	if (SobGroup_Count("EnemyCarrier") == 0) then
	print("**** GAME OVER")
	Rule_Remove("Rule_AttackWaves")
	return
	end
	if (SobGroup_Count("Carrier") == 0) then
	print("**** GAME OVER")
	Rule_Remove("Rule_AttackWaves")
	FE_NextTutorial()
	return
	end
	g_attacknum = (g_attacknum + 1)
	g_attackMode = (1 - g_attackMode)
	if (g_attackMode == 1) then
	for i = 1, g_attacknum do
	newShips = SobGroup_CreateShip("EnemyCarrier", "Vgr_Scout")
	SobGroup_SobGroupAdd("tempSobGroup", newShips)
	print("****Scouts created")
	end
	else
	for i = 1, g_attacknum do
	newShips = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	SobGroup_SobGroupAdd("tempSobGroup", newShips)
	print("****Bombers created")
	end
	end
	Rule_AddInterval("Rule_doAttack", 25)
	print("*** scheduling Rule_doAttack..")
end

function Rule_doAttack()
	SobGroup_AttackPlayer("tempSobGroup", 0)
	print("** issuing attack ")
	Rule_Remove("Rule_doAttack")
end

Events = {}
Events["intelevent_controlgroups"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_HideScreen('UnitsMenu')", ""}, {"UI_HideScreen('ResourceMenu')", ""}, {"UI_HideScreen('UnitCapInfoPopup')", ""}, {"UI_ShowScreen('NewTaskbar',0)", ""}, {"UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", ""},}, {{"Camera_AltFocus( 'Interceptors' , 1)", ""},}, {HW2_LocationCardEvent("$51020", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51028", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51031", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_controlgroups_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51032", 5), {"addObjective('selectfighters')", ""}, {"int_ptr_id1 = EventPointer_AddSobGroup('int1', 65280, 0.05)", ""}, {"int_ptr_id2 = EventPointer_AddSobGroup('int2', 65280, 0.05)", ""}, {"int_ptr_id3 = EventPointer_AddSobGroup('int3', 65280, 0.05)", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_group1"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51053", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51040", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_focus"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"EventPointer_Remove(int_ptr_id1)", ""}, {"EventPointer_Remove(int_ptr_id2)", ""}, {"EventPointer_Remove(int_ptr_id3)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51050", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51051", 5)}, {{"SobGroup_ExitHyperSpace('Bombers', 'BomberVolume' )", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51052", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51055", 5)}, {{"Camera_AltFocus( 'StrikeCraft' , 1)", ""}, {"int_ptr_id1 = EventPointer_AddSobGroup('b1', 65280, 0.05)", ""}, {"int_ptr_id2 = EventPointer_AddSobGroup('b2', 65280, 0.05)", ""}, {"int_ptr_id3 = EventPointer_AddSobGroup('b3', 65280, 0.05)", ""},}, {{"addObjective('assign2')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_focus_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51054", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_attack"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Camera_AltFocus( 'Frigate' , 0)", ""},}, {{"EventPointer_Remove(int_ptr_id1)", ""}, {"EventPointer_Remove(int_ptr_id2)", ""}, {"EventPointer_Remove(int_ptr_id3)", ""}, {"SobGroup_ExitHyperSpace('Frigate', 'Frigate_Incoming' )", ""},}, {{"ping_frigate_attack_id = HW2_PingCreateWithLabel( ping_frigate_attack, 'Frigate' )", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$51060", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_destroy_frigates"] = {{}, {}, {}, {},}
Events["intelevent_3dmovement"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_MoveRestrictToVolume(1,'Destination')", ""},}, {{"ping_destination_id = HW2_PingCreateWithLabel( ping_destination, 'Carrier' )", ""}, {"Sensors_FlashWorldPlane(1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$51080", 5), HW2_Wait(1), {"Sensors_FlashWorldPlane(0)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51081", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51083", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51082", 5), {"addObjective('movetoping')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_specialcommands"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"SobGroup_ExitHyperSpace('Carrier', 'Destination' )", ""},}, {}, {{"HW2_Wait(3)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51070", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51090", 5)}, {{"HW2_Wait(2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51091", 5)}, {{"HW2_Wait(3)", ""}, {"cloak_ptr_id = HW2_CreateEventPointerSubSystem('Hgn_C_Module_CloakGenerator', 'Carrier')", ""},}, {{"Camera_FocusSobGroup( 'Carrier', 1 , 100, 2)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$51092", 5)}, {{"HW2_Wait(2)", ""}, {"EventPointer_Remove(cloak_ptr_id)", ""}, {"carrierID = EventPointer_AddSobGroup('Carrier', 65280, 0.05)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51100", 5), {"addObjective('selectC')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_activatecloakingOpenSpecial"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"EventPointer_Remove(carrierID)", ""},}, {{"UI_FlashButton('NewTaskbar', 'btnSpecial', -1)", ""}, {"addObjective('specialA')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51101", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_activatecloaking"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_StopFlashButton('NewTaskbar', 'btnSpecial')", ""},}, {{"completeObjective('specialA')", ""},}, {{"UI_FlashButton('NewTaskbar', 'btnCloak', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51102", 5)}, {{"addObjective('cloakC')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$51103", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_uncloaking"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"completeObjective('cloakC')", ""}, {"EventPointer_Remove(cloak_ptr_id)", ""}, {"UI_StopFlashButton('NewTaskbar', 'btnCloak')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51110", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51111", 5)}, {{"addObjective('uncloakC')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$51112", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_capture"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"SobGroup_ExitHyperSpace('Marine', 'Marine_Enter' )", ""}, HW2_Wait(2)}, {{"completeObjective('uncloakC')", ""}, {"Camera_FocusSobGroup( 'Marine', 0 , 200, 3)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$51120", 5)}, {{"SobGroup_ExitHyperSpace('Frigate_2', 'Frigate_2_Enter' )", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51121", 5), HW2_Wait(2)}, {{"SobGroup_FillUnion('tempSobGroup','Frigate_2','Marine')", ""}, {"addObjective('capture')", ""}, {"SobGroup_SetTactics('Interceptors',2)", ""}, {"SobGroup_SetTactics('Bombers',2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51122", 5)}, {{"Camera_AltFocus('tempSobGroup',1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51162", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51163", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_complete"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"completeObjective('capture')", ""}, {"SobGroup_AbilityActivate('Frigate_2', AB_Attack, 1)", ""}, {"SobGroup_AbilityActivate('Frigate_2', AB_Move, 1)", ""}, {"SobGroup_SetSpeed('Frigate_2', 1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51130", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["IntelEvent_Tactics"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52000", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52001", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52003", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52004", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52005", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52006", 5)}, {{"UI_FlashButton('NewTaskbar', 'btnTactics', 10)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52007", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52008", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""},},}
Events["IntelEvent_StikeGroups"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52010", 5)}, {{"int_ptr_id1 = EventPointer_AddSobGroup('int1', 65280, 0.05)", ""}, {"int_ptr_id2 = EventPointer_AddSobGroup('int2', 65280, 0.05)", ""}, {"int_ptr_id3 = EventPointer_AddSobGroup('int3', 65280, 0.05)", ""}, {"bnt_ptr_id1 = EventPointer_AddSobGroup('b1', 65280, 0.05)", ""}, {"bnt_ptr_id2 = EventPointer_AddSobGroup('b2', 65280, 0.05)", ""}, {"bnt_ptr_id3 = EventPointer_AddSobGroup('b3', 65280, 0.05)", ""}, {"Camera_AltFocus( 'tempSobGroup' , 1)", ""},}, {{"addObjective('select2')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52011", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""},},}
Events["IntelEvent_StikeGroupsSelected"] = {{{"completeObjective('select2')", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""},}, {{"EventPointer_Remove(int_ptr_id1)", ""}, {"EventPointer_Remove(int_ptr_id2)", ""}, {"EventPointer_Remove(int_ptr_id3)", ""}, {"EventPointer_Remove(bnt_ptr_id1)", ""}, {"EventPointer_Remove(bnt_ptr_id2)", ""}, {"EventPointer_Remove(bnt_ptr_id3)", ""},}, {{"UI_FlashButton('NewTaskbar', 'btnStrike', 10)", ""},}, {{"addObjective('strike')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52013", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""},},}
Events["IntelEvent_StikeGroupsStriked"] = {{{"completeObjective('strike')", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Universe_EnableSkip(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52012", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52014", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52015", 5)}, {}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""},},}
Events["IntelEvent_Waypoints"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52030", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52031", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52032", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52033", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52034", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52035", 5)}, {{"UI_SetElementEnabled('InGameMenu', 'm_btnNextTutorial', 0)", ""}, {"setMissionComplete(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$51132", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$52017", 5)}, {{"addObjective('exit',1)", ""},}, {}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
