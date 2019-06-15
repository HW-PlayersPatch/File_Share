dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

GameFilterScreen = {
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},


	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
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
			TitleText = "$3050",  --GAME FILTERS
			-- SubtitleText = "$3051", --SET GAME LIST FILTERS//

			autosize=1,
			;

				-- Contents frame
			{
				type = "Frame",
				arrangetype = "vert",
				
				Layout = {						
					pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					size_WH = {w = .5, h = 1, wr = "scr", hr = "px",},
				},
				autosize=1,
				arrangeSep = {	x=0, y=PANEL_SPACING_VERT/2, xr="scr", yr="scr",},
				;
				Option_LabeledTextInput("ServerNameFilter", "$3052",  "txtInputNameFilter", "$3053" ),
				Option_LabeledTextInput("MapNameFilter", "$3054",  "txtInputMapFilter", "$3055" ),
				Option_LabeledTextInput("ModeFilter", "$3046",  "txtInputModeFilter", "$3047" ),
				Option_LabeledTextInput("PlayerFilter", "$3048",  "txtInputMaxPlayersFilter", "$3049" ),
				--Option_LabeledTextInput("PingFilter", "$3056",  "txtInputPingFilter", "$3057" ),
				NewCheckBoxButton("PasswordFilter",		"$4970", "$4971", nil,  nil, 1 ),
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
			
			NewMenuButton("btnBack",		"$2613",	"$2613",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	[[UI_SetScreenVisible("GameFilterScreen", 0);]]),
			NewMenuButton("btnClear",		"$3060",	"$3058",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),
			NewMenuButton("btnAccept",		"$2612",	"$2612",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
			
		},
	},
}

	