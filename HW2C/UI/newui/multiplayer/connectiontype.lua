-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

WIDTH = 300
HEIGHT = 121

ConnectionType = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {}, nameInUseFormatID = 3549, ErrorMessages = {[LM_AuthCD] = "$3542", [LM_UnableToConnect] = "$3543", [LM_InvalidNickname] = "$3544", [LM_Connecting] = "$3545", [LM_AuthCDFailed] = "$3546", [LM_Disconnected] = "$3547", [LM_InvalidCDKey] = "$3548"}, previousScreen = "NewMainMenu", ;
	{type = "TextLabel", position = {4, 580}, size = {800, 20}, Text = {font = "ChatFont", color = {255, 255, 255, 255}, text = "$1220", hAlign = "Left", vAlign = "Middle"},},
	{type = "Frame", position = {(400 - (WIDTH / 2)), (300 - (HEIGHT / 2))}, size = {WIDTH, HEIGHT}, backgroundColor = "FEColorBackground1", ;
	{type = "TextLabel", position = {10, 2}, size = {280, 13}, Text = {textStyle = "FEHeading3", text = "$3530"},},
	{type = "TextLabel", position = {10, 17}, size = {280, 10}, Text = {textStyle = "FEHeading4", text = "$3531"},},
	{type = "Frame", outerBorderWidth = 2, position = {4, 32}, size = {(WIDTH - 8), (HEIGHT - 36)}, borderColor = "FEColorOutline", ;
	{type = "Frame", autosize = 1, autoarrange = 1, autoarrangeSpace = 2, ;
	{type = "TextButton", name = "m_itemLAN", width = (WIDTH - 12), buttonStyle = "FEButtonStyle1", helpTipTextLabel = "m_lblHelpText", helpTip = "$3532", Text = {text = "$3533", textStyle = "FEButtonTextStyle"},},
	{type = "TextButton", name = "m_itemTCP", width = (WIDTH - 12), buttonStyle = "FEButtonStyle1", helpTipTextLabel = "m_lblHelpText", helpTip = "$3534", Text = {text = "$3535", textStyle = "FEButtonTextStyle"}, onMouseClicked = "UI_ShowScreen('DirectConnection', eTransition)"},
	{type = "TextButton", name = "m_itemGameSpy", width = (WIDTH - 12), buttonStyle = "FEButtonStyle1", helpTipTextLabel = "m_lblHelpText", helpTip = "$3536", Text = {text = "$3537", textStyle = "FEButtonTextStyle"},},},
	{type = "Line", p1 = {0, (HEIGHT - 72)}, p2 = {(WIDTH - 6), (HEIGHT - 72)}, lineWidth = 2, color = "FEColorOutline", above = 1},
	{type = "TextLabel", position = {4, (HEIGHT - 70)}, size = {(WIDTH - 6), 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", p1 = {0, (HEIGHT - 53)}, p2 = {(WIDTH - 6), (HEIGHT - 53)}, lineWidth = 2, color = "FEColorOutline", above = 1},
	{type = "TextButton", position = {2, (HEIGHT - 51)}, width = (WIDTH - 12), buttonStyle = "FEButtonStyle1", name = "m_btnCancel", helpTipTextLabel = "m_lblHelpText", helpTip = "$3043", Text = {textStyle = "FEButtonTextStyle", text = "$3539"}, onMouseClicked = "UI_PreviousScreen(eTransition);"},},},}
