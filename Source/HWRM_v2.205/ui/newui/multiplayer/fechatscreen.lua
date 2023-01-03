dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

FEChatScreen = {
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	Layout = {	
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	RootElementSettings = {
		giveParentMouseInput = 1,
		eventOpaque = 0,
	},

	-- Localizer format IDs for broadcast and whisper chat messages.  These should be the same in all screens ChatUI is used.
	sayFormatID = 3364,
	whisperFormatID = 3365,	
	whisperEchoFormatID = 3369,
	replyFormatID = 4080,	
	replyEchoFormatID = 4081,
	playerJoinedFormatID = 3525,
	playerLeftFormatID = 3526,
	inviteFormatID = 4065,
	inviteEchoFormatID = 4076,
	playerNameFormatID = 4077,
	playerJoinedGameFormatID = 4078,
	playerLeftGameFormatID = 4079,
	playerMutedFormatID = 4082,
	playerUnmutedFormatID = 4083,
	playerAFKFormatID = 4084,
	playerInLobbyFormatID = 4085,
	playerInGameFormatID = 4086,
	playerIsAFKFormatID = 4087,
	invalidCommandFormatID = 4088,
	youAreNowAFKFormatID = 4090,
	youAreNoLongerAFKFormatID = 4091,
	errorMuteInvalidID = 4092,
	giveParentMouseInput = 1,
	eventOpaque = 0,
	;
		

	-- Dialog frame 
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		name = "dialogWindow",
		TitleText = "$3405",--GAME INFO
		
		Anchor_Binds = {
			mirror = "Anchor_MPChat",
		},
			
		Layout = {					
			pos_XY = { x = 0.05, y = .05, xr = "scr", yr = "scr" },
			size_WH = {	w = .4, h = .3, wr = "scr", hr = "scr" },	
		},

		;

		-- Contents frame
		{
			type = "Frame",
			--autosize=1,		
			arrangetype = "vert",
			Layout = {			
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },	
			},		
			;


			------------------------------------------------------

			{
				type = "TabControl",
				name = "m_chatTabControl",
		
				UseTemplate = TEMPLATE_TABCONTROL,	-- TabControls must use a template
				Layout = {					
					size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },	
				},

				arrangeweight=1,
				TabButtonStyle = 	"OptionTabButtonStyle",
				;	
			},



			{
				type = "Frame",
				name = "TextEntryPanel",			
					
				Layout = {					
					size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},			
					pad_LT = { l = 2, t = 4/600, lr = "px", tr = "scr" },
					--pos_XY = { x = 0.0, y =1, xr = "par", yr = "par" },
					--pivot_XY = { 0, 1 },	

				},		
				autosize=1,
				sizetype = "contain",
				arrangetype = "horiz",

				;

				--DEFINITION FOR: (txInput) Chat
				{
					type = "DestinationTextInput",
					name = "txtInputChat",
					marginWidth = 10,
					arrangeweight = 1,
							
					textInputStyle = "FEChatTextInputStyle",

					helpTipTextLabel = "txtLblHELPTEXT",
					helpTip = "$3335",--TYPE YOUR CHAT MESSAGE
					maxTextLength = 200,
							
					Text = {
						font = "ChatFont",
					},				
							
					onAccept = "UI_GiveFocus('txtInputChat', 'FEChatScreen')",	
							
						
				},
				-- Send button
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					name = "txtBtnSEND",							
					helpTipTextLabel = "txtLblHELPTEXT",
					helpTip = "$3332",--SEND YOUR CHAT MESSAGE
					Text = {
						text = "$3349", -- SEND
						textStyle = "FEButtonTextStyle",
					},
		
					autosize=1,

					Layout = {					
						size_WH = {	w = 1, h = 1, wr = "px", hr = "px"},
						pos_XY = { x = 1, y = 0.5, xr = "px", yr = "par" },				
						pivot_XY = { 0, .5 },	
						pad_LT = { l = 4, t = 2, lr = "px", tr = "px" },
						pad_RB = { r = 4, b = 2, rr = "px", br = "px" },	
						margin_LT = { l = 4, t = 2, lr = "px", tr = "px" },
						margin_RB = { r = 4, b = 2, rr = "px", br = "px" },	
					},
	
				},
			},

						



	
		},

	},

		

	---------------------- ITEMS TO CLONE -----------------------------
	
	-- Right Click Plaer Context Menu
	{
		type = "ContextMenu",
		name = "playerContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,

		-- onOpening = "OnOpeningContextMenu(\"23\");",

		--autoarrange = 1,
		--autoarrangeSpace = 0,
		--arrangetype="vert",
		autosize=1,
		visible=0,
		;

		{

			type = "ContextMenuItem",
			name = "contextInvite",

			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$3065",
			;
		},
		{

			type = "ContextMenuItem",
			name = "contextWhisper",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$3066",
			;
		},
	},

	{
		type = "ContextMenuItem",
		name = "contextMute",
		visible=0,
		UseTemplate = TEMPLATE_CONTEXTMENUITEM,
		text="$4093",

		IconGraphic = {
			size = { 8, 8},
			texture = "DATA:UI\\NewUI\\Multiplayer\\playerChatStates.dds",
			uvRect = { 0/32, 128/256, 32/32, 160/256 },
		},
		;
	},

	{

		type = "ContextMenuItem",
		name = "contextUnMute",
		visible=0,
		UseTemplate = TEMPLATE_CONTEXTMENUITEM,
		text="$4094",
		;
	},

	-- Help Context Menu
	{
		type = "ContextMenu",
		name = "helpContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU_TRANSLUCENT,

		--autoarrange = 1,
		--autoarrangeSpace = 0,
		--arrangetype="vert",
		autosize=1,
		;

		{

			type = "ContextMenuItem",
			name = "contextHelpWhisper",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$4095",
			customDataWString="/whisper",
			;
		},
		{
			type = "ContextMenuItem",
			name = "contextHelpReply",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$4096",
			customDataWString="/reply",
			;
		},
		{

			type = "ContextMenuItem",
			name = "contextHelpInvite",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$4097",
			customDataWString="/invite",
			;
		},
		{

			type = "ContextMenuItem",
			name = "contextHelpMute",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$4098",
			customDataWString="/mute",
			;
		},
		{

			type = "ContextMenuItem",
			name = "contextHelpUnmute",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$4099",
			customDataWString="/unmute",
			;
		},
		{

			type = "ContextMenuItem",
			name = "contextHelpAFK",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
			text="$4100",
			customDataWString="/afk",
			;
		},
--		{
--			type = "ContextMenuItem",
--			name = "contextHelpHelp",
--			UseTemplate = TEMPLATE_CONTEXTMENUITEM,
--			text="$4101",
--			customDataWString="/help",
--			;
--		},
	},
	
		
	--------------------------Chat listbox item to clone
	{
				
		type = "ListBoxItem",
		name = "lstBoxChatTemplate",
	
		Layout = {	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
			pad_LT = { l = 4, t = 2, lr = "px", tr = "px" },
			pad_RB = { r = 4, b = 2, rr = "px", br = "px" },		
		},

		visible = 0,
		enabled = 0,
		autosize = 1,
		sizetype = "contain",
		ignored=1,
		backgroundColor = { 0, 0, 0, 64 },

		;			
		{
			type = "TextLabel",
			name = "m_lblText",
		
			Layout = {							
				size_WH = {	w = 1, h = 1 , wr = "par", hr = "px" },
				pad_RB = { r = SCROLLBAR_WIDTH*0.1, b = 0, rr = "scr_min", rb = "px" },
			},

			Text = {
				textStyle = "FEListBoxItemTextStyle",
				color = {255,255,255,255},
				font = "ChatFont",
				offset ={0,0},
			},
			wrapping = 1,
			autosize = 1,
		},
	},
	---------------------
	-- Player list listbox item
	{

		type = "ListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
    	name = "lstBoxLobbyPlayersTemplate",
	
		Layout = {	
			--pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
			pad_LT = { l = 4, t = 2, lr = "px", tr = "px" },
			pad_RB = { r = 4, b = 2, rr = "px", br = "px" },		
		},

		visible = 0,
		enabled = 0,
		autosize = 1,
		ignored = 1,
       	backgroundColor = {0,0,0,0},
		contextMenu = "playerContextMenu",
		arrangetype = "horiz",
		;		
		-- Icon
		{
			type = "Button",
			name = "StatusIcon",
			Layout = {		
				size_WH = {	w = 10000.0, h = .8, wr = "px", hr = "par" },	
				pos_XY = {	y = .5, yr = "par" },
				pivot_XY = { 0.0, 0.5 },						
				lockAspect=1,		
			},
				
			BackgroundGraphic = {
				size = { 8, 8},
				texture = "DATA:UI\\NewUI\\Multiplayer\\playerChatStates.dds",
				uvRect = { 0/32, 0/256, 32/32, 32/256 },
			},
				
			eventOpaque = 0,
			--visible=false,
			clickThrough = 1,
		},
			
		{
			type = "TextLabel",
			name = "lblName",
		
			Layout = {							
				size_WH = {	w = 1, h = 1 , wr = "par", hr = "px" },						
					},	


			Text = {
				textStyle = "FEListBoxItemTextStyle",
				color = {255,255,255,255},
				font = "ChatFont",
				offset ={0,0},
			},
			wrapping = 0,
			autosize = 1,
		},	
	},
	-------------------------
	
	{
		type = "TabPage",
		name = "m_channelTabPageTemplate",
		text = "DEFAULT LABEL",  
		ignored=1,
		visible=0,
		Layout = {					
			size_WH = {	w = 1.0, h = 1, wr = "par", hr = "par" },			
		},
		
		;
		{
			type = "Frame",
			name = "frmRootChatBox",
			Layout = {					
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},	
				pad_LT = { l = 2, t = 2, lr = "px", tr = "px" },
				pad_RB = { r = 2, b = 2, rr = "px", br = "px" },	
			},		
			arrangetype="horiz",	
			;



			{
				type = "ListBox",
				listBoxStyle = "FEListBoxStyle_Bordered",
				autoHideScrollbar = 0,
				listitemsArrangeType = "vert",
				name = "lstBoxChat",

				hugBottom = 1,
				maxItems = 200,						
	
			
				Layout = {					
					size_WH = {	w = .8, h = 1, wr = "par", hr = "par"},	
					pad_LT = { l = 2, t = 2, lr = "px", tr = "px" },
					pad_RB = { r = 2, b = 3, rr = "px", br = "px" },	
				},
	
			},
			{
				type = "Frame",
				name = "frmLobbyPlayers",
				Layout = {					
					size_WH = {	w = .2, h = 1, wr = "par", hr = "par"},	
					pad_LT = { l = 2, t = 2, lr = "px", tr = "px" },
					pad_RB = { r = 2, b = 0, rr = "px", br = "px" },	
				},
				arrangetype="vert",	
				;					
				{
					type = "TextLabel",
					name = "lblPlayerCount",
		
					Layout = {							
						size_WH = {	w = 1, h = 1 , wr = "par", hr = "px" },				
						pad_LT = { l = 16, t = 2, lr = "px", tr = "px" },		
						},	


					Text = {
						textStyle = "FEListBoxItemTextStyle",
						color = {255,255,255,255},
						font = "ChatFont",
						offset ={0,0},
						text="0 Players",
					},
					wrapping = 0,
					autosize = 1,
				},				
				-- Listbox to hold names of all the players in a chat channel
				{
					type = "ListBox",
					listBoxStyle = "FEListBoxStyle_Bordered",
					name = "lstBoxLobbyPlayers",
					backgroundColor = { 0, 0, 0, 128 },		

					hugBottom = 1,
					maxItems = 200,						

					arrangeweight=1,
					Layout = {					
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},	
					},
					borderWidth = 1,
					borderColor = "FEColorOutline",
				},	
			},


		},			

	},



}

	