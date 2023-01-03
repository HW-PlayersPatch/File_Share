dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

CreateGameScreen = 
{
	stylesheet = "HW2StyleSheet",
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	

	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},

	-- Custom data
	titleCreateGame = "$3026",--CREATE GAME
	titleJoinGame = "$3032",--JOIN GAME

	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;

	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		Layout = {			
			size_WH = {	w = .5, h = 1.0, wr = "par", hr = "px" },	
			pos_XY = { x = .5, y = .5, xr = "scr", yr = "scr" },					
			pivot_XY = { 0.5, 0.5 },	
		},
		
		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
		;
		
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",	
			name = "m_frmDialogWindow",	
			WindowTemplate = PANEL_WINDOWSTYLE,
			arrangetype = "vert",
			
			TitleText = "$3026",  -- CREATE GAME
			-- SubtitleText = "$3027",  -- SETUP//

			Layout = {		
				size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
			},	


			autosize=1,
			;					
	
			----------------- Options ------------------------
			{
				type = "Frame",
			
				Layout = {
					margin_LT = { l = PANEL_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
					margin_RB = { r = PANEL_PAD_HORIZ, b =1, rr = "scr", br = "px" },				
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
				},	
				autosize = 1,
				arrangetype = "vert",
				;
				Option_LabeledTextInput("NameTextInput",		"$3028",  "txtGameName",			"$3025", 16, 0 ),
				--DEFINITION FOR: (ddLst) Choose_GameType  (also known as labelGameInfo)
					-- BB - Removed from the dropdownlistbox disabledHelpTip = "$3033", 
				Option_LabeledDropDown("labelGameInfo",			"$3031",  "ddLstChooseGameType",	"$3024", nil ),
				
				-- small spacer (add constructor?)
				{
					type = "Frame",
					size = {10, 5},
				},
				
				NewCheckBoxButton("checkUsePass",			"$4972", "$4973", nil,  nil, 1 ),


				Option_LabeledTextInput("labelPassword",		"$3029",  "txtPassword",			"$3023", 16, 1 ),
				Option_LabeledTextInput("labelConfirmPassword",	"$3030",  "txtConfirmPassword",		"$3022", 16, 1 ),
			
				-- Game type info button 0
				-- BB- hidden for now since the cpp code looks for this named element
				{
					type = "Button",
					name = "btnGameInfo",
					visible=0,
					ignored=1,
					Layout = {			
						pos_XY = { y = .5, yr = "par" },		
						--size_WH = {	w = 1000, h = TEXTINPUT_HEIGHT, wr = "px", hr = "scr"},	
						size_WH = {	w = 1, h = 1, wr = "px", hr = "scr"},	
						pivot_XY = { 0, 0.5 },	
						lockAspect = 1,	
					},	

					buttonStyle = "FEInfoButtonStyle",
					helpTip = "$3021", -- SHOW GAME TYPE INFORMATION
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
			NewMenuButton("btnCancel",	"$2613",	"$2613",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),	
			NewMenuButton("btnAccept",	"$2612",	"$2612",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
			
		},		
	},

	------------------------------------------------------------------------------------
	-- Items to Clone
	------------------------------------------------------------------------------------
	{
		type = "TextListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
		visible = 0,
		enabled = 0,
		resizeToListBox = 1,
		Text = {
			textStyle = "FEListBoxItemTextStyle",
		},
		--position = {4,4},
		width = 120,
		name = "ddLstChooseGameTypeTemplate",
		;
	},	


}