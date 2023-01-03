dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")	

-- Simple screen with 2 buttons, one for host direct game, 
-- another for join direct game.  This menu is used for direct
-- tcp/ip games only


WIDTH = 300--304
HEIGHT = 121--164

DirectConnection = {

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
		[ LM_GameName ] 	= "$3035",--DirectConnection
	},	
	
	previousScreen = "NewMainMenu",
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
		-- Contents frame
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$3036",--DIRECT TCP/IP
			-- SubtitleText = "$3037",--CHOOSE//	
			--arrangetype = "vert",
			autosize=1,
			;
		
			{
				type = "Frame",
				autosize = 1,

				autoarrange = 1,								
				autoarrangeSpace = 6,
				autoarrangeWidth = MAINMENU_BUTTON_WIDTH,
				;
				-- Buttons:
			
				-- Host button
				{
					type = "TextButton",
					name = "m_btnHost",
					buttonStyle = "FEButtonStyle1",
				
					Layout = {						
						size_WH = {	w = MAINMENU_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
					},					

					helpTip = "$3038", --HOST A TCP/IP GAME
				
					Text = {
						text = "$3039", -- HOST
					},
				},
			
				-- Join button
				{
					type = "TextButton",
					name = "m_btnJoin",
					buttonStyle = "FEButtonStyle1",
				
					Layout = {						
						size_WH = {	w = MAINMENU_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
					},	

					helpTip = "$3040",--JOIN A HOST'S GAME
				
					Text = {
						text = "$3041", -- JOIN
					},
				
					onMouseClicked = "UI_ShowScreen(\"IPConnect\", ePopup)",
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
			
			NewMenuButton("m_btnBack",		"$2610",	"$3042",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	"UI_ShowScreen(\"ConnectionType\", eTransition)"),
			--NewMenuButton("btnAccept",		"$2612",	"$2612",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	[[UI_DialogAccept();]]),
			
		},
	},
}

	

	