-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:ui/newui/multiplayer/chatui.lua")

LobbyTitleRoom = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {}, sayFormatID = 3364, whisperFormatID = 3365, whisperEchoFormatID = 3369, playerJoinedFormatID = 3525, playerLeftFormatID = 3526, chatTitleID = "$3405", ErrorMessages = {[LM_Joining] = "$3406", [LM_Disconnected] = "$3407", [LM_CouldNotJoinRoom] = "$3408"}, pixelUVCoords = 1, ;
	{type = "Frame", position = {0, 0}, size = {800, 600}, name = "frmTheRoot", ;
	{type = "TextLabel", position = {16, -2}, size = {600, 36}, name = "txtLblTITLE", Text = {text = "$3390", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {600, 21}, name = "txtLblSUBTITLE", Text = {text = "$3391", textStyle = "FEHeading2"},},
	{type = "Frame", BackgroundGraphic = {type = "Graphic", size = {128, 32}, texture = "Data:UI\\NewUI\\Network\\gamespy.mres", textureUV = {0, 0, 128, 32},}, position = {656, 9}, size = {128, 32}, name = "frmgr1gamespytga"},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {6, 69}, size = {381, 469}, name = "frmRootServer", ;
	{type = "TextLabel", position = {6, 3}, size = {350, 15}, name = "txtLblSERVERS", Text = {text = "$3392", textStyle = "FEHeading3"},},
	{type = "TextLabel", position = {6, 17}, size = {250, 9}, name = "txtLblSELECTASERVER", Text = {text = "$3394", textStyle = "FEHeading4"},},
	{type = "Frame", position = {2, 31}, size = {377, 436}, borderWidth = 2, borderColor = "FEColorOutline", ;
	{type = "Line", p1 = {0, 21}, p2 = {377, 21}, lineWidth = 2, above = 0, color = "FEColorOutline"},
	{type = "Line", p1 = {358, 0}, p2 = {358, 436}, lineWidth = 2, above = 0, color = "FEColorOutline"},
	{type = "Table", name = "tableRooms", position = {4, 4}, size = {369, 428}, backgroundColor = {0, 0, 0, 0}, tableStyle = "FETableStyle", Columns = {{width = 160, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$2675", ;
	{type = "TextButton", name = "TableTitleRoomName", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3402", textStyle = "FETableTitleTextStyle"},},},}, {width = 86, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$2676", ;
	{type = "TextButton", name = "TableTitleNumGames", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3403", textStyle = "FETableTitleTextStyle"},},},}, {width = 100, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$2677", ;
	{type = "TextButton", name = "TableTitleNumPlayers", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3404", textStyle = "FETableTitleTextStyle"},},},},},},},}, GetChatTable(394, 69, 400, 469),
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "txtBtnBACK", Text = {text = "$3399", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3043"},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {648, 23}, name = "txtBtnJOINLOBBY", Text = {text = "$3397", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$2678"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {126, 23}, name = "txtBtnREFRESH", Text = {text = "$3400", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$2679"},},},},}
