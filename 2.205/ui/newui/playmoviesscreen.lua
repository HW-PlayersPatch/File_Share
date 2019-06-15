dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

PlayMoviesScreen = {

	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	pixelUVCoords = 1,

	;
	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		TitleText = "$3603", -- PLAYER PROFILES
		SubTitleText = "$3601", -- MANAGE PLAYER PROFILES
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

		;
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,

			TitleText = "$3600",
			autosize=1,
			onClose = "UI_HideScreen('PlayMoviesScreen'); UI_ShowScreen('NewMainMenu', ePopup)",  -- Not Used Yet
			;			

			-- List box frame
			{
				type = "ListBox",
				name = "m_listGames",
				listBoxStyle = "FEListBoxStyle_Bordered",
				Layout = {						
					pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					size_WH = {w = .5, h = .5, wr = "scr", hr = "scr",},
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
				-- BUTTONS
				NewMenuButton("m_btnCancel",		"$2610",	"$3602",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	"UI_HideScreen('PlayMoviesScreen'); UI_ShowScreen('NewMainMenu', ePopup)"),	
				NewMenuButton("m_btnPlayMovie",		"$3586",	"$3587",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
					
		},				
						
		------------------------------------------------------------------------------------
		-- Items to Clone
		------------------------------------------------------------------------------------

		-- ListBoxItemToClone
		{
			type = "TextListBoxItem",
			name = "m_listBoxItemToClone",
			resizeToListBox = 1,
			visible = 0,		
			Text = {
				textStyle = "FEButtonTextStyle",
				color = {255,255,255,255},
				hAlign = "Left",
				offset = {2,0},
			},
			
			overColor = {100,100,100,100},
			pressedColor = {100,100,100,150},

			helpTipTextLabel = "m_lblHelpText",
			allowDoubleClicks = 1,
		},




	},
}

