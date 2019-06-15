dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

GameInfoScreen = {
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	LocalizedMessages = 
	{
		[ LM_GameName ] 	= "$3435", -- HOST NAME
		[ LM_Map ] 		= "$3436", -- MAP
		[ LM_GameMode ] 	= "$3437", -- MODE
		[ LM_MaxPlayers ] 	= "$3446", -- MAX PLAYERS
	},
	;
		
	{
		type = "Frame",

		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
		},	
		
		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	

		backgroundColor = "FEColorDialog",
		;
		-- Dialog frame 
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$3422",--GAME INFO
			-- SubtitleText = "$3447",--EXTRA INFORMATION//

			autosize=1,
			;

			-- Contents frame
			{
				type = "Frame",
				autosize=1,				
				;
			
				--DEFINITION FOR: (listBox) listInfo
				{
					type = "ListBox",
					name = "listBoxInfo",
					listBoxStyle = "FEListBoxStyle_Bordered",
					--borderWidth = 0,
					--borderColor = "FEColorOutline",
					--backgroundColor = {25,25,25,89},
					position = {0,0},
					size = {300,275},				
				},

				--DEFINITION FOR: (lstBox) _InfoTemplate
				{
					type = "ListBoxItem",
					name = "listBoxTemplate",
					size = {300, 13},
					ignored=1,
					;
					{
						type = "TextListBoxItem",
						name = "optionName",
						overTextColor				= COLOR_BUTTON_TEXT_HOVER,
						visible = 1,
						enabled = 1,
						Text = {
							font = "ListBoxItemFont",
							textStyle = "FEListBoxItemTextStyle",
							color = {255,255,255,255},
							offset = {4,0},
						},
						backgroundColor = {0,0,0,0},	
						position = {0,0},
						size = {140,13},
					},
					{
						type = "TextListBoxItem",
						name = "optionValue",
						visible = 1,
						enabled = 1,
						Text = {
							font = "ListBoxItemFont",
							color = {255,255,255,255},
							offset = {4,0},
						},
						backgroundColor = {0,0,0,0},
						position = {140,0},					
						size = {180,13},				
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

			Layout = {
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
			
			NewMenuButton("m_btnBack",		"$3420",	"",			0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),
			NewMenuButton("m_btnJoin",		"$3417",	"$3630",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
		},
		

	},
}

	