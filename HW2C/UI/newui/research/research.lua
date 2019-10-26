-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:ui/newui/build/collapsablequeue.lua")

OUTLINECOLOR = {124, 200, 196, 255}
RESEARCHQUEUECOLOR = {64, 129, 249, 255}
RESEARCHGROUPCOLOR = {80, 175, 255, 255}
UGT_ABILITY_DFT = {255, 213, 0, 255}
UGT_ABILITY_OVR = {225, 225, 225, 255}
UGT_ABILITY_PRS = {255, 255, 255, 255}
UGT_TECH_DFT = {239, 115, 0, 255}
UGT_TECH_OVR = {225, 225, 225, 255}
UGT_TECH_PRS = {255, 255, 255, 255}
UGT_UPGRADE_DFT = {0, 175, 255, 255}
UGT_UPGRADE_OVR = {225, 225, 225, 255}
UGT_UPGRADE_PRS = {255, 255, 255, 255}

function GetResearchButton(_name, _defaultColor, _overColor, _pressedColor)
	local Button =
	{type = "Button", name = _name, position = {2, 2}, size = {180, 13}, visible = 0, enabled = 0, giveParentMouseInput = 0, soundOnClicked = "SFX_ResearchItemClick", ;
	{type = "Button", name = "btnMoreInfo", position = {1, 0}, size = {13, 13}, DefaultGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = _defaultColor}, OverGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = _overColor}, PressedGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = _pressedColor}, helpTip = "$5230", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", position = {16, 0}, size = {164, 13}, DefaultGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = _defaultColor}, OverGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = _overColor}, PressedGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = _pressedColor}, helpTip = "$5226", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", ;
	{type = "Frame", name = "frmIcon", position = {2, 2}, size = {9, 9}, BackgroundGraphic = {texture = "data:ui\\newui\\research\\icons\\speed.mres", textureUV = {0, 0, 9, 9},},},
	{type = "TextLabel", name = "lblUpgrade", position = {13, 0}, size = {112, 13}, Text = {textStyle = "IGButtonTextStyle", color = {255, 255, 255, 255}, hAlign = "Left", vAlign = "Middle", offset = {2, 0},},},
	{type = "TextLabel", name = "lblCost", position = {126, 0}, size = {37, 13}, Text = {font = "ButtonFont", color = "FEColorHeading3", hAlign = "Right", vAlign = "Middle", offset = {-4, 0},},},},} ;
	return Button
end

