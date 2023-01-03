-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

function GetChatTable(_x, _y, _w, _h)
	local ChatTable =
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {_x, _y}, size = {_w, _h}, name = "frmRootLobbycht", ;
	{type = "TextLabel", position = {6, 5}, size = {_w, 15}, name = "txtLblGAMEROOMCHAT", Text = {text = "$3413", textStyle = "FEHeading3"},},
	{type = "TextLabel", position = {6, 20}, size = {_w, 9}, name = "txtLblTYPECHATMESSAGE", Text = {text = "$3415", textStyle = "FEHeading4"},},
	{type = "TextLabel", position = {(_w - 159), 20}, size = {139, 9}, name = "txtLblTYPESUPPRESSOPTION", Text = {text = "$3483", textStyle = "FEHeading4", hAlign = "Right"},},
	{type = "Button", buttonStyle = "FEReadyButtonStyle", name = "btnSuppress", position = {(_w - 19), 16}, visible = 1, pressed = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$3484"},
	{type = "Frame", position = {2, 31}, size = {(_w - 4), (_h - 33)}, borderWidth = 2, borderColor = "FEColorOutline", ;
	{type = "ListBox", position = {2, 2}, size = {(_w - 153), (_h - 56)}, name = "lstBoxmainChat", backgroundColor = {0, 0, 0, 0}, hugBottom = 1, maxItems = 200},
	{type = "ListBoxItem", visible = 0, enabled = 0, autosize = 1, name = "lstBoxmainChatTemplate", ;
	{type = "TextLabel", name = "m_lblText", Text = {textStyle = "FEListBoxItemTextStyle", color = {255, 255, 255, 255}, font = "ChatFont", offset = {0, 0},}, width = (_w - 152), wrapping = 1, autosize = 1, marginWidth = 2},},
	{type = "ListBox", position = {(_w - 146), 2}, size = {138, (_h - 56)}, name = "lstBoxPlayers"},
	{type = "ListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", visible = 0, enabled = 0, Text = {textStyle = "FEListBoxItemTextStyle"}, size = {120, 13}, name = "lstBoxPlayersTemplate", ;
	{type = "TextLabel", name = "lblName", size = {108, 13}, position = {13, 0}, visible = 1, Text = {textStyle = "FEListBoxItemTextStyle", offset = {4, 0},},},
	{type = "Button", name = "btnListAll", visible = 1, size = {13, 13}, position = {0, 0}, borderColor = {0, 175, 255, 255}, borderWidth = 0, DefaultGraphic = {texture = "data:ui/newui/network/chat_icons.tga", textureUV_TL = {19, 41}, textureUV_WH = {13, 13},}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3480"},
	{type = "Button", name = "btnListIgnore", visible = 0, size = {13, 13}, position = {0, 0}, borderColor = {0, 175, 255, 255}, borderWidth = 0, DefaultGraphic = {texture = "data:ui/newui/network/chat_icons.tga", textureUV_TL = {34, 41}, textureUV_WH = {13, 13},}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3481"},
	{type = "Button", name = "btnListWhisper", visible = 0, size = {13, 13}, position = {0, 0}, borderColor = {0, 175, 255, 255}, borderWidth = 0, DefaultGraphic = {texture = "data:ui/newui/network/chat_icons.tga", textureUV_TL = {3, 42}, textureUV_WH = {13, 13},}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3482"},},
	{type = "Line", above = 0, p1 = {0, (_h - 54)}, p2 = {_w, (_h - 54)}, lineWidth = 2, color = "FEColorOutline"},
	{type = "TextLabel", position = {3, (_h - 50)}, size = {8, 13}, Text = {font = "ChatFont", color = {255, 255, 255, 255}, hAlign = "Left", text = "$2848"}, giveParentMouseInput = 1},
	{type = "DestinationTextInput", textInputStyle = "FEChatTextInputStyle", position = {0, (_h - 54)}, size = {(_w - 166), 21}, name = "txtInputChat", helpTipTextLabel = "m_lblHelpText", helpTip = "$3442", maxTextLength = 128, marginWidth = 9, Text = {font = "ChatFont"}, onAccept = "if(UI_ScreenIsActive('LobbyScreen')  =  =  1) then UI_GiveFocus('txtInputChat','LobbyScreen') else UI_GiveFocus('txtInputChat','LobbyTitleRoom') end"},
	{type = "Button", name = "btnToAll", visible = 1, size = {64, 13}, position = {(_w - 164), (_h - 50)}, borderColor = {0, 175, 255, 255}, borderWidth = 2, DefaultGraphic = {texture = "data:ui/newui/network/chat_icons.tga", textureUV_TL = {0, 26}, textureUV_WH = {64, 13},}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3443", onMouseClicked =  [[UI_SetElementVisible( "", "btnToAll", 0 ); UI_SetElementVisible( "", "btnWhisper", 1 );]]},
	{type = "Button", name = "btnWhisper", visible = 0, size = {64, 13}, position = {(_w - 164), (_h - 50)}, borderColor = {0, 175, 255, 255}, borderWidth = 2, DefaultGraphic = {texture = "data:ui/newui/network/chat_icons.tga", textureUV_TL = {0, 0}, textureUV_WH = {64, 13},}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3444", onMouseClicked =  [[UI_SetElementVisible( "", "btnWhisper", 0 ); UI_SetElementVisible( "", "btnWhisperToList", 1 );]]},
	{type = "Button", name = "btnWhisperToList", visible = 0, size = {64, 13}, position = {(_w - 164), (_h - 50)}, borderColor = {0, 175, 255, 255}, borderWidth = 2, DefaultGraphic = {texture = "data:ui/newui/network/chat_icons.tga", textureUV_TL = {0, 13}, textureUV_WH = {64, 13},}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3449", onMouseClicked =  [[UI_SetElementVisible( "", "btnWhisperToList", 0 ); UI_SetElementVisible( "", "btnToAll", 1 );]]},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {(_w - 98), (_h - 50)}, size = {90, 13}, name = "txtBtnSEND", Text = {text = "$3416", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$3445"},
	{type = "Line", above = 0, p1 = {(_w - 166), 0}, p2 = {(_w - 166), (_h - 54)}, lineWidth = 2, color = "FEColorOutline"},
	{type = "Line", above = 0, p1 = {(_w - 147), 0}, p2 = {(_w - 147), (_h - 54)}, lineWidth = 2, color = "FEColorOutline"},
	{type = "Line", above = 0, p1 = {(_w - 23), 0}, p2 = {(_w - 23), (_h - 54)}, lineWidth = 2, color = "FEColorOutline"},},}
	return ChatTable;
end
