dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")		

IPConnect = {
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	onShow = "UI_GiveFocus(\"m_txtInput\",\"IPConnect\")",
	
	;
	{
		type = "Frame",

		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
		},	

		
		autosize=1,
		arrangetype = "vert",
		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	

		backgroundColor = "FEColorDialog",
		;
				
		-- Main frame
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$3550",--JOIN GAME
			-- SubtitleText = "$3551",	--ENTER IP ADDRESS//	
			--arrangetype = "vert",
			autosize=1,
			
			;
			----------------------------------------------------------------
			-- Contents frame
			{
				type = "Frame",
				name = "dialogWindow",
				arrangetype = "vert",
				autosize=1,
				arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
				Layout = {
					margin_LT  = { l = BUILDPANEL_PAD_HORIZ*2, t = BUILDPANEL_PAD_VERT*2, lr = "scr", tr = "scr" },
					margin_RB  = { r = BUILDPANEL_PAD_HORIZ*2, b = BUILDPANEL_PAD_VERT*2, rr = "scr", br = "scr" },	
				},
				;
			
				-- Subtitle
				{
					type = "TextLabel",
					position = {10,17},
					size = {230, 10},
					Text = {
						textStyle = "FEHeading4",
						text = "$3551",	--ENTER IP ADDRESS//		
					},
				},
				-- Text box
				{
					type = "TextInput",
					textInputStyle = "FETextInputStyle",
					name = "m_txtInput",
					maxTextLength = 16,
					position = {4,35},	
					width = 238,
					helpTipTextLabel = "m_lblHelpText",
					helpTip = "$3552",--ENTER THE HOST'S IP ADDRESS
				
					onAccept = [[UI_DialogAcceptID(UI_GetScreenID('IPConnect'));]],
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
			
			NewMenuButton("m_btnCancel",		"$2613",	"$2613",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	[[UI_DialogCancel();]]),
			NewMenuButton("btnAccept",		"$2612",	"$2612",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	[[UI_DialogAccept();]]),
			
		},

	},

}

	
	