NewResearchMenu = {
	size = {586, 15, 212, 497}, resolution = {800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"},
	soundOnShow = "SFX_ResearchMenuONOFF",
	soundOnHide = "SFX_ResearchMenuONOFF",
	pixelUVCoords = 1, fStringCost = "%d", abilitiesText = "$2861", techText = "$2862",
	onHide =  [[UI_HideScreen("ResearchInfo"); UI_SubtitleWide()]],
	onShow = "UI_HideScreen('NewBuildMenu'); UI_HideScreen('NewLaunchMenu'); UI_ShowScreen('ResourceMenu', ePopup); UI_SubtitleNarrow()",
	queuesFramePos = 494, queueTitle = "$2570", menuColor = OUTLINECOLOR, itemIconUV = {0, 0, 9, 9}, defaultDisplayPriority = 1,
	FamilyIcons = {
	{"Vaygr", "Fighter", "Vgr_LanceFighter"},
	{"Vaygr", "Corvette", "Vgr_MinelayerCorvette"},
	{"Vaygr", "Frigate", "Vgr_InfiltratorFrigate"},
	{"Vaygr", "Capital", "Vgr_ShipYard"},
	{"Vaygr", "Flagship", "Vgr_Mothership"},
	{"Vaygr", "Platform", "Vgr_HyperSpace_Platform"},
	{"Vaygr", "Utility", "Vgr_Probe_ECM"},
	{"Hiigaran", "Fighter", "Hgn_AttackBomber"},
	{"Hiigaran", "Corvette", "Hgn_MinelayerCorvette"},
	{"Hiigaran", "Frigate", "Hgn_DefenseFieldFrigate"},
	{"Hiigaran", "Capital", "Hgn_Shipyard"},
	{"Hiigaran", "Flagship", "Hgn_MotherShip"},
	{"Hiigaran", "Platform", "Hgn_GunTurret"},
	{"Hiigaran", "Utility", "Hgn_ECMProbe"},}, ;
{type = "TextLabel", position = {0, 2}, size = {210, 19}, name = "lblTitle", backgroundColor = OUTLINECOLOR, Text = {textStyle = "IGHeading1", text = "$2850", offset = {4, 0}, color = {0, 0, 0, 255},}, ;
{type = "Button", position = {193, 2}, buttonStyle = "IGCloseButton", onMouseClicked = "UI_HideScreen('NewResearchMenu')", helpTip = "$5221", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", hotKeyID = 49},},
{type = "Line", p1 = {210, 19}, p2 = {210, 63}, above = 0, lineWidth = 2, color = OUTLINECOLOR},
{type = "Frame", name = "m_frameButtonGroup", position = {-1, 36}, size = {208, 30}, autoarrange = 1, autoarrangeWidth = 300, autoarrangeSpace = 2, helpTip = "$5228", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar", ;
{type = "RadioButton", buttonStyle = "IGButtonUtility", name = "Utility", helpTip = "$5231", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 94},
{type = "RadioButton", buttonStyle = "IGButtonCorvette", name = "Corvette", helpTip = "$5232", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 91},
{type = "RadioButton", buttonStyle = "IGButtonCapital", name = "Capital", helpTip = "$5233", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 93},
{type = "RadioButton", buttonStyle = "IGButtonFighter", name = "Fighter", helpTip = "$5234", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 90},
{type = "RadioButton", buttonStyle = "IGButtonFrigate", name = "Frigate", helpTip = "$5235", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 92},
{type = "RadioButton", buttonStyle = "IGButtonPlatform", name = "Platform", helpTip = "$5236", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 96},},
{type = "TextButton", buttonStyle = "IGButtonShowAll", position = {1, 22}, width = 206, name = "btnShowAll", Text = {text = "$5237"}, toggleButton = 1, helpTip = "$5229", helpTipTextLabel = "lblCurrentFacility", hotKeyID = 98, PressedGraphic = {texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres", textureUV = {0, 15, 206, 30}, color = OUTLINECOLOR},},
{type = "TextLabel", position = {0, 63}, size = {210, 13}, name = "lblCurrentFacility", Text = {textStyle = "IGHeading2", color = {0, 0, 0, 255}, offset = {6, 0}, vAlign = "Middle"}, backgroundColor = OUTLINECOLOR},
{type = "ListBox", position = {-3, 76}, size = {211, 420}, name = "m_listResearch", scrollBarSpace = 2, marginWidth = 2, marginHeight = 0, outerBorderWidth = 2, borderColor = OUTLINECOLOR, contentsOuterBorderWidth = 2, contentsBorderColor = OUTLINECOLOR, ScrollBar = {stepSize = 3, pageSize = 100, marginHeight = 2},},
{type = "ListBoxItem", size = {188, 80}, autosize = 1, minSize = {188, 0}, visible = 0, name = "shipUpgradeItemToClone", ;
{type = "Frame", position = {3, 1}, autoarrange = 1, autoarrangeWidth = 186, autosize = 1, ;
{type = "Frame", size = {185, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres", textureUV = {0, 0, 185, 13}, color = RESEARCHGROUPCOLOR}, ;
{type = "TextLabel", name = "lblShipName", position = {0, 0}, size = {180, 13}, Text = {font = "ListBoxItemFont", hAlign = "Left", vAlign = "Middle", color = {0, 0, 0, 255}, offset = {4, 0},},},},
{type = "Frame", minSize = {185, 0}, autosize = 1, BackgroundGraphic = {texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres", textureUV = {0, 14, 185, 25}, color = RESEARCHGROUPCOLOR}, ;
{type = "Frame", position = {2, 2}, autosize = 1, ;
{type = "Frame", name = "researchIconFrame", position = {0, 0}, size = {100, 32},},},
{type = "Frame", position = {0, 35}, size = {184, 46}, autosize = 1, autoarrange = 1, autoarrangeSpace = 2, name = "upgradesFrame"},},
{type = "Frame", size = {185, 5}, BackgroundGraphic = {size = {185, 4}, texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres", textureUV = {0, 28, 185, 32}, color = RESEARCHGROUPCOLOR},},},},
{type = "ListBoxItem", size = {188, 80}, autosize = 1, minSize = {188, 0}, visible = 0, name = "emptyShipUpgradeItemToClone", ;
{type = "Frame", position = {3, 1}, autoarrange = 1, autoarrangeWidth = 186, autosize = 1, ;
{type = "Frame", size = {185, 13}, BackgroundGraphic = {position = {0, 0}, texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres", textureUV = {0, 0, 185, 13}, color = {0, 0, 0, 255},},},
{type = "Frame", minSize = {185, 0}, autosize = 1, BackgroundGraphic = {texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres", textureUV = {0, 14, 185, 25}, color = {0, 0, 0, 255},}, ;
{type = "Frame", position = {3, 37}, size = {13, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {0, 0, 13, 13}, color = {0, 0, 0, 255},},},
{type = "Frame", position = {18, 37}, size = {164, 13}, BackgroundGraphic = {texture = "data:ui\\newui\\ingameicons\\research_borders.mres", textureUV = {16, 0, 180, 13}, color = {0, 0, 0, 255},},},},
{type = "Frame", size = {185, 5}, BackgroundGraphic = {size = {185, 4}, texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres", textureUV = {0, 28, 185, 32}, color = {0, 0, 0, 255},},},},}, GetResearchButton("btnUpgradeToClone", UGT_UPGRADE_DFT, UGT_UPGRADE_OVR, UGT_UPGRADE_PRS), GetResearchButton("btnUpgradeToClone2", UGT_TECH_DFT, UGT_TECH_OVR, UGT_TECH_PRS), GetResearchButton("btnUpgradeToClone3", UGT_ABILITY_DFT, UGT_ABILITY_OVR, UGT_ABILITY_PRS), GetCollapsableQueue(OUTLINECOLOR, RESEARCHQUEUECOLOR, 94),
{type = "Frame", position = {0, 393}, name = "frameQueues", autosize = 1, autoarrange = 1, autoarrangeSpace = 0, autoarrangeWidth = 393, customData = 4, outerBorderWidth = 1, borderColor = OUTLINECOLOR},}
