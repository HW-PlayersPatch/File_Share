-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

LABEL_POS = {0, 481}
LABEL_SIZE = {800, 19}

GameOverScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, onShow = "UI_HideScreen('SubtitleScreen')", RootElementSettings = {backgroundColor = "FEColorBackground2"}, ;
	{type = "TextLabel", name = "m_lblVictory", position = LABEL_POS, size = LABEL_SIZE, visible = 0, Text = {text = "$3615", textStyle = "IGHeading1", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Center"},},
	{type = "TextLabel", name = "m_lblDefeat", position = LABEL_POS, size = LABEL_SIZE, visible = 0, Text = {text = "$3616", textStyle = "IGHeading1", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Center"},},
	{type = "TextLabel", name = "m_lblExit", position = LABEL_POS, size = LABEL_SIZE, visible = 0, Text = {text = "$3617", textStyle = "IGHeading1", color = {255, 255, 255, 255}, vAlign = "Top", hAlign = "Center"},},}
