-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

GameFilterScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = "FEColorBackground2"}, ;
	{type = "Frame", position = {(400 - (550 / 2)), 200}, size = {550, 137}, backgroundColor = "FEColorDialog", ;
	{type = "Frame", position = {4, 4}, size = {542, 100}, style = "FEPopupBackgroundStyle"},
	{type = "Frame", position = {2, 2}, size = {546, 32}, ;
	{type = "Frame", size = {546, 34}, borderWidth = 2, borderColor = "FEColorPopupOutline"},},
	{type = "TextLabel", position = {10, 2}, size = {320, 13}, Text = {textStyle = "FEHeading3", text = "$3050"},},
	{type = "TextLabel", position = {10, 17}, size = {320, 10}, Text = {textStyle = "FEHeading4", text = "$3051"},},
	{type = "Frame", outerBorderWidth = 2, position = {4, 33}, size = {542, 100}, borderColor = "FEColorPopupOutline", ;
	{type = "TextLabel", position = {10, 7}, size = {100, 10}, Text = {textStyle = "FEHeading4", text = "$3052"},},
	{type = "TextInput", textInputStyle = "FETextInputStyle", position = {10, 20}, width = 100, name = "txtInputNameFilter", helpTipTextLabel = "helpTip", helpTip = "$3053"},
	{type = "TextLabel", position = {115, 7}, size = {100, 10}, Text = {textStyle = "FEHeading4", text = "$3054"},},
	{type = "TextInput", textInputStyle = "FETextInputStyle", position = {115, 20}, width = 100, name = "txtInputMapFilter", helpTipTextLabel = "helpTip", helpTip = "$3055"},
	{type = "TextLabel", position = {220, 7}, size = {100, 10}, Text = {textStyle = "FEHeading4", text = "$3046"},},
	{type = "TextInput", textInputStyle = "FETextInputStyle", position = {220, 20}, width = 100, name = "txtInputModeFilter", helpTipTextLabel = "helpTip", helpTip = "$3047"},
	{type = "TextLabel", position = {325, 7}, size = {100, 10}, Text = {textStyle = "FEHeading4", text = "$3048"},},
	{type = "TextInput", textInputStyle = "FETextInputStyle", position = {325, 20}, width = 100, name = "txtInputMaxPlayersFilter", helpTipTextLabel = "helpTip", helpTip = "$3049"},
	{type = "TextLabel", position = {430, 7}, size = {100, 10}, Text = {textStyle = "FEHeading4", text = "$3056"},},
	{type = "TextInput", textInputStyle = "FETextInputStyle", position = {430, 20}, width = 100, name = "txtInputPingFilter", helpTipTextLabel = "helpTip", helpTip = "$3057"},
	{type = "Line", p1 = {0, 64}, p2 = {550, 64}, lineWidth = 2, color = "FEColorPopupOutline", above = 1},
	{type = "TextLabel", name = "helpTip", position = {4, 66}, size = {542, 13}, Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", p1 = {0, 83}, p2 = {550, 83}, lineWidth = 2, color = "FEColorPopupOutline", above = 1}, {visible = 1, type = "TextButton", position = {(542 - 122), 85}, buttonStyle = "FEButtonStyle1", name = "btnBack", Text = {textStyle = "FEButtonTextStyle", text = "$2613"}, onMouseClicked =  [[UI_SetScreenVisible("GameFilterScreen", 0);]], helpTipTextLabel = "helpTip", helpTip = "$2613"}, {visible = 1, type = "TextButton", position = {(542 - 244), 85}, buttonStyle = "FEButtonStyle2", name = "btnAccept", Text = {textStyle = "FEButtonTextStyle", text = "$2612"}, helpTipTextLabel = "helpTip", helpTip = "$2612"}, {visible = 1, type = "TextButton", position = {215, 41}, buttonStyle = "FEButtonStyle1", name = "btnClear", Text = {textStyle = "FEButtonTextStyle", text = "$3060"}, helpTipTextLabel = "helpTip", helpTip = "$3058"},},},}
