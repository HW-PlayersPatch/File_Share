-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

DIALOGWIDTH = 254

YesNoDialog = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = "FEColorBackground2"}, onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);", onHide = "MainUI_PopEnabledCommandState()", jRight = ((DIALOGWIDTH - 6) - 122), jCenter = (((DIALOGWIDTH - 6) / 2) - 60), jLeft = 2, ;
	{type = "Frame", name = "m_frmDialogRoot", size = {DIALOGWIDTH, 100}, backgroundColor = "FEColorDialog", autosize = 1, marginHeight = 1, position = {(400 - (DIALOGWIDTH / 2)), 249}, giveParentMouseInput = 1, ;
	{type = "Frame", style = "FEPopupBackgroundStyle", position = {2, 2}, size = {(DIALOGWIDTH - 4), 96}, giveParentMouseInput = 1},
	{type = "Frame", position = {2, 2}, size = {(DIALOGWIDTH - 4), 31}, giveParentMouseInput = 1, ;
	{type = "Frame", outerBorderWidth = 2, position = {2, 2}, borderColor = "FEColorPopupOutline", size = {(DIALOGWIDTH - 8), 38}, giveParentMouseInput = 1},},
	{type = "Frame", position = {1, 0}, autosize = 1, autoarrange = 1, autoarrangeWidth = (DIALOGWIDTH - 2), autoarrangeSpace = 2, giveParentMouseInput = 1, ;
	{type = "Frame", size = {(DIALOGWIDTH - 5), 29}, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "m_lblTitle", position = {4, 0}, size = {(DIALOGWIDTH - 10), 13}, Text = {textStyle = "FEHeading3", text = "$5169"}, giveParentMouseInput = 1},
	{type = "TextLabel", name = "m_lblSubTitle", position = {4, 15}, size = {(DIALOGWIDTH - 10), 10}, Text = {textStyle = "FEHeading4", text = "$5170"}, giveParentMouseInput = 1},},
	{type = "Frame", name = "m_frmBorderRoot", outerBorderWidth = 1, position = {3, 30}, autosize = 1, borderColor = "FEColorPopupOutline", autoarrange = 1, giveParentMouseInput = 1, ;
	{type = "Frame", name = "m_frmMessageLabel", borderWidth = 1, borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, giveParentMouseInput = 1, ;
	{type = "TextLabel", name = "m_lblMessage", width = (DIALOGWIDTH - 6), autosize = 1, wrapping = 1, marginHeight = 4, marginWidth = 4, minSize = {0, 50}, name = "m_lblErrorMessage", Text = {textStyle = "FEHelpTipTextStyle", vAlign = "Top"}, giveParentMouseInput = 1},},
	{type = "Frame", name = "m_frmButtons", size = {(DIALOGWIDTH - 6), 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", giveParentMouseInput = 1, ;
	{visible = 1, type = "TextButton", position = {3, 3}, buttonStyle = "FEButtonStyle2", name = "m_btnAccept", Text = {textStyle = "FEButtonTextStyle", text = "$5172"}, onMouseClicked = "UI_DialogAccept();", giveParentMouseInput = 1},
	{type = "TextButton", position = {((DIALOGWIDTH - 6) - 123), 3}, name = "m_btnCancel", buttonStyle = "FEButtonStyle1", Text = {textStyle = "FEButtonTextStyle", text = "$5171"}, onMouseClicked = "UI_DialogCancel();", giveParentMouseInput = 1},},},},},}
