-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
ping_destination = "$50016"

objectives = {}
objectives["learn"] = {title = "$50000", id = 0, desc = "$50300"}
objectives["rotate"] = {title = "$50001", id = 0, desc = "$50301"}
objectives["pan"] = {title = "$50002", id = 0, desc = "$50302"}
objectives["focus"] = {title = "$50003", id = 0, desc = "$50303"}
objectives["selectfocus"] = {title = "$50004", id = 0, desc = nil}
objectives["selectboth"] = {title = "$50005", id = 0, desc = "$50305"}
objectives["sensors"] = {title = "$50006", id = 0, desc = "$50306"}
objectives["move"] = {title = "$50007", id = 0, desc = "$50307"}
objectives["movedisc"] = {title = "$50008", id = 0, desc = "$50308"}
objectives["objectives"] = {title = "$50011", id = 0, desc = "$50309"}
objectives["selectascout"] = {title = "$50012", id = 0, desc = nil}
objectives["zoom"] = {title = "$50013", id = 0, desc = "$50310"}
objectives["exitSM"] = {title = "$50014", id = 0, desc = nil}
objectives["movetoping"] = {title = "$50440", id = 0, desc = "$50441"}

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

gHasOpenedObjectives = 0
gLastZoom = -1

function Rule_monitorObjectivesWindow()
	if (UI_IsScreenActive("ObjectivesList") == 1) then
	gHasOpenedObjectives = 1
	Rule_Remove("Rule_monitorObjectivesWindow")
	end
end

txtMap = {};
txtMap["objectives"] = {dat = "$5203", hkey = 137}
txtMap["fun"] = {dat = "Fun String", hkey = nil}
gSpecialWindowStatus = 0

function showText(s, on)
	if (txtMap[s]) then
	if (on == 1) then
	UI_ShowScreen("GenericScreen", 0)
	UI_SetElementVisible("GenericScreen", "lblText", 1)
	if (txtMap[s]["hkey"]) then
	UI_SetLabelTextHotkey("GenericScreen", "lblText", txtMap[s]["dat"], txtMap[s]["hkey"])
	else
	UI_SetTextLabelText("GenericScreen", "lblText", txtMap[s]["dat"])
	end
	else
	UI_SetElementVisible("GenericScreen", "lblText", 0)
	if (gSpecialWindowStatus == 1) then
	UI_ShowScreen("GenericScreen", 0)
	else
	UI_HideScreen("GenericScreen")
	end
	end 
	end
end

function showGraphic(s, on)
	if (on == 1) then
	UI_ShowScreen("GenericScreen", 0)
	UI_SetElementVisible("GenericScreen", s, 1)
	elseif (gSpecialWindowStatus == 1) then
	UI_ShowScreen("GenericScreen", 0)
	else
	UI_HideScreen("GenericScreen")
	end
end

g_now_time = Universe_GameTime()
gSomeKeyPressed = 0

function pressedKey()
	gSomeKeyPressed = 1
end

function OnInit()
	addObjective("learn");
	UI_HideScreen("ObjectivesPopup")
	HW2_SetResearchLevel(1)
	Sound_EnableAllSpeech(1)
	Universe_EnableSkip(0)
	Universe_EnableCmd(0, MUI_ScuttleCommand)
	Universe_EnableCmd(0, MUI_RetireCommand)
	Camera_AllowControl(0)
	UI_SetElementEnabled("NewLaunchMenu", "launchButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "launchAllButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "stayDockedButton", 0)
	UI_SetElementEnabled("NewLaunchMenu", "autoLaunchButton", 0)
	Sound_SpeechSubtitlePath("speech:missions/TUT_01/")
	Camera_UsePanning(0)
	Universe_EnableCmd(0, MUI_MoveCommand)
	Universe_AllowSelect(0)
	SobGroup_Create("sob_BothFighters")
	SobGroup_Create("asteroidShip")
	SobGroup_CreateSubSystem("Carrier", "FighterProduction")
	Event_Start("intelevent_SetupWorld")
	Rule_Add("Rule_Intro")
