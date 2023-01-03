-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

StrikeGroupsMenu = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", claimMousePress = 1, RootElementSettings = {onMouseClicked = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)"}, pixelUVCoords = 1,
	onShow =  [[UI_SetButtonPressed('NewTaskbar', 'btnStrike', 1); UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnForm1', '$2735', 28); UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnForm2', '$2736', 29); UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnForm3', '$2737', 30); UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnLeave', '$3135', 31); ]],
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnStrike', 0)", ;
	{type = "Frame", name = "rootFrame", position = {0, 0}, size = {800, 600}, giveParentMouseInput = 1, ;
	{type = "Frame", name = "menu", position = {79, (448 - 14)}, size = {138, (65 + 14)}, backgroundColor = "IGColorBackground1", ;
	{type = "TextLabel", position = {-2, 0}, size = {144, 18}, borderColor = {170, 227, 255, 255}, borderWidth = 2, Text = {textStyle = "IGHeading2", hAlign = "Left", offset = {8, 0}, color = {255, 255, 255, 255}, text = "$2734"},},
	{type = "TextButton", buttonStyle = "RightClickMenu_ButtonStyle", name = "btnForm1", toggleButton = 0, position = {2, 21}, size = {133, 12}, Text = {font = "ButtonFont", hAlign = "Left", offset = {4, 0}, text = "$2735"}, onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", hotKeyID = 28},
	{type = "TextButton", buttonStyle = "RightClickMenu_ButtonStyle", name = "btnForm2", toggleButton = 0, position = {2, 35}, size = {133, 12}, Text = {font = "ButtonFont", hAlign = "Left", offset = {4, 0}, text = "$2736"}, onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", hotKeyID = 29},
	{type = "TextButton", buttonStyle = "RightClickMenu_ButtonStyle", name = "btnForm3", toggleButton = 0, position = {2, 49}, size = {133, 12}, Text = {font = "ButtonFont", hAlign = "Left", offset = {4, 0}, text = "$2737"}, onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", hotKeyID = 30},
	{type = "TextButton", buttonStyle = "RightClickMenu_ButtonStyle", name = "btnLeave", toggleButton = 0, position = {2, 63}, size = {133, 12}, Text = {font = "ButtonFont", hAlign = "Left", offset = {4, 0}, text = "$3165"}, onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", hotKeyID = 31},},
	{type = "Frame", name = "menu", position = {80, 514}, size = {72, 19}, onMouseClicked = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)"},},}
