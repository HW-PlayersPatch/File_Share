-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

SAVELOAD_WIDTH = 420
SAVELOAD_HEIGHT = 250
SAVELOAD_POSITION = {(400 - (SAVELOAD_WIDTH / 2)), (300 - (SAVELOAD_HEIGHT / 2))}

SaveLoadDialog = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);", onHide = "MainUI_PopEnabledCommandState()", ;
	{type = "Frame", position = {0, 0}, size = {800, 600}, name = "m_frmRoot", backgroundColor = "FEColorBackground2", ;
	{type = "TextListBoxItem", name = "m_listBoxItemToClone", resizeToListBox = 1, width = (SAVELOAD_WIDTH - 31), visible = 0, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, hAlign = "Left", offset = {2, 0},}, overColor = {100, 100, 100, 100}, pressedColor = {100, 100, 100, 150}, helpTipTextLabel = "m_lblHelpText", allowDoubleClicks = 1, soundOnClicked = "SFX_ButtonClick"},
	{type = "Frame", backgroundColor = "FEColorDialog", position = SAVELOAD_POSITION, size = {SAVELOAD_WIDTH, (SAVELOAD_HEIGHT + 1)}, ;
	{type = "Frame", style = "FEPopupBackgroundStyle", position = {2, 2}, size = {(SAVELOAD_WIDTH - 4), 96},},
	{type = "Frame", position = {2, 2}, size = {(SAVELOAD_WIDTH - 4), 31}, ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorPopupOutline", size = {(SAVELOAD_WIDTH - 4), 34},},},
	{type = "Frame", outerBorderWidth = 2, borderColor = "FEColorPopupOutline", position = {4, 34}, autosize = 1, autoarrange = 1, ;
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorPopupOutline", size = {(SAVELOAD_WIDTH - 8), (SAVELOAD_HEIGHT - 93)}, ;
	{type = "ListBox", name = "m_listGames", listBoxStyle = "FEListBoxStyle", position = {2, 0}, size = {(SAVELOAD_WIDTH - 12), (SAVELOAD_HEIGHT - 94)},},
	{type = "Line", lineWidth = 2, p1 = {(SAVELOAD_WIDTH - 25), 0}, p2 = {(SAVELOAD_WIDTH - 25), (SAVELOAD_HEIGHT - 93)}, above = 0, color = "FEColorPopupOutline"},},
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorPopupOutline", size = {(SAVELOAD_WIDTH - 8), 19}, ;
	{type = "TextInput", name = "m_txtInput", position = {2, 3}, width = (SAVELOAD_WIDTH - 12), textInputStyle = "FETextInputStyle", maxTextLength = 64, onAccept = "GiveFocus('m_frmRoot', 'SaveLoadDialog')"},},
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorPopupOutline", size = {(SAVELOAD_WIDTH - 8), 19}, ;
	{type = "TextLabel", name = "m_lblHelpText", size = {(SAVELOAD_WIDTH - 8), 19}, Text = {textStyle = "FEHelpTipTextStyle", vAlign = "Middle", hAlign = "Left", offset = {4, 0},},},},
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorPopupOutline", size = {(SAVELOAD_WIDTH - 8), 18}, ;
	{type = "TextButton", name = "m_btnCancel", position = {(SAVELOAD_WIDTH - 130), 3}, buttonStyle = "FEButtonStyle1", Text = {text = "$2613", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$2613"},
	{type = "TextButton", name = "m_btnDelete", position = {2, 3}, buttonStyle = "FEButtonStyle1", Text = {textStyle = "FEButtonTextStyle", text = "$3572"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3573"},
	{type = "TextButton", name = "m_btnLoadSkirmish", position = {(SAVELOAD_WIDTH - 252), 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$3574", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3575"},
	{type = "TextButton", name = "m_btnLoadCampaign", position = {(SAVELOAD_WIDTH - 252), 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$3576", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3577"},
	{type = "TextButton", name = "m_btnLoadRecorded", position = {(SAVELOAD_WIDTH - 252), 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$3578", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3579"},
	{type = "TextButton", name = "m_btnSaveSkirmish", position = {(SAVELOAD_WIDTH - 252), 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$3580", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3581"},
	{type = "TextButton", name = "m_btnSaveCampaign", position = {(SAVELOAD_WIDTH - 252), 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$3582", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3583"},
	{type = "TextButton", name = "m_btnSaveRecorded", position = {(SAVELOAD_WIDTH - 252), 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$3584", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3585"},},},},
	{type = "Frame", name = "m_frmLoadSkirmish", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3588", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3589", textStyle = "FEHeading4", vAlign = "Middle"},},},
	{type = "Frame", name = "m_frmLoadCampaign", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3590", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3591", textStyle = "FEHeading4", vAlign = "Middle"},},},
	{type = "Frame", name = "m_frmLoadRecorded", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3592", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3593", textStyle = "FEHeading4", vAlign = "Middle"},},},
	{type = "Frame", name = "m_frmSaveSkirmish", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3594", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3595", textStyle = "FEHeading4", vAlign = "Middle"},},},
	{type = "Frame", name = "m_frmSaveCampaign", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3596", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3597", textStyle = "FEHeading4", vAlign = "Middle"},},},
	{type = "Frame", name = "m_frmSaveRecorded", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3598", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3599", textStyle = "FEHeading4", vAlign = "Middle"},},},},}