end

function Rule_Skip()
	Scout_1 = SobGroup_CreateShip("Carrier", "Hgn_Scout")
	Scout_2 = SobGroup_CreateShip("Carrier", "Hgn_Scout")
	SobGroup_FillUnion("sob_BothFighters", Scout_1, Scout_2)
	HW2_Wait(2)
	Universe_EnableCmd(1, MUI_MoveCommand)
	Camera_UsePanning(1)
	Universe_AllowSelect(1)
	Event_Start("intelevent_sensors2")
	Rule_Add("Rule_Sensors2ListenOnly")
	Rule_Remove("Rule_Skip")
end

function Rule_Intro()
	if (Event_IsDone("intelevent_SetupWorld") == 1) then
	Event_Start("intelevent_intro")
	Rule_Add("Rule_IntroTaskbar")
	Rule_Remove("Rule_Intro")
	end
end

function Rule_IntroTaskbar()
	local tb_Minimized = UI_IsNamedElementVisible("NewTaskbar", "btnHide2")
	local tb_Active = UI_IsScreenActive("NewTaskbar")
	if (Event_IsDone("intelevent_intro") == 1 and tb_Minimized == 1) then
	if (tb_Active == 0) then
	return
	end
	Event_Start("intelevent_intro_taskbar_active")
	UI_StopFlashButton("NewTaskbar", "btnHide1")
	Rule_Add("Rule_IntroRecall")
	Rule_Remove("Rule_IntroTaskbar")
	end
end

function Rule_IntroRecall()
	if (Event_IsDone("intelevent_intro_taskbar_active") == 1 or UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 1) then
	if (Event_IsDone("intelevent_intro_taskbar_active") ~= 1) then
	Event_Stop("intelevent_intro_taskbar_active")
	end
	if (UI_IsNamedElementVisible("NewTaskbar", "btnHide1") ~= 1) then
	return
	end
	Event_Start("intelevent_intro_recall")
	Rule_Add("Rule_IntroRecall2")
	Rule_Remove("Rule_IntroRecall")
	end
end

function Rule_IntroRecall2()
	if (Event_IsDone("intelevent_intro_recall") == 1 and UI_IsScreenActive("SpeechRecall") == 1) then
	Event_Start("intelevent_intro_recall_active")
	Rule_Add("Rule_IntroObjectives")
	Rule_Remove("Rule_IntroRecall2")
	end
end

function Rule_IntroObjectives()
	local isActv = UI_IsScreenActive("SpeechRecall")
	if (Event_IsDone("intelevent_intro_recall_active") == 1 or isActv == 0) then
	if (Event_IsDone("intelevent_intro_recall_active") ~= 1) then
	Event_Stop("intelevent_intro_recall_active")
	end
	if (isActv ~= 0) then
	return
	end
	UI_StopFlashButton("NewTaskbar", "btnRecall")
	Event_Start("intelevent_intro_objectives")
	Rule_Add("Rule_IntroActive")
	Rule_Remove("Rule_IntroObjectives")
	end
end

function Rule_IntroActive()
	if (Event_IsDone("intelevent_intro_objectives") == 1) then
	Event_Start("intelevent_intro_active")
	Rule_Add("Rule_IntroCtue")
	Rule_Remove("Rule_IntroActive")
	end
end

function Rule_IntroCtue()
	if (Event_IsDone("intelevent_intro_active") == 1 or UI_IsScreenActive("ObjectivesList") == 1) then
	if (Event_IsDone("intelevent_intro_active") ~= 1) then
	Event_Stop("intelevent_intro_active")
	end
	if (UI_IsScreenActive("ObjectivesList") ~= 1) then
	return
	end
	Objective_Select(objectives["objectives"]["id"])
	Event_Start("intelevent_introContinue")
	Rule_Add("Rule_IntroCtueActive")
	Rule_Remove("Rule_IntroCtue")
	end
end

