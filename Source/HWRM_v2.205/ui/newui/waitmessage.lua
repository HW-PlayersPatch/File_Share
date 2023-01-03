dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")


WaitMessage = {
	size = {0, 0, 800, 600},
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
		--size = {254, 100},		
		;
		
		-- Dialog frame 
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$5167",  -- Waiting
			-- SubtitleText = "$5168", --SET GAME LIST FILTERS//

			autosize=1,
			;

			-- Help text
			{
				type = "TextLabel",
				position = {8,6},			
				size = {230,45},
				wrapping = 1,
				marginHeight = 2,
				marginWidth = 2,
				name = "m_lblErrorMessage",
				Text = {
					textStyle = "FEHelpTipTextStyle",
					vAlign = "Top",
				},
				;
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
			
			NewMenuButton("m_btnCancel",		"$2613",	"$2613",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),
		},
		
		
			
	
	},
}
