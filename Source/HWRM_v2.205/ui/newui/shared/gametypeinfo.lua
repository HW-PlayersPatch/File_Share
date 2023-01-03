dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

DIALOGWIDTH = 254
MOREINFOWIDTH = DIALOGWIDTH - 7
MOREINFOHEIGHT = 100

GameTypeInfo = {	
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
		name = "m_frmDialogRoot",
		type = "RmWindow",
		
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"$5587", -- "TEST TITLE",
		-- SubtitleText = "$5588", -- "GAME TYPE DESCRIPTION//",
		
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},				
		},	

		--backgroundColor = "FEColorDialog",
		autosize = 1,
		--marginHeight = 1,
		;
		
		
		{
			type = "Frame",
			autosize = 1,
			arrangetype = "vert",
			Layout = {
				margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				margin_RB = { r = PANEL_PAD_HORIZ, b =1, rr = "scr", br = "px" },				
				size_WH = {	w = DIALOGBOX_WIDTH, h = 1.0, wr = "scr", hr = "px" },		
				--max_WH = { w = DIALOGBOX_WIDTH, wr = "scr" },								
			},	

			;		
					
			-- ErrorMessage Label
			{
				type = "TextLabel",
				name = "lblDescription",		
				autosize = 1,
				wrapping = 1,

				--name = "m_lblErrorMessage",
				Text = {
					textStyle = "RM_MessageLabel_TextStyle",

					vAlign = "Top",
					hAlign = "Center",
				},

				
				Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="par", yr="par",},		
					--margin_LT = { l = 1, t = PANEL_PAD_VERT, lr = "px", tr = "scr" },
					margin_RB = { r = 1, b =PANEL_PAD_VERT, rr = "px", br = "scr" },					
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
					--pad_LT  = { l = 20, t = 8, lr = "px", tr = "px" },
					--pad_RB  = { r = 20, b = 8, rr = "px", br = "px" },

				},
				giveParentMouseInput = 1,
				;
			},
		},
	
	----------------Button Row ---------------------

		-- Button tray frame
		{
			type = "Frame",
			name = "m_frmButtons",
			autosize  = 1,
			Layout = {				
				size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
			},
			;
					
			-- Accept button
			{	
				name = "btnOk",
				type = "TextButton",
				Layout = {	
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH/2, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },					
				},	
				
				buttonStyle = "FEButtonStyle1_Alert_Chipped",		

				Text = {
					textStyle = "FEButtonTextStyle",
					text = "$5172",--YES
				},
				hotKeyID = 131,		
				onMouseClicked = "UI_HideScreen('GameTypeInfo')",
			},
		},
	},
				-- DELETE THIS
			{
				type = "TextLabel",
				autosize=1,
				visible = 0,
				name = "lblTitle",
				Text = {
					text = "$3026",  -- CREATE GAME
					textStyle = "FEHeading3",
				},
			},

}


	