function Rule_IntroCtueActive()
	if (Event_IsDone("intelevent_introContinue") == 1) then
	Event_Start("intelevent_introContinue_active")
	Rule_Add("Rule_IntroCtueActiveSelection")
	Rule_Remove("Rule_IntroCtueActive")
	end
end

function Rule_IntroCtueActiveSelection()
	if (Event_IsDone("intelevent_introContinue_active") == 1 or UI_IsScreenActive("ObjectivesList") == 0) then
	if (Event_IsDone("intelevent_introContinue_active") ~= 1) then
	Event_Stop("intelevent_introContinue_active")
	end
	if (UI_IsScreenActive("ObjectivesList") ~= 0) then
	return
	end
	Universe_EnableCmd(1, MUI_MoveCommand)
	Universe_AllowSelect(1)
	Event_Start("intelevent_selection")
	Rule_Add("Rule_DragSelection")
	Rule_Remove("Rule_IntroCtueActiveSelection")
	end
end

function Rule_IntroATI()
	if (Event_IsDone("intelevent_sensors2") == 1) then
	gSpecialWindowStatus = 1
	Event_Start("intelevent_ATI")
	Rule_Add("Rule_ATIProceed")
	Rule_Remove("Rule_IntroATI")
	end
end

function Rule_ATIProceed()
	if (Event_IsDone("intelevent_ATI") == 1) then
	gSpecialWindowStatus = 0
	showGraphic("gfc1", 0);
	showGraphic("gfc2", 0);
	showGraphic("gfc3", 0);
	Rule_Add("Rule_Sensors2ListenOnly")
	Rule_Remove("Rule_ATIProceed")
	end
end

function Rule_DragSelection()
	local selected = SobGroup_Selected(Scout_2)
	if (Event_IsDone("intelevent_selection") == 1 and selected == 1) then
	Event_Start("intelevent_dragselection")
	Rule_Add("Rule_DragSelectionListenOnly")
	Rule_Remove("Rule_DragSelection")
	end
end

function Rule_DragSelectionListenOnly()
	if (Event_IsDone("intelevent_dragselection") == 1) then
	Event_Start("intelevent_dragselection_active")
	Rule_Add("Rule_DragSelectionFin")
	Rule_Remove("Rule_DragSelectionListenOnly")
	end
end

function Rule_DragSelectionFin()
	local sel1 = SobGroup_Selected(Scout_1)
	local sel2 = SobGroup_Selected(Scout_2)
	if (Event_IsDone("intelevent_dragselection_active") == 1 or sel1 == 1 and sel2 == 1) then
	if (Event_IsDone("intelevent_dragselection_active") ~= 1) then
	Event_Stop("intelevent_dragselection_active")
	end
	if (sel1 ~= 1 or sel2 ~= 1) then
	return
	end
	completeObjective("selectboth");
	Event_Start("intelevent_rotate")
	Rule_Add("Rule_Zooming")
	Rule_Remove("Rule_DragSelectionFin")
	end
end

function Rule_Zooming()
	local rotated = Camera_PlayerHasRotated(0)
	if (Event_IsDone("intelevent_rotate") == 1 and rotated == 1) then
	completeObjective("rotate");
	Event_Start("dialogevent_rotated")
	Rule_Add("Rule_ZoomingProceed")
	Rule_Remove("Rule_Zooming")
	else
	Camera_ResetRotated()
	end
end

function Rule_ZoomingProceed()
	if (Event_IsDone("dialogevent_rotated") == 1) then
	Event_Start("intelevent_zooming")
	gLastZoom = Camera_GetLastZoomAmount()
	Rule_Add("Rule_Zooming_Checked")
	Rule_Remove("Rule_ZoomingProceed")
	end
end

function Rule_Zooming_Checked()
	if (Event_IsDone("intelevent_zooming") == 1 and gLastZoom ~= Camera_GetLastZoomAmount()) then
	Event_Start("intelevent_zoomingChecked")
	completeObjective("zoom");
	Rule_Add("Rule_PanningProceed")
	Rule_Remove("Rule_Zooming_Checked")
	end
