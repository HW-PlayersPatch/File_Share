dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

BTN_MENU_SMALL_DIPLOMACY_LAYOUT = 
{
	min_WH = {	w = .045, wr = "scr"},	
	pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
	pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
}



DiplomacyScreen = {

	stylesheet = "HW2StyleSheet",

	RootElementSettings = {
	--autosize=1,
	},
	
	Layout = {	
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	eventOpaque=0,
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords

	;
	
	{
		type = "Frame",
		autosize  = 1,
		arrangetype = "vert",
		Layout = {						
			pivot_XY = { .5, .5},					
			pos_XY = {	x=.5, y=.5, xr="par", yr="par",},		
			--size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
		},		
		;
	

		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText =	"$2900", -- DIPLOMACY
			-- SubtitleText = "$2899", -- PLAYERS//
			autosize=1,
			arrangetype = "vert",



			;
			{
				type = "Frame",
				autosize  = 1,
				arrangetype = "horiz",
				arrangedir = 1,	
						
				;
				-- player buttons
				{
					type = "Frame",
					--position = { 3, 31},
					autosize = 1,
					--borderColor = "IGColorOutline",
					arrangetype = "vert",

					arrangeSep = {	x=0, y=PANEL_SPACING_VERT/4, xr="scr", yr="scr",},	
					--outerBorderWidth = 1,
					;	
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player1",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player2",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player3",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player4",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player5",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player6",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player7",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
					{
						type = "Frame",

						autosize = 1,
						BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
						backgroundColor = COLOR_LISTITEM,
						;	
						{
							type = "Button",
							name = "player8",
							buttonStyle = "DiplomacyScreen_PlayerButtonStyle",
						},
					},
				},
		

				-- action buttons
				{
					type = "Frame",
					autosize = 1,
					arrangetype = "vert",

					Layout = {
						margin_LT = { l = PANEL_PAD_HORIZ*2, t = 0, lr = "scr", tr = "scr" },
						min_WH = {h=1,hr="par"},	

					},


					arrangeSep = {	x=0, y=PANEL_SPACING_VERT/4, xr="scr", yr="scr",},	
					;	
										-- donate RU buttons and label
					{
						type = "TextLabel",
						--position = { 225, 105+20},
						autosize = 1,

						Layout = {
							margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
							--pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
							--size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
						},	

						Text = {
							UseTemplate = T_Text_TitleBar,
							text = "$2713", -- Diplomacy
							hAlign = "Left",
						},
					},
					---------------------------------------------------------------
					-- Diplomacy action panel
					{
						type = "Frame",
						
						Layout = {
							pad_LT = { l = PANEL_PAD_HORIZ/4, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
							pad_RB = { r =PANEL_PAD_HORIZ/4, b = PANEL_PAD_VERT/2, rr = "scr", br = "scr" },	
									
							--size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
						},		

						autosize = 1,
			
						BackgroundGraphic = BORDER_GRAPHIC_FRAME,
						backgroundColor = COLOR_BACKGROUND_SUBPANEL,
					
						arrangetype = "vert",	
						arrangeSep = {	x=PANEL_SPACING_HORIZ/4, y=PANEL_SPACING_VERT/2, xr="scr", yr="scr",},	
						;
							NewMenuButton("requestAlliance",		"$2901",	"$2914",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1_Chipped",	nil),
							NewMenuButton("breakAlliance",			"$2902",	"$2915",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1_Chipped",	nil),
							NewMenuButton("ignoreAlliance",			"$2903",	"$2916",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1_Chipped",	nil),
							NewMenuButton("transferShips",			"$2908",	"$2917",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1_Chipped",	nil),
					},

					---------------------------------------------------------------
					-- donate RU buttons and label
					{
						type = "TextLabel",
						--position = { 225, 105+20},
						autosize = 1,

						Layout = {
							margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
							--pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
							--size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
						},	

						Text = {
							UseTemplate = T_Text_TitleBar,
							text = "$2909", -- Donate RUs
							hAlign = "Left",
						},
					},

					{
						type = "Frame",
						
						Layout = {
							pad_LT = { l = PANEL_PAD_HORIZ/4, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
							pad_RB = { r =PANEL_PAD_HORIZ/8, b = PANEL_PAD_VERT/2, rr = "scr", br = "scr" },			
							--size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
						},		

						autosize = 1,
			
						BackgroundGraphic = BORDER_GRAPHIC_FRAME,
						backgroundColor = COLOR_BACKGROUND_SUBPANEL,
					
						arrangetype = "horiz",
						arrangearray = 2,
						arrangeSep = {	x=PANEL_SPACING_HORIZ/4, y=PANEL_SPACING_VERT/2, xr="scr", yr="scr",},	
						;
						NewMenuButton("donate500",		"500",	"$2919",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1",	nil),
						NewMenuButton("donate1000",		"1000",	"$2920",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1",	nil),
						NewMenuButton("donate5000",		"5000",	"$2921",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1",	nil),
						NewMenuButton("donateAll",		"$2910",	"$2922",	0,	BTN_MENU_SMALL_DIPLOMACY_LAYOUT,	"FEButtonStyle1",	nil),

					},
				},

			},

		},

			--- Close button
		{
			type = "Frame",
			autosize=1,
			
			Layout = {
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		

			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,
			;
			
			{
				type = "TextButton",
				Layout = {
					pivot_XY = { 1.0, 0.5 },					
					pos_XY = {	x=1.0, y=0.5, xr="par", yr="par",},								
					size_WH = {	w = 1, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	
				buttonStyle = "FEButtonStyle1_Alert_Chipped",	
				text = "$2642",  -- CLOSE
				onMousePressed = "UI_ToggleScreen( 'DiplomacyScreen', 0)",
				helpTipTextLabel = "helpTip",
				helpTip = "$2923",
			},
		},
	},
}
