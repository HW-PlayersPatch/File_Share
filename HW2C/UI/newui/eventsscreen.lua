-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

SCREENWIDTH = 200
SCREENHEIGHT = 100
BOTTOMYPOS = 497

EventsScreen = {size = {2, (BOTTOMYPOS - 2), SCREENWIDTH, 2}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, soundOnShow = "SFX_RecallMenuONOFF", soundOnHide = "SFX_RecallMenuONOFF", RootElementSettings = {autosize = 1}, Regions = {{0, 0, 22, -1},}, bottomYPos = BOTTOMYPOS, ;
	{type = "Frame", position = {0, 0}, maxSize = {SCREENWIDTH, SCREENHEIGHT}, size = {SCREENWIDTH, 2}, name = "listEvents", autosize = 1, autoarrange = 1, autoarrangeWidth = SCREENWIDTH},
	{type = "Frame", name = "listItem", autosize = 1, visible = 0, ;
	{type = "Button", position = {4, 1}, size = {13, 15}, name = "icon", BackgroundGraphic = {size = {13, 13}, texture = "DATA:UI\\NewUI\\Taskbar\\eventicon.tga", textureUV = {0, 0, 20, 20}, color = {200, 200, 0, 255},}, OverGraphic = {size = {13, 13}, texture = "DATA:UI\\NewUI\\Taskbar\\eventicon.tga", textureUV = {0, 0, 20, 20}, color = {255, 255, 0, 255},}, helpTip = "$5456", helpTipScreen = "NewTaskbar", helpTipTextLabel = "commandsHelpTip"},
	{type = "TextLabel", name = "text", position = {22, 2}, size = {(SCREENWIDTH - 28), 13}, wrapping = 1, autosize = 1, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left"},},},
	{type = "Frame", name = "listObjectiveItem", autosize = 1, visible = 0, ;
	{type = "Button", position = {4, 1}, size = {13, 15}, name = "icon", BackgroundGraphic = {size = {13, 13}, texture = "DATA:UI\\NewUI\\Taskbar\\eventicon.tga", textureUV = {0, 0, 20, 20}, color = {0, 100, 200, 255},}, OverGraphic = {size = {13, 13}, texture = "DATA:UI\\NewUI\\Taskbar\\eventicon.tga", textureUV = {0, 0, 20, 20}, color = {0, 175, 255, 255},}, helpTip = "$5457", helpTipScreen = "NewTaskbar", helpTipTextLabel = "commandsHelpTip"},
	{type = "TextLabel", name = "text", position = {22, 2}, size = {(SCREENWIDTH - 28), 13}, wrapping = 1, autosize = 1, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left"},},},}