end

function Rule_PanningProceed()
	if (Event_IsDone("intelevent_zoomingChecked") == 1) then
	Event_Start("intelevent_panning")
	Camera_UsePanning(1)
	Camera_ResetPanned()
	Rule_Add("Rule_PannedLittle")
	Rule_Remove("Rule_PanningProceed")
	end
end

function Rule_PannedLittle()
	if (Event_IsDone("intelevent_panning") == 1 and Camera_PlayerHasPanned(0.01) == 1) then
	Event_Start("intelevent_panned_little")
	Rule_Add("Rule_Focus")
	Rule_Remove("Rule_PannedLittle")
	end
end

function Rule_Focus()
	if (Event_IsDone("intelevent_panned_little") == 1 and SobGroup_OnScreen(Scout_1) == 0) then
	completeObjective("pan");
	Event_Start("intelevent_focus")
	addObjective("focus");
	Rule_Add("Rule_FocusListenOnly")
	Rule_Remove("Rule_Focus")
	end
end

function Rule_FocusListenOnly()
	if (Event_IsDone("intelevent_focus") == 1) then
	Event_Start("intelevent_focus_active")
	Rule_Add("Rule_BasicsEnd")
	Rule_Remove("Rule_FocusListenOnly")
	end
end

function Rule_BasicsEnd()
	local camF = Camera_IsFocused(Scout_1)
	local camF2 = Camera_IsFocused(Scout_1)
	local sobSel = SobGroup_Selected(Scout_1)
	if (Event_IsDone("intelevent_focus_active") == 1 or camF == 1 and sobSel == 1) then
	if (Event_IsDone("intelevent_focus_active") ~= 1) then
	Event_Stop("intelevent_focus_active")
	end
	if (camF ~= 1 or sobSel ~= 1) then
	return
	end
	completeObjective("focus");
	Event_Start("dialogevent_basics_end")
	Rule_Add("Rule_Sensors")
	Rule_Remove("Rule_BasicsEnd")
	else
	SobGroup_SelectSobGroup(Scout_1)
	end
end

function Rule_Sensors()
	if (Event_IsDone("dialogevent_basics_end") == 1) then
	Event_Start("intelevent_sensors")
	Rule_Add("Rule_Sensors2")
	gSomeKeyPressed = 0
	Rule_Remove("Rule_Sensors")
	end
end

function Rule_Sensors2()
	if (Event_IsDone("intelevent_sensors") == 1 or Sensors_ManagerIsUp() == 1) then
	if (Event_IsDone("intelevent_sensors") ~= 1) then
	Event_Stop("intelevent_sensors")
	end
	if (Sensors_ManagerIsUp() ~= 1) then
	return
	end
	completeObjective("sensors");
	Event_Start("intelevent_sensors2")
	Rule_Add("Rule_IntroATI")
	Rule_Remove("Rule_Sensors2")
	end
end

function Rule_Sensors2ListenOnly()
	if (Event_IsDone("intelevent_sensors2") == 1) then
	addObjective("exitSM");
	EventPointer_Remove(asteroid_ptr_id2)
	Ping_Remove(asteroid_ptr_id)
	Event_Start("intelevent_sensors2_active")
	Rule_Add("Rule_Movement")
	Rule_Remove("Rule_Sensors2ListenOnly")
	end
end

function Rule_Movement()
	local sensorsUp = Sensors_ManagerIsUp()
	if (Event_IsDone("intelevent_sensors2_active") == 1 or sensorsUp ~= 1) then
	if (Event_IsDone("intelevent_sensors2_active") ~= 1) then
	Event_Stop("intelevent_sensors2_active")
	end
	if (sensorsUp == 1) then
	return
	end
	Event_Start("intelevent_movement")
	Rule_Add("Rule_MovementListenOnly")
	Rule_Remove("Rule_Movement")
	end
end

