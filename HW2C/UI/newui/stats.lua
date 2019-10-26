-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

smShipBuiltRU = 1
smShipsCapturedRU = 1
smShipsDestroyedRU = 1
smShipsLostRU = 1
smResourcesHarvestedRU = 0.5
smResourcesSpentRU = 0.5
smCollectorsBuiltRU = 1
smRefineriesRU = 1
smBuildShipsRU = 1
smSubsystemsRU = 1.5
smResearchRU = 1
smTributeDonatedRU = 1
smTributeReceivedRU = 0.25
smDeathTimeLoserSec = 2.245
smDeathTimeWinnerSec = 4.879

Stats = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, onSPSkirmishDone = "GameSetup", onMPDone = "LobbyScreen", statCount = 6, playerCount = 6, noTimeKilledText = "--", StatTabs = {{name = "tabOverview", type = "StatTab", title = "$4500", helpTip = "$4555", ;
	{name = "statCombatTotal", type = "PlayerStat", title = "$4518", helpTip = "$4519", fstring = "%d", position = 0, stat = "CombatTotal"},
	{name = "statResourceTotal", type = "PlayerStat", title = "$4528", helpTip = "$4529", fstring = "%d", position = 1, stat = "ResourceTotal"},
	{name = "statBuildingTotal", type = "PlayerStat", title = "$4538", helpTip = "$4539", fstring = "%d", position = 2, stat = "BuildingTotal"},
	{name = "statDiplomacyTotal", type = "PlayerStat", title = "$4548", helpTip = "$4549", fstring = "%d", position = 3, stat = "DiplomacyTotal"},
	{name = "statOverviewTotal", type = "PlayerStat", fstring = "%d", title = "$4506", helpTip = "$4507", position = 5, stat = "OverviewTotal"},},
	{name = "tabCombat", type = "StatTab", title = "$4501", helpTip = "$4556", ;
	{name = "statShipsBuilt", type = "PlayerStat", title = "$4508", helpTip = "$4509", fstring = "%d", stat = "TotalShipsBuilt", position = 0},
	{name = "statShipsLost", type = "PlayerStat", title = "$4510", helpTip = "$4511", fstring = "%d", stat = "TotalShipsLost", position = 1},
	{name = "statShipsDestroyed", type = "PlayerStat", title = "$4512", helpTip = "$4513", fstring = "%d", stat = "TotalShipsDestroyed", position = 2},
	{name = "statShipsCaptured", type = "PlayerStat", title = "$4514", helpTip = "$4515", fstring = "%d", stat = "TotalShipsCaptured", position = 3},
	{name = "statCombatTotal", type = "PlayerStat", title = "$4518", helpTip = "$4519", fstring = "%d", stat = "CombatTotal", position = 5},},
	{name = "tabResource", type = "StatTab", title = "$4502", helpTip = "$4557", ;
	{name = "statRUHarvested", type = "PlayerStat", title = "$4520", helpTip = "$4521", position = 0, stat = "TotalRUHarvested", fstring = "%d RU"},
	{name = "statRUSpent", type = "PlayerStat", title = "$4522", helpTip = "$4523", position = 1, stat = "TotalRUSpent", fstring = "%d RU"},
	{name = "statResourceCollectors", type = "PlayerStat", title = "$4524", helpTip = "$4525", position = 2, stat = "ResourceCollectors", fstring = "%d"},
	{name = "statMobileRefineries", type = "PlayerStat", title = "$4526", helpTip = "$4527", position = 3, stat = "MobileRefineries", fstring = "%d"},
	{name = "statResourceTotal", type = "PlayerStat", title = "$4528", helpTip = "$4529", position = 5, stat = "ResourceTotal", fstring = "%d"},},
	{name = "tabBuilding", type = "StatTab", title = "$4503", helpTip = "$4558", ;
	{name = "statBuildCapableShips", type = "PlayerStat", title = "$4530", helpTip = "$4531", position = 0, fstring = "%d", stat = "BuildCapableShips"},
	{name = "statTotalSubsystems", type = "PlayerStat", title = "$4532", helpTip = "$4533", position = 1, fstring = "%d", stat = "TotalSubsystems"},
	{name = "statTechnologies", type = "PlayerStat", title = "$4534", helpTip = "$4535", position = 2, fstring = "%d%", stat = "Research%"},
	{name = "statResearchCost", type = "PlayerStat", title = "$4536", helpTip = "$4537", position = 3, fstring = "%d RU", stat = "ResearchCost"},
	{name = "statBuildingTotal", type = "PlayerStat", title = "$4538", helpTip = "$4539", position = 5, fstring = "%d", stat = "BuildingTotal"},},
	{name = "tabDiplomacy", type = "StatTab", title = "$4504", helpTip = "$4559", ;
	{name = "statTributeRecieved", type = "PlayerStat", title = "$4542", helpTip = "$4543", position = 0, fstring = "%d RU", stat = "TributeReceived"},
	{name = "statTributeDontated", type = "PlayerStat", title = "$4544", helpTip = "$4545", position = 1, fstring = "%d RU", stat = "TributeDonated"},
	{name = "statTimeOfDeath", type = "PlayerStat", title = "$4546", helpTip = "$4547", position = 2, fstring = "%d:%02d:%02d", stat = "TimeOfDeath"},
	{name = "statDiplomacyTotal", type = "PlayerStat", title = "$4548", helpTip = "$4549", position = 5, fstring = "%d", stat = "DiplomacyTotal"},},}, ;
	{type = "Frame", name = "frameGamespy", BackgroundGraphic = {type = "Graphic", size = {128, 32}, texture = "Data:UI\\NewUI\\Network\\gamespy.mres", textureUV = {0, 0, 128, 32},}, position = {656, 9}, size = {128, 32},},
	{type = "TextLabel", position = {16, -2}, size = {600, 36}, name = "lblTitle", Text = {text = "$4550", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {700, 21}, name = "lblSubtitleVictory", Text = {text = "$4551", textStyle = "FEHeading2"},},
	{type = "TextLabel", position = {17, 34}, size = {700, 21}, name = "lblSubtitleDefeat", Text = {text = "$4552", textStyle = "FEHeading2"},},
	{type = "Frame", position = {12, 140}, size = {776, 252}, backgroundColor = "FEColorBackground1", ;
	{type = "TextLabel", position = {5, 2}, size = {400, 13}, Text = {text = "$4553", textStyle = "FEHeading3"},},
	{type = "TextLabel", name = "lblStatsSubtitle", position = {5, 18}, size = {400, 9}, Text = {text = "$4554", textStyle = "FEHeading4"},},
	{type = "TextLabel", name = "lblTotalTime", position = {400, 4}, size = {374, 13}, Text = {text = "$5174", textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, hAlign = "Right", vAlign = "Middle"},},
	{type = "TextLabel", name = "lblLevelName", position = {400, 17}, size = {374, 13}, Text = {text = "$5175", textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, hAlign = "Right", vAlign = "Middle"},},
	{type = "Frame", name = "frameTabButtons", position = {282, 34}, size = {560, 15}, autoarrange = 1, autoarrangeSpace = 1, autoarrangeWidth = 560},
	{type = "RadioButton", visible = 0, name = "btnTabButtonToClone", buttonStyle = "FETabButtonStyle", Text = {textStyle = "FEButtonTextStyle"},},
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorOutline", position = {3, 49}, size = {770, 200}, ;
	{type = "Frame", borderWidth = 1, borderColor = "FEColorOutline", size = {194, 38},},
	{type = "Frame", name = "framePlayers", borderWidth = 1, borderColor = "FEColorOutline", position = {0, 38}, size = {194, 162}, autoarrange = 1},
	{type = "Frame", name = "statTitlesParentFrame", borderWidth = 1, borderColor = "FEColorOutline", position = {194, 0}, size = {576, 38}, autoarrange = 1, autoarrangeWidth = 578},
	{type = "TextLabel", name = "lblStatTitle", visible = 0, size = {96, 38}, wrapping = 1, marginWidth = 10, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, vAlign = "Middle", hAlign = "Center"},},
	{type = "Frame", size = {194, 27}, name = "framePlayerInfoToClone", visible = 0, ;
	{type = "Frame", borderColor = "FEColorOutline", borderWidth = 1, position = {-1, 0}, size = {196, 27}, ;
	{type = "Frame", outerBorderWidth = 1, borderColor = {255, 255, 255, 255}, backgroundColor = {161, 104, 206, 255}, position = {5, 5}, size = {182, 17}, name = "frmPlayerInfo", ;
	{type = "TextLabel", position = {5, 2}, size = {111, 12}, name = "lblName", giveParentMouseInput = 1, dropShadow = 1, Text = {color = {255, 255, 255, 255}, text = "$5177", textStyle = "FEButtonTextStyle", hAlign = "Left"},},
	{type = "Frame", position = {120, 0}, size = {60, 17}, name = "frmEmblem", ;
	{type = "Frame", BackgroundGraphic = {type = "Graphic", size = {60, 17}, texture = "Data:UI\\NewUI\\Network\\stripes.mres", textureUV = {0, 0, 60, 17},}, size = {60, 17}, name = "frmStripe"},
	{type = "Frame", BackgroundGraphic = {type = "Graphic", size = {17, 17}, texture = "DATA:Badges/Hiigaran.tga", textureUV = {0, 0, 64, 64},}, size = {17, 17}, name = "frmBadge"},},},},},
	{type = "Frame", name = "frameStats", borderWidth = 1, borderColor = "FEColorOutline", position = {194, 38}, size = {576, 162}, autoarrange = 1},
	{type = "Frame", name = "frameStatSlotToClone", size = {576, 27}, visible = 0, ;
	{type = "Frame", name = "frameStats", borderColor = "FEColorOutline", borderWidth = 1, position = {-1, 0}, size = {578, 27}, autoarrange = 1, autoarrangeWidth = 578},},
	{type = "TextLabel", visible = 0, name = "lblStat", size = {96, 27}, wrapping = 1, marginWidth = 15, Text = {font = "ChatFont", vAlign = "Middle", hAlign = "Center", color = {255, 255, 255, 255},},},},},
	{type = "Frame", name = "frameChatRoot", position = {12, 326}, size = {776, 202}, backgroundColor = "FEColorBackground1", visible = 0, ;
	{type = "TextLabel", position = {5, 2}, size = {400, 13}, Text = {text = "$5178", textStyle = "FEHeading3"},},
	{type = "TextLabel", position = {5, 18}, size = {400, 9}, Text = {text = "$3309", textStyle = "FEHeading4"},},
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 29}, size = {772, 171}, ;
	{type = "ListBox", name = "listBoxChat", position = {3, 2}, size = {765, 148}, hugBottom = 1},
	{type = "Line", above = 1, lineWidth = 2, color = "FEColorOutline", p1 = {751, 0}, p2 = {751, 151},},
	{type = "ListBoxItem", visible = 0, enabled = 0, autosize = 1, name = "lstBoxChatMsgTemplate", ;
	{type = "TextLabel", name = "m_lblText", Text = {textStyle = "FEListBoxItemTextStyle", color = {255, 255, 255, 255},}, width = 756, wrapping = 1, autosize = 1, marginWidth = 2},},
	{type = "Frame", borderColor = "FEColorOutline", outerBorderWidth = 2, position = {2, 152}, size = {768, 17}, ;
	{type = "TextInput", textInputStyle = "FEChatTextInputStyle", borderWidth = 0, outerBorderWidth = 0, position = {2, 0}, size = {640, 17}, name = "txtInputChat", helpTipTextLabel = "lblHelpText", helpTip = "$4560", maxTextLength = 256},
	{type = "Line", above = 1, lineWidth = 2, color = "FEColorOutline", p1 = {642, 0}, p2 = {642, 21},},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {646, 2}, name = "btnSendChat", Text = {text = "$3416", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpText", helpTip = "$4561"},},},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {648, 23}, name = "btnBack", Text = {text = "$5188", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpText", helpTip = "$4562"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {126, 23}, visible = 0, name = "btnReplay", Text = {text = "$5179", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpText", helpTip = "$4563"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {248, 23}, visible = 0, name = "btnSaveRecorded", Text = {text = "$5180", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpText", helpTip = "$4564"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "btnMainMenu", Text = {text = "$2617", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpText", helpTip = "$4565", onMouseClicked =  [[UI_ShowScreen("NewMainMenu", eTransition)]]},
	{type = "TextButton", enabled = 0, visible = 0, buttonStyle = "FEButtonStyle2", position = {648, 23}, name = "btnNewGame", Text = {text = "$5181", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpText", helpTip = "$4566"},},},}
