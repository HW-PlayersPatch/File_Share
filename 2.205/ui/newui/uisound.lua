feSoundRoot = "data:sound/sfx/ui/frontend/"
gamespaceSoundRoot = "data:sound/sfx/ui/game_space/"

-------------------------------------------------------------------------------
-- GENERIC WIDGET HOOKUPS
-------------------------------------------------------------------------------

-- All buttons have a click sound
SFX_ButtonClick = {
	filename = feSoundRoot.."Mouseexitbuttonstyle2",
}

-- All Menu and NavBar (Back, Start, Ok, Cancel) have mouse enter
SFX_ButtonEnter = {
	filename = feSoundRoot.."Mouseoverbuttonstyle1",
}

-- Tabs (eg. in the options menu) have an enter, but no click
SFX_TabEnter = {
	filename = SFX_ButtonEnter.filename,
}

SFX_DropDownListEnter = {	
	filename = SFX_ButtonEnter.filename,
}

SFX_DropDownListClick = {
	filename = SFX_ButtonClick.filename,
}

-- Scroll buttons have clicks only
SFX_ScrollButtonClick = {
	filename = feSoundRoot.."Scrollbarmousebuttonreleasedinpageupdownspace",
}

-- Sound on page up / down of the scrollbar
SFX_ScrollBarPage = {
	filename = SFX_ScrollButtonClick.filename, -- Same as scroll button
}

-- Sliders in the options screen have clicks only
-- These are the same as the scrollbar (come talk to me if you want them to be different [randy]
--SFX_SliderButtonClick = {
--	filename = feSoundRoot..SFX_ButtonClick.filename,
--}

SFX_TextInputClicked  = {
	filename = SFX_ButtonClick.filename,
}

-- Sound plays when enter is pressed in a text input
SFX_TextInputAccept = {
	filename = feSoundRoot.."Selectitemfromdropdownlist", -- just to be obvious
}

SFX_ListBoxItemEnter = {
	filename = SFX_ButtonEnter.filename,
}

SFX_ListBoxItemClick ={
	filename = SFX_ButtonClick.filename,
}

SFX_CheckBoxUnchecked = {
	filename = feSoundRoot.."keytypedintotextentry",
}

SFX_CheckBoxChecked = {
	filename = feSoundRoot.."Keytypedintotextentry",
}




-------------------------------------------------------------------------------
-- SPECIAL CASES - WIDGET HOOKUPS
-------------------------------------------------------------------------------

-- When selecting a mission
SFX_MissionSelectClick = {
	filename = SFX_ButtonClick.filename,
}

-- Sound when game type info button (? button in MP game) is clicked
SFX_GameInfoClicked = {
	filename = SFX_ButtonClick.filename,
}

-- When the ready button is checked in the MP GameSetup screen
SFX_ReadyButtonChecked = {
	filename =SFX_CheckBoxChecked.filename,
}
SFX_ReadyButtonUnchecked = {
	filename =SFX_CheckBoxUnchecked.filename,
}

-- Mouse enter for facility tabs in build and research manager
SFX_FacilityTabEnter = {
	filename = SFX_ButtonEnter.filename,
}

SFX_TaskbarControlGroupsEnter = {
	filename = SFX_ButtonEnter.filename,
}

-- when a build item is clicked (no enter sound for these)
SFX_BuildItemClick = {
	filename = SFX_ButtonClick.filename,
}
SFX_ResearchItemClick = {
	filename = SFX_ButtonClick.filename,
}

SFX_RightClickMenuClick = {
	filename = SFX_ButtonClick.filename,
}
--SFX_RightClickMenuPopup = {
--	
--}




-------------------------------------------------------------------------------
-- SPECIAL CASES - SCREEN SOUNDS
-------------------------------------------------------------------------------

SFX_ATIToggle = {
	filename = gamespaceSoundRoot.."TOGGLEFORWARDBACKTACTICAL",
}

-- menu-specific toggle sounds:

-- F10 menu
SFX_GameMenuONOFF = {
	--filename = feSoundRoot.."GAMEMENUONOFF",
	--filename = feSoundRoot.."BuildMenuONOFF",
	filename = feSoundRoot.."Mouseexitbuttonstyle2",
}


SFX_ErrorMessage = {
	filename = feSoundRoot.."Errormessagepopup",
}

SFX_BuildMenuONOFF = {
	--filename = feSoundRoot.."BUILDMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_LaunchMenuONOFF = {
	--filename = feSoundRoot.."LAUNCHMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_ChatMenuONOFF = {
	--filename = feSoundRoot.."CHATMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_ObjectiveMenuONOFF = {
	--filename = feSoundRoot.."OBJECTIVEMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_ResearchMenuONOFF = {
	--filename = feSoundRoot.."RESEARCHMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_RightClickMenuONOFF = {
	--filename = feSoundRoot.."RIGHTCLICKMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_RecallMenuONOFF = {
	--filename = feSoundRoot.."SPEECHRECALLMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_TaksbarMenuONOFF = {
	--filename = feSoundRoot.."TASKBARMENUONOFF",
	filename = SFX_GameMenuONOFF.filename,
}

SFX_GlobalQueueONOFF = {
	filename = SFX_GameMenuONOFF.filename,
}



-------------------------------------------------------------------------------
-- TODO
-------------------------------------------------------------------------------
--are these hookued up, i doubt it?
SFX_Chatmessagereceived = {
	filename = feSoundRoot.."Chatmessagereceived",
}

SFX_Privatechatmessagereceived = {
	filename = feSoundRoot.."Privatechatmessagereceived",
}

SFX_Playerjoinschatroom = {
	filename = feSoundRoot.."Playerjoinschatroom",
}

SFX_Playerleaveschatroom = {
	filename = feSoundRoot.."Playerleaveschatroom",
}

SFX_Playerkickedfromchatroom = {
	filename = feSoundRoot.."Playerkickedfromchatroom",
}

SFX_Playerkickedfromchatroom = {
	filename = feSoundRoot.."Playerkickedfromchatroom",
}


