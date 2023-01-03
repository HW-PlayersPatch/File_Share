dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 284
MOREINFOWIDTH = DIALOGWIDTH - 7
MOREINFOHEIGHT = 100

ErrorMessage = {
	stylesheet = "HW2StyleSheet",
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	
	pixelUVCoords = 1, 
	
	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	soundOnShow = "SFX_ErrorMessage",
	
	
	-- text strings for warning message, instead of error message
	warningTitle = "$5598",--WARNING
	warningSubTitle = "$5599",--MESSAGE//
	;
		

	{
		type = "Frame",
		
		arrangetype = "vert",
		arrangedir = 1,	
		name = "m_frmDialogRoot",
		Layout = {			
			pivot_XY = { 0.5, 0.5 },				
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},					
			
		},

		autosize=1,

		;
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
		
			TitleText =	"$3610", --ERROR
			name = "m_frmDialogWindow",
			-- SubtitleText = "$3611",	--ERROR MESSAGE//	
			--size = {DIALOGWIDTH, 100},



			autosize = 1,
	
			;
		

			{
				type = "Frame",
				autosize  = 1,
				arrangetype = "vert",
				arrangedir = 1,	
				name = "m_frmBorderRoot",
				Layout = {
					margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
					margin_RB = { r = PANEL_PAD_HORIZ, b =1, rr = "scr", br = "px" },				
					size_WH = {	w = DIALOGBOX_WIDTH, h = 1.0, wr = "scr", hr = "px" },	
					--max_WH = { w = DIALOGBOX_WIDTH, wr = "scr" },								
				},	

				;
						
				-- Error Message frame
				{
					type = "Frame",
					name = "m_frmMessageLabel",
					autosize = 1,
					autoarrange = 1,
					;
					
					-- ErrorMessage Label
					{
						type = "TextLabel",
						name = "m_lblErrorMessage",
						width = DIALOGWIDTH - 6,
						autosize = 1,
						wrapping = 1,
						marginHeight = 4,
						marginWidth = 4,
						minSize = {0,50},
						name = "m_lblErrorMessage",
						Text = {
							textStyle = "FEHelpTipTextStyle",
							vAlign = "Top",
						},
						;
					},
					
					-- 
					{
						type = "Frame",
						name = "m_frmDontShowAgain",
						size = {DIALOGWIDTH - 6, 19},
						;
						-- Do not show again check box
						{
							type = "Button",
							name = "m_chkDontShowAgain",
							buttonStyle = "FECheckBoxButtonStyle",
							position = {3,3},
						},
						{
							type = "TextLabel",
							position = {20,4},
							size = {DIALOGWIDTH - 30, 13},
							Text = {
								textStyle = "FEHeading4",
								text = "$3612",--DO NOT SHOW THIS MESSAGE AGAIN
								vAlign = "Middle",
							},
						},
					},
				},

				

				-- More info frame
				{
					type = "Frame",
					name = "m_frmMoreInfoRoot",
					ignored=1,
					Layout = {
						pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
						pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
						size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },								
					},		
		
					autosize = 1,
					;
					{
						type = "Frame",
						name = "m_frmMoreInfo",				
						Layout = {		
							size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },								
						},	
						autosize=1,
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

				NewMenuButton("m_btnMoreInfo",		"$3613",	"",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),	
				NewMenuButton("m_btnAccept",		"$3614",	"",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
					
				-- Accept wide (accept button takes up whole width of message box)
				{
					type = "TextButton",				
					name = "m_btnAcceptWide",

					ignored = 1,
					Layout = {
						pivot_XY = { 0.5, 0.0 },					
						pos_XY = {	x=0.5, y=0.0, xr="par", yr="par"},			
						size_WH = {	w = 1, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
					},					

					buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",
					Text = {
			
						text = "$3614",--OK
					},
				},
	
		},
	},
}

	