-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

LoadingScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = {0, 0, 0, 255},}, ;
	{type = "Frame", position = {0, 100}, size = {800, 400}, name = "bgImage", BackgroundGraphic = {size = {800, 400}, texture = "DATA:UI/NewUI/Background/load_background.mres", textureUV = {0, 56, 800, 455},}, ;
	{type = "Frame", position = {14, 378}, size = {772, 16}, outerBorderWidth = 2, borderColor = {107, 149, 172, 255}, backgroundColor = {0, 0, 0, 50},},
	{type = "ProgressBar", progressColor = {240, 170, 0, 255}, position = {16, 380}, size = {768, 12}, name = "loadingProgress"},},
	{type = "TextLabel", name = "moduleLabel", position = {0, 550}, size = {800, 50}, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, vAlign = "Middle", hAlign = "Center"},},
	{type = "TextLabel", name = "titleLabel1", visible = 0, size = {800, 50}, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, vAlign = "Middle", hAlign = "Left"},},
	{type = "TextLabel", name = "titleLabel2", position = {0, 50}, size = {800, 50}, visible = 0, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, vAlign = "Middle", hAlign = "Left"},},}
