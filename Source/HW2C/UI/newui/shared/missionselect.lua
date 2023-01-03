-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

MissionSelect = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, thumbnailPath = "Data:UI\\MapThumbnails\\Campaign\\%s\\%s.tga", strIncomplete = "$3496", strComplete = "$3495", completeMsg = "$3471", incompleteMsg = "$3472", completeColor = {238, 188, 5, 255}, incompleteColor = {112, 157, 180, 255}, ;
	{type = "Frame", position = {0, 0}, size = {800, 600}, name = "frmTheRoot", ;
	{type = "TextLabel", position = {16, -2}, size = {700, 36}, name = "txtLblTITLE", Text = {text = "$3490", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {16, -2}, size = {700, 36}, name = "txtLblTITLETUT", Text = {text = "$3450", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {700, 21}, name = "txtLblSUBTITLE", Text = {text = "$3491", textStyle = "FEHeading2"},},
	{type = "TextLabel", position = {17, 34}, size = {700, 21}, name = "txtLblSUBTITLETUT", Text = {text = "$3462", textStyle = "FEHeading2"},},
	{type = "Frame", position = {28, 112}, size = {742, 338}, name = "frmRootTutorialBox", backgroundColor = "FEColorBackground1", ;
	{type = "Line", p1 = {719, 30}, p2 = {719, 334}, lineWidth = 2, above = 1, color = "FEColorOutline"},
	{type = "TextLabel", position = {5, 2}, size = {500, 15}, name = "txtLblCampaignName", Text = {textStyle = "FEHeading3", vAlign = "Middle"},},
	{type = "TextLabel", position = {5, 18}, size = {300, 10}, name = "txtLblChooseTut", Text = {text = "$3451", textStyle = "FEHeading4"},},
	{type = "TextLabel", position = {5, 18}, size = {300, 10}, name = "txtLblChooseMission", Text = {text = "$3492", textStyle = "FEHeading4"},},
	{type = "Frame", outerBorderWidth = 1, borderColor = "FEColorOutline", position = {3, 31}, autosize = 1, ;
	{type = "ListBoxItem", helpTipTextLabel = "txtLblHELPTEXT", autosize = 1, name = "itemTutorialToClone", visible = 0, pressedColor = {255, 255, 255, 50}, pressedBorderColor = "FEColorHeading3", borderWidth = 1, allowDoubleClicks = 1, soundOnClicked = "SFX_MissionSelectClick", ;
	{type = "Button", position = {5, 5}, autosize = 1, ;
	{type = "TextLabel", position = {4, 0}, size = {443, 13}, name = "txtLblTutName", Text = {textStyle = "FEButtonTextStyle", color = {0, 0, 0, 255}, hAlign = "Left", offset = {4, 0},},},
	{type = "TextLabel", position = {4, 15}, size = {452, 35}, autosize = 1, wrapping = 1, minSize = {0, 39}, name = "txtLblTutDesc", marginWidth = 4, marginHeight = 2, Text = {textStyle = "FEButtonTextStyle", color = {255, 255, 255, 255}, hAlign = "Left", vAlign = "Top"},},},},
	{type = "Frame", borderWidth = 1, borderColor = "FEColorOutline", position = {248, 0}, size = {488, 304}, ;
	{type = "ListBox", position = {4, 2}, size = {481, 300}, name = "listTutorials", scrollBarSpace = 0, hugBottom = 1},},
	{type = "Frame", borderWidth = 1, borderColor = "FEColorOutline", size = {248, 200}, name = "frmMap", ;
	{type = "Frame", BackgroundGraphic = {type = "Graphic", texture = "Data:LevelData\\Multiplayer\\DefaultMapThumbnail.tga", textureUV = {0, 0, 484, 388},}, position = {3, 3}, size = {242, 194}, name = "frmgr1mmapbtga"},},
	{type = "Frame", borderWidth = 1, borderColor = "FEColorOutline", position = {0, 200}, size = {248, 104}, name = "frmMapSub"},},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "txtLblHELPTEXT", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "txtBtnBACK", helpTip = "$3468", helpTipTextLabel = "txtLblHELPTEXT", Text = {text = "$2610", textStyle = "FEButtonTextStyle"}, onMouseClicked =  [[UI_ShowScreen("NewMainMenu", eTransition)]]},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {248, 23}, name = "btnLoadSavedMission", helpTip = "$3494", helpTipTextLabel = "txtLblHELPTEXT", Text = {text = "$3493", textStyle = "FEButtonTextStyle"},},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {648, 23}, name = "btnStartMission", helpTip = "$3470", helpTipTextLabel = "txtLblHELPTEXT", Text = {text = "$3461", textStyle = "FEButtonTextStyle"},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {126, 23}, name = "txtBtnRESET", helpTip = "$3469", helpTipTextLabel = "txtLblHELPTEXT", Text = {text = "$3459", textStyle = "FEButtonTextStyle"},},},},},}
