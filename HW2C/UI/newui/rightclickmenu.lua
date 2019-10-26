-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

RightClickMenu = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", claimMousePress = 1, pixelUVCoords = 1, ;
	{type = "Frame", name = "menu", position = {0, 0}, autosize = 1, autoarrange = 1, visible = 1, backgroundColor = "IGColorBackground1"},
	{type = "Frame", name = "subMenu", position = {0, 0}, autosize = 1, autoarrange = 1, visible = 0, backgroundColor = "IGColorBackground1"},
	{type = "TextLabel", name = "menuLabel", position = {0, 0}, size = {130, 13}, wrapping = 1, autosize = 1, visible = 0, Text = {textStyle = "RightClickMenu_ButtonTextStyle", hAlign = "Left", color = {255, 255, 255, 255},},},
	{type = "Frame", name = "menuItem", autosize = 1, visible = 0, ;
	{type = "TextButton", name = "text", buttonStyle = "RightClickMenu_ButtonStyle", position = {0, 0}, size = {130, 13}, Text = {textStyle = "RightClickMenu_ButtonTextStyle", hAlign = "Left", offset = {3, 0},}, ;
	{type = "Frame", name = "rightarrow", position = {120, 1}, size = {11, 9}, visible = 0, BackgroundGraphic = {size = {11, 9}, texture = "DATA:UI\\NewUI\\InGameIcons\\menuarrow.tga", textureUV = {0, 0, 11, 9},},},},},}
