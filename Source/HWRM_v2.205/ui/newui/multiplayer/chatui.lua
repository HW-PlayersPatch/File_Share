-- CHAT UI FOR GAME LOBBY SCREEN AND SERVER LOBBY SCREEN

function GetChatTable(_x, _y, _w, _h)

local ChatTable = {
	type = "Frame",
	backgroundColor = "FEColorBackground1",
	--position = {414,69},
	--size = {380,469},
	position = {_x, _y},
	size = {_w, _h},
	name = "frmRootLobbycht",
	;

	-- TEXTLABEL TITLE
	{
		type = "TextLabel",
		position = {6,5},
		size = {_w,15},
		name = "txtLblGAMEROOMCHAT",
		Text = {
			text = "$3413", -- GAME ROOM CHAT
			textStyle = "FEHeading3",
		},
		;
	},

	-- TEXTLABEL SUBTITLE
	{
		type = "TextLabel",
		position = {6,20},
		size = {_w,9},
		name = "txtLblTYPECHATMESSAGE",
		Text = {
			text = "$3415", -- TYPE CHAT MESSAGE//
			textStyle = "FEHeading4",
		},
		;
	},
	
	-- SUPPRESS BUTTON Label
	{
		type = "TextLabel",
		position = {_w - 159, 20},
		size = {139 ,9},
		name = "txtLblTYPESUPPRESSOPTION",
		Text = {
			text = "$3483", -- SUPPRESS
			--text = "SUPPRESS",
			textStyle = "FEHeading4",
			hAlign = "Right",
		},
		;	
	},
	
	-- button to toggle the lobby join/leave msg	
	{
		type = "Button",
		buttonStyle = "FEReadyButtonStyle",
		name = "btnSuppress",
		
		position = { _w - 19 , 16 },
		visible = 1,
		pressed = 1,

		helpTipTextLabel = "m_lblHelpText",
		helpTip = "$3484", -- SUPPRESS JOIN / LEAVE LOBBY MESSAGES
	},	
	-- end of suppress option	
	
	-- FRAME FOR OUTLINE
	{
		type = "Frame",
		position = {2,31},
		--size = {376,436},
		size = {_w - 4,_h - 33},
		borderWidth = 2,
		borderColor = "FEColorOutline",
		;
		
		-- LIST BOX FOR CHAT MESSAGES
		{
			type = "ListBox",
			listBoxStyle = "FEListBoxStyle_Bordered",
			position = {2,2},
			--size = {246,412},
			--size = {_w - 134, _h - 56},
			size = {_w - 153, _h - 56}, -- moves the scrollbar
			name = "lstBoxmainChat",
			backgroundColor = {0,0,0,0},
			hugBottom = 1,
			maxItems = 200,
			;
		},
		
		-- LIST BOX ITEM TO CLONE FOR CHAT MESSAGES
		{
			type = "ListBoxItem",
			visible = 0,
			enabled = 0,
			autosize = 1,
			name = "lstBoxmainChatTemplate",
			;
			{
				type = "TextLabel",
				name = "m_lblText",
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					color = {255,255,255,255},
					font = "ChatFont",
					offset = {0,0},
				},
				--width = 228,
				width = _w - 152,
				wrapping = 1,
				autosize = 1,
				marginWidth = 2,
			},
		},
		
		-- LISTBOX FOR PLAYERS
		{
			type = "ListBox",
			listBoxStyle = "FEListBoxStyle_Bordered",
			--size = {380,469},
			
			--position = {252,2},
			--size = {120,412},
			position = {_w - 146, 2},
			size = {138, _h - 56},
			name = "lstBoxPlayers",
			;
		},
		-- LISTBOX ITEM TO CLONE FOR PLAYERS NAMES
		{
			type = "ListBoxItem",
			buttonStyle = "FEListBoxItemButtonStyle",
			visible = 0,
			enabled = 0,
			Text = {
				textStyle = "FEListBoxItemTextStyle",
			},
			size = {120,13},
			name = "lstBoxPlayersTemplate",
			;

				{
					type = "TextLabel",
					name = "lblName",
					size = { 108, 13 },
					position = { 13, 0 },
					visible = 1,
						
					Text = {
						--text = "TEST",
						textStyle = "FEListBoxItemTextStyle", 
						--font = "ListBoxItemFont",
					--	vAlign = "Middle",
					--	hAlign = "Left",
						offset = {4,0},
					--	color = {0,0,0,255},
					}
				},
							-- test of adding new buttons
				{
 					type = "Button",
 				    name = "btnListAll",
 				    visible = 1,
 					size = {13, 13},
					--position = {216, 419},
					position = {0, 0},
			
					borderColor = {0, 175, 255, 255},
					borderWidth = 0,
			
					DefaultGraphic = {
						texture = "data:ui/newui/network/chat_icons.tga",
						textureUV_TL = {19,41},
						textureUV_WH = {13, 13},
					},
			
					helpTipTextLabel = "m_lblHelpText",
					helpTip = "$3480", --USER IS ONLINE
				
					-- swap with the whisper button
 					--onMouseClicked = [[UI_SetElementVisible( "", "btnListIgnore", 0 ); UI_SetElementVisible( "", "btnListWhisper", 1 );]];
					-- the code would need to check the child and see which one is visible! 
					
 				},	
							
 				{
 					type = "Button",
 				    name = "btnListIgnore",
 				    visible = 0,
 					size = {13, 13},
					--position = {216, 419},
					position = {0, 0},
			
					borderColor = {0, 175, 255, 255},
					borderWidth = 0,
			
					DefaultGraphic = {
						texture = "data:ui/newui/network/chat_icons.tga",
						textureUV_TL = {34,41},
						textureUV_WH = {13, 13},
					},
			
					helpTipTextLabel = "m_lblHelpText",
					helpTip = "$3481",--USER IS IN YOUR IGNORE GROUP
				
					-- swap with the whisper button
 					--onMouseClicked = [[UI_SetElementVisible( "", "btnListIgnore", 0 ); UI_SetElementVisible( "", "btnListWhisper", 1 );]];
					-- the code would need to check the child and see which one is visible! 
					
 				},
 				{
 					type = "Button",
 				    name = "btnListWhisper",
 				    visible = 0,
 					size = {13, 13},
					--position = {216, 419},
					position = {0, 0},
			
					borderColor = {0, 175, 255, 255},
					borderWidth = 0,
			
					DefaultGraphic = {
						texture = "data:ui/newui/network/chat_icons.tga",
						textureUV_TL = {3,42},
						textureUV_WH = {13, 13},
					},
			
					helpTipTextLabel = "m_lblHelpText",
					helpTip = "$3482", --USER IS IN YOUR WHISPER GROUP
				
					-- swap with the whisper button
 					--onMouseClicked = [[UI_SetElementVisible( "", "btnListIgnore", 0 ); UI_SetElementVisible( "", "btnListWhisper", 1 );]];
					-- the code would need to check the child and see which one is visible! 
					
 				},			

		},
		
		
		-- BOTTOM HORZ LINE (ABOVE CHAT INPUT BOX)
		{
			type = "Line",
			above = 0,
			--p1 = {0, 415},
			--p2 = {442, 415},
			p1 = {0, _h - 54},
			p2 = {_w, _h - 54},
			lineWidth = 2,
			color = "FEColorOutline",
		},
		
		-- chat prompt cursor >
		{
			type = "TextLabel",
			position = { 3, _h - 50},
			size = { 8, 13},
			Text = {
				font = "ChatFont",
				color = { 255, 255, 255, 255},
				hAlign = "Left",
				text = "$2848", -- >
			},
			giveParentMouseInput = 1,
		},
		
		-- TEXT INPUT FOR CHAT MESSAGE
		{
			type = "DestinationTextInput",			
			textInputStyle = "FEChatTextInputStyle",
			--position = {0,415},
			--size = {214,21},
			position = {0, _h - 54},
			size = {_w - 166, 21},
			name = "txtInputChat",
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$3442",--ENTER YOUR CHAT MESSAGE
			maxTextLength = 128,
			marginWidth = 9,
			Text = {
				font = "ChatFont",
			},
			
			onAccept = "if(UI_ScreenIsActive('LobbyScreen') == 1) then UI_GiveFocus('txtInputChat','LobbyScreen') else UI_GiveFocus('txtInputChat','LobbyTitleRoom') end",
			;
		},
			
		{
			type = "Button",
			name = "btnToAll",
			visible = 1,
			size = {64, 13},
			--position = {216, 419},
			position = {_w - 164, _h - 50},
			
			borderColor = {0, 175, 255, 255},
			borderWidth = 2,
			
			DefaultGraphic = {
				texture = "data:ui/newui/network/chat_icons.tga",
				textureUV_TL = {0,26},
				textureUV_WH = {64, 13},
			},
			
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$3443",--SEND CHAT MESSAGE TO ALL
			
			-- swap with the whisper button
			onMouseClicked = [[UI_SetElementVisible( "", "btnToAll", 0 ); UI_SetElementVisible( "", "btnWhisper", 1 );]];
		},
		{
			type = "Button",
			name = "btnWhisper",
			visible = 0,
			size = {64, 13},
			
			--position = {216, 419},
			position = {_w - 164, _h - 50},
			
			borderColor = {0, 175, 255, 255},
			borderWidth = 2,
			
			DefaultGraphic = {
				texture = "data:ui/newui/network/chat_icons.tga",
				textureUV_TL = {0,0},
				textureUV_WH = {64, 13},
			},
			
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$3444", --WHISPER TO ANOTHER PLAYER
			
			-- swap with the broadcast button
			onMouseClicked = [[UI_SetElementVisible( "", "btnWhisper", 0 ); UI_SetElementVisible( "", "btnWhisperToList", 1 );]];
		},
		{
			type = "Button",
			name = "btnWhisperToList",
			visible = 0,
			size = {64, 13},
			
			--position = {216, 419},
			position = {_w - 164, _h - 50},
			
			borderColor = {0, 175, 255, 255},
			borderWidth = 2,
			
			DefaultGraphic = {
				texture = "data:ui/newui/network/chat_icons.tga",
				textureUV_TL = {0,13},
				textureUV_WH = {64, 13},
			},
			
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$3449", -- WHISPER TO GROUP OF PLAYERS
			
			-- swap with the broadcast button
			onMouseClicked = [[UI_SetElementVisible( "", "btnWhisperToList", 0 ); UI_SetElementVisible( "", "btnToAll", 1 );]];
		},		
			
		-- TEXTBUTTON FOR SEND CHAT MESSAGE
		{
			type = "TextButton",
			buttonStyle = "FEButtonStyle1",
			
			--position = {282,419},
			position = {_w - 98, _h - 50},
			
			size = {90,13},
			name = "txtBtnSEND",
			Text = {
				text = "$3416",
				textStyle = "FEButtonTextStyle",
			},
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$3445",--POST YOUR CHAT MESSAGE
			;
		},
		
		--size = {380,469},
		-- VERTICAL LINES
		{
			type = "Line",
			above = 0,
			--p1 = {233, 0},
			--p2 = {233, 415},
			-- 147
			p1 = {_w - 166, 0},
			p2 = {_w - 166, _h - 54},
			lineWidth = 2,
			color = "FEColorOutline",
		},
		{
			type = "Line",
			above = 0,
			--p1 = {252, 0},
			--p2 = {252, 415},
			-- 128
			p1 = {_w - 147, 0},
			p2 = {_w - 147, _h - 54},
			lineWidth = 2,
			color = "FEColorOutline",
		},
		{
			type = "Line",
			above = 0,
			--p1 = {357, 0},
			--p2 = {357, 415},
			p1 = {_w - 23, 0},
			p2 = {_w - 23, _h - 54},
			lineWidth = 2,
			color = "FEColorOutline",
		},				
		
	},
}

return ChatTable;

end