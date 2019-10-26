-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

DiplomacyScreen = {size = {225, 149, 351, 207}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, pixelUVCoords = 1, ;
	{type = "TextLabel", position = {4, 1}, size = {208, 14}, name = "lblTitle", Text = {textStyle = "IGHeading1", text = "$2900"},},
	{type = "TextLabel", position = {4, 15}, size = {208, 14}, Text = {textStyle = "IGHeading2", text = "$2899", offset = {1, 0},},},
	{type = "Frame", position = {3, 31}, autosize = 1, borderColor = "IGColorOutline", outerBorderWidth = 1, ;
	{type = "Frame", position = {0, 0}, autosize = 1, autoarrange = 1, ;
	{type = "Button", name = "player1", buttonStyle = "DiplomacyScreen_PlayerButtonStyle"},
	{type = "Button", name = "player2", buttonStyle = "DiplomacyScreen_PlayerButtonStyle"},
	{type = "Button", name = "player3", buttonStyle = "DiplomacyScreen_PlayerButtonStyle"},
	{type = "Button", name = "player4", buttonStyle = "DiplomacyScreen_PlayerButtonStyle"},
	{type = "Button", name = "player5", buttonStyle = "DiplomacyScreen_PlayerButtonStyle"},},
	{type = "TextLabel", name = "helpTip", position = {0, 135}, size = {345, 19}, borderWidth = 1, borderColor = "IGColorOutline", Text = {textStyle = "IGHelpTipTextStyle", offset = {4, 0},},},
	{type = "Frame", position = {0, 154}, size = {345, 19}, borderWidth = 1, borderColor = "IGColorOutline", ;
	{type = "TextButton", position = {3, 3}, width = (345 - 6), buttonStyle = "DiplomacyScreen_ButtonStyle", text = "$2642", onMousePressed = "UI_ToggleScreen( 'DiplomacyScreen', 0)", helpTipTextLabel = "helpTip", helpTip = "$2923"},},
	{type = "Frame", position = {219, 0}, size = {126, 135}, borderWidth = 1, borderColor = "IGColorOutline"},},
	{type = "TextButton", name = "requestAlliance", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {225, 34}, width = 120, text = "$2901", helpTipTextLabel = "helpTip", helpTip = "$2914"},
	{type = "TextButton", name = "breakAlliance", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {225, 49}, width = 120, text = "$2902", helpTipTextLabel = "helpTip", helpTip = "$2915"},
	{type = "TextButton", name = "ignoreAlliance", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {225, 64}, width = 120, text = "$2903", helpTipTextLabel = "helpTip", helpTip = "$2916"},
	{type = "TextButton", name = "transferShips", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {225, (64 + 15)}, width = 120, text = "$2908", helpTipTextLabel = "helpTip", helpTip = "$2917"},
	{type = "TextButton", name = "surrenderButton", position = {225, (((64 + 15) + 15) + 6)}, width = 120, buttonStyle = "DiplomacyScreen_ButtonStyle", text = "$2913", onMouseClicked =  [[FE_Retire("UI_HideScreen('DiplomacyScreen')")]], helpTipTextLabel = "helpTip", helpTip = "$2918"},
	{type = "TextLabel", position = {225, (105 + 20)}, autosize = 1, Text = {textStyle = "FEButtonTextStyle", text = "$2909", hAlign = "Left"},},
	{type = "TextButton", name = "donate500", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {(286 - 61), 135}, width = 59, text = "500", helpTipTextLabel = "helpTip", helpTip = "$2919"},
	{type = "TextButton", name = "donate1000", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {286, 135}, width = 59, text = "1000", helpTipTextLabel = "helpTip", helpTip = "$2920"},
	{type = "TextButton", name = "donate5000", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {(286 - 61), 150}, width = 59, text = "5000", helpTipTextLabel = "helpTip", helpTip = "$2921"},
	{type = "TextButton", name = "donateAll", buttonStyle = "DiplomacyScreen_ButtonStyle", position = {286, 150}, width = 59, text = "$2910", helpTipTextLabel = "helpTip", helpTip = "$2922"},}
