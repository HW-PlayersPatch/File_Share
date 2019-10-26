-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

ObjectivesList = {size = {225, 119, 351, 266}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, soundOnShow = "SFX_ObjectiveMenuONOFF", soundOnHide = "SFX_ObjectiveMenuONOFF", pixelUVCoords = 1, ;
	{type = "TextLabel", position = {4, 1}, size = {208, 14}, name = "lblTitle", Text = {textStyle = "IGHeading1", text = "$2750"},},
	{type = "TextLabel", position = {4, 16}, size = {208, 13}, name = "lblSubtitle", Text = {textStyle = "IGHeading2", text = "$2751"},},
	{type = "Frame", position = {3, 31}, autosize = 1, borderColor = "IGColorOutline", outerBorderWidth = 1, ;
	{type = "Frame", position = {0, 0}, size = {173, 15}, backgroundColor = "IGColorOutline", ;
	{type = "TextLabel", position = {0, 0}, size = {173, 15}, Text = {textStyle = "IGButtonTextStyle", text = "$2752", color = {0, 0, 0, 255}, offset = {1, 1},},},
	{type = "TextLabel", position = {0, 0}, size = {173, 15}, Text = {textStyle = "IGButtonTextStyle", text = "$2752", color = "FEColorHeading3"},},},
	{type = "ListBox", listBoxStyle = "FEBorderListBoxStyle", position = {0, 15}, size = {173, 92}, name = "primaryList", hugBottom = 1},
	{type = "Line", p1 = {153, 15}, p2 = {153, 107}, lineWidth = 2, color = "IGColorOutline"},
	{type = "Frame", position = {0, 107}, size = {173, 15}, backgroundColor = "IGColorOutline", ;
	{type = "TextLabel", position = {0, 0}, size = {173, 15}, Text = {textStyle = "IGButtonTextStyle", text = "$2753", color = {0, 0, 0, 255}, offset = {1, 1},},},
	{type = "TextLabel", position = {0, 0}, size = {173, 15}, Text = {textStyle = "IGButtonTextStyle", text = "$2753", color = "FEColorHeading3"},},},
	{type = "ListBox", listBoxStyle = "FEBorderListBoxStyle", position = {0, 122}, size = {173, 91}, name = "secondaryList", hugBottom = 1},
	{type = "Line", p1 = {153, 122}, p2 = {153, 213}, lineWidth = 2, color = "IGColorOutline"},
	{type = "ListBox", listBoxStyle = "FEBorderListBoxStyle", position = {173, 0}, size = {172, 213}, name = "descriptionList"},
	{type = "Line", p1 = {325, 0}, p2 = {325, 213}, lineWidth = 2, color = "IGColorOutline"},
	{type = "Frame", position = {0, 213}, size = {345, 19}, borderWidth = 1, borderColor = "IGColorOutline", ;
	{type = "TextButton", position = {3, 3}, width = (345 - 6), buttonStyle = "DiplomacyScreen_ButtonStyle", Text = {text = "$2642"}, onMousePressed = "UI_ToggleScreen( 'ObjectivesList', 0)"},},},
	{type = "ListBoxItem", name = "listItem", autosize = 1, visible = 0, pressedColor = {255, 255, 255, 64}, overColor = {255, 255, 255, 32}, ;
	{type = "Frame", position = {3, 2}, size = {11, 11}, name = "iconincomplete", visible = 0, BackgroundGraphic = {size = {11, 11}, texture = "DATA:UI\\NewUI\\InGameIcons\\objectiveincomplete.tga", textureUV = {0, 0, 11, 11},},},
	{type = "Frame", position = {3, 2}, size = {11, 11}, name = "iconcomplete", visible = 0, BackgroundGraphic = {size = {11, 11}, texture = "DATA:UI\\NewUI\\InGameIcons\\objectivecomplete.tga", textureUV = {0, 0, 11, 11},},},
	{type = "Frame", position = {3, 2}, size = {11, 11}, name = "iconfailed", visible = 0, BackgroundGraphic = {size = {11, 11}, texture = "DATA:UI\\NewUI\\InGameIcons\\objectivefailed.tga", textureUV = {0, 0, 11, 11},},},
	{type = "TextLabel", name = "textincomplete", position = {18, 1}, size = {130, 13}, visible = 0, wrapping = 1, autosize = 1, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left", color = {255, 255, 255, 255},},},
	{type = "TextLabel", name = "textcomplete", position = {18, 1}, size = {130, 13}, visible = 0, wrapping = 1, autosize = 1, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left", color = {255, 255, 255, 128},},},
	{type = "TextLabel", name = "textfailed", position = {18, 1}, size = {130, 13}, visible = 0, wrapping = 1, autosize = 1, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left", color = {205, 0, 0, 255},},},},
	{type = "ListBoxItem", name = "descriptionItem", autosize = 1, visible = 0, ;
	{type = "TextLabel", name = "text", position = {0, 0}, size = {147, 13}, visible = 0, wrapping = 1, autosize = 1, marginWidth = 2, marginHeight = 2, Text = {textStyle = "Taskbar_MenuButtonTextStyle", font = "ChatFont", hAlign = "Left", color = {255, 255, 255, 255},},},
	{type = "TextLabel", name = "textcomplete", position = {0, 0}, size = {147, 13}, visible = 0, wrapping = 1, autosize = 1, marginWidth = 2, marginHeight = 2, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left", font = "ChatFont", color = {255, 255, 255, 128},},},
	{type = "TextLabel", name = "textfailed", position = {0, 0}, size = {147, 13}, visible = 0, wrapping = 1, autosize = 1, marginWidth = 2, marginHeight = 2, Text = {textStyle = "Taskbar_MenuButtonTextStyle", hAlign = "Left", font = "ChatFont", color = {205, 0, 0, 255},},},},
	{type = "TextLabel", name = "descriptionTitle", autosize = 1, visible = 0, Text = {textStyle = "Taskbar_MenuButtonTextStyle", text = "$2754", color = {255, 255, 255, 255},},},}
