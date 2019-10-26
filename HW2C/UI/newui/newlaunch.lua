-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

OUTLINECOLOR = {83, 202, 0, 255}

NewLaunchMenu = {size = {586, 15, 212, 497}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, soundOnShow = "SFX_LaunchMenuONOFF", soundOnHide = "SFX_LaunchMenuONOFF", shipHealthColor = {0, 255, 0, 255}, pixelUVCoords = 1, onShow = "UI_SubtitleNarrow()", onHide = "UI_SubtitleWide()", fstringDockedCount = "$2667", drawToShipLineWidth = 2, drawToShipLineStubLength = 10, drawToShipLineColor = OUTLINECOLOR, drawToShipLineElement = "btnPrev", ;
	{type = "Line", p1 = {0, 144}, p2 = {210, 144}, above = 1, lineWidth = 2, color = OUTLINECOLOR},
	{type = "Line", p1 = {210, 2}, p2 = {210, 495}, above = 0, lineWidth = 2, color = OUTLINECOLOR},
	{type = "Line", p1 = {189, 144}, p2 = {189, 441}, above = 1, lineWidth = 2, color = OUTLINECOLOR},
	{type = "Line", p1 = {0, 441}, p2 = {210, 441}, above = 1, lineWidth = 2, color = OUTLINECOLOR},
	{type = "Line", p1 = {0, 460}, p2 = {210, 460}, above = 1, lineWidth = 2, color = OUTLINECOLOR},
	{type = "Line", p1 = {0, 495}, p2 = {210, 495}, above = 1, lineWidth = 2, color = OUTLINECOLOR},
	{type = "TextLabel", name = "helpTipTextLabel", position = {0, 441}, size = {210, 19}, marginWidth = 6, Text = {textStyle = "IGHeading2", hAlign = "Left", color = {255, 255, 255, 255},},},
	{type = "TextLabel", position = {0, 2}, size = {210, 19}, name = "lblTitle", Text = {textStyle = "IGHeading1", text = "$2660", offset = {4, 0}, color = {0, 0, 0, 255},}, backgroundColor = OUTLINECOLOR, ;
	{type = "Button", position = {193, 2}, buttonStyle = "IGCloseButton", onMouseClicked = "UI_HideScreen('NewLaunchMenu')", helpTip = "$5221", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", hotKeyID = 53},},
	{type = "Frame", position = {3, 35}, size = {200, 64}, name = "frameShipGraphic", backgroundGraphicHAlign = "Center", backgroundGraphicVAlign = "Center", helpTip = "$5217", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "ProgressBar", backgroundColor = {0, 128, 0, 255}, progressColor = {0, 255, 0, 255}, borderColor = {0, 0, 0, 255}, outerBorderWidth = 1, position = {57, 88}, size = {100, 2}, name = "launchShipHealth"},
	{type = "Button", name = "btnPrev", buttonStyle = "IGPrevButton", toggleButton = 0, position = {2, 23}, OverGraphic = {texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.mres", textureUV = {0, 31, 13, 103}, color = OUTLINECOLOR}, helpTip = "$5219", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "DropDownListBox", dropDownListBoxStyle = "IGDropDownListBoxStyle", position = {17, 23}, width = 174, visible = 1, name = "launchShipList", ListBox = {type = "ListBox", name = "comboBuildShipListBox", size = {174, 130}, backgroundColor = "IGColorBackground1"}, helpTip = "$5216", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", name = "btnNext", toggleButton = 0, buttonStyle = "IGNextButton", position = {193, 23}, OverGraphic = {texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.mres", textureUV = {13, 31, 0, 103}, color = OUTLINECOLOR}, helpTip = "$5218", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "TextListBoxItem", buttonStyle = "IGListBoxItemButtonStyle", name = "launchShipItem", visible = 0, enabled = 0, width = 160, Text = {textStyle = "IGListBoxItemTextStyle"},},
	{type = "Frame", position = {2, 112}, size = {204, 28}, ;
	{type = "RadioButton", name = "stayDockedButton", position = {0, 0}, size = {193, 13}, buttonStyle = "IGRadioButtonStyle", Text = {text = "$2662", textStyle = "IGRadioButtonTextStyle"}, PressedGraphic = {size = {13, 13}, texture = "data:ui\\newui\\elements\\radio_button.mres", textureUV = {14, 0, 27, 13}, color = OUTLINECOLOR}, helpTip = "$5222", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "RadioButton", name = "autoLaunchButton", position = {0, 15}, size = {193, 13}, buttonStyle = "IGRadioButtonStyle", Text = {text = "$2663", textStyle = "IGRadioButtonTextStyle"}, PressedGraphic = {size = {13, 13}, texture = "data:ui\\newui\\elements\\radio_button.mres", textureUV = {14, 0, 27, 13}, color = OUTLINECOLOR}, helpTip = "$5223", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},},
	{type = "Frame", size = {210, 13}, position = {0, 97}, backgroundColor = OUTLINECOLOR, ;
	{type = "TextLabel", position = {2, 0}, size = {158, 13}, marginWidth = 6, Text = {textStyle = "IGHeading2", text = "$2666", color = {0, 0, 0, 255},},},
	{type = "TextLabel", name = "dockedCountLabel", position = {160, 0}, size = {50, 13}, Text = {textStyle = "IGHeading2", hAlign = "Right", offset = {-4, 0}, color = {0, 0, 0, 255},},},},
	{type = "ListBox", position = {2, 144}, size = {204, 295}, name = "dockedShipList", multiSelect = 1, helpTip = "$5220", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "ListBoxItem", visible = 0, buttonStyle = "Taskbar_ShipButtonStyle", name = "dockedShipItem", helpTipTextLabel = "helpTipTextLabel"},
	{type = "TextButton", name = "launchButton", position = {2, 462}, size = {204, 13}, buttonStyle = "IGButtonStyle1NoEnterSound", Text = {text = "$2664", textStyle = "IGButtonTextStyle"}, helpTip = "$5225", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "TextButton", name = "launchAllButton", position = {2, 477}, size = {204, 13}, buttonStyle = "IGButtonStyle1NoEnterSound", Text = {text = "$2665", textStyle = "IGButtonTextStyle"}, helpTip = "$5224", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},}
