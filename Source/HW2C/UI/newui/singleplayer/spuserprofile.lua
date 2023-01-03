-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

UserProfile = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, ;
	{type = "TextLabel", position = {16, -2}, size = {800, 36}, Text = {text = "$3516", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {800, 21}, Text = {text = "$3518", textStyle = "FEHeading2"},},
	{type = "Frame", position = {273, 200}, size = {254, 215}, backgroundColor = "FEColorBackground1", ;
	{type = "TextLabel", position = {10, 2}, size = {250, 13}, Text = {textStyle = "FEHeading3", text = "$3506"},},
	{type = "TextLabel", position = {10, 17}, size = {250, 10}, Text = {textStyle = "FEHeading4", text = "$3507"},},
	{type = "Frame", outerBorderWidth = 2, position = {4, 32}, size = {246, 179}, borderColor = "FEColorOutline", ;
	{type = "ListBox", position = {1, 0}, size = {243, 130}, name = "m_listProfiles", helpTipTextLabel = "m_lblHelpText", helpTip = "$3508", scrollBarSpace = 6},
	{type = "Line", p1 = {227, 0}, p2 = {227, 130}, lineWidth = 2, color = "FEColorOutline", above = 1},
	{type = "TextListBoxItem", name = "m_itemToClone", buttonStyle = "FEListBoxItemButtonStyle", visible = 0, enabled = 0, resizeToListBox = 1, Text = {textStyle = "FEListBoxItemTextStyle"}, allowDoubleClicks = 1},
	{type = "Line", p1 = {0, (94 + 38)}, p2 = {254, (94 + 38)}, lineWidth = 2, color = "FEColorOutline", above = 1},
	{type = "TextButton", name = "m_btnCreateNew", position = {2, (96 + 38)}, width = 242, buttonStyle = "FEButtonStyle1", helpTipTextLabel = "m_lblHelpText", helpTip = "$3509", Text = {textStyle = "FEButtonTextStyle", text = "$3510"},},
	{type = "TextButton", position = {2, (111 + 38)}, width = 242, name = "m_btnPlayerSetup", helpTipTextLabel = "m_lblHelpText", helpTip = "$3511", buttonStyle = "FEButtonStyle1", Text = {textStyle = "FEButtonTextStyle", text = "$3512"},},
	{type = "TextButton", position = {2, (126 + 38)}, width = 242, name = "m_btnDelete", buttonStyle = "FEButtonStyle1", helpTipTextLabel = "m_lblHelpText", helpTip = "$3513", name = "m_btnDelete", Text = {textStyle = "FEButtonTextStyle", text = "$3514"},},},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", position = {4, 23}, visible = 0, buttonStyle = "FEButtonStyle2", name = "m_btnCancel", helpTipTextLabel = "m_lblHelpText", helpTip = "$3515", Text = {textStyle = "FEButtonTextStyle", text = "$2619"},},
	{type = "TextButton", name = "m_btnAccept", position = {648, 23}, visible = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$3517", buttonStyle = "FEButtonStyle2", Text = {textStyle = "FEButtonTextStyle", text = "$2619"},},},},}
