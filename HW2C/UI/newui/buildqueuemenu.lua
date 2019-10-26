-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

SHIPQUEUECOLOR = {246, 212, 0, 255}
SUBQUEUECOLOR = {224, 150, 0, 255}
RESEARCHQUEUECOLOR = {64, 129, 249, 255}
MENUWIDTH = 200
SHIPTEXTCOLOR = {170, 227, 255, 255}
ITEMTEXTCOLOR = {255, 255, 255, 255}
MAXHEIGHT = 325
PROGRESSBGCOLOR = {70, 74, 85, 190}

BuildQueueMenu = {size = {2, 71, MENUWIDTH, 500}, stylesheet = "HW2StyleSheet", RootElementSettings = {autosize = 1}, soundOnShow = "SFX_GlobalQueueONOFF", soundOnHide = "SFX_GlobalQueueONOFF", onShow = "UI_HideScreen('UnitCapInfoPopup')", pixelUVCoords = 1, fstringBuild = "$2641", Regions = {{0, 0, 65, -1},}, ;
	{type = "Frame", name = "buildQueueFrame", position = {0, 0}, size = {MENUWIDTH, 13}, autosize = 1, autoarrange = 1, maxSize = {MENUWIDTH, MAXHEIGHT},},
	{type = "Button", name = "buildQueueItem", position = {0, 0}, size = {MENUWIDTH, 36}, visible = 0, ;
	{type = "TextLabel", position = {2, 0}, size = {(MENUWIDTH - 4), 12}, name = "shipName", Text = {font = "ChatFont", hAlign = "Left", color = SHIPTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "Button", name = "btnOpenBuildMgr", position = {0, 12}, size = {64, 24}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {0, 175, 255, 255}, pressedBorderColor = {255, 255, 255, 255}, helpTip = "$5450", helpTipScreen = "NewTaskbar", helpTipTextLabel = "commandsHelpTip", ;
	{type = "ProgressBar", backgroundColor = PROGRESSBGCOLOR, progressColor = SHIPQUEUECOLOR, position = {2, 2}, size = {40, 8}, name = "buildProgress", giveParentMouseInput = 1},
	{type = "Button", name = "pauseButton", position = {44, 2}, size = {8, 8}, flashSpeed = 300, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},}, soundOnClicked = "SFX_ButtonClick"},
	{type = "Button", name = "cancelButton", position = {54, 2}, size = {8, 8}, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},}, soundOnClicked = "SFX_ButtonClick"},
	{type = "ProgressBar", backgroundColor = PROGRESSBGCOLOR, progressColor = SUBQUEUECOLOR, position = {2, 14}, size = {40, 8}, name = "subsystemBuildProgress", giveParentMouseInput = 1},
	{type = "Button", name = "subsystemPauseButton", position = {44, 14}, size = {8, 8}, flashSpeed = 300, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},}, soundOnClicked = "SFX_ButtonClick"},
	{type = "Button", name = "subsystemCancelButton", position = {54, 14}, size = {8, 8}, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},}, soundOnClicked = "SFX_ButtonClick"},},
	{type = "TextLabel", position = {65, 12}, size = {(MENUWIDTH - 66), 12}, name = "buildText", Text = {font = "ChatFont", hAlign = "Left", color = ITEMTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "TextLabel", position = {65, 24}, size = {(MENUWIDTH - 66), 12}, name = "subsystemBuildText", Text = {font = "ChatFont", hAlign = "Left", color = ITEMTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},},
	{type = "Button", name = "subsystemQueueItem", position = {0, 0}, size = {MENUWIDTH, 24}, visible = 0, ;
	{type = "TextLabel", position = {2, 0}, size = {(MENUWIDTH - 4), 12}, name = "shipName", Text = {font = "ChatFont", hAlign = "Left", color = SHIPTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "Button", name = "btnOpenBuildMgr", position = {0, 12}, size = {64, 12}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {0, 175, 255, 255}, pressedBorderColor = {255, 255, 255, 255}, helpTip = "$5451", helpTipScreen = "NewTaskbar", helpTipTextLabel = "commandsHelpTip", ;
	{type = "ProgressBar", backgroundColor = PROGRESSBGCOLOR, progressColor = SUBQUEUECOLOR, position = {2, 2}, size = {40, 8}, name = "subsystemBuildProgress", giveParentMouseInput = 1},
	{type = "Button", name = "subsystemPauseButton", position = {44, 2}, size = {8, 8}, flashSpeed = 300, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {255, 255, 255, 255},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},},},
	{type = "Button", name = "subsystemCancelButton", position = {54, 2}, size = {8, 8}, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {255, 255, 255, 255},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},},},},
	{type = "TextLabel", position = {65, 12}, size = {(MENUWIDTH - 66), 13}, name = "subsystemBuildText", Text = {font = "ChatFont", hAlign = "Left", color = ITEMTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},},
	{type = "Button", name = "researchQueueItem", position = {0, 0}, size = {MENUWIDTH, 24}, visible = 0, ;
	{type = "TextLabel", position = {2, 0}, size = {(MENUWIDTH - 4), 12}, name = "shipName", Text = {text = "$3126", font = "ChatFont", hAlign = "Left", color = SHIPTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "Button", name = "btnOpenResearchMgr", position = {0, 12}, size = {64, 12}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {0, 175, 255, 255}, pressedBorderColor = {255, 255, 255, 255}, helpTip = "$5451", helpTipScreen = "NewTaskbar", helpTipTextLabel = "commandsHelpTip", ;
	{type = "ProgressBar", backgroundColor = PROGRESSBGCOLOR, progressColor = RESEARCHQUEUECOLOR, position = {2, 2}, size = {40, 8}, name = "researchProgress", giveParentMouseInput = 1},
	{type = "Button", name = "pauseButton", position = {44, 2}, size = {8, 8}, flashSpeed = 300, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {255, 255, 255, 255},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},},},
	{type = "Button", name = "cancelButton", position = {54, 2}, size = {8, 8}, DefaultGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {0, 175, 255, 255},}, OverGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {255, 255, 255, 255},}, DisabledGraphic = {size = {8, 8}, texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres", textureUV = {0, 0, 8, 8}, color = {48, 108, 136, 255},},},},
	{type = "TextLabel", position = {65, 12}, size = {(MENUWIDTH - 66), 13}, name = "researchText", Text = {font = "ChatFont", hAlign = "Left", color = ITEMTEXTCOLOR}, giveParentMouseInput = 1, dropShadow = 1},},}
