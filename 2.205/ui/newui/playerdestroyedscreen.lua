dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")


DIALOGWIDTH = 284
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100

PlayerDestroyedScreen = { 
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
		name = "m_frmDialogRoot", 
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

		{ 
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$3203",  -- Waiting
			-- SubtitleText = "$5168", --SET GAME LIST FILTERS//

			autosize=1,
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



				{ 
					type = "TextLabel", 
					name = "lblDescription1",  
					position = 	{ 4, 2, },    
					size = 	{ (DIALOGWIDTH + -10), 12, }, 
					Text = 
					{ 
						textStyle = "FEHeading4", 
					}, 
				}, 
				{ 
					type = "TextLabel", 
					name = "lblDescription2",     
					position = 	{ 4, 12, },    
					size = 	{ (DIALOGWIDTH + -10), 12, }, 
					Text = 
					{ 
						textStyle = "FEHeading4", }, 
					}, 
				{ 
					type = "TextLabel", 
					name = "lblDescription3",     
					position = 	{ 4, 22, },    
					size = 	{ (DIALOGWIDTH + -10), 12, }, 
					Text = 
					{ 
						textStyle = "FEHeading4", }, 
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
			
			NewMenuButton("btnOk",		"$3614",	"$3614",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	"UI_HideScreen('PlayerDestroyedScreen')"),
		},
	},
}
