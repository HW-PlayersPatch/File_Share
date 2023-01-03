-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

FRM_SPACER = {type = "Frame", size = {240, 13},}
BTN_SAVEGAME = {type = "TextButton", buttonStyle = "FEButtonStyle1", name = "m_btnSave", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5564"}, helpTip = "$5550", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_SaveGameScreen()"}
BTN_LOADGAME = {type = "TextButton", name = "m_btnLoad", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5565"}, helpTip = "$5551", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_LoadGameScreen()"}
BTN_SAVEGAME_CAMPAIGN = {type = "TextButton", buttonStyle = "FEButtonStyle1", name = "m_btnSaveCampaign", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5566"}, helpTip = "$5552", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_SaveGameScreen_Campaign()"}
BTN_LOADGAME_CAMPAIGN = {type = "TextButton", name = "m_btnLoadCampaign", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5567"}, helpTip = "$5553", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_LoadGameScreen_Campaign()"}
BTN_LOADGAME_RECORDED = {type = "TextButton", name = "m_btnLoadRecorded", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5568"}, helpTip = "$5554", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_LoadGameScreen_Recorded()"}
BTN_OPTIONS = {type = "TextButton", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5569"}, helpTip = "$5555", helpTipTextLabel = "m_lblHelpText", onMouseClicked =  [[UI_SetScreenEnabled("InGameOptions", 1); UI_ShowScreen("InGameOptions", ePopup); ]]}
BTN_EXITTOWINDOWS = {type = "TextButton", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5570"}, helpTip = "$5556", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "MainUI_UserEvent( eExit )"}
BTN_EXITTOMAINMENU = {type = "TextButton", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5571"}, helpTip = "$5557", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_ExitToMainMenu();"}
BTN_ENDCURRENTGAME = {type = "TextButton", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5579"}, helpTip = "$5559", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_ExitToMainMenu();"}
BTN_SKIRMISH_STATS = {type = "TextButton", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5579"}, helpTip = "$5559", helpTipTextLabel = "m_lblHelpText", onMouseClicked =  [[FE_Retire("MainUI_UserEvent(eMenu)")]]}
BTN_RETIRE = {type = "TextButton", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5572"}, helpTip = "$5558", helpTipTextLabel = "m_lblHelpText", onMouseClicked =  [[FE_Retire("MainUI_UserEvent(eMenu)")]]}
BTN_RETURNTOGAME = {type = "TextButton", buttonStyle = "FEButtonStyle2", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5573"}, helpTip = "$5559", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "MainUI_UserEvent(eMenu);"}
BTN_NEXTTUTORIAL = {type = "TextButton", name = "m_btnNextTutorial", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5574"}, helpTip = "$5560", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_NextTutorial()"}
BTN_RESTARTTUTORIAL = {type = "TextButton", name = "m_btnRestartTutorial", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5575"}, helpTip = "$5561", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_RestartGame(1)"}
BTN_RESTARTMISSION = {type = "TextButton", name = "m_btnRestartMission", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5576"}, helpTip = "$5562", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_RestartGame(1)"}
BTN_RESTARTMISSION2 = {type = "TextButton", name = "m_btnRestartMission2", buttonStyle = "FEButtonStyle2", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5576"}, helpTip = "$5562", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_RestartGame(0)"}
BTN_RESTART = {type = "TextButton", name = "m_btnRestart", buttonStyle = "FEButtonStyle1", width = 240, Text = {textStyle = "FEButtonTextStyle", text = "$5576"}, helpTip = "$5563", helpTipTextLabel = "m_lblHelpText", onMouseClicked = "FE_RestartGame(1)"}
InGameMenu = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "FEColorBackground2"}, pixelUVCoords = 1, soundOnShow = "SFX_GameMenuONOFF", soundOnHide = "SFX_GameMenuONOFF", ;
	{type = "Frame", position = {274, 179}, backgroundColor = "FEColorDialog", autosize = 1, ;
	{type = "Frame", outerBorderWidth = 2, position = {4, 4}, size = {244, 28}, borderColor = "FEColorPopupOutline", style = "FEPopupBackgroundStyle"},
	{type = "TextLabel", position = {0, 2}, size = {200, 18}, Text = {textStyle = "FEHeading3", text = "$5577", offset = {8, 0}, vAlign = "Top"},}, {position = {0, 17}, type = "TextLabel", name = "m_lblSubTitle", size = {200, 10}, Text = {textStyle = "FEHeading4", text = "$5578", offset = {8, 0},},},
	{type = "Frame", name = "frmButtonGroup", position = {0, 30}, autosize = 1, autoarrange = 1, autoarrangeSpace = 4},},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_PlayerVsCpu", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_SAVEGAME, BTN_LOADGAME, BTN_OPTIONS, BTN_EXITTOWINDOWS, BTN_EXITTOMAINMENU, BTN_SKIRMISH_STATS, BTN_RESTART, FRM_SPACER, BTN_RETURNTOGAME},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_PlayerVsCpuFailed", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_LOADGAME, BTN_OPTIONS, BTN_SKIRMISH_STATS, BTN_EXITTOWINDOWS, BTN_RESTART, FRM_SPACER, BTN_RETURNTOGAME},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_Campaign", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_RESTARTMISSION, BTN_SAVEGAME_CAMPAIGN, BTN_LOADGAME_CAMPAIGN, BTN_OPTIONS, BTN_EXITTOMAINMENU, BTN_EXITTOWINDOWS, FRM_SPACER, BTN_RETURNTOGAME},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_CampaignFailed", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_LOADGAME_CAMPAIGN, BTN_EXITTOMAINMENU, BTN_EXITTOWINDOWS, FRM_SPACER, BTN_RESTARTMISSION2},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_Multiplayer", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_OPTIONS, BTN_RETIRE, BTN_EXITTOWINDOWS, FRM_SPACER, BTN_RETURNTOGAME},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_MultiplayerFailed", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_OPTIONS, BTN_ENDCURRENTGAME, BTN_EXITTOWINDOWS, FRM_SPACER, BTN_RETURNTOGAME},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_Tutorial", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_NEXTTUTORIAL, BTN_RESTARTTUTORIAL, BTN_OPTIONS, BTN_EXITTOMAINMENU, BTN_EXITTOWINDOWS, FRM_SPACER, BTN_RETURNTOGAME},
	{type = "Frame", outerBorderWidth = 2, name = "frmButtons_RecordedGame", borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, visible = 0, ;
	BTN_OPTIONS, BTN_EXITTOWINDOWS, BTN_EXITTOMAINMENU, FRM_SPACER, BTN_RETURNTOGAME},}
