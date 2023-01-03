-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:ui/newui/multiplayer/chatui.lua")

GAMELIST_W = 776
GAMELIST_H = 177
GAMELIST_X = 12
GAMELIST_Y = 68

LANGAMELIST_W = 776
LANGAMELIST_H = 391
LANGAMELIST_X = 12
LANGAMELIST_Y = 97

LobbyScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {}, enabledGameColor = {1, 1, 1, 1}, disabledGameColor = {0.3, 0.3, 0.3, 1}, sayFormatID = 3364, whisperFormatID = 3365, whisperEchoFormatID = 3369, playerJoinedFormatID = 3525, playerLeftFormatID = 3526, ErrorMessages = {[LM_Joining] = "$3620", [LM_Disconnected] = "$3621", [LM_CouldNotJoinRoom] = "$3622"}, pixelUVCoords = 1, ;
	{type = "Frame", position = {0, 0}, size = {800, 600}, name = "frmTheRoot", ;
	{type = "TextLabel", position = {14, -2}, size = {650, 36}, name = "txtLblTITLE", Text = {text = "$3410", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {15, 34}, size = {650, 21}, name = "txtLblSUBTITLE", Text = {text = "$3411", textStyle = "FEHeading2"},},
	{type = "TextLabel", position = {15, 34}, size = {650, 21}, name = "txtLblSUBTITLELAN", Text = {text = "$3441", textStyle = "FEHeading2"},},
	{type = "Frame", BackgroundGraphic = {type = "Graphic", size = {128, 32}, texture = "Data:UI\\NewUI\\Network\\gamespy.mres", textureUV = {0, 0, 128, 32},}, position = {656, 9}, size = {128, 32}, name = "frmgr1gamespytga"},
	{type = "Frame", BackgroundGraphic = {type = "Graphic", size = {128, 35}, texture = "Data:UI\\NewUI\\Network\\relic.mres", textureUV = {0, 0, 128, 35},}, position = {656, 5}, size = {128, 35}, name = "frmgr1relictgaLAN"},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {GAMELIST_X, GAMELIST_Y}, size = {GAMELIST_W, GAMELIST_H}, name = "frmRootGame", ;
	{type = "Frame", position = {2, 31}, size = {(GAMELIST_W - 4), (GAMELIST_H - 33)}, borderWidth = 2, borderColor = "FEColorOutline", ;
	{type = "Line", p1 = {0, 21}, p2 = {(GAMELIST_W - 4), 21}, lineWidth = 2, above = 0, color = "FEColorOutline"},
	{type = "Line", p1 = {(GAMELIST_W - 23), 0}, p2 = {(GAMELIST_W - 23), (GAMELIST_H - 33)}, lineWidth = 2, above = 0, color = "FEColorOutline"},
	{type = "Table", name = "tableGames", position = {4, 4}, size = {(GAMELIST_W - 12), (GAMELIST_H - 41)}, backgroundColor = {0, 0, 0, 100}, tableStyle = "FETableStyle", Columns = {{width = 180, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3623", ;
	{name = "TableTitleGameHost", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3435", textStyle = "FETableTitleTextStyle"},},},}, {width = 180, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3624", ;
	{name = "TableTitleMap", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3436", textStyle = "FETableTitleTextStyle"},},},}, {width = 100, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3625", ;
	{name = "TableTitleGameMode", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3437", textStyle = "FETableTitleTextStyle"},},},}, {width = 80, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3626", ;
	{name = "TableTitlePlayers", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3438", textStyle = "FETableTitleTextStyle"},},},}, {width = 80, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3627", ;
	{name = "TableTitlePing", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3439", textStyle = "FETableTitleTextStyle"},},},}, {width = 115, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3628", ;
	{type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3440", textStyle = "FETableTitleTextStyle"},},},},},},},
	{type = "TextLabel", position = {6, 4}, size = {GAMELIST_W, 15}, name = "txtLblGAME", Text = {text = "$3412", textStyle = "FEHeading3"},},
	{type = "TextLabel", backgroundColor = {25, 25, 25, 0}, position = {6, 19}, size = {GAMELIST_W, 10}, name = "txtLblSELECTAGAME", Text = {text = "$3414", textStyle = "FEHeading4"},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {630, 10}, name = "txtBtnREFRESH", Text = {text = "$3421", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3631"},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {LANGAMELIST_X, LANGAMELIST_Y}, size = {LANGAMELIST_W, LANGAMELIST_H}, name = "frmRootGameLAN", ;
	{type = "Frame", position = {2, 31}, size = {(LANGAMELIST_W - 4), (LANGAMELIST_H - 33)}, borderWidth = 2, borderColor = "FEColorOutline", ;
	{type = "Line", p1 = {0, 21}, p2 = {(GAMELIST_W - 4), 21}, lineWidth = 2, above = 0, color = "FEColorOutline"},
	{type = "Line", p1 = {(LANGAMELIST_W - 23), 0}, p2 = {(LANGAMELIST_W - 23), (LANGAMELIST_H - 33)}, lineWidth = 2, above = 0, color = "FEColorOutline"},
	{type = "Table", name = "tableGamesLAN", position = {4, 4}, size = {(LANGAMELIST_W - 12), (LANGAMELIST_H - 41)}, backgroundColor = {0, 0, 0, 100}, tableStyle = "FETableStyle", Columns = {{width = 180, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3623", ;
	{name = "TableTitleGameHost", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3435", textStyle = "FETableTitleTextStyle"},},},}, {width = 180, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3624", ;
	{name = "TableTitleMap", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3436", textStyle = "FETableTitleTextStyle"},},},}, {width = 100, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3625", ;
	{name = "TableTitleGameMode", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3437", textStyle = "FETableTitleTextStyle"},},},}, {width = 80, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3626", ;
	{name = "TableTitlePlayers", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3438", textStyle = "FETableTitleTextStyle"},},},}, {width = 80, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3627", ;
	{name = "TableTitlePing", type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3439", textStyle = "FETableTitleTextStyle"},},},}, {width = 115, TitleCell = {type = "TableCell", helpTipTextLabel = "m_lblHelpText", helpTip = "$3628", ;
	{type = "TextButton", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$3440", textStyle = "FETableTitleTextStyle"},},},},},},},
	{type = "TextLabel", position = {6, 4}, size = {LANGAMELIST_W, 15}, name = "txtLblGAME", Text = {text = "$3412", textStyle = "FEHeading3"},},
	{type = "TextLabel", backgroundColor = {25, 25, 25, 0}, position = {6, 19}, size = {LANGAMELIST_W, 10}, name = "txtLblSELECTAGAME", Text = {text = "$3414", textStyle = "FEHeading4"},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {630, 10}, name = "txtBtnREFRESHLAN", Text = {text = "$3421", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3631"},}, GetChatTable(12, 252, 776, 285),
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "txtBtnBACK", Text = {text = "$3433", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3629"},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {648, 23}, name = "txtBtnJOINGAME", Text = {text = "$3417", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3630"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {126, 23}, name = "txtBtnGAMEINFO", Text = {text = "$3422", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3632"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {248, 23}, name = "txtBtnFILTERS", Text = {text = "$3401", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3633"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {526, 23}, name = "txtBtnHOSTGAME", Text = {text = "$3418", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3634"},},},},}