function Rule_MovementListenOnly()
	if (Event_IsDone("intelevent_movement") == 1) then
	Event_Start("intelevent_movement_active")
	Rule_Add("Rule_RelativeMove")
	Rule_Remove("Rule_MovementListenOnly")
	end
end

function Rule_RelativeMove()
	if (Event_IsDone("intelevent_movement_active") == 1 or SobGroup_Selected(Scout_1) == 1 or SobGroup_Selected(Scout_2) == 1) then
	if (Event_IsDone("intelevent_movement_active") ~= 1) then
	Event_Stop("intelevent_movement_active")
	end
	if (SobGroup_Selected(Scout_1) ~= 1 and SobGroup_Selected(Scout_2) ~= 1) then
	return
	end
	completeObjective("selectascout");
	Event_Start("intelevent_relativemove")
	addObjective("move");
	Rule_Add("Rule_PreMoveIssued")
	Rule_Remove("Rule_RelativeMove")
	end
end

function Rule_PreMoveIssued()
	local hasIssued1 = SobGroup_IsDoingAbility(Scout_1, AB_Move)
	local hasIssued2 = SobGroup_IsDoingAbility(Scout_2, AB_Move)
	if (Event_IsDone("intelevent_relativemove") == 1 and hasIssued1 == 1 or hasIssued2 == 1) then
	Event_Start("intelevent_relativemoveIssued")
	Rule_Add("Rule_RelativeMove2")
	Rule_Remove("Rule_PreMoveIssued")
	end
end

function Rule_RelativeMove2()
	if (Player_IsShipInVolume(0, "Asteroid_Volume") == 1 and Event_IsDone("intelevent_relativemoveIssued") == 1) then
	HW2_Wait(2)
	local s1 = SobGroup_IsInVolume(Scout_1, "Asteroid_Volume")
	local s2 = SobGroup_IsInVolume(Scout_2, "Asteroid_Volume")
	local s3 = SobGroup_IsInVolume("Carrier", "Asteroid_Volume")
	asteroidShip = Scout_1
	if (s1 == 1 and s2 == 1 and s3 == 1) then
	SobGroup_FillUnion("asteroidShip", "Carrier", "sob_BothFighters")
	asteroidShip = "asteroidShip"
	elseif (s1 == 1 and s2 == 1) then
	asteroidShip = "sob_BothFighters"
	elseif (s2 == 1) then
	asteroidShip = Scout_2
	elseif (s3 == 1) then
	asteroidShip = "Carrier"
	end
	completeObjective("move");
	EventPointer_Remove(asteroid_ptr_id2)
	Ping_Remove(asteroid_ptr_id)
	Event_Start("intelevent_relativemove2")
	Rule_Add("Rule_MoveDisc")
	Rule_Remove("Rule_RelativeMove2")
	end
end

function Rule_MoveDisc()
	if (Event_IsDone("intelevent_relativemove2") == 1 or Universe_IsPiePlateActive() == 1) then
	if (Event_IsDone("intelevent_relativemove2") ~= 1) then
	Event_Stop("intelevent_relativemove2")
	end
	if (Universe_IsPiePlateActive() ~= 1) then
	return
	end
	completeObjective("movedisc");
	Event_Start("intelevent_movedisc")
	Rule_Add("Rule_MoveDiscDone")
	Rule_Remove("Rule_MoveDisc")
	end
end

function Rule_MoveDiscDone()
	if (Event_IsDone("intelevent_movedisc") == 1 and Universe_IsPiePlateActive() == 0) then
	Event_Start("intelevent_movediscdone")
	Rule_Add("Rule_MoveDisc3D")
	Rule_Remove("Rule_MoveDiscDone")
	end
end

function Rule_MoveDisc3D()
	if (Event_IsDone("intelevent_movediscdone") == 1 and Sensors_ManagerIsUp() == 1) then
	Camera_ZoomClose(0)
	Event_Start("intelevent_movedisc3D")
	Rule_Add("Rule_MoveDisc3DShipSelectListenOnly")
	Rule_Remove("Rule_MoveDisc3D")
	end
