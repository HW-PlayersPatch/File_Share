-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

ResourceMenu = {size = {586, 0, 214, 14}, stylesheet = "HW2StyleSheet", clickThrough = 1, pixelUVCoords = 1, onUpdate = [[UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() )); ]], ;
	{type = "Frame", position = {0, 0}, size = {214, 13}, backgroundColor = "IGColorBackground1", ;
	{type = "Frame", position = {(214 - 13), 0}, size = {13, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\ru_icon.mres", textureUV = {0, 0, 13, 13}, color = OUTLINECOLOR},},
	{type = "TextLabel", position = {0, 0}, size = {128, 13}, name = "lblResourceUnitsStaticText", Text = {text = "$2800", textStyle = "IGHeading2", offset = {4, 0},},},
	{type = "TextLabel", position = {(138 - 13), 0}, size = {74, 13}, name = "lblResourceUnits", Text = {textStyle = "IGHeading2", hAlign = "Right", offset = {-2, 0}, color = "FEColorHeading3"},},},}
