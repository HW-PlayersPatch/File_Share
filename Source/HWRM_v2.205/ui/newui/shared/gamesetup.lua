dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Shared/GameSetup_Controls.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

TITLE_FRAMEHEIGHT = 1/26
TITLE_FONTSIZE = 40
--DROPDOWN_HEIGHT = 1/24
MARGIN_HEIGHT = 1/128

T_WindowSuperHeader = {
		type = "Text",
		font = "Heading1Font",
		color = "FEColorHeading1",
		vAlign = "Middle",
		hAlign = "Left",
		dropShadow = 1,
		offset = {0, 0},
	}
LAYOUT_PRESET_BUTTON = 
{
	min_WH = {	w = 1, wr = "par"},	
	pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
	pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
	pivot_XY = { 1.0, 0.0 },					
	pos_XY = {	x=1.0, xr="par"},	
		
}




GameSetup = {
	type = "Frame",
	name = "EXAMPLE_GameSetup",
	stylesheet = "HW2StyleSheet",
	visible = 0,
		
	Layout = {
		pos_XY = LAYOUT_TOPLEFTSCREEN,		
		size_WH = LAYOUT_FILLSCREEN,		
	},

	------------------- CUSTOM DATA
		titleSkirmish = "$3310",--SKIRMISH
		titleMultiplayer = "$3311",--MULTIPLAYER
		subtitleSkirmish = "$3312",--CREATE NEW GAME
		showLobbyPlayersText = "$3320",--SHOW PLAYERS LIST
		hideLobbyPlayersText = "$3315",--COLLAPSE PLAYERS LIST
		openString = "$3316",--OPEN
		closedString = "$3317",--CLOSED
		labelLobbyChat  = "$3297",
		levelString = "$3318",--%s (%d Players)	
		defaultThumbnail = "Data:LevelData\\Multiplayer\\DefaultMapThumbnail.tga",
		posSkirmish = {319, 144},
		posMultiplayer = {12, 97},
		-- IDs for the Localizer::FormatText string.  The parameter is the gamename
		subtitleMultiplayerJoinID = 3313,--JOIN GAME
		subtitleMultiplayerHostID = 3314,--HOST GAME	
		-- Localizer format IDs for broadcast and whisper chat messages.  These should be the same in all screens ChatUI is used.
		sayFormatID = 3364,
		whisperFormatID = 3365,
		whisperEchoFormatID = 3369,
		playerJoinedFormatID = 3525,
		playerLeftFormatID = 3526,	
		fStringCPU = "$3294" -- format string for cpu players CPU%d	
		--ErrorMessages =
		--{
			-- Note: This disconnected from server is the same message as in GameRoom.lua and ServerRoom.lua so it can share a localizer ID
		--	[ LM_Disconnected ] 		= "$3319",--Disconnected from server
		--}, 	

	;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		TitleText = "$3300", -- PLAYER PROFILES
		SubTitleText = "$3301", -- MANAGE PLAYER PROFILES
		--Extra1Text = "$2622", -- BETA

		Layout = {	
			size_WH = {	w = 1.0, h = 1, wr = "par", hr = "par" },							
		},				
		--autosize=1,
		;
		
		--DEFINITION FOR: (txtLbl) IP_ADDRESS
		{
			type = "TextLabel",
			name = "txtLblIPADDRESS",
			Text = {
				text = "$3360", -- IP ADDRESS
				textStyle = "FEHeading4",
				hAlign = "Right",
			},			
			Layout = {					
				pos_XY = { x = 1, y = 1, xr = "par", yr = "par" },						
				Flags = { hasVolume = 0, canArrange = 0	},
				pivot_XY = { 1, 1 },	
			},
			autosize=1,
			helpTipTextLabel = "txtLblHELPTEXT",
			helpTip = "$3321"--THIS IS YOUR COMPUTERS IP ADDRESS
			;
		},	
	
	},

	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",

		
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
		},		

		autosize=1,
		arrangetype = "vert",

		;

		------------------------------------------------------------------------------------
		-- MAIN FRAME 
		------------------------------------------------------------------------------------
		{
			type = "Frame",		
			backgroundColor = "FEColorBackground1",
			
			Layout = {		
				size_WH = { w = .9, h =.75 , wr = "scr", hr = "scr_min" },
			},
			arrangeSep = {	x=PANEL_PAD_HORIZ, y=PANEL_PAD_VERT, xr="scr", yr="scr",},	
			arrangetype = "horiz",
			;
			
			------------------------------------------
			----------- Left Parent Panel ------------
			------------------------------------------
			{
				type = "Frame",		
				backgroundColor = "FEColorBackground1",
				autosize=1,
				arrangetype = "vert",
				
				Layout = {					
					size_WH = {	w = .60, h = 1, wr = "par", hr = "par"},			
				},

				;
				-------------Player Info Panel --------------
				{
					type = "RmWindow",
					WindowTemplate = PANEL_WINDOWSTYLE,

					TitleText = "$3305", -- GAME PLAYERS
					visible = 1,
		
					Layout = {					
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},			
					},

					--backgroundColor = { 0, 255, 0, 200 },
					autosize=1,
					arrangetype = "vert",
					--arrangeweight = 1,	
					;
					
					{
						type = "Frame",
						name = "UserListFrame",
					
						Layout = {					
							size_WH = {	w = 1, h = 1000, wr = "par", hr = "px"},	

						},
						autosize=1,
						arrangetype = "vert",
						--backgroundColor = { 255, 0, 255, 255 },
						--arrangeweight = 1,
						

						;
					
						-------------------------------------
						PLAYERLISTHEADER,
						-------------------------------------
						{
							type = "Frame",
							name = "frmPlayerSlots",
							
							borderWidth = 1,
							borderColor = {95,112,103,255},

							Layout = {					
								size_WH = LAYOUT_STRETCHWIDTHPARENT,		
							},
							arrangeweight = 1,
							arrangetype = "vert",
							autosize=1,
							;
							--PLAYER1FRAMETOCLONE,	
							--PLAYER1FRAMETOCLONE,
							--PLAYER1FRAMETOCLONE,
							--PLAYER1FRAMETOCLONE,
							--PLAYER1FRAMETOCLONE,
							--PLAYER1FRAMETOCLONE,
							--PLAYER1FRAMETOCLONE,
							--PLAYER1FRAMETOCLONE,
						},
					},

				},
				{
					type = "Frame",
					name = "frmRootChatBox",				

					visible = 1,
				
					Layout = {					
						size_WH = LAYOUT_STRETCHWIDTHPARENT,	
						--pad_LT = { l = 1/256, t = 0, lr = "scr", tr = "par" },
						--pad_RB = { r = 1/256, b = 1/256, rr = "scr", br = "scr" },			
					},
					arrangeweight=1,
					--backgroundColor = { 128, 0, 0, 100 }
					arrangetype = "vert",
					Anchor_Spawns = {
						{
							anchorName = "Anchor_MPChat",
							relativePos = { 0.0, 0.0 },
						},		
					},
					;
					-------------Chat Panel --------------
					{
						type = "RmWindow",
						WindowTemplate = PANEL_WINDOWSTYLE,
						--name = "frmRootChatBox",
						TitleText = "$3295", -- GAME PLAYERS
						visible = 0,
		
						Layout = {					
							size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},			
						},

						--backgroundColor = { 0, 255, 0, 200 },
						--autosize=1,
						arrangetype = "vert",
						--arrangeweight = 1,	
						;


						{
							type = "ListBox",
							listBoxStyle = "FEListBoxStyle_Bordered",
							name = "lstBoxChat",


							hugBottom = 1,
							maxItems = 200,						
							Anchor_Binds = {
								edgeB = "ChatEntryTopEdge_Anchor",
							},		
			
							Layout = {					
								size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},	
								pad_LT = { l = 2, t = 2, lr = "px", tr = "px" },
								pad_RB = { r = 2, b = 2, rr = "px", br = "px" },	
							},
	
						},
						
						------------
						{
							type = "Frame",
							name = "TextEntryPanel",			
					
							Layout = {					
								size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},			
								pad_LT = { l = 2, t = 4/600, lr = "px", tr = "scr" },
								pos_XY = { x = 0.0, y =1, xr = "par", yr = "par" },
								pivot_XY = { 0, 1 },	

							},		
							autosize=1,
							arrangetype = "horiz",

							Anchor_Spawns = {
								{
									anchorName = "ChatEntryTopEdge_Anchor",
									relativePos = { 0.0, 0.0 },
								},
							}
							;

							-- chat prompt cursor >
							{
								type = "TextLabel",		

								Layout = {
									pivot_XY = { 0, .5 },	
									pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },
								},
								autosize=1,

								Text = {
									font = "ChatFont",
									color = { 255, 255, 255, 255},
									hAlign = "Left",
									text = "$2848", -- >
								},
								giveParentMouseInput = 1,
							},	

							--DEFINITION FOR: (txInput) Chat
							{
								type = "DestinationTextInput",
								name = "txtInputChat",
								marginWidth = 10,
								arrangeweight = 1,
							
								textInputStyle = "FEChatTextInputStyle",
								--borderWidth = 2,
								--borderColor = "FEColorOutline",

								helpTipTextLabel = "txtLblHELPTEXT",
								helpTip = "$3335",--TYPE YOUR CHAT MESSAGE
								maxTextLength = 128,
							
								Text = {
									font = "ChatFont",
								},				
							
								onAccept = "UI_GiveFocus('txtInputChat', 'GameSetup')",	
							
								--backgroundColor = { 0, 0, 0, 255 },			
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
							
								--backgroundColor = { 0, 255, 0, 255 },			
							},
						},

						CHATLISTBOXITEMCLONE,

					},
				},


			},
			------------------------------------------
			----------- Right Parent Panel ------------
			------------------------------------------
			{
				type = "Frame",		
				backgroundColor = "FEColorBackground1",
				autosize=1,
				arrangetype = "vert",
				
				Layout = {					
					size_WH = {	w = .40, h = 1, wr = "par", hr = "par"},			
				},

				;
				-------------Map Select Panel --------------
				{
					type = "RmWindow",
					WindowTemplate = PANEL_WINDOWSTYLE,

					TitleText = "$3302", -- GAME PLAYERS
					helpTip = "$3329",--SELECT YOUR MAP

					visible = 1,					

					Layout = {					
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},			
					},

					autosize=1,
					arrangetype = "vert",
					;

					--DEFINITION FOR: (ddLst) Choose_Map
					{
						type = "DropDownListBox",
						dropDownListBoxStyle = "FEDropDownListBoxStyle",	
						name = "ddLstChooseMap",

						--Text = {text = "Map Dropdown",pixels  = 10},
		
						Layout = {					
							size_WH = {	w = 1, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
						},

						--backgroundColor = { 0, 256, 0, 255 },			
					},
					--DEFINITION FOR: (frmgr) 1m_map.tga
					{
						type = "Frame",
						name = "frmMapThumbnail",
						BackgroundGraphic = {
							type = "Graphic",
							texture = "Data:LevelData\\Multiplayer\\DefaultMapThumbnail.tga",
							uvRect = {0.0,1.0,1.0,0.0},
						},		
		
						Layout = {					
							size_WH = {	w = 1, h = 50000, wr = "par", hr = "px"},
							max_WH = {	w = 1, h = .3, wr = "par", hr = "scr_min"},
							pos_XY = { x = .5, xr = "par" },				
							pivot_XY = { .5, 0 },	

							lockAspect = 2,			
						},

						--backgroundColor = { 255, 0, 0, 255 },			
					},
					CHOOSEMAPTEMPLATE,
				},
				--------------------------------------------------------
				-------------------------------------------------
				{
					type = "RmWindow",
					WindowTemplate = PANEL_WINDOWSTYLE,

					TitleText = "$3303", -- GAME PLAYERS
				

					visible = 1,					

					Layout = {					
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},			
					},

					--autosize=1,
					arrangetype = "vert",
					arrangeweight=1,
					;
					---------- Game Type dropdown ---------------
					{
						type = "Frame",
						name = "GameTypeFrame",

						autosize=1,
						Layout = {					
							size_WH = {	w = 1, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
							pad_LT = { l = 0, t = 0, lr = "scr", tr = "scr" },		
							pad_RB = { r = 0, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },		
						},
						;
						GAMETYPETOCLONE,		
					},
					------------- Options Listbox -------------------
					{
						type = "ListBox",
						listBoxStyle = "FEListBoxStyle_Bordered",
						name = "frmOptFrame",	
		
						Layout = {					
							size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},						
						},
							
						Anchor_Binds = {
							edgeB = "PresetButtonTopEdge_Anchor",
						},		

						--backgroundColor = { 255, 128, 0, 255 },			
					},

					{
						type = "Frame",
						name = "frmRootbottombigfrm",
						autosize=1,
						Layout = {		
							size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},	
							pos_XY = { x = 0.5, y =1, xr = "par", yr = "par" },
							pivot_XY = { .5, 1 },	
							pad_LT = { l = 0, t = 4/600, lr = "px", tr = "scr" },											
						},
						Anchor_Spawns = {
							{
								anchorName = "PresetButtonTopEdge_Anchor",
								relativePos = { 0.0, 0.0 },
							},
						},
						;
						NewMenuButton("txtBtnOPTIONPRESETS",	"$5131",	"$3469",	0,	LAYOUT_PRESET_BUTTON,	"FEButtonStyle1",	nil),	
					},


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
			;		
				-- BUTTONS
				NewMenuButton("m_btnBack",				"$3362",	"$3336",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),	
				NewMenuButton("txtBtnLOADGAME",			"$3338",	"$3339",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),	
				NewMenuButton("txtBtnLOADRECORDEDGAME",	"$3366",	"$3367",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),	
				
				NewMenuButton("txtBtnSTARTGAME",	"$3363",	"$3337",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),	
				
		},		

	},


	

----------------------------------- MAIN SCREEN -----------------------------------
	{	
		type = "Frame",
		name = "MainWindowFrame",
		--style = "FEScreenBackgroundStyle",
		visible = 1,

		Layout = {			
			pos_XY = LAYOUT_CENTERPARENT,
			--size_WH = { w = .9, h =(.9)/(16/9) , wr = "scr", hr = "scr_max" },
			size_WH = { w = 0, h =0 , wr = "scr", hr = "scr_max" },
			pivot_XY = { .5, .5 },	
			pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
			pad_RB = { r = 16, b = 16, rr = "px", br = "px" },	
		},	

		backgroundColor = COLOR_BACKGROUND_SCREEN,
		arrangetype = "horiz"
		;
		SUPPRESSBUTTON,
			NewMenuButton("txtBtnMOREOPTIONS",		"$3363",	"$3337",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),	


	},
	-- Items to clone landfill
	PLAYER1FRAMETOCLONE,
	
	OPTIONTOCLONE,
	LISTBOXITEMTOCLONE,
	
}