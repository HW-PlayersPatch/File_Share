-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

DIALOGWIDTH = 284
MOREINFOWIDTH = (DIALOGWIDTH - 7)
MOREINFOHEIGHT = 100

GameTypeInfo = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = "FEColorBackground2"}, ;
	{type = "Frame", name = "m_frmDialogRoot", size = {DIALOGWIDTH, 100}, backgroundColor = "FEColorDialog", autosize = 1, marginHeight = 1, ;
	{type = "Frame", position = {4, 4}, size = {(DIALOGWIDTH - 8), 70}, style = "FEPopupBackgroundStyle"},
	{type = "Frame", position = {2, 2}, size = {(DIALOGWIDTH - 4), 32}, ;
	{type = "Frame", size = {(DIALOGWIDTH - 4), 34}, borderWidth = 2, borderColor = "FEColorPopupOutline"},},
	{type = "Frame", position = {1, 0}, autosize = 1, autoarrange = 1, autoarrangeWidth = (DIALOGWIDTH - 2), autoarrangeSpace = 2, ;
	{type = "Frame", size = {(DIALOGWIDTH - 5), 29}, ;
	{type = "TextLabel", name = "lblTitle", position = {4, 0}, size = {(DIALOGWIDTH - 10), 15}, Text = {textStyle = "FEHeading3", vAlign = "Middle", text = "$5587"},},
	{type = "TextLabel", position = {4, 15}, size = {(DIALOGWIDTH - 10), 13}, Text = {textStyle = "FEHeading4", text = "$5588"},},},
	{type = "Frame", outerBorderWidth = 1, position = {3, 30}, autosize = 1, borderColor = "FEColorPopupOutline", autoarrange = 1, ;
	{type = "Frame", borderWidth = 1, borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, ;
	{type = "TextLabel", name = "lblDescription", width = (DIALOGWIDTH - 6), autosize = 1, wrapping = 1, minSize = {(DIALOGWIDTH - 6), 40}, marginHeight = 4, marginWidth = 4, name = "m_lblErrorMessage", Text = {textStyle = "FEHelpTipTextStyle", vAlign = "Top"},},},
	{type = "Frame", name = "m_frmButtons", size = {(DIALOGWIDTH - 6), 17}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextButton", position = {2, 2}, width = ((DIALOGWIDTH - 6) - 4), name = "btnOk", buttonStyle = "FEButtonStyle2", Text = {textStyle = "FEButtonTextStyle", text = "$3614"}, onMouseClicked = "UI_HideScreen('GameTypeInfo')"},},},},},}
