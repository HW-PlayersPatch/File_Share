-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

SubtitleScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", clickThrough = 1, RootElementSettings = {DisabledGraphic = {size = {800, 600}, texture = "DATA:UI\\NewUI\\clearBG.tga", textureUV = {0, 0, 1, 1},},}, ;
	{type = "TextButton", toggleButton = 0, position = {690, 480}, buttonStyle = "Taskbar_PanelButtonStyle", Text = {text = "$3614", textStyle = "Taskbar_PanelButtonTextStyle"}, name = "btnSubtitleOk", onMouseClicked = "MainUI_UserEvent( eSubtitleOk )", visible = 0},
	{type = "Frame", name = "Region0_Frame", position = {0, 0}, size = {800, 600}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "Region0_Text", position = {0, 0}, size = {800, 600}, Text = {textStyle = "SubtitleSPTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Left", text = "Region 0 text"}, wrapping = 1, dropShadow = 1, visible = 0},},
	{type = "Frame", name = "Region1_Frame", position = {8, 17}, size = {755, 63}, giveParentMouseInput = 1, ;
	{type = "Frame", name = "Region1_Icon", position = {0, 0}, size = {100, 50}, BackgroundGraphic = {size = {100, 50}, texture = "DATA:UI\\logo.tga", textureUV = {0, 0, 1, 1},}, visible = 0},
	{type = "TextLabel", name = "Region1_Text", position = {104, 0}, size = {651, 63}, Text = {textStyle = "SubtitleSPTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Left", text = "Region 1 text"}, wrapping = 1, dropShadow = 1, visible = 0},
	{type = "TextLabel", name = "Region1_TextNarrow", position = {104, 0}, size = {439, 63}, Text = {textStyle = "SubtitleSPTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Left", text = "Region 1 text narrow"}, wrapping = 1, dropShadow = 1, visible = 0},},
	{type = "Frame", name = "Region2_Frame", position = {25, 450}, size = {750, 50}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "Region2_Text", position = {0, 0}, size = {750, 50}, Text = {textStyle = "SubtitleGenericTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Left", text = "Region 2 text"}, wrapping = 1, dropShadow = 1, visible = 0},},
	{type = "Frame", name = "Region3_Frame", position = {0, 481}, size = {800, 19}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "Region3_Text", position = {0, 0}, size = {800, 19}, Text = {textStyle = "SubtitleLocationCardTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Center", text = "Region 3 text"}, wrapping = 1, dropShadow = 1, visible = 0},},
	{type = "Frame", name = "Region4_Frame", position = {214, 482}, size = {370, 50}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "Region4_Text", position = {0, 0}, size = {370, 50}, Text = {textStyle = "SubtitleSPTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Center", text = "Region 4 text"}, wrapping = 1, dropShadow = 1, visible = 0},},
	{type = "Frame", name = "Region5_Frame", position = {0, 100}, size = {800, 19}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "Region5_Text", position = {0, 0}, size = {800, 19}, Text = {textStyle = "SubtitleSPTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Center", text = "Region 5 text"}, wrapping = 1, dropShadow = 1, visible = 0},},
	{type = "Frame", name = "Region6_Frame", position = {8, 17}, size = {755, 63}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "Region6_Text", position = {45, 0}, size = {710, 63}, Text = {textStyle = "SubtitleSPTextStyle", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Left", text = "Region 6 text"}, wrapping = 1, dropShadow = 1, visible = 0},},}
