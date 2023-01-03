-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

SpeechRecall = {size = {225, 119, 351, 266}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, soundOnShow = "SFX_ObjectiveMenuONOFF", soundOnHide = "SFX_ObjectiveMenuONOFF", pixelUVCoords = 1, ;
	{type = "TextLabel", position = {4, 1}, size = {208, 14}, name = "lblTitle", Text = {textStyle = "IGHeading1", text = "$2940"},},
	{type = "TextLabel", position = {4, 16}, size = {208, 13}, name = "lblSubtitle", Text = {textStyle = "IGHeading2", text = "$2941"},},
	{type = "Frame", position = {3, 31}, autosize = 1, borderColor = "IGColorOutline", outerBorderWidth = 1, ;
	{type = "ListBox", listBoxStyle = "FEBorderListBoxStyle", position = {0, 0}, size = {345, (174 + 39)}, name = "listSpeech", hugBottom = 1},
	{type = "Line", p1 = {325, 0}, p2 = {325, (174 + 39)}, lineWidth = 2, color = "IGColorOutline"},
	{type = "Frame", position = {0, (193 + 20)}, size = {345, 19}, borderWidth = 1, borderColor = "IGColorOutline", ;
	{type = "TextButton", position = {3, 3}, width = (345 - 6), buttonStyle = "DiplomacyScreen_ButtonStyle", Text = {text = "$2642"}, onMousePressed = "UI_ToggleScreen( 'SpeechRecall', 0)"},},},
	{type = "ListBoxItem", name = "listItem", autosize = 1, visible = 0, marginHeight = 2, ;
	{type = "Frame", position = {0, 1}, size = {16, 8}, name = "icon"},
	{type = "TextLabel", name = "text", position = {18, 0}, size = {294, 13}, wrapping = 1, autosize = 1, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left"},},},}
