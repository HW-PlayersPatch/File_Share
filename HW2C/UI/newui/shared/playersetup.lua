-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

PlayerSetup = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "FEColorBackground2"}, pixelUVCoords = 1, ;
	{type = "Frame", position = {151, 70}, size = {498, 453}, backgroundColor = "FEColorDialog", ;
	{type = "Frame", position = {4, 4}, size = {490, 100}, style = "FEPopupBackgroundStyle"},
	{type = "Frame", position = {2, 2}, size = {494, 32}, ;
	{type = "Frame", size = {494, 34}, borderWidth = 2, borderColor = "FEColorPopupOutline"},},
	{type = "Frame", position = {3, 33}, autosize = 1, autoarrange = 1, outerBorderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "Frame", size = {492, 257}, borderWidth = 1, borderColor = "FEColorPopupOutline"},
	{type = "Frame", size = {492, 124}, borderWidth = 1, borderColor = "FEColorPopupOutline"},
	{type = "TextLabel", name = "helpTip", size = {492, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", Text = {textStyle = "FEHelpTipTextStyle", offset = {4, 0},},},
	{type = "Frame", size = {492, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline"},},
	{type = "TextLabel", position = {7, 2}, autosize = 1, marginWidth = 0, marginHeight = 0, Text = {text = "$2775", textStyle = "FEHeading3", hAlign = "Left", vAlign = "Top"},},
	{type = "TextLabel", position = {7, 19}, autosize = 1, Text = {text = "$2776", textStyle = "FEHeading4", hAlign = "Left", vAlign = "Top"},},
	{type = "TextLabel", position = {6, 36}, size = {242, 13}, marginWidth = 6, Text = {text = "$2789", textStyle = "FEHeading4"},},
	{type = "TextInput", name = "chatname", textInputStyle = "FETextInputStyle", position = {250, 36}, width = 242, maxTextLength = 16, helpTipTextLabel = "helpTip", helpTip = "$2791"},
	{type = "TextLabel", position = {6, 52}, size = {242, 13}, marginWidth = 6, Text = {text = "$2777", textStyle = "FEHeading4"},},
	{type = "DropDownListBox", position = {250, 52}, size = {242, 13}, name = "raceselect", selected = 0, ListBox = {backgroundColor = {0, 0, 0, 255}, width = 242, ;
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", resizeToListBox = 1, Text = {textStyle = "FEListBoxItemTextStyle", text = "$2787"}, onMouseClicked =  [[UI_SetElementVisible("PlayerSetup", "shippreview", 1); UI_SetElementVisible("PlayerSetup", "vshippreview", 0);]]},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", resizeToListBox = 1, Text = {textStyle = "FEListBoxItemTextStyle", text = "$2788"}, onMouseClicked =  [[UI_SetElementVisible("PlayerSetup", "shippreview", 0); UI_SetElementVisible("PlayerSetup", "vshippreview", 1);]]},}, helpTipTextLabel = "helpTip", helpTip = "$2792"},
	{type = "Line", p1 = {3, 67}, p2 = {496, 67}, above = 0, color = "FEColorPopupOutline", lineWidth = 2},
	{type = "Frame", position = {6, 71}, size = {486, 216}, name = "grid", visible = 1, BackgroundGraphic = {texture = "DATA:UI\\NewUI\\PlayerSetup\\grid.tga", textureUV = {0, 0, 486, 216},}, helpTipTextLabel = "helpTip", helpTip = "$2793"},
	{type = "Frame", position = {6, 71}, size = {486, 216}, name = "shippreview", visible = 1, helpTipTextLabel = "helpTip", helpTip = "$2793", ;
	{type = "Frame", position = {93, 5}, size = {300, 190}, BackgroundGraphic = {size = {300, 190}, texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_base.tga", textureUV = {0, 0, 300, 190},}, giveParentMouseInput = 1, ;
	{type = "Frame", position = {0, 0}, size = {300, 190}, name = "shipteamcolor", BackgroundGraphic = {size = {300, 190}, texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_teamcolor.tga", textureUV = {0, 0, 300, 190}, color = {118, 174, 207, 255},}, giveParentMouseInput = 1, ;
	{type = "Frame", position = {0, 0}, size = {300, 190}, name = "shipstripecolor", BackgroundGraphic = {size = {300, 190}, texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_stripecolor.tga", textureUV = {0, 0, 300, 190},}, giveParentMouseInput = 1},},
	{type = "Frame", name = "hgn_emblem1", position = {46, 21}, size = {26, 26}, BackgroundGraphic = {texture = "DATA:Badges/Hiigaran.tga", textureUV = {64, 64, 0, 0}, color = {240, 240, 240, 255},}, giveParentMouseInput = 1},
	{type = "Frame", name = "hgn_emblem2", position = {46, 142}, size = {26, 26}, BackgroundGraphic = {texture = "DATA:Badges/Hiigaran.tga", textureUV = {0, 0, 64, 64}, color = {200, 200, 200, 255},}, giveParentMouseInput = 1},},
	{type = "Frame", size = {486, 216}, BackgroundGraphic = {texture = "DATA:UI\\NewUI\\PlayerSetup\\labeltext.tga", textureUV = {0, 0, 486, 216},}, giveParentMouseInput = 1},},
	{type = "Frame", position = {6, 71}, size = {486, 216}, name = "vshippreview", visible = 0, helpTipTextLabel = "helpTip", helpTip = "$2793", ;
	{type = "Frame", position = {24, 42}, size = {438, 116}, BackgroundGraphic = {size = {438, 116}, texture = "DATA:UI\\NewUI\\PlayerSetup\\vship_base.tga", textureUV = {0, 0, 438, 116},}, giveParentMouseInput = 1, ;
	{type = "Frame", position = {0, 0}, size = {438, 116}, name = "vshipteamcolor", BackgroundGraphic = {size = {438, 116}, texture = "DATA:UI\\NewUI\\PlayerSetup\\vship_teamcolor.tga", textureUV = {0, 0, 438, 116}, color = {118, 174, 207, 255},}, giveParentMouseInput = 1, ;
	{type = "Frame", position = {0, 0}, size = {438, 116}, name = "vshipstripecolor", BackgroundGraphic = {size = {438, 116}, texture = "DATA:UI\\NewUI\\PlayerSetup\\vship_stripecolor.tga", textureUV = {0, 0, 438, 116},}, giveParentMouseInput = 1},
	{type = "Frame", name = "vgr_emblem", position = {116, 14}, size = {26, 26}, BackgroundGraphic = {texture = "DATA:Badges/Hiigaran.tga", textureUV = {0, 0, 64, 64}, color = {255, 255, 255, 255},}, giveParentMouseInput = 1},},},
	{type = "Frame", size = {486, 216}, BackgroundGraphic = {texture = "DATA:UI\\NewUI\\PlayerSetup\\vlabeltext.tga", textureUV = {0, 0, 486, 216},}, giveParentMouseInput = 1},},
	{type = "Frame", name = "emblemback", position = {6, 308}, size = {246, 88}, backgroundColor = {118, 174, 207, 255}, ;
	{type = "Frame", name = "emblemstripes", position = {94, 0}, size = {152, 88}, BackgroundGraphic = {size = {152, 88}, texture = "DATA:UI\\NewUI\\PlayerSetup\\stripes.tga", textureUV = {103, 1, 255, 89},}, giveParentMouseInput = 1},
	{type = "Frame", name = "emblem", position = {91, 12}, size = {64, 64}, BackgroundGraphic = {size = {64, 64}, texture = "DATA:Badges/Hiigaran.tga", textureUV = {0, 0, 64, 64},}, giveParentMouseInput = 1},},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {6, 398}, size = {246, 13}, Text = {text = "$2779", textStyle = "FEButtonTextStyle"}, onMouseClicked = "UI_ShowScreen( 'EmblemSelect', 0)", helpTipTextLabel = "helpTip", helpTip = "$2794"},
	{type = "RadioButton", name = "teamcolor", position = {6, 293}, size = {122, 13}, Text = {text = "$2781", textStyle = "FEButtonTextStyle", dropShadow = 1}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {255, 255, 255, 128}, pressedBorderColor = {255, 255, 255, 255}, textColor = {255, 255, 255, 255}, overTextColor = {255, 255, 255, 255}, pressedTextColor = {255, 255, 255, 255}, clickedColor = {0, 0, 0, 255}, clickedTextColor = {255, 255, 255, 255}, helpTipTextLabel = "helpTip", helpTip = "$2795"},
	{type = "RadioButton", name = "stripecolor", position = {130, 293}, size = {122, 13}, Text = {text = "$2782", textStyle = "FEButtonTextStyle", dropShadow = 1}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {255, 255, 255, 128}, pressedBorderColor = {255, 255, 255, 255}, textColor = {255, 255, 255, 255}, overTextColor = {255, 255, 255, 255}, pressedTextColor = {255, 255, 255, 255}, clickedColor = {0, 0, 0, 255}, clickedTextColor = {255, 255, 255, 255}, helpTipTextLabel = "helpTip", helpTip = "$2796"},
	{type = "Frame", position = {254, 323}, size = {223, 88}, name = "colorpicker", BackgroundGraphic = {texture = "DATA:UI\\NewUI\\PlayerSetup\\colorpicker.tga", textureUV = {0, 0, 128, 32},}, helpTipTextLabel = "helpTip", helpTip = "$2797", ;
	{type = "Frame", position = {-5, -5}, size = {11, 11}, name = "cursor", BackgroundGraphic = {size = {11, 11}, texture = "DATA:UI\\NewUI\\PlayerSetup\\colorcursor.tga", textureUV = {0, 0, 11, 11},}, giveParentMouseInput = 1},},
	{type = "Frame", position = {479, 323}, size = {13, 88}, name = "greyscale", BackgroundGraphic = {size = {13, 88}, texture = "DATA:UI\\NewUI\\PlayerSetup\\greyscale.tga", textureUV = {0, 0, 8, 32},}, helpTipTextLabel = "helpTip", helpTip = "$2778", ;
	{type = "Frame", position = {0, -1}, size = {15, 3}, name = "cursor", BackgroundGraphic = {size = {15, 3}, texture = "DATA:UI\\NewUI\\PlayerSetup\\greycursor.tga", textureUV = {0, 0, 15, 3},}, giveParentMouseInput = 1},},
	{type = "Frame", name = "colorswatches", position = {253, 293}, autosize = 1, autoarrange = 1, autoarrangeWidth = 240},
	{type = "Frame", name = "colorswatch", visible = 0, size = {15, 29}, backgroundColor = {255, 0, 0, 255}, borderWidth = 1, borderColor = {0, 0, 0, 0}, ;
	{type = "Button", name = "savecolor", size = {15, 29}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {255, 255, 255, 255}, pressedBorderColor = {0, 0, 0, 0}, BackgroundGraphic = {position = {2, 15}, size = {11, 13}, texture = "DATA:UI\\NewUI\\PlayerSetup\\arrowup.tga", textureUV = {0, 0, 11, 13}, color = {0, 0, 0, 255},}, OverGraphic = {position = {2, 15}, size = {11, 13}, texture = "DATA:UI\\NewUI\\PlayerSetup\\arrowup.tga", textureUV = {0, 0, 11, 13}, color = {255, 255, 255, 255},}, PressedGraphic = {position = {2, 15}, size = {11, 13}, texture = "DATA:UI\\NewUI\\PlayerSetup\\arrowup.tga", textureUV = {0, 0, 11, 13}, color = {255, 255, 255, 255},}, helpTipTextLabel = "helpTip", helpTip = "$2783"},
	{type = "Button", name = "pickcolor", size = {15, 16}, borderWidth = 1, borderColor = {0, 0, 0, 0}, overBorderColor = {255, 255, 255, 255}, pressedBorderColor = {0, 0, 0, 0}, helpTipTextLabel = "helpTip", helpTip = "$2784"},},
	{type = "TextButton", name = "restoreDefaults", position = {6, 436}, width = 160, buttonStyle = "FEButtonStyle1", Text = {text = "$2805", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "helpTip", helpTip = "$2806"},
	{type = "TextButton", position = {372, 436}, buttonStyle = "FEButtonStyle1", Text = {text = "$2613", textStyle = "FEButtonTextStyle"}, name = "cancelbutton", helpTipTextLabel = "helpTip", helpTip = "$2798"},
	{type = "TextButton", position = {250, 436}, buttonStyle = "FEButtonStyle2", Text = {text = "$2612", textStyle = "FEButtonTextStyle"}, name = "acceptbutton", helpTipTextLabel = "helpTip", helpTip = "$2799"},},}
