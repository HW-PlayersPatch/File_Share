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

ErrorMessage = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = "FEColorBackground2"}, soundOnShow = "SFX_ErrorMessage", jRight = ((DIALOGWIDTH - 6) - 122), jCenter = (((DIALOGWIDTH - 6) / 2) - 60), jLeft = 3, warningTitle = "$5598", warningSubTitle = "$5599", ;
	{type = "Frame", name = "m_frmDialogRoot", size = {DIALOGWIDTH, 100}, backgroundColor = "FEColorDialog", autosize = 1, marginHeight = 1, ;
	{type = "Frame", style = "FEPopupBackgroundStyle", position = {2, 2}, size = {(DIALOGWIDTH - 4), 96},},
	{type = "Frame", position = {2, 2}, size = {(DIALOGWIDTH - 4), 31}, ;
	{type = "Frame", outerBorderWidth = 2, position = {2, 2}, borderColor = "FEColorPopupOutline", size = {(DIALOGWIDTH - 8), 38},},},
	{type = "Frame", position = {1, 0}, autosize = 1, autoarrange = 1, autoarrangeWidth = (DIALOGWIDTH - 2), autoarrangeSpace = 2, ;
	{type = "Frame", size = {(DIALOGWIDTH - 5), 29}, ;
	{type = "TextLabel", name = "m_lblTitle", position = {4, 0}, size = {(DIALOGWIDTH - 10), 13}, Text = {textStyle = "FEHeading3", text = "$3610"},},
	{type = "TextLabel", name = "m_lblSubTitle", position = {4, 15}, size = {(DIALOGWIDTH - 10), 10}, Text = {textStyle = "FEHeading4", text = "$3611"},},},
	{type = "Frame", name = "m_frmBorderRoot", outerBorderWidth = 1, position = {3, 30}, autosize = 1, borderColor = "FEColorPopupOutline", autoarrange = 1, ;
	{type = "Frame", name = "m_frmMessageLabel", borderWidth = 1, borderColor = "FEColorPopupOutline", autosize = 1, autoarrange = 1, ;
	{type = "TextLabel", name = "m_lblErrorMessage", width = (DIALOGWIDTH - 6), autosize = 1, wrapping = 1, marginHeight = 4, marginWidth = 4, minSize = {0, 50}, name = "m_lblErrorMessage", Text = {textStyle = "FEHelpTipTextStyle", vAlign = "Top"},},
	{type = "Frame", name = "m_frmDontShowAgain", size = {(DIALOGWIDTH - 6), 19}, ;
	{type = "Button", name = "m_chkDontShowAgain", buttonStyle = "FECheckBoxButtonStyle", position = {3, 3},},
	{type = "TextLabel", position = {20, 4}, size = {(DIALOGWIDTH - 30), 13}, Text = {textStyle = "FEHeading4", text = "$3612", vAlign = "Middle"},},},},
	{type = "Frame", name = "m_frmMoreInfoRoot", borderWidth = 1, borderColor = "FEColorPopupOutline", autosize = 1, ;
	{type = "Frame", name = "m_frmMoreInfo", position = {1, 1}, size = {MOREINFOWIDTH, MOREINFOHEIGHT},},},
	{type = "Frame", name = "m_frmButtons", size = {(DIALOGWIDTH - 6), 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{visible = 1, type = "TextButton", position = {2, 3}, buttonStyle = "FEButtonStyle1", name = "m_btnMoreInfo", Text = {textStyle = "FEButtonTextStyle", text = "$3613"},},
	{type = "TextButton", position = {((DIALOGWIDTH - 6) - 122), 3}, name = "m_btnAccept", width = 120, buttonStyle = "FEButtonStyle2", Text = {textStyle = "FEButtonTextStyle", text = "$3614"},},
	{type = "TextButton", position = {3, 3}, name = "m_btnAcceptWide", width = (DIALOGWIDTH - 12), buttonStyle = "FEButtonStyle2", Text = {textStyle = "FEButtonTextStyle", text = "$3614"},},},},},},}
