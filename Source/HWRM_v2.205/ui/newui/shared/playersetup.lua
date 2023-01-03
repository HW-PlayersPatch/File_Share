dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

PlayerSetup = {

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, -- Enter pixel coords for texture coords

	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	-- Flags

	;

	{
		type = "Frame",	
		name = "m_frmRoot",
			
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
			size_WH = {	w = 0.8, h = 1.0, wr = "par", hr = "px" },
		},	

		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;

				


			
		--	{
		--		type = "TextLabel",
		--		name = "helpTip",
		--		size = { 492, 19},
		--		borderWidth = 1,
		--		borderColor = "FEColorPopupOutline",
		--		Text = {
		--			textStyle = "FEHelpTipTextStyle",
		--			offset = { 4, 0},
		--		},
		--	},

		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$2775",  -- EDIT PROFILE
			-- SubtitleText = "$2776",  -- SETTINGS//

			autosize=1,
			arrangetype = "vert",
			--position = SAVELOAD_POSITION,
			--size = {SAVELOAD_WIDTH, SAVELOAD_HEIGHT+1},
			
			Layout = {
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },		
			},
			;
			---------------------- TOP BAR --------------------
			{
				type = "Frame",
				autosize=1,
				arrangetype = "horiz",
				--arrangedir = -1,
				Layout = {
					size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },		
				},
				;	

				-- Presets
				{
					type = "Frame",
					autosize=1,
					arrangetype = "vert",
					--arrangedir = -1,
					Layout = {
						margin_RB = { r = 0, b = PANEL_SPACING_VERT, rr = "scr", br = "scr" },	
						pos_XY = {	x = 0, y = 1, xr = "par",	yr = "px"	},	
						pivot_XY = { 0.0, 0.0 },
					},		
					--backgroundColor = {255,0,0,200},	

					;				
					{
						type = "TextLabel",					
						size = { 100, 13},
						marginWidth = 6,
						Text = {
							text = "$2803",  -- 
							textStyle = "FEHeading4",
						},
					},
					{
						type = "Frame",
						autosize=1,
						arrangetype = "horiz",
						--arrangedir = -1,
						Layout = {
							--margin_RB = { r = 0, b = PANEL_SPACING_VERT, rr = "scr", br = "scr" },	
							--pos_XY = {	x = 1, y = 1, xr = "par",	yr = "px"	},	
							--pivot_XY = { 1.0, 0.0 },
						},		
						arrangeSep = {	x=PANEL_SPACING_HORIZ/2, y=0, xr="scr", yr="scr",},	
						;
						{
							type = "ButtonHD",
							ignored = 1,				
							--toggleButton = 1,
							buttonStyle = "RM_TaskbarHD_MenuButtonStyle",
							name = "hiigaranPresetButton",
										
							helpTip = "$1100",
							helpTipTextLabel = "commandsHelpTip",							

							Layout = {
								--pos_XY = { x = 256, y = 128, xr = "px", yr = "px" },
								size_WH = { w = 128.0, h = 64.0, wr = "px", hr = "px" },
								lockAspect = 2,
								pivot_XY = {0.0, 0.0},
							},

							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\PlayerSetup\\preset_hiigaran.tga",
								textureUV = { 0, 0, 256, 128 },
								--color = { 0, 0, 0, 200 },
							},
						},
						{
							type = "ButtonHD",
							ignored = 1,				
							--toggleButton = 1,
							buttonStyle = "RM_TaskbarHD_MenuButtonStyle",
							name = "vaygrPresetButton",
										
							helpTip = "$1101",
							helpTipTextLabel = "commandsHelpTip",							

							Layout = {
								--pos_XY = { x = 256, y = 128, xr = "px", yr = "px" },
								size_WH = { w = 128.0, h = 64.0, wr = "px", hr = "px" },
								lockAspect = 2,
								pivot_XY = {0.0, 0.0},
							},

							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\PlayerSetup\\preset_vaygr.tga",
								textureUV = { 0, 0, 256, 128 },
								--color = { 0, 0, 0, 200 },
							},
						},
						{
							type = "ButtonHD",
							ignored = 1,				
							--toggleButton = 1,
							buttonStyle = "RM_TaskbarHD_MenuButtonStyle",
							name = "kushanPresetButton",
										
							helpTip = "$1104",
							helpTipTextLabel = "commandsHelpTip",							

							Layout = {
								--pos_XY = { x = 256, y = 128, xr = "px", yr = "px" },
								size_WH = { w = 128.0, h = 64.0, wr = "px", hr = "px" },
								lockAspect = 2,
								pivot_XY = {0.0, 0.0},
							},

							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\PlayerSetup\\preset_kushan.tga",
								textureUV = { 0, 0, 256, 128 },
								--color = { 0, 0, 0, 200 },
							},
						},
						{
							type = "ButtonHD",
							ignored = 1,				
							--toggleButton = 1,
							buttonStyle = "RM_TaskbarHD_MenuButtonStyle",
							name = "taiidanPresetButton",
										
							helpTip = "$1105",
							helpTipTextLabel = "commandsHelpTip",							

							Layout = {
								--pos_XY = { x = 256, y = 128, xr = "px", yr = "px" },
								size_WH = { w = 128.0, h = 64.0, wr = "px", hr = "px" },
								lockAspect = 2,
								pivot_XY = {0.0, 0.0},
							},

							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\PlayerSetup\\preset_taiidan.tga",
								textureUV = { 0, 0, 256, 128 },
								--color = { 0, 0, 0, 200 },
							},
						},
					},

			
				},
				----------------------------------------------------
				-- Name 
				{
					type = "Frame",
					autosize=1,
					arrangetype = "vert",
					--arrangedir = -1,
					Layout = {
						margin_RB = { r = 0, b = PANEL_SPACING_VERT, rr = "scr", br = "scr" },	
						pos_XY = {	x = 1, y = 1, xr = "par",	yr = "px"	},	
						pivot_XY = { 1.0, 0.0 },
						size_WH = {	w = .25, h = 1.0, wr = "par", hr = "px" },		
					},		

					--backgroundColor = {255,255,0,200},	
					;	



					-- chat name	edit chat name
					{
						type = "Frame",
						autosize=1,
						arrangetype = "vert",
						arrangedir = -1,
						Layout = {
							margin_RB = { r = PANEL_SPACING_HORIZ, b = PANEL_SPACING_VERT, rr = "scr", br = "scr" },	
							pos_XY = {	x = 1, y = 0, xr = "par",	yr = "px"	},	
							pivot_XY = { 1.0, 0.0 },
						},		
						arrangeSep = {	x=PANEL_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	

						;				
						{
							type = "TextLabel",					
							autosize=1,
							marginWidth = 2,
							Text = {
								text = "$2789",  -- CHAT NAME
								textStyle = "FEHeading4",
							},
						},
						{
							type = "TextInput",
							name = "chatname",
							
							textInputStyle = "FETextInputStyle",					
							width = 100,
							maxTextLength = 16,
							helpTipTextLabel = "helpTip",
							helpTip = "$2791",
						},
					},


				},
			},
			-- ship preview
			{
				type = "Frame",
				autosize=1,
				Layout = {
					pos_XY = {	x = 0.5, y = 0.0, xr = "par",	yr = "px"	},
					pivot_XY = { 0.5, 0.0 },			
					size_WH = {	w = 1.0, h = 1.0, wr = "px", hr = "px" },							
				},	
				--Layout = {							
				--		lockAspect = 2,	
				--	},		
				;			

				{
					type = "Frame",				
					size = {500, 250},
					name = "grid",
					eventOpaque = 0,
					visible = 1,
					BackgroundGraphic = {
						texture = "DATA:UI\\NewUI\\PlayerSetup\\grid.tga",
						textureUV = { 0, 0, 2048, 1024 },
					},
					helpTipTextLabel = "helpTip",
					helpTip = "$2793",
				},
				----------Hiigaran
				{
					type = "Frame",				
					size = {500, 250},
					name = "shippreview",
					eventOpaque = 0,
					visible = 1,
					helpTipTextLabel = "helpTip",
					helpTip = "$2793",
					;

					{
						type = "Frame",				
						size = {500, 250},
						name = "grid",
						visible = 1,
						BackgroundGraphic = {
							texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_shadow.tga",
							textureUV = { 0, 0, 2048, 1024 },
							--color = { 0, 0, 0, 200 },
						},
						helpTipTextLabel = "helpTip",
						helpTip = "$2793",
					},


					{
						type = "Frame",
						--position = {93, 5},
						size = {500, 250},
						BackgroundGraphic = {
							size = {500, 250},
							texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_base.tga",
							uvRect = { 0, 1, 1, 0 },
							--textureUV = { 0, 0, 300, 190 },
						},
						giveParentMouseInput = 1,
						;
						{
							type = "Frame",
							--position = {0, 0},
							size = {500, 250},
							name = "shipteamcolor",
							BackgroundGraphic = {
								size = {500, 250},
								texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_teamcolor.tga",
								uvRect = { 0, 1, 1, 0 },
								--textureUV = { 0, 0, 300, 190 },
								color = { 118, 174, 207, 255 },
							},
							giveParentMouseInput = 1,
							;
							{
								type = "Frame",
								--position = {0, 0},
								size = {500, 250},
								name = "shipstripecolor",
								BackgroundGraphic = {
									size = {500, 250},
									texture = "DATA:UI\\NewUI\\PlayerSetup\\ship_stripecolor.tga",
									--textureUV = { 0, 0, 300, 190 },
									uvRect = { 0, 1, 1, 0 },
								},
								giveParentMouseInput = 1,
							},
						},
						{
							type = "Frame",
							name = "hgn_emblem1",
							--position = {46, 21},
							size = { 26, 26},
							BackgroundGraphic = {
								texture = "DATA:Badges/Hiigaran.tga",
								uvRect = {0.0,1.0,1.0,0.0},
								color = { 240, 240, 240, 255},
							},
							giveParentMouseInput = 1,
						},
						---{
						--	type = "Frame",
						--	name = "hgn_emblem2",
						--	--position = {46, 142},
						--	size = { 26, 26},
						--	BackgroundGraphic = {
						--		texture = "DATA:Badges/Hiigaran.tga",
						--		uvRect = {0.0,0.0,1.0,1.0},
						--		color = { 200, 200, 200, 255},
						--	},
						--	giveParentMouseInput = 1,
						--},
					},

					--{
					--	type = "Frame",
					--	size = {500, 250},
					--	BackgroundGraphic = {
					--		texture = "DATA:UI\\NewUI\\PlayerSetup\\labeltext.tga",
					--		textureUV = { 0, 0, 486, 216 },
					--	},
					--	giveParentMouseInput = 1,
					--},
				},
				{
					type = "Frame",
					--position = {6, 71},
					size = {500, 250},
					name = "vshippreview",
					visible = 0,
					helpTipTextLabel = "helpTip",
					helpTip = "$2793",
					;
					{
						type = "Frame",
						--position = {24, 42},
						size = {500, 250},
						BackgroundGraphic = {
							size = {500, 250},
							texture = "DATA:UI\\NewUI\\PlayerSetup\\vship_base.tga",
							uvRect = { 0, 1, 1, 0 },
							--textureUV = { 0, 0, 438, 116 },
						},
						giveParentMouseInput = 1,
						;
						{
							type = "Frame",
							--position = {0, 0},
							size = {500, 250},
							name = "vshipteamcolor",
							BackgroundGraphic = {
								size = {500, 250},
								texture = "DATA:UI\\NewUI\\PlayerSetup\\vship_teamcolor.tga",
								uvRect = { 0, 1, 1, 0 },
								--textureUV = { 0, 0, 438, 116 },
								color = { 118, 174, 207, 255 },
							},
							giveParentMouseInput = 1,
							;
							{
								type = "Frame",
								--position = {0, 0},
								size = {500, 250},
								name = "vshipstripecolor",
								BackgroundGraphic = {
									size = {500, 250},
									texture = "DATA:UI\\NewUI\\PlayerSetup\\vship_stripecolor.tga",
									--textureUV = { 0, 0, 438, 116 },
									uvRect = { 0, 1, 1, 0 },
								},
								giveParentMouseInput = 1,
							},
							{
								type = "Frame",
								name = "vgr_emblem",
								--position = {116, 14},
								size = { 26, 26},
								BackgroundGraphic = {
									texture = "DATA:Badges/Hiigaran.tga",
									uvRect = {0.0,1.0,1.0,0.0},
									color = { 255, 255, 255, 255},
								},
								giveParentMouseInput = 1,
							},
						},
					},
					--{
					--	type = "Frame",
					--	size = {500, 250},
					--	BackgroundGraphic = {
					--		texture = "DATA:UI\\NewUI\\PlayerSetup\\vlabeltext.tga",
					--		textureUV = { 0, 0, 486, 216 },
					--	},
					--	giveParentMouseInput = 1,
					--},
				},
				{
					type = "Frame",
					--position = {6, 71},
					size = {500, 250},
					name = "tshippreview",
					visible = 0,
					helpTipTextLabel = "helpTip",
					helpTip = "$2793",
					;
					{
						type = "Frame",
						--position = {24, 42},
						size = {500, 250},
						BackgroundGraphic = {
							size = {500, 250},
							texture = "DATA:UI\\NewUI\\PlayerSetup\\tship_base.tga",
							uvRect = { 0, 1, 1, 0 },
							--textureUV = { 0, 0, 438, 116 },
						},
						giveParentMouseInput = 1,
						;
						{
							type = "Frame",
							--position = {0, 0},
							size = {500, 250},
							name = "tshipteamcolor",
							BackgroundGraphic = {
								size = {500, 250},
								texture = "DATA:UI\\NewUI\\PlayerSetup\\tship_teamcolor.tga",
								uvRect = { 0, 1, 1, 0 },
								--textureUV = { 0, 0, 438, 116 },
								color = { 118, 174, 207, 255 },
							},
							giveParentMouseInput = 1,
							;
							{
								type = "Frame",
								--position = {0, 0},
								size = {500, 250},
								name = "tshipstripecolor",
								BackgroundGraphic = {
									size = {500, 250},
									texture = "DATA:UI\\NewUI\\PlayerSetup\\tship_stripecolor.tga",
									--textureUV = { 0, 0, 438, 116 },
									uvRect = { 0, 1, 1, 0 },
								},
								giveParentMouseInput = 1,
							},
							{
								type = "Frame",
								name = "tai_emblem",
								--position = {116, 14},
								size = { 26, 26},
								BackgroundGraphic = {
									texture = "DATA:Badges/Hiigaran.tga",
									uvRect = {0.0,1.0,1.0,0.0},
									color = { 255, 255, 255, 255},
								},
								giveParentMouseInput = 1,
							},
						},
					},
					--{
					--	type = "Frame",
					--	size = {500, 250},
					--	BackgroundGraphic = {
					--		texture = "DATA:UI\\NewUI\\PlayerSetup\\tlabeltext.tga",
					--		textureUV = { 0, 0, 486, 216 },
					--	},
					--	giveParentMouseInput = 1,
					--},
				},
				{
					type = "Frame",
					--position = {6, 71},
					size = {500, 250},
					name = "kshippreview",
					visible = 0,
					helpTipTextLabel = "helpTip",
					helpTip = "$2793",
					;
					{
						type = "Frame",
						--position = {24, 42},
						size = {500, 250},
						BackgroundGraphic = {
							size = {500, 250},
							texture = "DATA:UI\\NewUI\\PlayerSetup\\kship_base.tga",
							uvRect = { 0, 1, 1, 0 },
							--textureUV = { 0, 0, 438, 116 },
						},
						giveParentMouseInput = 1,
						;
						{
							type = "Frame",
							--position = {0, 0},
							size = {500, 250},
							name = "kshipteamcolor",
							BackgroundGraphic = {
								size = {500, 250},
								texture = "DATA:UI\\NewUI\\PlayerSetup\\kship_teamcolor.tga",
								uvRect = { 0, 1, 1, 0 },
								--textureUV = { 0, 0, 438, 116 },
								color = { 118, 174, 207, 255 },
							},
							giveParentMouseInput = 1,
							;
							{
								type = "Frame",
								--position = {0, 0},
								size = {500, 250},
								name = "kshipstripecolor",
								BackgroundGraphic = {
									size = {500, 250},
									texture = "DATA:UI\\NewUI\\PlayerSetup\\kship_stripecolor.tga",
									--textureUV = { 0, 0, 438, 116 },
									uvRect = { 0, 1, 1, 0 },
								},
								giveParentMouseInput = 1,
							},
							{
								type = "Frame",
								name = "kus_emblem",
								--position = {116, 14},
								size = { 26, 26},
								BackgroundGraphic = {
									texture = "DATA:Badges/Hiigaran.tga",
									uvRect = {0.0,1.0,1.0,0.0},
									color = { 255, 255, 255, 255},
								},
								giveParentMouseInput = 1,
							},
						},
					},
					--{
					--	type = "Frame",
					--	size = {500, 250},
					--	BackgroundGraphic = {
					--		texture = "DATA:UI\\NewUI\\PlayerSetup\\klabeltext.tga",
					--		textureUV = { 0, 0, 486, 216 },
					--	},
					--	giveParentMouseInput = 1,
					--},
				},
				-- Grid that goes on top of ships
				{
					type = "Frame",				
					size = {500, 250},
					name = "grid",
					visible = 1,
					BackgroundGraphic = {
						texture = "DATA:UI\\NewUI\\PlayerSetup\\grid.tga",
						textureUV = { 0, 0, 2048, 1024 },
						color = { 255, 255, 255, 100},
					},
					helpTipTextLabel = "helpTip",
					helpTip = "$2793",
				},

					-- race	select for preview
					{
						type = "Frame",
						autosize=1,
						arrangetype = "horiz",
						arrangedir=-1,
						Layout = {
							margin_LT = { l = PANEL_SPACING_HORIZ, t = 0, lr = "scr", tr = "px" },
							margin_RB = { r = PANEL_SPACING_HORIZ, b = PANEL_SPACING_VERT/2, rr = "scr", br = "scr" },	
							pos_XY = {	x = 1, y = 1, xr = "par",	yr = "par"	},	
							pivot_XY = { 1.0, 1.0 },
							Flags = {
								hasVolume = 0,
								canArrange = 0,
							}
						},	

						arrangeSep = {	x=PANEL_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	
						;			
						{
							type = "TextLabel",					
							
							autosize=1,
							Text = {
								text = "$2777",  -- RACE
								textStyle = "FEHeading4",
							},
						},
						{
							type = "DropDownListBox",	
							size = { 100, 13},
							name = "raceselect",
							selected = 0,
							ListBox = {
								backgroundColor = {0,0,0,255},
								width = 242,
								;
								-- Hiigaran
								{
									type = "TextListBoxItem",
									buttonStyle = "FEListBoxItemButtonStyle",
									resizeToListBox = 1,
									Text = {
										textStyle = "FEListBoxItemTextStyle",
										text = "$1100",
									},
									onMouseClicked = "UI_SetElementVisible(\"PlayerSetup\", \"shippreview\", 1); UI_SetElementVisible(\"PlayerSetup\", \"vshippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"kshippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"tshippreview\", 0);";
								},
								-- Vaygr
								{
									type = "TextListBoxItem",
									buttonStyle = "FEListBoxItemButtonStyle",
									resizeToListBox = 1,
									Text = {
										textStyle = "FEListBoxItemTextStyle",
										text = "$1101",
									},	
									onMouseClicked = "UI_SetElementVisible(\"PlayerSetup\", \"shippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"vshippreview\", 1); UI_SetElementVisible(\"PlayerSetup\", \"kshippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"tshippreview\", 0);";
								},
								--Kushan
								{
									type = "TextListBoxItem",
									buttonStyle = "FEListBoxItemButtonStyle",
									resizeToListBox = 1,
									Text = {
										textStyle = "FEListBoxItemTextStyle",
										text = "$1104",
									},	
									onMouseClicked = "UI_SetElementVisible(\"PlayerSetup\", \"shippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"vshippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"kshippreview\", 1); UI_SetElementVisible(\"PlayerSetup\", \"tshippreview\", 0);";
								},
								--Taiidan
								{
									type = "TextListBoxItem",
									buttonStyle = "FEListBoxItemButtonStyle",
									resizeToListBox = 1,
									Text = {
										textStyle = "FEListBoxItemTextStyle",
										text = "$1105",
									},	
									onMouseClicked = "UI_SetElementVisible(\"PlayerSetup\", \"shippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"vshippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"kshippreview\", 0); UI_SetElementVisible(\"PlayerSetup\", \"tshippreview\", 1);";
								},
							},
							helpTipTextLabel = "helpTip",
							helpTip = "$2792",
						},		
					},


			},
			

		},
		---------------------------------------------------------------------------------
		------------------------ Color/Badge/Stripe Selection Area ----------------------
		{
			type = "Frame",

			Layout = {
				pos_XY = {	x = 0.5, y = 0.0, xr = "par",	yr = "px"	},
				pivot_XY = { 0.5, 0.0 },				
				margin_LT = { l = 0, t = PANEL_SPACING_VERT, lr = "scr", tr = "scr" },
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "px", hr = "px" },							
			},

			autosize=1,
			
			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,
				
			arrangetype = "horiz",
			arrangeSep = {	x=PANEL_SPACING_HORIZ, y=0, xr="scr", yr="scr",},
			;
			------------ LEFT PANEL--------------
			{
				type = "Frame",
				autosize=1,
				arrangetype = "vert",

				;
				{
					type = "Frame",
					autosize=1,
					arrangetype = "horiz",
					;
					-- team colors
					{
						type = "RadioButton",
						name = "teamcolor",
						--position = { 6, 293},
						size = { 122, 13},
						Text = {
							text = "$2781",  -- BASE COLOR
							textStyle = "FEButtonTextStyle",
							dropShadow = 1,
						},
						borderWidth = 1,
						borderColor = { 0, 0, 0, 0},
						overBorderColor = { 255, 255, 255, 128},
						pressedBorderColor = { 255, 255, 255, 255},
						textColor = { 255, 255, 255, 255},
						overTextColor = { 255, 255, 255, 255},
						pressedTextColor = { 255, 255, 255, 255},
						clickedColor = { 0, 0, 0, 255},
						clickedTextColor = { 255, 255, 255, 255},
			
						helpTipTextLabel = "helpTip",
						helpTip = "$2795",
					},
					{
						type = "RadioButton",
						name = "stripecolor",
						--position = { 130, 293},
						size = { 122, 13},
						Text = {
							text = "$2782",  -- STRIPE COLOR
							textStyle = "FEButtonTextStyle",
							dropShadow = 1,
						},
						borderWidth = 1,
						borderColor = { 0, 0, 0, 0},
						overBorderColor = { 255, 255, 255, 128},
						pressedBorderColor = { 255, 255, 255, 255},
						textColor = { 255, 255, 255, 255},
						overTextColor = { 255, 255, 255, 255},
						pressedTextColor = { 255, 255, 255, 255},
						clickedColor = { 0, 0, 0, 255},
						clickedTextColor = { 255, 255, 255, 255},
			
						helpTipTextLabel = "helpTip",
						helpTip = "$2796",
					},
				},
				-- emblem and stripes
				{
					type = "Frame",
					name = "emblemback",
					position = { 6, 308},
					size = { 246, 88},
					backgroundColor = { 118, 174, 207, 255 },
					;
			
					{
						type = "Frame",
						name = "emblemstripes",
						position = {94, 0},
						size = { 152, 88},
						BackgroundGraphic = {
							size = {152, 88},
							texture = "DATA:UI\\NewUI\\PlayerSetup\\stripes.tga",
							textureUV = { 103, 1, 255, 89 },
						},
						giveParentMouseInput = 1,
					},
					{
						type = "Frame",
						name = "emblem",
						position = {80, 12},
						Layout = {							
							size_WH = { w = 80.0/800, h = 80.0/600, wr = "scr", hr = "scr" },
							lockAspect = 1,
						},
						BackgroundGraphic = {							
							texture = "DATA:Badges/Hiigaran.tga",
							uvRect = {0.0,1.0,1.0,0.0},
						},
						giveParentMouseInput = 1,
					},
				},

				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle2",
					--position = { 6, 398},
					size = { 246, 13},
					Text = {
						text = "$2779",  -- LOAD BADGE
						textStyle = "FEButtonTextStyle",
					},
					onMouseClicked = "UI_ShowScreen( 'EmblemSelect', 0)",
					helpTipTextLabel = "helpTip",
					helpTip = "$2794",
				},

			},

			------------- Right Panel ----------------
			{
				type = "Frame",
				autosize=1,
				arrangetype = "vert",				
				;
				-- Color Swatch

				-- color swatch list
				{
					type = "Frame",
					name = "colorswatches",
					--position = { 253, 293},
					autosize = 1,
					autoarrange = 1,
					arrangetype = "horiz",	
					--autoarrangeWidth = 240,					
				},
		
				-- color swatch to insert into above list
				{
					type = "Frame",
					name = "colorswatch",
					ignored=1,
					visible = 0,
					size = { 15, 29},
					;
					{
						type = "Button",
						name = "savecolor",
						size = { 15, 29},
						borderWidth = 1,
						borderColor = { 0, 0, 0, 0},
						overBorderColor = { 255, 255, 255, 255},
						pressedBorderColor = { 0, 0, 0, 0},
						BackgroundGraphic = {
							position = { 2, 15},
							size = { 11, 11},
							texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
							textureUV = { 0, 0, 64, 64},
							color = { 0, 0, 0, 255},
						},
						OverGraphic = {
							position = { 2, 15},
							size = { 11, 11},
							texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
							textureUV = { 0, 0, 64, 64},
							color = { 255, 255, 255, 255},
						},
						PressedGraphic = {
							position = { 2, 15},
							size = { 11, 11},
							texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
							textureUV = { 0, 0, 64, 64},
							color = { 255, 255, 255, 255},
						},
						helpTipTextLabel = "helpTip",
						helpTip = "$2783",
					},
					{
						type = "Button",
						name = "pickcolor",
						size = { 15, 16},
						borderWidth = 1,
						borderColor = { 0, 0, 0, 0},
						overBorderColor = { 255, 255, 255, 255},
						pressedBorderColor = { 0, 0, 0, 0},
						helpTipTextLabel = "helpTip",
						helpTip = "$2784",
					},
				},

				-- color picker
				{
					type = "Frame",
					autosize=1,
					arrangetype = "horiz",					
					;
					-- color picker
					{
						type = "Frame",
						--position = {254, 323},
						size = { 223, 88},
						name = "colorpicker",
						BackgroundGraphic = {
							texture = "DATA:UI\\NewUI\\PlayerSetup\\colorpicker.tga",
							textureUV = { 0, 0, 128, 32 },
						},
						helpTipTextLabel = "helpTip",
						helpTip = "$2797",
						;
			
						{
							type = "Frame",
							position = {-5, -5},
							Layout = {
								size_WH = { w = 11.0/800, h = 11.0/600, wr = "scr", hr = "scr" },
								lockAspect = 1,
							},
							name = "cursor",
							BackgroundGraphic = {
								--size = { 11, 11},
								texture = "DATA:UI\\NewUI\\PlayerSetup\\colorcursor.tga",
								textureUV = { 0, 0, 64, 64 },
							},
							giveParentMouseInput = 1,
						},
					},

					-- Brightness Slider

					{
						type = "Frame",
						--position = {479, 323},
						size = { 13, 88},
						name = "greyscale",
						BackgroundGraphic = {
							size = {13, 88},
							texture = "DATA:UI\\NewUI\\PlayerSetup\\greyscale.tga",
							textureUV = { 0, 0, 8, 32 },
						},
						helpTipTextLabel = "helpTip",
						helpTip = "$2778",
						;
			
						{
							type = "Frame",
							position = {0, -1},
							size = { 15, 3},
							name = "cursor",
							BackgroundGraphic = {
								size = { 15, 3},
								texture = "DATA:UI\\NewUI\\PlayerSetup\\greycursor.tga",
								textureUV = { 0, 0, 15, 3 },
							},
							giveParentMouseInput = 1,
						},
					},
			
				},
			},
		},


	
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		-- Button frame
		{
			type = "Frame",
			--size = {486, 18},
			--size = {SAVELOAD_WIDTH-8, 18},

			Layout = {
				--pos_XY = {	x = 0.10, y = 0.20, xr = "par",	yr = "par"	},	
				margin_LT = { l = 0, t = PANEL_SPACING_VERT, lr = "scr", tr = "scr" },
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		

			autosize=1,
			
			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,
				
			arrangetype = "horiz",

			;

			-- cancel/accept buttons
			{
				type = "TextButton",
				name = "m_btnCancel",
				buttonStyle = "FEButtonStyle1_Outlined",

				Layout = {
					pivot_XY = { 0.0, 0.5 },					
					pos_XY = {	x=0.0, y=0.5, xr="par", yr="par",},		
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
				},
				
				Text = {
					text = "$2613",  -- CANCEL				
				},
				
				helpTipTextLabel = "helpTip",
				helpTip = "$2798",
			},

			-- restore defaults button
			{
				type = "TextButton",
				name = "restoreDefaults",
				buttonStyle = "FEButtonStyle1_Outlined",

				Layout = {
					pivot_XY = { 0.0, 0.5 },					
					pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH*1.5, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
				},	

				Text = {
					text = "$2805", -- RESTORE DEFAULTS
				},

				helpTipTextLabel = "helpTip",
				helpTip = "$2806",
			},		

			{
				type = "TextButton",
				name = "acceptbutton",
				buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",
			
				Layout = {
					pivot_XY = { 1.0, 0.5 },					
					pos_XY = {	x=1.0, y=0.5, xr="par", yr="par",},	
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
				},	

			
				Text = {
					text = "$2612",  -- OK
				},
				
				helpTipTextLabel = "helpTip",
				helpTip = "$2799",
			},
		},
	},
}
