-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

PlayerLaggingScreen = {size = {225, 2, 351, 79}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, pixelUVCoords = 1, fstringMessage = "$2840", ;
	{type = "Frame", position = {3, 3}, autosize = 1, borderColor = "IGColorOutline", outerBorderWidth = 1, ;
	{type = "TextLabel", position = {0, 0}, size = {345, 54}, borderWidth = 1, borderColor = "IGColorOutline", name = "message", wrapping = 1, marginWidth = 8, marginHeight = 8, Text = {font = "ButtonFont", color = {255, 255, 255, 255}, hAlign = "Center", vAlign = "Top"},},
	{type = "Frame", position = {0, 54}, size = {345, 19}, borderWidth = 1, borderColor = "IGColorOutline", ;
	{type = "TextButton", position = {3, 3}, width = 120, buttonStyle = "DiplomacyScreen_ButtonStyle", Text = {text = "$2841"}, name = "btnKick", onMouseClicked = "UI_ToggleScreen('PlayerLaggingScreen', 0)"},
	{type = "TextButton", position = {222, 3}, width = 120, buttonStyle = "DiplomacyScreen_ButtonStyle", Text = {text = "$2843"}, name = "btnClose", onMouseClicked = "UI_ToggleScreen( PlayerLaggingScreen', 0)"},},},
	{type = "TextLabel", position = {-25, 40}, hAlign = "Right", size = {200, 13}, Text = {font = "ButtonFont", color = {255, 255, 255, 255}, hAlign = "Right", text = "$2842"},},
	{type = "Button", buttonStyle = "IGCheckBoxStyle", position = {330, 40}, name = "btnNoMore"},}
