dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

MissionSelect = {
	
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},


	pixelUVCoords = 1,
	
	thumbnailPath = "Data:UI\\MapThumbnails\\Campaign\\%s\\%s.tga", -- %s is the name of the campaign and the name of the mission file
	thumbnailPathdds = "Data:UI\\MapThumbnails\\Campaign\\%s\\%s.dds", -- %s is the name of the campaign and the name of the mission file

	strIncomplete = "$3496",
	strComplete = "$3495",
	completeMsg = "$3471",			-- Help text to display for a completed tutorial
	incompleteMsg = "$3472",		-- Help text to display for an incomplete tutorial

	Extra_Choose_Text = "$3492", -- CHOOSE MISSION//
	--$3613  More Info

	completeColor = COLOR_LISTITEM_TITLEBAR_COMPLETED, --{238,188,5,255},		-- Blue
	incompleteColor = COLOR_LISTITEM_TITLEBAR, --{112,157,180,255},	-- Yella
	UINavDefaultSelectedElementName = "listTutorials",
	UINavReloadSelectedOnFocus = 1,
	;

{
	type = "Frame",
	name = "frmTheRoot",

	Layout = {
		pivot_XY = { 0.5, 0.5 },					
		pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
	},		

	autosize=1,
	arrangetype = "vert",


	;
	
	--DEFINITION FOR: (frmRoot) (The window)
	{
		type = "Frame",		
		--size = {742,338},
		name = "frmRootMissionBox",	
		backgroundColor = "FEColorBackground1",
		autosize=1,
		;

		-- This frame contains the map, the tutorial list frame, the spacer frame, and the bottom help text frame
		{
			type = "Frame",
			autosize = 1,
			;			

			{
				type = "Frame",
				Layout = {							
					size_WH = {	w = .75, h = 240/540, wr = "scr", hr = "scr" },		
				},
				arrangetype = "horiz",
				arrangeSep = {	x=PANEL_PAD_HORIZ, y=PANEL_PAD_VERT, xr="scr", yr="scr",},	
				;
				{
					type = "RmWindow",
					WindowTemplate = PANEL_WINDOWSTYLE,
					name = "lvlSelectInfoPanel",
					Layout = {							
						size_WH = {	w = .35, h = 1, wr = "par", hr = "par" },		
					},
					--backgroundColor = COLOR_BLUE_SOLID,

					arrangetype = "vert",
					;

					--DEFINITION FOR: (frm) Map
					{
						type = "Frame",
						Layout = {		
							size_WH = {	w = 1, h = 600.0, wr = "par", hr = "px" },		
							lockAspect = 2,	
						},
						name = "frmMap",
						--backgroundColor = COLOR_GREEN_SOLID,
						;
						--DEFINITION FOR: (frmgr) 1m_mapb.tga
						{
						name = "frmgr1mmapbtga",
							type = "Frame",
							BackgroundGraphic = {
								type = "Graphic",
								texture = "Data:LevelData\\Multiplayer\\DefaultMapThumbnail.tga",
								uvRect = { 0, 1, 1, 0 },
							},

							Layout = {	size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },},							
							;
						},

					},
	
					--DEFINITION FOR: (frm) MapSub
					{
						type = "Frame",
						name = "frmMapSub",						
						Layout = {
							size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },		
						},
		
						--backgroundColor = COLOR_RED_SOLID,
						arrangeweight = 1,
						
						;


					},


				},
				{
					type = "RmWindow",
					name = "txtLblChooseLevel",
					WindowTemplate = PANEL_WINDOWSTYLE,
					TitleText = Campaign_Choose_Text,
					
					Layout = {							
						size_WH = {	w = 1, h = 1, wr = "px", hr = "par" },		
					},
					arrangeweight=1,
					;
					-- This is the list box that will hold all of the mission items
					{
						type = "ListBox",
						listBoxStyle = "FEListBoxStyle_Bordered",
						Layout = {							
							size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
						},
						
						name = "listTutorials",
					
						scrollBarSpace = 0,
					
						hugBottom = 1,
						;
					},

				},


			},


		},
	},

	------------------------------------------------------------------------------------
	-- BOTTOM NAVIGATION FRAME
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",

		Layout = {
			--pos_XY = {	x = 0.10, y = 0.20, xr = "par",	yr = "par"	},	
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

			
		-- HELP TEXT
		--{
		--	type = "TextLabel",
		--	position = {4,4},
		--	size = {764,13},
		--	name = "txtLblHELPTEXT",
		--	Text = {					
		--		textStyle = "FEHelpTipTextStyle",
		--	},
		--	;
		--},
			
		-- BUTTONS
			
		--DEFINITION FOR: (txtBtn) BACK
		{
			type = "TextButton",
			name = "m_btnBack",

			buttonStyle = "FEButtonStyle1_Outlined",	

			Layout = {
				pivot_XY = { 0.0, 0.5 },					
				pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},	

			helpTip = "$3468",
			helpTipTextLabel = "txtLblHELPTEXT",
				
			Text = {
				text = "$2610", -- BACK
			},
			--onMouseClicked = "UI_ShowScreen(\"NewMainMenu\", eTransition)",
			;
		},

		-- DEFINITION FOR: (txtBtn) Load saved campaign
		{
			type = "TextButton",
			name = "btnLoadSavedMission",	
			buttonStyle = "FEButtonStyle1_Outlined",	
			
			Layout = {
				pivot_XY = { 0.0, 0.5 },					
				pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH*1.2, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},	


			helpTip = "$3494",
			helpTipTextLabel = "txtLblHELPTEXT",						
			Text = {
				text = "$3493",
				--textStyle = "FEButtonTextStyle",
			},						
			;
		},
			

		--DEFINITION FOR: (txtBtn) RESET
		{
			type = "TextButton",
			buttonStyle = "FEButtonStyle1_Outlined",

			Layout = {
				pivot_XY = { 0.0, 0.5 },					
				pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},	

			name = "txtBtnRESET",
			helpTip = "$3469",
			helpTipTextLabel = "txtLblHELPTEXT",
			Text = {
				text = "$3459",
				--textStyle = "FEButtonTextStyle",
			},
			;
		},

		--DEFINITION FOR: (txtBtn) Start mission
		{
			type = "TextButton",
			buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",
			
			Layout = {
				pivot_XY = { 1.0, 0.5 },					
				pos_XY = {	x=1.0, y=0.5, xr="par", yr="par",},	
				size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			},	

			name = "btnStartMission",		
			helpTip = "$3470",
			helpTipTextLabel = "txtLblHELPTEXT",						
			Text = {
				text = "$3461",
				--textStyle = "FEButtonTextStyle",
			},						
			;
		},

	
	},


	-- This is the list box item to clone that will contain all the information regarding the a tutorial		
			{
				type = "ListBoxItem",
				helpTipTextLabel = "txtLblHELPTEXT",
				
				name = "itemTutorialToClone",

				Layout = {							
					size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },
					pad_LT = { l = 0, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },						
				},	
				autosize = 1,

				visible = 0,
				ignored =1,
				backgroundColor = "FEColorBackground1",
				overColor = {12, 29, 36, 255},
				pressedColor = {23, 59, 72, 255},
				pressoverColor = {30, 74, 90, 255},
				clickedColor = {30, 74, 90, 255},
				pressclickColor = {30, 74, 90, 255},
				
				hugBottom=1,
				allowDoubleClicks = 1,
				UINavClickOnSelect = 1,

				soundOnClicked = "SFX_MissionSelectClick",
				BackgroundGraphic = BORDER_GRAPHIC_BOTTOM,
				;
				
				{
					type = "Button",
					--position = {5,5},

					Layout = {		
						pos_XY = {	x=0.0, y=0.0, xr="par", yr="par",},	
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },						
					},	
					autosize=1,
					arrangetype = "vert",
					
					;
					--DEFINITION FOR: (txtLbl) TutName
					{
						type = "TextLabel",		
						name = "txtLblTutName",
						backgroundColor = COLOR_LISTITEM_TITLEBAR_COMPLETED,
						wrapping = 1,		
						autosize=1,
						Layout = {							
							size_WH = {	w = 1, h = 1 , wr = "par", hr = "px" },		
							pad_LT = { l = 0.004, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },		
							pad_RB = { r = 0.008, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },						
						},	
						
						Text = {
							textStyle = "RM_GenericLabelLarge_TextStyle",		
							offset = {0, 0},
						},
						;
					},
		
					--DEFINITION FOR: (txtLbl) TutDesc
					{
						type = "TextLabel",
						Layout = {
							size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },		
							pad_LT = { l = 0.006, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },		
							pad_RB = { r = 0.012, b = PANEL_PAD_VERT*2, rr = "scr", br = "scr" },					
						},	
						autosize = 1,
						wrapping = 1,	
						minSize = {0, 39},
						name = "txtLblTutDesc",
						marginWidth = 4,
						marginHeight = 2,						
						
						Text = {					
							textStyle = "RM_DescriptionLabel_TextStyle",
							--color = {255,255,255,255},
							hAlign = "Left",
							vAlign = "Top",
						},
						;
					},
				},
			},

	--DEFINITION FOR: (txtLbl) TITLE (CAMPAIGN)
	--{
	--	type = "TextLabel",
	--	name = "txtLblTITLE",
	--},
	
	--DEFINITION FOR: (txtLbl) TITLE (TUTORIAL)
	--{
	--	type = "TextLabel",
	--	name = "txtLblTITLETUT",
	--},	

	--DEFINITION FOR: (txtLbl) SUBTITLE (CAMPAIGN)
	--{
	--	type = "TextLabel",
	--	name = "txtLblSUBTITLE",

	--},
	--DEFINITION FOR: (txtLbl) SUBTITLE (TUTORIAL)
	--{
	--	type = "TextLabel",
	--	name = "txtLblSUBTITLETUT",  -- SPECIAL SUBTITLE FOR THE TUTORIAL
	--},
	
	--DEFINITION FOR: (txtLbl) Tutorial
	--{
	--	type = "TextLabel",
	--	name = "txtLblCampaignName",
	--	;
	--},

	--DEFINITION FOR: (txtLbl) ChooseTut
	--{
	--	type = "TextLabel",
	--	name = "txtLblChooseTut",
	--	;
	--},
	--DEFINITION FOR: (txtLbl) ChooseMission
	--{
	--	type = "TextLabel",
	--	name = "txtLblChooseMission",
	--	;
	--},



}
}