end

function Rule_MoveDisc3DShipSelectListenOnly()
	if (Event_IsDone("intelevent_movedisc3D") == 1) then
	Event_Start("intelevent_movedisc3D_active")
	Rule_Add("Rule_MoveDisc3DShipSelect")
	Rule_Remove("Rule_MoveDisc3DShipSelectListenOnly")
	end
end

function Rule_MoveDisc3DShipSelect()
	local sel1 = 0 + SobGroup_Selected(Scout_1)
	local sel2 = 0 + SobGroup_Selected(Scout_2)
	local sel3 = 0 + SobGroup_Selected("Carrier")
	if (Event_IsDone("intelevent_movedisc3D_active") == 1 or ((sel1 + sel2) + sel3) > 0) then
	if (Event_IsDone("intelevent_movedisc3D_active") ~= 1) then
	Event_Stop("intelevent_movedisc3D_active")
	end
	if (((sel1 + sel2) + sel3) <= 0) then
	return
	end
	Event_Start("intelevent_movedisc3D_shipSelected")
	Rule_Add("Rule_MoveDisc3DPieActive")
	Rule_Remove("Rule_MoveDisc3DShipSelect")
	end
end

function Rule_MoveDisc3DPieActive()
	if (Event_IsDone("intelevent_movedisc3D_shipSelected") == 1 or Universe_IsPiePlateActive() == 1) then
	if (Event_IsDone("intelevent_movedisc3D_shipSelected") ~= 1) then
	Event_Stop("intelevent_movedisc3D_shipSelected")
	end
	if (Universe_IsPiePlateActive() ~= 1) then
	return
	end
	Universe_AllowClicks(0)
	Event_Start("intelevent_movedisc3D_moveDiscActiveButLocked")
	Rule_Add("Rule_MoveDisc3DPieHeightChanged")
	Rule_Remove("Rule_MoveDisc3DPieActive")
	else
	Universe_MoveRestrictToVolume(1, "MoveHere")
	end
end

function Rule_MoveDisc3DPieHeightChanged()
	local heightChange = Universe_GetCurrentMoveHeight()
	print("******** heightChange Sqr:"..heightChange)
	heightChange = abs(heightChange)
	if (Event_IsDone("intelevent_movedisc3D_moveDiscActiveButLocked") == 1 or heightChange >= 4000) then
	if (Event_IsDone("intelevent_movedisc3D_moveDiscActiveButLocked") ~= 1) then
	Event_Stop("intelevent_movedisc3D_moveDiscActiveButLocked")
	end
	if (heightChange < 4000) then
	Universe_MoveRestrictToVolume(1, "MoveHere")
	return
	end
	Universe_AllowClicks(1)
	Event_Start("intelevent_movedisc3D_moveDiscActiveUnlocked")
	Rule_Add("Rule_Complete")
	Rule_Remove("Rule_MoveDisc3DPieHeightChanged")
	else
	Universe_MoveRestrictToVolume(1, "MoveHere")
	end
end

function Rule_Complete()
	if (Event_IsDone("intelevent_movedisc3D_moveDiscActiveUnlocked") == 1 and Universe_IsPiePlateActive() == 0) then
	completeObjective("movetoping");
	Event_Start("intelevent_complete")
	completeObjective("learn");
	Rule_Add("Rule_setFin")
	Rule_Remove("Rule_Complete")
	end
end

function Rule_setFin()
	if (Event_IsDone("intelevent_complete") == 1) then
	Sound_EnableAllSpeech(0)
	FE_NextTutorial()
	Rule_Remove("Rule_setFin")
	end
end

