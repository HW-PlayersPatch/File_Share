dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

SAVELOAD_WIDTH = 420/800
SAVELOAD_HEIGHT = 160/600
SAVELOAD_POSITION = {400 - (SAVELOAD_WIDTH / 2), 300 - (SAVELOAD_HEIGHT / 2) }

SaveLoadDialog = {
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,

	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},

	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",
	onHide = "MainUI_PopEnabledCommandState()",


	Load_Skirmish_Title_Text = "$3589",--LOAD
	Load_Skirmish_Subtitle_Text = "$3588", --LOAD SAVED GAME//

	Load_Campaign_Title_Text = "$3591",--LOAD
	Load_Campaign_Subtitle_Text = "$3590", --LOAD SAVED CAMPAIGN//

	Load_Recorded_Title_Text = "$3593",--LOAD
	Load_Recorded_Subtitle_Text = "$3592", --LOAD RECORDED GAME//

	Save_Skirmish_Title_Text = "$3595",--SAVE
	Save_Skirmish_Subtitle_Text = "$3594", --SAVE CURRENT GAME//

	Save_Campaign_Title_Text = "$3597",--SAVE
	Save_Campaign_Subtitle_Text = "$3596", --SAVE CAMPAIGN GAME//

	Save_Recorded_Title_Text = "$3599",--SAVE
	Save_Recorded_Subtitle_Text = "$3598", --SAVE RECORDED GAME//

	;

	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",	
		name = "m_frmRoot",
			
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
			name = "dialogWindow",
			TitleText = "$3588",

			onClose = "UI_HideScreen('PlayMoviesScreen'); UI_ShowScreen('NewMainMenu', ePopup)",  -- Not Used Yet
			
			autosize=1,
			;

			{	
				type = "Frame",
				arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
				arrangetype = "vert",
				autosize=1,
				;
				-- List box frame				
				{
					type = "ListBox",
					name = "m_listGames",
					listBoxStyle = "FEListBoxStyle_Bordered",

					Layout = {		
						size_WH = {w = SAVELOAD_WIDTH, h = SAVELOAD_HEIGHT, wr = "scr", hr = "scr",},
					},
				},			
				
				-- Game name text input (only visible when saving a game)
				{
					type = "TextInput",
					name = "m_txtInput",
					Layout = {	
						size_WH = {w = SAVELOAD_WIDTH, h = TEXTINPUT_HEIGHT, wr = "scr", hr = "scr",},
					},

					textInputStyle = "FETextInputStyle",
					maxTextLength = 64,
					ignored=1,
					onAccept = "UI_GiveFocus('m_frmRoot', 'SaveLoadDialog')",
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
			NewMenuButton("m_btnCancel",		"$2613",	"$2613",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),		
			NewMenuButton("m_btnDelete",		"$3572",	"$3573",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	nil),		

			NewMenuButton("m_btnLoadSkirmish",		"$3574",	"$3575",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		
			NewMenuButton("m_btnLoadCampaign",		"$3576",	"$3577",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		
			NewMenuButton("m_btnLoadRecorded",		"$3578",	"$3579",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		

			NewMenuButton("m_btnSaveSkirmish",		"$3580",	"$3581",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		
			NewMenuButton("m_btnSaveCampaign",		"$3582",	"$3583",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		
			NewMenuButton("m_btnSaveRecorded",		"$3584",	"$3585",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),		

		},	


	},

	------------------------------------------------------------------------------------
	-- Items to Clone
	------------------------------------------------------------------------------------
	-- ListBoxItemToClone
	{
		type = "TextListBoxItem",
		name = "m_listBoxItemToClone",
		resizeToListBox = 1,
		--width = 463,
		width = SAVELOAD_WIDTH - 31,
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
		
		soundOnClicked = "SFX_ButtonClick",
	},

}

