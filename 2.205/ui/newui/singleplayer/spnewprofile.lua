dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")


NewProfile = {
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	
	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	pixelUVCoords = 1, 
	
	;
	{		
		--position = {273, 250},
		--size = {254, 100},
		type = "Frame",
		
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
			size_WH = {w = DIALOGBOX_WIDTH, h = 1, wr = "scr", hr = "px",},		
		},	
		autosize=1,

		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;
				
		-- Contents frame
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText =	"$3500",
			-- SubtitleText = "$3501",  
			autosize=1,

			Layout = {
				margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				margin_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },								
			},	

			;			
			-- Text box
			{
				type = "TextInput",
				textInputStyle = "FETextInputStyle",
				name = "m_txtProfileName",
				maxTextLength = 16,

				--position = {4,35},	
				width = 238,

				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$3502",
				
				Text = {
					text = "$2564", -- Default profile name suffix
				},
			},
			
		},
		{
			type = "Frame",
						
			Layout = {
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		

			autosize = 1,
			
			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,

			;	
			-- Cancel button
			{
				type = "TextButton",
				name = "m_btnCancel",

				Layout = {
					pivot_XY = { 0.0, 0.5 },					
					pos_XY = {	x=0.0, y=0.5, xr="par", yr="par",},		
					size_WH = {	w = NAVIGATION_SMALL_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
				},	

				buttonStyle = "FEButtonStyle1_Outlined_Chipped",
				
				Text = {					
					text = "$2613", -- CANCEL
				},
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$3503",
				
				--onMouseClicked = [[UI_DialogCancel();]],
			},
			
			-- Accept button
			{
				type = "TextButton",
				name = "m_btnCreateNew",

				Layout = {
					pivot_XY = { 1.0, 0.5 },					
					pos_XY = {	x=1.0, y=0.5, xr="par", yr="par",},			
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },					
				},	
				
				buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",

				Text = {					
					text = "$2612", -- OK
				},
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$3504",
				
				--onMouseClicked = [[UI_DialogAccept();]], 
			},
		},
	},
}

	