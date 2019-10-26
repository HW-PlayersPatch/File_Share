-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

NewProfile = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = "FEColorBackground2"}, ;
	{type = "Frame", position = {273, 250}, size = {254, 100}, backgroundColor = {0, 0, 0, 255}, ;
	{type = "Frame", outerBorderWidth = 2, position = {4, 4}, size = {246, 92}, borderColor = "FEColorPopupOutline", style = "FEPopupBackgroundStyle", ;
	{type = "Line", p1 = {0, 28}, p2 = {254, 28}, lineWidth = 2, color = "FEColorPopupOutline", above = 0},
	{type = "TextInput", textInputStyle = "FETextInputStyle", name = "m_txtProfileName", maxTextLength = 16, position = {4, 35}, width = 238, helpTipTextLabel = "m_lblHelpText", helpTip = "$3502", Text = {text = "$2564"},},
	{type = "Line", p1 = {0, 54}, p2 = {254, 54}, lineWidth = 2, color = "FEColorPopupOutline", above = 0},
	{type = "TextLabel", position = {10, 58}, size = {230, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", p1 = {0, 75}, p2 = {254, 75}, lineWidth = 2, color = "FEColorPopupOutline", above = 1},
	{type = "TextButton", position = {124, 77}, buttonStyle = "FEButtonStyle1", name = "m_btnCancel", Text = {textStyle = "FEButtonTextStyle", text = "$2613"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3503"},
	{type = "TextButton", position = {2, 77}, name = "m_btnCreateNew", buttonStyle = "FEButtonStyle2", Text = {textStyle = "FEButtonTextStyle", text = "$2612"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3504"},},
	{type = "TextLabel", position = {10, 2}, size = {230, 13}, Text = {textStyle = "FEHeading3", text = "$3500"},},
	{type = "TextLabel", position = {10, 17}, size = {230, 10}, Text = {textStyle = "FEHeading4", text = "$3501"},},},}
