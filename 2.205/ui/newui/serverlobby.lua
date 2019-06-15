dofilepath("data:ui/newui/multiplayer/chatui.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

LobbyTitleRoom = {

	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	
	RootElementSettings = {
		--backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},

	-- Localizer format IDs for broadcast and whisper chat messages.  These should be the same in all screens ChatUI is used.
	sayFormatID = 3364,
	whisperFormatID = 3365,
	whisperEchoFormatID = 3369,
	playerJoinedFormatID = 3525,
	playerLeftFormatID = 3526,
	chatTitleID = "$3405",
	
	ErrorMessages = 
	{
		[ LM_Joining ] 			= "$3406",
		[ LM_Disconnected ] 		= "$3407",
		[ LM_CouldNotJoinRoom ] 	= "$3408",
	}, 
	
	pixelUVCoords = 1,
	;

{
	type = "Frame",
	name = "frmTheRoot",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	;


	--DEFINITION FOR: (txtLbl) TITLE
	{
		type = "TextLabel",
		position = {16,-2},
		size = {600,36},
		name = "txtLblTITLE",
		Text = {
			text = "$3390",
			textStyle = "FEHeading1",
		},
		;
	},

	--DEFINITION FOR: (txtLbl) SUBTITLE
	{
		type = "TextLabel",
		position = {17,34},
		size = {600,21},
		name = "txtLblSUBTITLE",
		Text = {
			text = "$3391",
			textStyle = "FEHeading2",
		},
		;
	},
	
	--DEFINITION FOR: (frmgr) 1steam.tga
--	{
--		type = "Frame",
--		BackgroundGraphic = {
--			type = "Graphic",
--			size = {128,32},
--			texture = "Data:UI\\NewUI\\Network\\steam.mres",
--			textureUV = {0.0,0.0,128,32},
--		},
--		position = {656,9},
--		size = {128,32},
--		name = "frmgr1steamtga",
--		;
--	},
	
	

	------------------------------------------------------------------------------------
	-- SERVER LIST FRAME
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbigfrm",
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
		},	
		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
		;
	
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
		
			Layout = {
				pivot_XY = { 0.5, 0.5 },					
				pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
			},	

			size = {381,469},
			name = "frmRootServer",
			;
		
			--DEFINITION FOR: (txtLbl) SERVERS
			{
				type = "TextLabel",
				position = {6,3},
				size = {350,15},
				name = "txtLblSERVERS",
				Text = {
					text = "$3392",
					textStyle = "FEHeading3",
				},
				;
			},

			--DEFINITION FOR: (txtLbl) SELECT_A_SERVER
			{
				type = "TextLabel",
				position = {6,17},
				size = {250,9},
				name = "txtLblSELECTASERVER",
				Text = {
					text = "$3394",
					textStyle = "FEHeading4",
				},
				;
			},
		
			-- Table Border frame
			{
				type = "Frame",
				position = {2, 31},
				--size = {397, 436},
				size = {377, 436},
				borderWidth = 2,
				borderColor = "FEColorOutline",
				--backgroundColor = "FEColorBackground1",
				;
			
				-- Horz line
				{
					type = "Line",
					p1 = {0, 21},
					--p2 = {397, 21},
					p2 = {377, 21},
					lineWidth = 2,
					above = 0,
					color = "FEColorOutline",
				},
			
				-- Vert line
				{
					type = "Line",
					--p1 = {378, 0},
					--p2 = {378, 436},
					p1 = {358, 0},
					p2 = {358, 436},
					lineWidth = 2,
					above = 0,
					color = "FEColorOutline",
				},
			
		
				-- DEFINITION FOR (tbl) tableGames
				{
					type = "Table",
					name = "tableRooms",
					position = {4,4},
					--size = {389,428},
					size= {369,428},
				
					backgroundColor = {0,0,0,0},
					tableStyle = "FETableStyle",
					Columns = {
						;
						-- roomName
						{
							--width = 180,
							width = 160,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$2675", -- "SORT BY SERVER NAME",
								;
								{
									type = "TextButton",
									name = "TableTitleRoomName",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3402",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
					
						-- numGames
						{
							width = 86,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$2676", -- "SORT BY NUMBER OF GAMES",
								;
								{
									type = "TextButton",
									name = "TableTitleNumGames",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3403",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
					
						-- numPlayers
						{
							width = 100,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$2677", -- "SORT BY NUMBER OF PLAYERS",
								;
								{
									type = "TextButton",
									name = "TableTitleNumPlayers",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3404",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},			
					},
				}
			}
		},
	},
	
	
	
	------------------------------------------------------------------------------------
	-- BOTTOM NAVIGATION FRAME
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",		

		Layout = {
			pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
			pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
			size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
		},		

		autosize = 1,
			
		BackgroundGraphic = BORDER_GRAPHIC_FRAME,
		backgroundColor = COLOR_BACKGROUND_PANEL,
		arrangetype = "horiz",
		;

		-- BUTTONS
		--DEFINITION FOR: (txtBtn) BACK
		{
			type = "TextButton",
			name = "m_btnBack",
			buttonStyle = "FEButtonStyle1_Outlined_Chipped",
			
			Layout = {
				pivot_XY = { 0.0, 0.5 },					
				pos_XY = {	x=0.0, y=0.5, xr="par", yr="par",},		
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},
		
			Text = {
				text = "$3399",
			},
			-- onMouseClicked = [[UI_ShowScreen("NewMainMenu", eTransition);]],
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$3043", -- "RETURN TO THE MAIN MENU",
			;
		},
		
		--DEFINITION FOR: (txtBtn) REFRESH
		{
			type = "TextButton",
			name = "txtBtnREFRESH",

			buttonStyle = "FEButtonStyle1_Outlined",

			Layout = {
				pivot_XY = { 0.0, 0.5 },					
				pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},	
			
			Text = {
				text = "$3400",
			},
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$2679", -- "REFRESH THE LIST OF DISPLAYED SERVERS",
			;
		},

		--DEFINITION FOR: (txtBtn) JOIN_LOBBY
		{
			type = "TextButton",
			name = "txtBtnJOINLOBBY",

			buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",
			
			Layout = {
				pivot_XY = { 1.0, 0.5 },					
				pos_XY = {	x=1.0, y=0.5, xr="par", yr="par",},	
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},
			
			Text = {
				text = "$3397",
			},
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$2678", -- "JOIN THE LOBBY ON THE SELECTED SERVER",
			;
		},

	},
	

	------------------------------------------------------------------------------------
	-- CHAT FRAME
	------------------------------------------------------------------------------------
	GetChatTable(394,69, 400,469), -- in data:ui/newui/multiplayer/chatui.lua

}
}
