dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254


bentusidialog = {
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
		
		arrangetype = "vert",
		arrangedir = 1,	
		name = "m_frmDialogRoot",
		Layout = {			
			pivot_XY = { 0.5, 0.5 },				
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},					
			
		},
		cursorType = "Normal",
		autosize=1,
		giveParentMouseInput = 1, --?
		;
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
		
			TitleText =	"$4912", --Bentusi Exchange
			name = "m_frmDialogWindow",
			-- SubtitleText = "$4913",	--Choose//	
			autosize = 1,	
			;
			{
				type = "Frame",
		
				arrangetype = "horiz",

				autosize=1,

				;
				{
					type = "Frame",		
					arrangetype = "vert",
					autosize=1,

					;


					{
						type = "TextLabel",
						name = "m_lblTechName",
						position = {0, 0},
							--size = {256,130},	
						wrapping = 1,
						marginHeight = 2,
						marginWidth = 2,
						Layout = {			
							min_WH = {	w = 200/800, h = 40/600, wr = "scr", hr = "scr" },	
						},
						autosize=1,
						--name = "m_lblErrorMessage",
						Text =
						{
							text = "NAME - filled by script",
							textStyle = "FEHelpTipTextStyle",
							vAlign = "Top",
						},
						giveParentMouseInput = 1,
						--backgroundColor = {0,255,0,255},
					},

					{
						type = "TextLabel",
						name = "m_lblTechPrice",
						autosize=1,

						wrapping = 1,
						marginHeight = 2,
						marginWidth = 2,
						Layout = {			
							min_WH = {	w = 200/800, h = 40/600, wr = "scr", hr = "scr" },	
						},
						Text =
						{
							text = "PRICE - filled by script",
							textStyle = "FEHelpTipTextStyle",
							vAlign = "Top",
						},
						giveParentMouseInput = 1,
						--backgroundColor = {0,255,255,255},
					},

					{
						type = "TextLabel",
						name = "m_lblTechDescription",
						autosize=1,
						
						--	size = {128,130},	
						wrapping = 1,
						marginHeight = 2,
						marginWidth = 2,
						Layout = {			
							min_WH = {	w = 200/800, h = 40/600, wr = "scr", hr = "scr" },	
						},
						Text =
						{
							text = "Description text - filled by script",
							textStyle = "FEHelpTipTextStyle",
							vAlign = "Top",
						},
						giveParentMouseInput = 1,
						--backgroundColor = {255,255,0,255},
					},

				},
				{
					type = "Frame",
					position = {130, 2},
					size = {116,116},
					BackgroundGraphic = {			
						texture = "DATA:\\Ship\\Icons\\BentusiExchange.tga",
						textureUV = {0,0,256,256},
						color = OUTLINECOLOR,
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
			
			NewMenuButton("m_btnAccept",		"$4914",	"$4914",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	"UI_HideScreen('bentusidialog'); MainUI_ScarEvent( \"KAS_BentusiTradeAcceptPressed()\" )"),
			NewMenuButton("m_btnDecline",		"$4915",	"$4915",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	"UI_HideScreen('bentusidialog'); MainUI_ScarEvent( \"KAS_BentusiTradeDeclinePressed()\" )"),
		},

	},
}

