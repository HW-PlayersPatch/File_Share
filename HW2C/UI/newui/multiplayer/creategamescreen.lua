-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

CreateGameScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "FEColorBackground2"}, titleCreateGame = "$3026", titleJoinGame = "$3032", pixelUVCoords = 1, ;
	{type = "Frame", position = {273, 226}, size = {254, 148}, backgroundColor = "FEColorDialog", ;
	{type = "Frame", position = {4, 4}, size = {(254 - 8), 100}, style = "FEPopupBackgroundStyle"},
	{type = "Frame", position = {2, 2}, size = {250, 32}, ;
	{type = "Frame", size = {250, 34}, borderWidth = 2, borderColor = "FEColorPopupOutline"},},
	{type = "TextLabel", position = {9, 3}, size = {240, 16}, name = "lblTitle", Text = {text = "$3026", textStyle = "FEHeading3"},},
	{type = "TextLabel", position = {9, 17}, size = {240, 11}, Text = {text = "$3027", textStyle = "FEHeading4"},},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", visible = 0, enabled = 0, resizeToListBox = 1, Text = {textStyle = "FEListBoxItemTextStyle"}, position = {4, 4}, width = 120, name = "ddLstChooseGameTypeTemplate"},
	{type = "Frame", position = {3, 31}, autosize = 1, autoarrange = 1, outerBorderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "Frame", size = {248, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextLabel", position = {4, 3}, size = {120, 13}, Text = {text = "$3028", textStyle = "FEHeading4"},},
	{type = "TextInput", position = {125, 3}, width = 120, textInputStyle = "FETextInputStyle", name = "txtGameName", helpTipTextLabel = "helpTip", helpTip = "$3025"},},
	{type = "Frame", size = {248, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextLabel", position = {4, 3}, name = "labelGameInfo", size = {120, 13}, Text = {text = "$3031", textStyle = "FEHeading4"},},
	{type = "Button", name = "btnGameInfo", position = {107, 2}, buttonStyle = "FEInfoButtonStyle", helpTipTextLabel = "helpTip", helpTip = "$3021"},
	{type = "DropDownListBox", dropDownListBoxStyle = "FEDropDownListBoxStyle", position = {125, 3}, size = {120, 13}, name = "ddLstChooseGameType", helpTipTextLabel = "helpTip", helpTip = "$3024", disabledHelpTip = "$3033"},},
	{type = "Frame", size = {248, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextLabel", position = {4, 3}, size = {120, 13}, Text = {text = "$3029", textStyle = "FEHeading4"},},
	{type = "TextInput", position = {125, 3}, width = 120, textInputStyle = "FETextInputStyle", password = 1, name = "txtPassword", helpTipTextLabel = "helpTip", helpTip = "$3023", maxTextLength = 16},},
	{type = "Frame", size = {248, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextLabel", position = {4, 3}, size = {120, 13}, name = "labelConfirmPassword", Text = {text = "$3030", textStyle = "FEHeading4"},},
	{type = "TextInput", textInputStyle = "FETextInputStyle", position = {125, 3}, width = 120, password = 1, name = "txtConfirmPassword", helpTipTextLabel = "helpTip", helpTip = "$3022", maxTextLength = 16},},
	{type = "Frame", position = {5, 88}, size = {248, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextLabel", position = {5, 3}, size = {240, 13}, Text = {textStyle = "FEHelpTipTextStyle"}, name = "helpTip"},},
	{type = "Frame", size = {248, 19}, borderWidth = 1, borderColor = "FEColorPopupOutline", ;
	{type = "TextButton", position = {125, 3}, buttonStyle = "FEButtonStyle1", Text = {text = "$2613", textStyle = "FEButtonTextStyle"}, name = "btnCancel", helpTipTextLabel = "helpTip", helpTip = "$2613"},
	{type = "TextButton", position = {3, 3}, buttonStyle = "FEButtonStyle2", Text = {text = "$2612", textStyle = "FEButtonTextStyle"}, name = "btnAccept", helpTipTextLabel = "helpTip", helpTip = "$2612"},},},},}