Events = {}
Events["intelevent_SetupWorld"] = {{{"Universe_EnableSkip(0)", ""},}, {{"UI_HideScreen('NewTaskbar')", ""}, {"UI_HideScreen('ObjectivesPopup')", ""}, {"UI_HideScreen('UnitsMenu')", ""}, {"UI_HideScreen('ResourceMenu')", ""}, {"UI_HideScreen('UnitCapInfoPopup')", ""},}, {{"SobGroup_ExitHyperSpace ('Carrier', 'Carrier_EnterVolume')", ""}, {"Camera_UseCameraPoint('camera1')", ""},},}
Events["intelevent_intro"] = {{HW2_LocationCardEvent("$50020", 4), {"HW2_Wait(2)", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50030", 5), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50350", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50351", 5)}, {{"UI_ShowScreen('NewTaskbar',0)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50352", 5)}, {{"UI_FlashButton('NewTaskbar', 'btnHide1', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50410", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50411", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_intro_taskbar_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50412", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50414", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_intro_recall"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50402", 5)}, {{"HW2_Wait(3)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50415", 5), {"UI_FlashButton('NewTaskbar', 'btnRecall', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50416", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_intro_recall_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50417", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_intro_objectives"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50420", 5), HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50353", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50354", 5), {"UI_FlashButton('NewTaskbar', 'btnObjectives', -1)", ""},}, {{"addObjective('objectives')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_intro_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {}, {{"UI_FlashButton('NewTaskbar', 'btnObjectives', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50356", 5)}, {}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_introContinue"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"completeObjective('objectives')", ""},}, {{"UI_StopFlashButton('NewTaskbar', 'btnObjectives')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50402", 2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50358", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50359", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_introContinue_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50360", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_ATI"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50421", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50422", 5)}, {{"showGraphic('gfc1',1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50423", 5)}, {{"showGraphic('gfc2',1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50424", 5)}, {{"showGraphic('gfc3',1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50425", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50426", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50427", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_selection"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Scout_2 = SobGroup_CreateShip('Carrier', 'Hgn_Scout')", ""}, {"Camera_FocusSobGroupWithBuffer( 'Carrier', 500, 0, 2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50428", 5)}, {{"scout2_ptr_id = EventPointer_AddSobGroup(Scout_2, 65280, 0.05)", ""},}, {{"Camera_FocusSobGroupWithBuffer (Scout_2, 400, 0, 3)", ""}, {"SobGroup_DeSelectAll()", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50081", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_dragselection"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"EventPointer_Remove(scout2_ptr_id)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50087", 1), HW2_Wait(3)}, {{"Scout_1 = SobGroup_CreateShip('Carrier', 'Hgn_Scout')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50080", 1)}, {{"SobGroup_FillUnion('sob_BothFighters',Scout_1,Scout_2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50083", 1)}, {{"Camera_AltFocus('sob_BothFighters',1)", ""},}, {{"addObjective('selectboth')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50090", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_dragselection_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"SobGroup_DeSelectAll()", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50091", 1)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_rotate"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_AllowSelect(0)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50040", 5)}, {{"UI_FlashButton('NewTaskbar', 'btnShip01', -1)", ""}, {"UI_FlashButton('NewTaskbar', 'btnShip02', -1)", ""},}, {{"UI_ShowScreen('NewTaskbar',1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50097", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50098", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50099", 5)}, {{"UI_StopFlashButton('NewTaskbar', 'btnShip02')", ""}, {"UI_StopFlashButton('NewTaskbar', 'btnShip01')", ""},}, {{"HW2_Wait(2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50031", 5)}, {{"Camera_AllowControl(1)", ""},}, {{"SobGroup_SelectSobGroup(Scout_1)", ""}, {"Camera_FocusSobGroupWithBuffer(Scout_1 , 150, 0, 4)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50032", 5)}, {{"addObjective('rotate')", ""},}, {{"Camera_ResetRotated()", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50033", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_rotate_active"] = {{}, {},}
Events["dialogevent_rotated"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50040", 2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50041", 2)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["dialogevent_basics_end"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_AllowSelect(1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50070", 2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50071", 5)}, {HW2_Wait(1), HW2_SubTitleEvent(Actor_FleetCommand, "$50072", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_zooming"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50042", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50043", 2)}, {{"addObjective('zoom')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_zoomingChecked"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50400", 2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50044", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_panning"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50050", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_panned_little"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50040", 5)}, {{"HW2_Wait(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50051", 5)}, {{"addObjective('pan')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50052", 1)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_panning_active"] = {{},}
Events["intelevent_focus"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50400", 5)}, {{"HW2_Wait(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50054", 1)}, {{"HW2_Wait(2)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50060", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50061", 1)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_focus_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50062", 1), {"HW2_Wait(1)", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_sensors"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50101", 5), {"HW2_Wait(1)", ""},}, {{"UI_FlashButton('NewTaskbar', 'btnSensors', -1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50121", 5)}, {{"addObjective('sensors')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_sensors2"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"UI_StopFlashButton('NewTaskbar', 'btnSensors')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50130", 5)}, {{"scout1_ptr_id = EventPointer_AddSobGroup(Scout_1, 65280, 0.05)", ""}, {"scout2_ptr_id = EventPointer_AddSobGroup(Scout_2, 65280, 0.05)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50131", 5)}, {{"asteroid_ptr_id2 = EventPointer_AddVolume('Asteroid_Volume', 65280, 4.0)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50132", 5), {"EventPointer_Remove(scout1_ptr_id)", ""}, {"EventPointer_Remove(scout2_ptr_id)", ""},}, {{"asteroid_ptr_id = HW2_PingCreateWithLabelPoint ( '$50015', 'Asteroid_Volume' )", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50133", 1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50134", 1)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_sensors2_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50135", 1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50136", 1)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movement"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"completeObjective('exitSM')", ""},}, {{"Sensors_Toggle(0)", ""},}, {{"Camera_AltFocus('sob_BothFighters',1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50140", 5)}, {{"SobGroup_DeSelectAll()", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movement_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50142", 2)}, {{"addObjective('selectascout')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50143", 2)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_relativemove"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"asteroid_ptr_id = HW2_PingCreateWithLabelPoint ( '$50009', 'Asteroid_Volume' )", ""}, {"Ping_AddDescription(asteroid_ptr_id, 0, '$50010')", ""},}, {{"asteroid_ptr_id2 = EventPointer_AddVolume('AsteroidPtr_Volume', 65280, 2.0)", ""}, {"Camera_AltFocusWithVolume('sob_BothFighters',1,'AsteroidPtr_Volume')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50150", 3)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_relativemoveIssued"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50152", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50153", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50154", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_relativemove2"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50160", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50163", 5)}, {{"Camera_ZoomClose(0)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50164", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_relativemove2_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50163", 1)}, {{"Camera_AltFocus(asteroidShip,0)", ""}, {"Camera_ZoomClose(0)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$50164", 1)}, {{"SobGroup_SelectSobGroup(asteroidShip)", ""},}, {{"addObjective('movedisc')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movedisc"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50400", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50170", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50179", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movediscdone"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50173", 5), HW2_Wait(3)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50174", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50175", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50176", 5)}, {{"addObjective('sensors')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movedisc3D"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Universe_MoveRestrictToVolume(1,'MoveHere')", ""}, {"ping_destination_id = HW2_PingCreateWithLabelPoint( ping_destination, 'MoveHere' )", ""},}, {{"completeObjective('sensors')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50430", 5)}, {{"Sensors_FlashWorldPlane(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50431", 5)}, {HW2_Wait(1), {"Sensors_FlashWorldPlane(0)", ""}, {"addObjective('movetoping')", ""},}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movedisc3D_active"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50432", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movedisc3D_shipSelected"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50433", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movedisc3D_moveDiscActiveButLocked"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50434", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50435", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_movedisc3D_moveDiscActiveUnlocked"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50437", 5)}, {}, {}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["intelevent_complete"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Ping_Remove(ping_destination_id)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50180", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50181", 5), HW2_Wait(2)}, {{"UI_SetElementEnabled('InGameMenu', 'm_btnNextTutorial', 0)", ""}, {"setMissionComplete(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$50182", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""},},}
