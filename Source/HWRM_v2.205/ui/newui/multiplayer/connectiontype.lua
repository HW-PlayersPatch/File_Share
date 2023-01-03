dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

LAYOUT_MENU_CONNECTION_BUTTONS = 
{
	min_WH = {	w = MAINMENU_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
}


ConnectionType = {

	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	pixelUVCoords = 1, 
	
	-- the message that will be displayed in a player joins and their name is already in use.
	nameInUseFormatID = 3549,
	
	ErrorMessages = 
	{
		[ LM_AuthCD ] 			= "$3542",--"Authenticating CD key",
		[ LM_UnableToConnect ] 	= "$3543",--"Unable to connect to server",
		[ LM_InvalidNickname ] 	= "$3544",--"You need to set a proper chat name",
		[ LM_Connecting ] 		= "$3545",--"Connecting to Server",
		[ LM_AuthCDFailed ] 		= "$3546",--"CD Key authentication failed",
		[ LM_Disconnected ] 		= "$3547",--"Disconnected from server", 				
		[ LM_InvalidCDKey ] 		= "$3548",--"Your CD Key is invalid",
	}, 
	
	previousScreen = "NewMainMenu",
	;
	
	-- ERSB Warning label
	{
		type = "TextLabel",

		Layout = {
			pivot_XY = { 0, 1 },					
			pos_XY = {	x=0, y=1, xr="par", yr="par",},		
		},		
		autosize = 1,
		Text = {
			font = "ChatFont",
			color = {255,255,255,255},
			text = "$1220", --* Game Experience May Change During Online Play
			hAlign = "Left",
			vAlign = "Middle",
		},
	},
	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		TitleText = "$2614", -- MULTIPLAYER
		SubTitleText = "$3530", -- MANAGE PLAYER PROFILES
		--Extra1Text = "$2622", -- BETA
		Layout = {	
			size_WH = {	w = 1.0, h = 180.0/540, wr = "par", hr = "scr" },							
		},				
		--autosize=1,
		;
	},
	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
		},	
		autosize=1,
		arrangetype = "vert",

		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
		;
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{ 
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,

			TitleText = "$3530",
			-- SubtitleText = "$3531",

			autosize=1,
			;
		
			{
				type = "Frame",
				autosize = 1,

				autoarrange = 1,								
				arrangetype = "vert",
				autoarrangeWidth = MAINMENU_BUTTON_WIDTH,
				arrangeSep = {	x=0, y= 6/540, xr="scr", yr="scr"},
				autoarrangeSpace = 6,

				Layout = {
					pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
					pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = 0, rr = "scr", br = "scr" },	
				},


				;
				-- Buttons:
				NewMenuButton("m_itemLAN",		"$3533",	"$3532",	0,	LAYOUT_MENU_CONNECTION_BUTTONS,	"FEButtonStyle1",	nil),
				NewMenuButton("m_itemSteam",	"$3537",	"$3536",	0,	LAYOUT_MENU_CONNECTION_BUTTONS,	"FEButtonStyle1",	nil),
				--NewMenuButton("m_itemTCP",		"$3535",	"$3534",	0,	LAYOUT_MENU_CONNECTION_BUTTONS,	"FEButtonStyle1",	"UI_ShowScreen('DirectConnection', eTransition)"),
				
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
			-- Back Button
			NewMenuButton("m_btnCancel",	"$3539",	"$3043",	0,	BTN_FOOTER_STD_SMALL_LAYOUT,	"FEButtonStyle1_Outlined_Chipped",	"UI_PreviousScreen(eTransition);"),

		},
	},
} 