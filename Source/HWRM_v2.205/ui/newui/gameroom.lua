dofilepath("data:ui/newui/multiplayer/chatui.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
GAMELIST_W = 776
GAMELIST_H = 177
GAMELIST_X = 12
GAMELIST_Y = 68

LANGAMELIST_W = 776
LANGAMELIST_H = 391
LANGAMELIST_X = 12
LANGAMELIST_Y = 97

LobbyScreen = {
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},


	RootElementSettings = {
		--backgroundColor = "FEColorBackground1",
	},

	-- custom
	enabledGameColor = {1,1,1,1},
	disabledGameColor = {0.3,0.3,0.3,1},

	-- Localizer format IDs for broadcast and whisper chat messages.  These should be the same in all screens ChatUI is used.
	sayFormatID = 3364,
	whisperFormatID = 3365,	
	whisperEchoFormatID = 3369,
	playerJoinedFormatID = 3525,
	playerLeftFormatID = 3526,

	LobbyType_Steam_Text = "$3411",	--STEAM
	LobbyType_LAN_Text = "$3441",	--LAN

	ErrorMessages = 
	{
		[ LM_Joining ] 			= "$3620",--"Joining Room",
		-- Note: This disconnected from server is the same message as in GameSetup.lua and ServerRoom.lua so it can share a localizer ID
		[ LM_Disconnected ] 		= "$3621",--"Disconnected from server",
		[ LM_CouldNotJoinRoom ] 	= "$3622",--"Unable to join room",
	}, 
	
	pixelUVCoords = 1,
	
	
	;


	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		TitleText =		"$3410",
		SubTitleText =	"UNDEFINED",	-- Filled in by the Type of Game
		--Extra1Text =	"$2622",		-- BETA

		Layout = {	
			size_WH = {	w = 1.0, h = 180.0/540, wr = "par", hr = "scr" },							
		},				
		autosize=1,
		;
		--SUBTITLE (visible for LAN games only)
		{
			type = "TextLabel",
			autosize=1,
			name = "txtLblSUBTITLELAN",
			Text = {
				text = "", -- LOCAL AREA NETWORK
				textStyle = "FEHeading2",
			},
			;
		},
	},


	
	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------
	-- GAME LIST FRAME - GBX:pdeupree - This was the LAN gamelist, but with no chat in the game list now for Steam it's used for both game types
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootGame",

		--backgroundColor = "FEColorBackground1",
		
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par" },			
			size_WH = {w = 0.9, h = 1, wr = "par", hr = "px" },
		},	

		autosize=1,
		arrangetype = "vert",
		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
		;
		
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",			
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText = "$3414",
			-- SubtitleText = "$3412", --SELECT_A_GAME
			autosize=1,
			--backgroundColor = {0,255,0,255},
			arrangetype="horiz",
			
			Layout = {
				size_WH = {	w = 1.0, h = 1, wr = "par", hr = "px" },
			},
			;
			
			----------- Server List ---------------------
			{
				type = "Frame",
				name = "frmOptions",
								
				Layout = {
					--	pivot_XY = { 0.5, 0.5 },					
					--pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},		
					pad_LT  = { l = 0, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
					pad_RB  = { r = 0, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
					size_WH = {	w = 1, h = .35, wr = "px", hr = "scr" },							
				},
				arrangeweight=1.0,
				BackgroundGraphic = BORDER_GRAPHIC_FRAME,		
				;
		
				-- DEFINITION FOR (tbl) tableGames
				{
					type = "Table",
					name = "tableGames",
					
					Layout = {													
						size_WH = { w=1, h = 1,  wr="par", hr = "par",},
					},
					--width = 875,
					--position = {4,4},
					
					--size = {LANGAMELIST_W - 12, LANGAMELIST_H - 41},
					--size = {389,428},
					
					backgroundColor = FEColorBackground1,
					tableStyle = "FETableStyle",
					
					Columns = {
						;
						-- GAME HOST
						{
							width = .2,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$3623",--"SORT GAMES BY GAME HOST",
								;
								{
									name = "TableTitleGameHost",
									type = "TextButton",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3435",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
						
						-- MAP
						{
							width = .3,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$3624",--SORT GAMES BY MAP NAME
								;
								{
									name = "TableTitleMap",
									type = "TextButton",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3436",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
						
						-- GAME MODE
						{
							width = .25,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$3625",--SORT GAMES BY GAME MODE
								;
								{
									name = "TableTitleGameMode",
									type = "TextButton",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3437",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
						
						-- PLAYERS
						{
							width = .11,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$3626",--SORT GAMES BY GAME PLAYERS
								;
								{
									name = "TableTitlePlayers",
									type = "TextButton",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3438",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
						
						-- PING
						--{
						--	width = .05,
						--	TitleCell = {
						--		type = "TableCell",
						--		helpTipTextLabel = "m_lblHelpText",
						--		helpTip = "$3627",--SORT GAMES BY PING
						--		;
						--		{
						--			name = "TableTitlePing",
						--			type = "TextButton",
						--			buttonStyle = "FETableTitleButtonStyle",
						--			Text = {
						--				text = "$3439",
						--				textStyle = "FETableTitleTextStyle",
						--			},
						--		}
						--	},
						--},
						
						-- VERSION
						{
							width = .14,
							TitleCell = {
								type = "TableCell",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$3628",--SORT GAMES BY GAME VERSION
								;
								{
									type = "TextButton",
									buttonStyle = "FETableTitleButtonStyle",
									Text = {
										text = "$3440",
										textStyle = "FETableTitleTextStyle",
									},
								}
							},
						},
					},
				},	
			},
			
			{	-- Spacer!
				type = "Frame",
								
				Layout = {
					pivot_XY = { 0.0, 0.0 },					
					pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},		
					size_WH = {	w=PANEL_SPACING_HORIZ, h = 10, wr = "scr", hr = "px" },
				},
				arrangeweight=0.0,
			},

			----------- Options Bar ---------------------
			{
				type = "Frame",
				name = "frmOptions",
								
				Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="par",},		
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = 1, wr = "scr", hr = "par" },	
					--max_WH = {	w = NAVIGATION_BUTTON_WIDTH, wr = "scr" },
					Flags = { hasVolume=0 },		
				},	
				--backgroundColor = {0,255,0,255},
				--autosize=1,
				arrangetype = "vert",
				--arrangeweight = 1.0,
				arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
				;
		
				--NewMenuButton("txtBtnREFRESH",	"$3421",	"$3631",	0,	BTN_MENU_SMALL_FILL_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	nil),
				NewMenuButton("txtBtnFILTERS",	"$3401",	"$3633",	0,	BTN_MENU_SMALL_FILL_LAYOUT,	"FEButtonStyle1_Chipped",	nil),
				NewMenuButton("txtBtnJOINGAME",	"$3417",	"$3630",	0,	BTN_MENU_SMALL_FILL_LAYOUT,	"FEButtonStyle1_Chipped",	nil),		
				--NewMenuButton("txtBtnHOSTGAME",	"$3418",	"$3634",	0,	BTN_MENU_SMALL_FILL_LAYOUT,	"FEButtonStyle1_Chipped",	nil),
				
				--Refresh Checkbox
				{
					type = "Button",
					ignored = 1,
					
					name = "txtBtnREFRESH",
					
					stateIconOfs = { 0.0, 0.0 },
					stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
					
					Layout = {
						size_WH = {	w = 1.0, h = 24/600, wr = "par", hr = "scr"},
						--min_WH  = {	w = INGAMEMENU_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },
						pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
						pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
					},
						
					IconBase = MENU_BUTTON_ALERT_GRAPHIC_CHIPPED,
					
					textColor					= COLOR_BUTTON_TEXT_DEFAULT,
					overTextColor				= COLOR_BUTTON_TEXT_HOVER,
					pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
					disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,
					flashTextColor				= COLOR_BUTTON_TEXT_DEFAULT,

					-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
					soundOnEnter 		= "SFX_ButtonEnter",
					soundOnClicked 		= "SFX_ButtonClick",
					backgroundColor = { 255, 0, 0, 255 },
					
					--autosize=1,
					;
					
					{
						type = "Frame",
						autosize=1,
						eventOpaque = 0,
						giveParentMouseInput = 1,
						
						Layout = {
							pivot_XY = {0.5, 0.5},
							pos_XY = { x=0.5, y=0.5, xr="par", yr="par" },
						},
						
						;
						{
							type = "TextLabel",
							
							--position = {20,0},
							Text = {
								textStyle = "RM_GenericLabelLarge_TextStyle",
								text = "$3421",
								color = COLOR_LABEL_TEXT_DEFAULT,
							},

							Layout = {		
								pos_XY = {	x=16/800, y=0.5, xr="scr", yr="par",},	
								pivot_XY = { 0.0, 0.5 },	
							},
							
							eventOpaque = 0,
							giveParentMouseInput = 1,
							helpTip = "$3631", 
							autosize=1,
						},
										
						{
							type = "Button",
							Layout = {		
									pos_XY = {	x=0, y=0.5, xr="px", yr="par",},	
									pivot_XY = { 0.0, 0.5 },	
									size_WH = {	w = 1000, h = .75, wr = "px", hr = "par" },		
									lockAspect = 1,	
							},
							
							name = "txtBtnREFRESH_Check",

							eventOpaque = 0,
							giveParentMouseInput = 1,
							enabled = 1,
							buttonStyle = "FECheckBoxButtonStyle",
							helpTipTextLabel = "m_lblHelpText", 
							helpTip = "$3631", 
						},
					},
				},
				
				NewMenuDropDown("btnDistances", "listDistances", "$4962", "$4967", nil, LISTBOX_MENU_VERT_BOTTOM_LAYOUT, "vert", 1 ),
			},
		},
		
		{	-- Chat!
			type = "Frame",
							
			Layout = {
				pivot_XY = { 0.0, 0.0 },					
				pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},
				size_WH = {	w = 1, h = .35, wr = "par", hr = "scr" },
			},

			Anchor_Spawns = {
				{
					anchorName = "Anchor_MPChat",
					relativePos = { 0.0, 0.0 },
				},		
			},
		},
		
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm",			
		
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			arrangetype="horiz",
			--arrangedir=-1,
			autosize=1,
			;
			-- BUTTONS	
			NewMenuButton("m_btnBack",			"$3433",	"$3629",	0,	BTN_FOOTER_FORCELEFT_LAYOUT,	"FEButtonStyle1_Outlined_Chipped",	nil),			
			NewMenuButton("txtBtnHOSTGAME",		"$3418",	"$3634",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
			
			--NewMenuButton("txtBtnGAMEINFO",		"$3422",	"$3632",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),		
			--NewMenuButton("txtBtnJOINGAME",		"$3417",	"$3630",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		
		},
	},

	-- Distance litboxitem template
	{
		type = "TextListBoxItem",
		name = "distanceListBoxItemTemplate",
		buttonStyle = "FEListBoxItemButtonStyle",
		resizeToListBox = 1,
		Text = {
			textStyle = "FEListBoxItemTextStyle",
			text = "Distance",
		},
		ignored = 1,
		visible = 0,							
	},

	------------------------------------------------------------------------------------
	-- LOBBY CHAT FRAME
	------------------------------------------------------------------------------------
	--position = {414,69},
	--size = {380,469},
	--GetChatTable(414,69, 380,469),
	GetChatTable(12, 252, 776, 285),
	
	
	
	


}
