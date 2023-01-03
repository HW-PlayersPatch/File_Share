-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

ChatScreen = {size = {225, 16, 351, 97}, stylesheet = "HW2StyleSheet", RootElementSettings = {backgroundColor = "IGColorBackground1"}, soundOnShow = "SFX_ChatMenuONOFF", soundOnHide = "SFX_ChatMenuONOFF", pixelUVCoords = 1, callUpdateWhenInactive = 1, sayFormatID = 3354, whisperFormatID = 3365, whisperEchoFormatID = 3369, whisperTeamEchoFormatID = 3353, ;
	{type = "Frame", position = {3, 3}, autosize = 1, autoarrange = 1, borderColor = "IGColorOutline", outerBorderWidth = 1, ;
	{type = "RadioButton", name = "player1", buttonStyle = "Chat_PlayerButtonStyle"},
	{type = "RadioButton", name = "player2", buttonStyle = "Chat_PlayerButtonStyle"},
	{type = "RadioButton", name = "player3", buttonStyle = "Chat_PlayerButtonStyle"},
	{type = "RadioButton", name = "player4", buttonStyle = "Chat_PlayerButtonStyle"},
	{type = "RadioButton", name = "player5", buttonStyle = "Chat_PlayerButtonStyle"},
	{type = "RadioButton", name = "teambutton", buttonStyle = "Chat_PlayerButtonStyle", Text = {text = "$2845"},},
	{type = "RadioButton", name = "allbutton", buttonStyle = "Chat_PlayerButtonStyle", Text = {text = "$2846"},},},
	{type = "ListBox", position = {88, 0}, size = {263, 80}, name = "listChat", hugBottom = 1, marginWidth = 2, ScrollBar = {stepSize = 13, pageSize = 76}, maxItems = 64},
	{type = "TextLabel", position = {95, 81}, size = {8, 13}, Text = {font = "ChatFont", color = {255, 255, 255, 255}, hAlign = "Left", text = "$2848"}, giveParentMouseInput = 1},
	{type = "DestinationTextInput", name = "chatInput", position = {93, 81}, size = {255, 13}, borderWidth = 1, outerBorderWidth = 1, borderColor = "IGColorOutline", marginWidth = 8, Text = {font = "ChatFont", color = {255, 255, 255, 255}, hAlign = "Left"},},
	{type = "ListBoxItem", name = "listItem", autosize = 1, visible = 0, ;
	{type = "TextLabel", name = "text", position = {4, 0}, size = {242, 12}, wrapping = 1, autosize = 1, Text = {font = "ChatFont", color = {255, 255, 255, 255}, hAlign = "Left"},},},}
