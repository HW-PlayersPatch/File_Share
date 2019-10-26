-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

OUTLINECOLOR = {244, 213, 0, 255}
SHIPQUEUECOLOR = {246, 212, 0, 255}
SUBQUEUECOLOR = {224, 150, 0, 255}
DISABLEDICONCOLOR = {90, 155, 211, 160}
ITEMDEFAULTCOLOR = {80, 175, 255, 255}
ITEMOVERCOLOR = {0, 175, 255, 50}
ITEMPRESSEDCOLOR = {185, 136, 0, 255}
UNITCAPSREACHEDCOLOR1 = {180, 0, 0, 255}
UNITCAPSREACHEDCOLOR2 = {255, 0, 0, 30}

dofilepath("data:ui/newui/build/collapsablequeue.lua")

NewBuildMenu = {size = {586, 15, 212, 497}, resolution = {800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, soundOnShow = "SFX_BuildMenuONOFF", soundOnHide = "SFX_BuildMenuONOFF", pixelUVCoords = 1, onShow = "UI_SubtitleNarrow()", onHide =  [[UI_HideScreen("BuildInfo"); UI_SubtitleWide()]], textureFolder = "DATA:\\UI\\NewUI\\Build", drawToShipLineWidth = 1, drawToShipLineStubLength = 10, drawToShipLineColor = OUTLINECOLOR, drawToShipLineElement = "btnPrev", neverAvailBorderColor = {0, 0, 0, 255}, notYetAvailBorderColor = DISABLEDICONCOLOR, unitCapsReachedColor = UNITCAPSREACHEDCOLOR2, unitCapsReachedTextColor = UNITCAPSREACHEDCOLOR1, fstringRU = "$2640", fstringQueue = "$2641", fstringSubsytemsReplace = "$2565", queuesFramePos = 494, shipNameDisabledColor = {175, 175, 175, 255}, shipQueueTitle = "$2566", subsystemQueueTitle = "$2567", subsysColor = SUBQUEUECOLOR, menuColor = OUTLINECOLOR, fstringHardpoints = "$2568", fstringUnitCaps = "$2569", ;
	{type = "TextLabel", position = {0, 2}, size = {210, 19}, backgroundColor = OUTLINECOLOR, name = "lblTitle", Text = {textStyle = "IGHeading1", text = "$2620", offset = {4, 0}, color = {0, 0, 0, 255},}, ;
	{type = "Button", position = {193, 2}, buttonStyle = "IGCloseButton", onMouseClicked = "UI_HideScreen('NewBuildMenu')", helpTip = "$5208", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", hotKeyID = 51},},
	{type = "Frame", position = {3, 35}, size = {200, 64}, name = "frameShipGraphic", backgroundGraphicHAlign = "Center", backgroundGraphicVAlign = "Center", helpTip = "$5201", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "ProgressBar", backgroundColor = {0, 128, 0, 255}, progressColor = {0, 255, 0, 255}, borderColor = {0, 0, 0, 255}, outerBorderWidth = 1, position = {57, 88}, size = {100, 2}, name = "buildShipHealth"},
	{type = "Line", p1 = {208, 19}, p2 = {208, 174}, above = 1, lineWidth = 2, color = OUTLINECOLOR},
	{type = "Button", name = "btnPrev", buttonStyle = "IGPrevButton", toggleButton = 0, position = {2, 23}, OverGraphic = {texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.mres", textureUV = {0, 31, 13, 103}, color = OUTLINECOLOR}, helpTip = "$5203", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "DropDownListBox", dropDownListBoxStyle = "IGDropDownListBoxStyle", position = {17, 23}, width = 174, visible = 1, name = "comboBuildShip", ListBox = {type = "ListBox", name = "comboBuildShipListBox", size = {174, 130}, backgroundColor = "IGColorBackground1"}, helpTip = "$5200", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", name = "btnNext", toggleButton = 0, buttonStyle = "IGNextButton", position = {193, 23}, OverGraphic = {texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.mres", textureUV = {13, 31, 0, 103}, color = OUTLINECOLOR}, helpTip = "$5202", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "TextListBoxItem", buttonStyle = "IGListBoxItemButtonStyle", name = "buildShipDropDownListBoxItem", visible = 0, enabled = 0, width = 160, Text = {textStyle = "IGListBoxItemTextStyle"},},
	{type = "Frame", position = {4, 97}, size = {202, 36}, ;
	{type = "TextLabel", position = {0, 0}, size = {150, 12}, dropShadow = 1, Text = {text = "$2815", textStyle = "IGHeading2", vAlign = "Top"},},
	{type = "TextLabel", position = {0, 12}, size = {150, 12}, dropShadow = 1, Text = {text = "$2816", textStyle = "IGHeading2", vAlign = "Top"},},
	{type = "TextLabel", position = {0, 24}, size = {150, 12}, dropShadow = 1, Text = {text = "$2817", textStyle = "IGHeading2", vAlign = "Top"},},
	{type = "TextLabel", name = "lblProductionCount", position = {150, 0}, size = {52, 12}, dropShadow = 1, Text = {textStyle = "IGHeading2", vAlign = "Top", hAlign = "Right", offset = {-2, 0},},},
	{type = "TextLabel", name = "lblModuleCount", position = {150, 12}, size = {52, 12}, dropShadow = 1, Text = {textStyle = "IGHeading2", vAlign = "Top", hAlign = "Right", offset = {-2, 0},},},
	{type = "TextLabel", name = "lblSensorsCount", position = {150, 24}, size = {52, 12}, dropShadow = 1, Text = {textStyle = "IGHeading2", vAlign = "Top", hAlign = "Right", offset = {-2, 0},},},},
	{type = "Frame", name = "frameButtonGroup", position = {-1, 146}, size = {212, 30}, autoarrange = 1, autoarrangeWidth = 300, autoarrangeSpace = 2, helpTip = "$5211", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", ;
	{type = "RadioButton", buttonStyle = "IGButtonUtility", name = "Utility", helpTip = "$2623", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 94},
	{type = "RadioButton", buttonStyle = "IGButtonCorvette", name = "Corvette", helpTip = "$2624", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 91},
	{type = "RadioButton", buttonStyle = "IGButtonCapital", name = "Capital", helpTip = "$2625", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 93},
	{type = "RadioButton", buttonStyle = "IGButtonSubsystemModules", name = "SubSystemModule", helpTip = "$2643", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 95},
	{type = "RadioButton", buttonStyle = "IGButtonSubsystemSensors", name = "SubSystemSensors", helpTip = "$2644", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 97},
	{type = "RadioButton", buttonStyle = "IGButtonFighter", name = "Fighter", helpTip = "$2627", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 90},
	{type = "RadioButton", buttonStyle = "IGButtonFrigate", name = "Frigate", helpTip = "$2628", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 92},
	{type = "RadioButton", buttonStyle = "IGButtonPlatform", name = "Platform", helpTip = "$2629", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 96},},
	{type = "TextButton", toggleButton = 1, position = {1, 132}, buttonStyle = "IGButtonShowAll", name = "btnShowAll", Text = {text = "$5212"}, helpTipTextLabel = "lblCurrentFacility", helpTip = "$2630", hotKeyID = 98, PressedGraphic = {texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres", textureUV = {0, 15, 206, 30}, color = OUTLINECOLOR},},
	{type = "TextLabel", position = {0, 173}, size = {210, 13}, backgroundColor = OUTLINECOLOR, name = "lblCurrentFacility", Text = {textStyle = "IGHeading2", color = {0, 0, 0, 255}, offset = {6, 0}, vAlign = "Middle"},},
	{type = "TextLabel", position = {150, 173}, size = {60, 13}, name = "lblFacilityUnitCaps", Text = {textStyle = "IGHeading2", color = {0, 0, 0, 255}, offset = {-4, 0}, vAlign = "Middle", hAlign = "Right", text = "12/12"},},
	{type = "ListBox", position = {-3, 186}, size = {211, 300}, name = "listBuild", scrollBarSpace = 2, marginWidth = 2, marginHeight = 0, outerBorderWidth = 2, borderColor = OUTLINECOLOR, contentsOuterBorderWidth = 2, contentsBorderColor = OUTLINECOLOR, ScrollBar = {stepSize = 3, pageSize = 100, marginHeight = 2},},
	{type = "Button", size = {185, 15}, name = "showAllItemToClone", visible = 0, enabled = 0, selectable = 0, flashColor = {255, 255, 255, 65}, soundOnClicked = "SFX_BuildItemClick", ;
	{type = "Button", name = "buildInfo", position = {3, 2}, size = {13, 13}, DefaultGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = ITEMDEFAULTCOLOR}, OverGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = OUTLINECOLOR}, helpTip = "$5213", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", position = {18, 2}, size = {164, 13}, overColor = ITEMOVERCOLOR, pressedColor = ITEMOVERCOLOR, flashColor = ITEMOVERCOLOR, DefaultGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = {0, 0, 0, 255},}, OverGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = OUTLINECOLOR}, PressedGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = ITEMPRESSEDCOLOR}, helpTip = "$5204", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", ;
	{type = "TextLabel", name = "lblShipName", position = {0, 0}, size = {145, 13}, giveParentMouseInput = 1, Text = {textStyle = "IGListBoxItemTextStyle", color = {255, 255, 255, 255}, offset = {5, 0}, hAlign = "Left", vAlign = "Middle"},},
	{type = "TextLabel", name = "lblShipNameUnitsReached", visible = 0, position = {0, 0}, size = {125, 13}, giveParentMouseInput = 1, Text = {textStyle = "IGListBoxItemTextStyle", color = UNITCAPSREACHEDCOLOR1, offset = {5, 0}, hAlign = "Left", vAlign = "Middle"},},
	{type = "TextLabel", name = "lblShipPrice", position = {126, 0}, size = {37, 13}, giveParentMouseInput = 1, Text = {font = "ListBoxItemFont", hAlign = "Right", vAlign = "Middle", color = "FEColorHeading3", offset = {-4, 0},},},},},
	{type = "ListBoxItem", size = {188, 13}, name = "showAllFamilyItemToClone", visible = 0, enabled = 0, selectable = 0, autosize = 1, ;
	{type = "Frame", position = {3, 2}, autosize = 1, autoarrange = 1, ;
	{type = "TextLabel", name = "lblTitle", size = {185, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres", textureUV = {0, 0, 185, 13}, color = ITEMDEFAULTCOLOR}, Text = {font = "ListBoxItemFont", vAlign = "Middle", hAlign = "Left", offset = {4, 0}, color = {0, 0, 0, 255},}, ;
	{type = "TextLabel", name = "lblShowAllFamilyUnitCaps", position = {125, 0}, size = {60, 13}, visible = 0, Text = {font = "ListBoxItemFont", vAlign = "Middle", hAlign = "Right", offset = {-3, 0}, color = {0, 0, 0, 255},},},},
	{type = "Frame", name = "frmSmallShipItems", autosize = 1, autoarrange = 1, size = {185, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres", textureUV = {0, 14, 185, 25}, color = ITEMDEFAULTCOLOR},},
	{type = "Frame", size = {185, 5}, BackgroundGraphic = {size = {185, 4}, texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres", textureUV = {0, 28, 185, 32}, color = ITEMDEFAULTCOLOR},},},},
	{type = "ListBoxItem", size = {188, 31}, name = "m_buildItemToClone", visible = 0, enabled = 0, selectable = 0, flashColor = {255, 255, 255, 65}, soundOnClicked = "SFX_BuildItemClick", ;
	{type = "Button", name = "buildInfo", position = {3, 1}, size = {13, 30}, DefaultGraphic = {texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres", textureUV = {0, 0, 13, 30}, color = ITEMDEFAULTCOLOR}, OverGraphic = {texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres", textureUV = {0, 0, 13, 30}, color = OUTLINECOLOR}, DisabledGraphic = {texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres", textureUV = {0, 0, 13, 30}, color = DISABLEDICONCOLOR}, helpTip = "$5213", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", name = "m_btnItemButton", position = {18, 1}, size = {170, 30}, backgroundColor = {0, 0, 0, 35}, overColor = ITEMOVERCOLOR, pressedColor = ITEMOVERCOLOR, flashColor = ITEMOVERCOLOR, DefaultGraphic = {texture = "data:ui\\newui\\InGameIcons\\item_borders.mres", textureUV = {0, 0, 170, 30}, color = ITEMDEFAULTCOLOR}, BackgroundGraphic2 = {texture = "data:ui\\newui\\InGameIcons\\item_borders.mres", textureUV = {0, 0, 170, 30}, color = UNITCAPSREACHEDCOLOR1}, OverGraphic = {texture = "data:ui\\newui\\InGameIcons\\item_borders.mres", textureUV = {0, 0, 170, 30}, color = OUTLINECOLOR}, PressedGraphic = {texture = "data:ui\\newui\\InGameIcons\\item_borders.mres", textureUV = {0, 0, 170, 30}, color = ITEMPRESSEDCOLOR}, DisabledGraphic = {texture = "data:ui\\newui\\InGameIcons\\item_borders.mres", textureUV = {0, 0, 170, 30}, color = {0, 0, 0, 255},}, helpTip = "$5204", disabledHelpTip = "$5214", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", ;
	{type = "Frame", name = "frameIcon", position = {0, -1}, size = {80, 32}, giveParentMouseInput = 1, backgroundGraphicVAlign = "Center"},
	{type = "TextLabel", name = "lblShipName", position = {13, 2}, size = {154, 12}, Text = {color = {56, 162, 250, 255}, font = "ListBoxItemFont", hAlign = "Right", vAlign = "Center", offset = {-1, 0},}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "TextLabel", name = "lblShipPrice", position = {13, 14}, size = {154, 12}, Text = {color = "FEColorHeading3", font = "ListBoxItemFont", hAlign = "Right", vAlign = "Center", offset = {-2, 0},}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "TextLabel", name = "lblShipPriceReplace", position = {13, 14}, size = {154, 12}, visible = 0, Text = {color = {255, 255, 255, 255}, font = "ListBoxItemFont", hAlign = "Right", vAlign = "Center", offset = {-2, 0},}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "TextLabel", name = "lblNotAvailable", visible = 0, position = {13, 14}, size = {154, 12}, Text = {color = {100, 100, 100, 255}, font = "ListBoxItemFont", hAlign = "Right", vAlign = "Center", offset = {-2, 0},}, giveParentMouseInput = 1, dropShadow = 1},
	{type = "TextLabel", name = "lblAlreadyBuilt", visible = 0, position = {13, 14}, size = {154, 12}, Text = {text = "$2637", textStyle = "IGButtonTextStyle", color = {255, 255, 255, 255}, font = "ListBoxItemFont", hAlign = "Right"}, giveParentMouseInput = 1, dropShadow = 1},},},
	{type = "ListBoxItem", size = {188, 31}, name = "m_emptyBuildItemToClone", visible = 0, enabled = 0, selectable = 0, ;
	{type = "Button", position = {3, 1}, size = {13, 30}, DefaultGraphic = {texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres", textureUV = {0, 0, 13, 30}, color = {0, 0, 0, 255},},},
	{type = "Button", position = {18, 1}, size = {170, 30}, DefaultGraphic = {texture = "data:ui\\newui\\InGameIcons\\item_borders.mres", textureUV = {0, 0, 170, 30}, color = {0, 0, 0, 255},},},},
	{type = "ListBoxItem", size = {188, 13}, name = "m_emptyShowAllItemToClone", visible = 0, enabled = 0, selectable = 0, autosize = 1, ;
	{type = "Frame", position = {3, 2}, autosize = 1, ;
	{type = "Frame", position = {0, 0}, size = {185, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres", textureUV = {0, 0, 185, 13}, color = {0, 0, 0, 255},},},
	{type = "Frame", position = {0, 13}, size = {185, 17}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres", textureUV = {0, 14, 185, 25}, color = {0, 0, 0, 255},}, ;
	{type = "Frame", position = {3, 4}, size = {13, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = {0, 0, 0, 255},},},
	{type = "Frame", position = {18, 4}, size = {164, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = {0, 0, 0, 255},},},},
	{type = "Frame", position = {0, 30}, size = {185, 5}, BackgroundGraphic = {size = {185, 4}, texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres", textureUV = {0, 28, 185, 32}, color = {0, 0, 0, 255},},},},}, GetCollapsableQueue(OUTLINECOLOR, SHIPQUEUECOLOR, 79),
	{type = "Frame", position = {0, 393}, name = "frameQueues", autosize = 1, autoarrange = 1, autoarrangeSpace = 0, autoarrangeWidth = 393, customData = 4, outerBorderWidth = 1, borderColor = OUTLINECOLOR},}
