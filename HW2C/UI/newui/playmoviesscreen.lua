-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

SAVELOAD_WIDTH = 420
SAVELOAD_HEIGHT = 250
SAVELOAD_POSITION = {(400 - (SAVELOAD_WIDTH / 2)), (300 - (SAVELOAD_HEIGHT / 2))}

PlayMoviesScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, ;
	{type = "Frame", position = {0, 0}, size = {800, 600}, name = "m_frmRoot", ;
	{type = "TextListBoxItem", name = "m_listBoxItemToClone", resizeToListBox = 1, width = (SAVELOAD_WIDTH - 31), visible = 0, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, hAlign = "Left", offset = {2, 0},}, overColor = {100, 100, 100, 100}, pressedColor = {100, 100, 100, 150}, helpTipTextLabel = "m_lblHelpText", allowDoubleClicks = 1},
	{type = "TextLabel", position = {16, -2}, size = {800, 36}, Text = {text = "$3600", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {800, 21}, Text = {text = "$3603", textStyle = "FEHeading2"},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = SAVELOAD_POSITION, size = {SAVELOAD_WIDTH, SAVELOAD_HEIGHT}, ;
	{type = "Frame", outerBorderWidth = 2, borderColor = "FEColorOutline", position = {4, 32}, autosize = 1, autoarrange = 1, ;
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorOutline", size = {(SAVELOAD_WIDTH - 8), (((SAVELOAD_HEIGHT - 92) + 38) + 18)}, ;
	{type = "ListBox", name = "m_listGames", listBoxStyle = "FEListBoxStyle", position = {2, 0}, size = {(SAVELOAD_WIDTH - 12), (((SAVELOAD_HEIGHT - 93) + 38) + 19)},},
	{type = "Line", lineWidth = 2, p1 = {(SAVELOAD_WIDTH - 25), 0}, p2 = {(SAVELOAD_WIDTH - 25), (((SAVELOAD_HEIGHT - 92) + 38) + 19)}, above = 0, color = "FEColorOutline"},},},},
	{type = "Frame", name = "m_frmPlayMovie", position = SAVELOAD_POSITION, autosize = 1, ;
	{type = "TextLabel", position = {10, 2}, size = {(SAVELOAD_WIDTH - 50), 17}, Text = {text = "$3600", textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {10, 18}, size = {(SAVELOAD_WIDTH - 50), 9}, Text = {text = "$3601", textStyle = "FEHeading4", vAlign = "Middle"},},},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", name = "m_btnCancel", position = {4, 23}, buttonStyle = "FEButtonStyle1", Text = {text = "$2610", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3602", onMouseClicked = "UI_HideScreen('PlayMoviesScreen'); UI_ShowScreen('NewMainMenu', ePopup)"},
	{type = "TextButton", name = "m_btnPlayMovie", position = {648, 23}, buttonStyle = "FEButtonStyle2", Text = {text = "$3586", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3587"},},},}
