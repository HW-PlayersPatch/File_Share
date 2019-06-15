dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Taskbar/TaskbarDefines.lua")
dofilepath("data:ui/newui/Taskbar/TB_FormationPanel.lua")
dofilepath("data:ui/newui/Taskbar/TB_SubsystemPanel.lua")
dofilepath("data:ui/newui/Taskbar/TB_CommandPanel.lua")
dofilepath("data:ui/newui/Taskbar/TB_MultiSelectPanel.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

BUILDCOLOR = {244,213,0,255}
RESEARCHCOLOR = {124,200,196,255}
LAUNCHCOLOR = {83,202,0,255}
HYPERSPACECOLOR = {144,230,226,255}
button_w = 116
button_h = 21



NewTaskbar = {	
	Layout = {
		pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },
		size_WH = { w = 1.0, h = 1.0, wr = "scr", hr = "scr" },
		pad_LT = { l = 8, t = 8, lr = "px", tr = "px" },
		pad_RB = { r = 8, b = 8, rr = "px", br = "px" },
	},		
	stylesheet = "HW2StyleSheet",
	eventOpaque = 0,
	pixelUVCoords = 1, 
	--onShow = "UI_HideScreen( 'NewTaskbarRecover')",
	callUpdateWhenInactive = 1,
	minimizedPos = { 0, 565},
	fstringShipCount = "$2764",
	healthBarGoodColor = { 0, 255, 0, 255},
	healthBarPoorColor = { 255, 255, 0, 255},
	healthBarFatalColor = { 255, 0, 0, 255},
	healthBarBackgroundColor = { 128, 128, 128, 255},
	healthBarEnemyColor = { 255, 0, 0, 255},
	healthBarEnemyBackgroundColor = { 128, 0, 0, 255},
	healthBarAlliedBackgroundColor = {255,255,0,255},
	healthBarAlliedBackgroundColor = { 128, 0, 0, 255},	
	soundOnShow = "SFX_TaksbarMenuONOFF",
	soundOnHide = "SFX_TaksbarMenuONOFF",


	RootElementSettings = {
		--backgroundColor          = {255,0,0,255},

	},
	;	
	
	
	-----------------------------Upper-Left Base Frame---------------------------
	{
		type = "Frame",		
			
		Layout = {
			Flags = { limitScreen_Y = 1 },	
			pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
			pivot_XY = { 0.0, 0.0 },

		},		
		name = "frame_UpperLeft",
		autosize  = 1,
		autoarrange = 1,
		arrangetype = "horiz",
		arrangedir = 1,	
		eventOpaque = 0,


		style = "FETopFrameBackgroundStyle",
		--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
	

		;	

		----------------------------- Main Menu Button ---------------------------
		{
			type = "Frame",		
			
			Layout = {
				Flags = { limitScreen_Y = 1 },	
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
				pivot_XY = { 0.0, 0.0 },			
			},		
			name = "frame_UpperLeft",
			autosize  = 1,
			autoarrange = 1,
			autoarrangeSpace = 0,
			arrangetype = "horiz",
			arrangedir = 1,		
			style = "FETopFrameBackgroundStyle",
			cursorType = "Normal",
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,

			Anchor_Binds = {
				scale = "Taskbar_TopMenus_Scale",	-- RB = Right/Bottom
			},	

			Anchor_Spawns = {
				{
					anchorName = "Taskbar_MainButtonBottom",
					relativePos = { 0.0, 1.0 },
				},		
			},

			;	
			{
				type = "Frame",	
				autosize=1,
				Layout = {	
					--pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },	
					--size_WH = { w = 1, h = 64, wr = "px", hr = "px" },
					pad_LT  = { l = 0, t = 2, lr = "px", tr = "px" },
					pad_RB  = { r = 4, b = 0, rr = "px", br = "px" },
				},	

				;
				{
					type = "ButtonHD",
					ignored = 1,				
					--toggleButton = 1,
					buttonStyle = "RM_TaskbarHD_MenuButtonStyle",
					name = "btnMenu",
			
					onMouseClicked = "MainUI_UserEvent( eMenu )",
					helpTip = "$2774",
					helpTipTextLabel = "commandsHelpTip",
					hotKeyID = 4,

					Layout = {
						--pos_XY = { x =-160, y = -16, xr = "px", yr = "px" },
						size_WH = { w = 60.0, h = 60.0, wr = "px", hr = "px" },
						pivot_XY = {0.0, 0.0},
					},
					IconBase = {
						uvRect = { 0, 1, 1, 0 },	
					},

				
					BackgroundGraphic = {			
						texture = "data:ui\\NewUI\\Styles\\HWRM_Style\\inside_glow.tga",
						uvRect = { 4/64, 4/192, 60/64, 60/192 },
						patch_X = { 8/4, -40/4, 8/4,0 },
						patch_Y = { 8/4, -40/4, 8/4,0 },
						patch_Scale = 1,

						Surface = {
							surface = "ui_multistate";
							{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
							{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
							{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
							{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
							},

					},
					stateBaseOfs = { 0.0, 64/192 },
					--stateBaseCells = { 0, 1, 2, 3,       2, 3, 2, 7 },
					stateBaseCells = { 0, 0, 1, 2,   2, 2, 2, 2 },
				},
			},
		},



		----------------------------- Objectives and Recall Parent Frame ---------------------------	
		{
			type = "Frame",			
			
			Layout = {	
				--pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },	
				size_WH = { w = 1, h = 64, wr = "px", hr = "px" },
				pad_LT  = { l = 0, t = 2, lr = "px", tr = "px" },
				pad_RB  = { r = 8, b = 2, rr = "px", br = "px" },
			},		
			name = "frame_UpperLeft",
			autosize  = 1,
			autoarrange = 1,
			arrangetype = "horiz",
			arrangedir = 1,		
			autoarrangeSpace = 0,
			cursorType = "Normal",

			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
			
			Anchor_Binds = {
				scale = "Taskbar_TopMenus_Scale",	-- RB = Right/Bottom
			},	

			;		
			------------- Objectives button -------------
			{
				type = "TextButton",
				name = "btnObjectives",

				toggleButton = 1,
				autosize  = 1,

				Layout = {					
					margin_LT = { l = 2, t = 0, lr = "px", tr = "px" },
					margin_RB = { r = 0, b = 0, rr = "px", br = "px" },
					pivot_XY = { 0.0, 0.0 },
				},
					
				buttonStyle = "RM_FEButtonStyleFlat",

				disabledTextColor			= {255, 255, 255, 32},
				Text = {
					textStyle = "RM_MenuButton_TextStyle",
					text = "$2704", -- OBJECTIVES
					hAlign = "Center",
					vAlign = "Center",
					dropShadow = 1,
				},
				
				onMouseClicked = "UI_ToggleScreen( 'ObjectivesList', 0)",
				helpTip = "$2744",
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 137,
			},	
			------------- Speech Recall button -------------
			{
				type = "TextButton",
				toggleButton = 1,

				autosize  = 1,
				buttonStyle = "RM_FEButtonStyleFlat",			
				
				disabledTextColor			= {255, 255, 255, 32},	
				Text = {
					textStyle = "RM_MenuButton_TextStyle",
					text = "$2762",
					hAlign = "Center",
					vAlign = "Center",
					dropShadow = 1,
				},
				name = "btnRecall",
				onMouseClicked = "UI_ToggleScreen( 'SpeechRecall', 0)",
				helpTip = "$2763", 
				helpTipTextLabel = "commandsHelpTip", 
				hotKeyID = 142, 
			},		
		},

	},
	----------------------------- Left Side Handy Buttons --------------------------
	{
		type = "Frame",		
		Layout = {	
			pivot_XY = { 0.0, 0.0 },
			size_WH = { w = 60, h = 200, wr = "px", hr = "px" },
		},	
		--name = "frame_LeftTabs",
		arrangetype = "vert",

		autoarrange = 1,
		arrangedir = 1,	
		cursorType = "Normal",
		eventOpaque = 0,
		clipchildren = 0,

		Anchor_Binds = {
			pivotY = "Taskbar_MainButtonBottom",
			scale = "Taskbar_UtilityIcons_Scale",	-- RB = Right/Bottom		
		},
	
		;	
		{
			type = "TimerControl",
			name = "GameTimer",
			timerStartOnLoad = 1,
			customFormat = "%H:%M:%S",					
						
			onMouseClicked = "UI_TimerToggleNegativeDisplay('NewTaskbar', 'GameTimer')",	
			--marginWidth = 16,
			autosize=1,
			stateIconOfs = { 0.0, 0.0 },
			stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
			Layout = {		
				size_WH = { w = 1, h = 1, wr = "par", hr = "px" },		
				pad_LT  = { l = 0.0, t = BUTTON_TEXT_PAD_VERT, lr = "px", tr = "scr" },
				pad_RB  = { r = 0.0, b = BUTTON_TEXT_PAD_VERT, rr = "px", br = "scr" },	
				pos_XY = { x = .5, y = 0, xr = "par", yr = "px" },
				pivot_XY = { 0.5, 0.0 },
			},
			
			ignored=1,

			--BackgroundGraphic = MENU_BUTTON_GRAPHIC,
			--IconBase = MENU_BUTTON_GRAPHIC_SMALL,
		
			textColor					= COLOR_BUTTON_TEXT_DEFAULT,
			overTextColor				= COLOR_BUTTON_TEXT_HOVER,
			pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
			disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

			-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
			soundOnEnter 		= "SFX_ButtonEnter",
			soundOnClicked 		= "SFX_ButtonClick",
					
			backgroundColor = { 255, 0, 0, 255 },
			Text = 
			{
				text = "00:00:00",
				font = "Blender",
				color = "RM_FETextBlueBright",
				vAlign = "Middle",
				hAlign = "Center",
				offset = {0, 0},
			
				pixels = (24),
				rel = 1080,
				hAlign = "Center",
				vAlign = "Center",	
				--pixels  = 18,
				--rel=0,
				minShrink = .25,
				dropShadow = 1,
			},

		},
		{
			type = "Frame",		
			Layout = {	
				--pos_XY = { x = 0.0, y = 0.1, xr = "par", yr = "par" },	
				pivot_XY = { 0.0, 0.0 },
					--size_WH = { w = 200, h = 200, wr = "px", hr = "px" },
					--pad_LT  = { l = SCREEN_SAFE_X, t = 1, lr = "scr", tr = "px" },
					--pad_RB  = { r = 1, b = 1, rr = "px", br = "px" },
			},	
			name = "frame_LeftTabs",
			arrangetype = "vert",
			autosize  = 1,
			autoarrange = 1,
			arrangedir = 1,	
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_THIN,

			Anchor_Spawns = {
				{
					anchorName = "Taskbar_LeftButtonsBottom",
					relativePos = { 0.0, 1.0 },
				},		
				{
					anchorName = "Taskbar_LeftButtonsTopRight",
					relativePos = { 1.0, 0.0 },
				},
			},


			;	
			-----------Queue button-----------
			{
				type = "ButtonHD",
				name = "btnQueue",	
				toggleButton = 1,
				ignored = 1,
				buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",

				onMouseClicked = "UI_ToggleScreen( 'BuildQueueMenu', 0)",	
				helpTip = "$5454", --to localize
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 139,
				soundOnClicked = "SFX_ButtonClick",

				Layout = {					
					size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
				},		

				stateBaseOfs = { 0.0, 128/1024 },
				stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },

				BackgroundGraphic = {
					--size = {4, 4},
					texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\hud_global_queue.dds",
					uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
					patch_X = { 4,-120, 4,0 },
					patch_Y = { 4,-120,4, 0 },
					patch_Scale = 1,
		
					Surface = THREESTATEBUTTONSURFACE,
				},
			},


			-----------Fleet button-----------
			{
				type = "ButtonHD",
				name = "btnFleet",
				toggleButton = 1,
				ignored = 1,
				buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",
				--name = "btnWaypoint",
				onMouseClicked = "UI_ToggleScreen( 'UnitCapInfoPopup', 0)",	
				helpTip = "$5453",
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 149,
				soundOnClicked = "SFX_ButtonClick",
				
				Layout = {					
					size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
				},		

			
				stateBaseOfs = { 0.0, 128/1024 },
				stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
				BackgroundGraphic = {
					--size = {4, 4},
					texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\hud_fleet_info.dds",
					uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
					patch_X = { 4,-120, 4,0 },
					patch_Y = { 4,-120,4, 0 },
					patch_Scale = 1,
		
					Surface = THREESTATEBUTTONSURFACE,

				},
			},
			
			-- Events button
			{
				type = "ButtonHD",
				name = "btnEvents",
				toggleButton = 1,
				ignored = 1,
				buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",
				--name = "btnWaypoint",
				onMouseClicked = "UI_ToggleScreen( 'EventsScreen', 0)",	
				helpTip = "$2743", --EVENTS
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 140,
				soundOnClicked = "SFX_ButtonClick",
				
				Layout = {					
					size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
				},		

			
				stateBaseOfs = { 0.0, 128/1024 },
				stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
				BackgroundGraphic = {
					--size = {4, 4},
					texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\hud_events.dds",
					uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
					patch_X = { 4,-120, 4,0 },
					patch_Y = { 4,-120,4, 0 },
					patch_Scale = 1,
		
					Surface = THREESTATEBUTTONSURFACE,

				},
			},
			-- Diplomacy Button
			{
				type = "ButtonHD",
				toggleButton = 1,
				--autosize=1,
				Layout = {			
					--pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
				},
				name = "btnDiplomacy",
				visible = 0,
				ignored = 1,

				buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",
			
			
			
			
				stateBaseOfs = { 0.0, 128/1024 },
				stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
				BackgroundGraphic = {
						--size = {4, 4},
					texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\menu_ico_diplomacy.dds",					
					uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
					patch_X = { 4,-120, 4,0 },
					patch_Y = { 4,-120,4, 0 },
					--patch_PadX = {3, -3},
					--patch_PadY = {2, -2},
					patch_Scale = 1,			
					Surface = THREESTATEBUTTONSURFACE,

				},

	
				onMouseClicked = "UI_ToggleScreen( 'DiplomacyScreen', 0)",
				helpTip = "$2746",
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 141,
			},	
			--Chat Button
			{
				type = "ButtonHD",
				toggleButton = 1,
				Layout = {				
					--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
				},
				name = "btnChat",
				visible = 0,
				ignored  = 1,

				buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",


			
				stateBaseOfs = { 0.0, 128/1024 },
				stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
				BackgroundGraphic = {
						--size = {4, 4},
					texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\menu_ico_chat.dds",					
					uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
					patch_X = { 4,-120, 4,0 },
					patch_Y = { 4,-120,4, 0 },
					--patch_PadX = {3, -3},
					--patch_PadY = {2, -2},
					patch_Scale = 1,			
					Surface = THREESTATEBUTTONSURFACE,

				},
							
				onMouseClicked = "UI_ToggleScreen( 'ChatScreen', 0)",
				helpTip = "$2747",
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 131,
			},		
			-------------------------DEVELOPER HELPER BUTTONS-----------------------
			{
				type = "Frame",		
				name = "frmBalance",
				arrangetype = "vert",
				autosize  = 1,
				autoarrange = 1,
				arrangedir = 1,	
				visible = 0,
				ignored=1,
				BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
				;

				{
					type = "ButtonHD",
					toggleButton = 1,
					Layout = {				
						--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
						size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
					},
					name = "btnBalanceScreen",
					visible = 1,
					ignored  = 1,

					buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",


			
					stateBaseOfs = { 0.0, 128/1024 },
					stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
					BackgroundGraphic = {
							--size = {4, 4},
						texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\menu_ico_chat.dds",					
						uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
						patch_X = { 4,-120, 4,0 },
						patch_Y = { 4,-120,4, 0 },
						--patch_PadX = {3, -3},
						--patch_PadY = {2, -2},
						patch_Scale = 1,			
						Surface = THREESTATEBUTTONSURFACE,

					},
							
					onMouseClicked = "UI_ToggleScreen( 'GameBalanceScreen', 0)",
					
					helpTip = "Balance Screen",
					--helpTipTextLabel = "commandsHelpTip",
					--hotKeyID = 131,
				},	
			},
		},
	},

	---------------------------------------Upper-Right-----------------------------------------
	{
		type = "Frame",		
		Layout = {	
			pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },	
			pivot_XY = { 1.0, 0.0 },
			size_WH = { w = 100, h = 64, wr = "px", hr = "px" },
			pad_LT  = { l = 4, t = 2, lr = "px", tr = "px" },
			pad_RB  = { r = 4, b = 2, rr = "px", br = "px" },
			--margin_LT = { l = 8.0, t = 0.0, lr = "px", tr = "px" },
			--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },	
		},	
		name = "frame_UpperRight",
		arrangetype = "horiz",
		autosize  = 1,
		autoarrange = 1,
		arrangedir = 1,	
		cursorType = "Normal",
		--backgroundColor          = {255,0,0,255},
		--style = "FETopFrameBackgroundStyle",
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,

		Anchor_Binds = {
			scale = "Taskbar_TopMenus_Scale",	-- RB = Right/Bottom
		},	

			Anchor_Spawns = {
				{
					anchorName = "Taskbar_UpperRight",
					relativePos = { 1.0, 1.0 },
				},		
			},

		;	
		
			
		------ Build button ------
		{
			type = "TextButton",
			name = "btnBuild",

			toggleButton = 1,
			autosize  = 1,
			Layout = {			
				min_WH = {	w = NAVIGATION_SMALL_BUTTON_WIDTH/2, h = STD_BUTTON_HEIGHT/2, wr = "scr", hr = "scr" },	
			},

			buttonStyle = "RM_FEButtonStyleFlat",
				
			disabledTextColor			= {255, 255, 255, 32},	
			Text = {
				textStyle = "RM_MenuButton_TextStyle",
				text = "$2700", -- BUILD
				hAlign = "Center",
				vAlign = "Center",
				dropShadow = 1,
			},
			
			onMouseClicked = "MainUI_UserEventData( eBuildManager, 1)", -- 1 means toggle
			helpTip = "$2748",
			helpTipTextLabel = "commandsHelpTip",
			hotKeyID = 50,
		},		



		------ Research button ------
		{
			type = "TextButton",
			name = "btnResearch",

			toggleButton = 1,
			autosize  = 1,
			Layout = {	
				min_WH = {	w = NAVIGATION_SMALL_BUTTON_WIDTH/2, h = STD_BUTTON_HEIGHT/2, wr = "scr", hr = "scr" },	
			},
			buttonStyle = "RM_FEButtonStyleFlat",
				
			disabledTextColor			= {255, 255, 255, 32},	
			Text = {
				textStyle = "RM_MenuButton_TextStyle",
				text = "$2701", -- RESEARCH
				hAlign = "Center",
				vAlign = "Center",
				dropShadow = 1,
			},
					
			onMouseClicked = "MainUI_UserEvent( eResearchManager)",
			helpTip = "$2749",
			helpTipTextLabel = "commandsHelpTip",
			hotKeyID = 49,
		},		



		------ Launch button ------
		{
			type = "TextButton",
			name = "btnLaunch",

			toggleButton = 1,
			autosize  = 1,

			Layout = {
				min_WH = {	w = NAVIGATION_SMALL_BUTTON_WIDTH/2, h = STD_BUTTON_HEIGHT/2, wr = "scr", hr = "scr" },	
			},
			buttonStyle = "RM_FEButtonStyleFlat",
				
			disabledTextColor			= {255, 255, 255, 32},	
			Text = {
				textStyle = "RM_MenuButton_TextStyle",
				text = "$2706", -- LAUNCH
				hAlign = "Center",
				vAlign = "Center",
				dropShadow = 1,
			},
			
			onMouseClicked = "MainUI_UserEventData( eLaunchManager, 1)",
			helpTip = "$2760",
			helpTipTextLabel = "commandsHelpTip",
			hotKeyID = 52,
		},
	},

	--Hyperspace (singleplayer)
	{
		type = "Frame",		
		Layout = {		
			pos_XY = { x = 0.5, y = .2, xr = "par", yr = "par" },			
			pivot_XY = { 0.5, 0.0 },
			--size_WH = { w = button_w, h = button_h, wr = "px", hr = "px" },
		},
					
		visible = 0,			
		ignored = 1,	
		arrangetype = "vert",
		arrangedir = 1,		
		eventOpaque = 0,
		autosize  = 1,		
		name = "btnHW1SPHyperspace",
		cursorType = "Normal",
		;	
		{
		
			type = "ButtonHD",
			ignored = 1,
			buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
			name = "btnLvlHyperspace",
			onMouseClicked = "MainUI_ScarEvent( \"singlePlayerHyperspaceButtonPressed()\" )",
			helpTip = "$4908",
			helpTipTextLabel = "commandsHelpTip",
			enabled=1,
			--hotKeyID = 11,

			Layout = {		
				pos_XY = { x = 0.5, xr = "par", },			
				pivot_XY = { 0.5, 0.0 },			
				size_WH = { w = 64, h = 64, wr = "px", hr = "px" },
			},		

			stateIconOfs = { 0.0, 128/512 },
			stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },

			IconBase = {
				texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_hyperspace.dds",
				uvRect = { 0/128, 0/512, 128/128, 128/512 },
				patch_X = { 4,-120, 4,0 },
				patch_Y = { 4,-120,4, 0 },
				patch_Scale = 1,
		
				Surface = {
					surface = "ui_multistate";
					{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
					{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
					},
			},


		},
	
		{

			type = "TextButton",
			buttonStyle = "FEButtonStyle1_Alert_Chipped",
			Layout = {
				pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
				pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },	
			},

			Text = {
				text = "$4907", --HYPERSPACE, 
			},			
			onMouseClicked = "MainUI_ScarEvent( \"singlePlayerHyperspaceButtonPressed()\" )",
			helpTip = "$4908",    -- INITIATE HYPERSPACE DOCKING PROCEDURE
			helpTipTextLabel = "commandsHelpTip",
			--hotKeyID = 50,
			autosize  = 1,	

		},
	},
	
	--Lower-Centre
	{
		type = "Frame",		
		Layout = {
			Flags = { limitScreen_Y = 1 },
			pos_XY = { x = 0.5, y = 1.0, xr = "par", yr = "par" },
			pivot_XY = { 0.5, 1.0 },
			--size_WH = { w = 550, h = 160, wr = "px", hr = "px" },
			pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
			pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
		
			},		
		Anchor_Binds = {
			scale = "Taskbar_BottomMiddle_Scale",	-- RB = Right/Bottom
		},	
		autosize = 1,
		arrangetype = "vert",
		arrangedir = 1,		
		eventOpaque = 0,
		--backgroundColor = { 0, 255, 0, 255},
		cursorType = "Normal",		
		;		
		{

			-------- Top Bar -------
			type = "Frame",	
			name = "frame_controlgroups",		

			Layout = {	
				pos_XY = { x = 0.5, y = 0, xr = "par", yr = "px" },
				pivot_XY = {0.5, 0.0},
				size_WH = { w = 20, h = 32, wr = "px", hr = "px" },
				pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
				pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
			
				},	
			arrangeSep = {	x=8, y=0, xr="px", yr="px",},
			arrangetype = "horiz",	
			autosize  = 1,
			eventOpaque = 0,
			ignored = 1,	
			;	
			
			--select all
			{
				type = "Button",	
						
				Layout = {
					pos_XY = { x = 0.0, y = .6, xr = "px", yr = "par" },
					--pivot_XY = {0.0, 0.5},
					size_WH = { w = 24, h = 16, wr = "px", hr = "px" },
				},
				ignored = 1,

				IconBase = {
					type = "Graphic",
					texture = "DATA:UI\\NewUI\\Taskbar\\selectall.tga",
					uvRect = { 0, 0, 1, 1 },
				
				},

				onMouseClicked = "SelectAllOwnedShips()", 	
				helpTip = "$4922",
				helpTipTextLabel = "commandsHelpTip",
				soundOnClicked = "SFX_ButtonClick", 
				soundOnEnter = "SFX_ButtonEnter",
				backgroundColor = { 255, 0, 0, 255},
			},

			------- Sensors button ---------
			{
				type = "ButtonHD",
				Layout = {
					--pos_XY = { x =.5, y = .5, xr = "par", yr = "par" },
					size_WH = { w = 124.0, h = 60.0, wr = "px", hr = "px" },
					max_WH = { w = 124.0, h = 60.0, wr = "px", hr = "px" },
					--pivot_XY = {0.5, 0.5},
				},
				--buttonStyle = "RM_TaskbarHD_MenuButtonStyle",
				--backgroundColor = { 255, 255, 0, 255},
				name = "btnSensors",
				onMouseClicked = "MainUI_UserEvent( eSensorsManager)",
				helpTip = "$2745",
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 54,
				stateBaseOfs = { 0.0, 136/1024 },
				stateBaseCells = { 0, 1, 2, 3, 3, 3, 2, 1 },
				soundOnClicked 		= "SFX_ButtonClick",


				BackgroundGraphic = {
					--size = {4, 4},
					texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\menu_ico_sensors4k.dds",					
					uvRect = { 0/128, 0/1024, 128/128, 136/1024 },
					patch_X = { 4,-248, 4,0 },
					patch_Y = { -136,0 },
					--patch_PadX = {3, -3},
					--patch_PadY = {2, -2},
					patch_Scale = 1,
			
					Surface = THREESTATEBUTTONSURFACE,

				},
	
		
			},

			--focus home
			{
				type = "Button",
						
				Layout = {
					pos_XY = { x = 0, y = 0.6, xr = "px", yr = "par" },
					--pivot_XY = {1, 0.5},
					size_WH = { w = 24, h = 16, wr = "px", hr = "px" },
				},
				ignored = 1,
				buttonStyle = "RM_FEButtonStyleFlat",

				IconBase = {
					type = "Graphic",
					texture = "DATA:UI\\NewUI\\Taskbar\\focuscapship.tga",
					uvRect = { 0, 0, 1, 1 },				
				},

				onMouseClicked = "MainUI_UserEvent(eFocusHome)", 		
				helpTip = "$4916", --to localize
				helpTipTextLabel = "commandsHelpTip",	
				soundOnClicked = "SFX_ButtonClick", 
				soundOnEnter 		= "SFX_ButtonEnter",

			},			
					
		},

		
		--------Frame for control groups...-----------
		{
			type = "Frame",		
			name = "frame_controlgroups",
				
			Layout = {	
				pos_XY = { x = .5, y = 0, xr = "par", yr = "px" },
				pivot_XY = {0.5, 0.0},
				--size_WH = { w = (button_h-2)*10+button_w+5, h = 32, wr = "px", hr = "px" },
				pad_LT  = { l = 12, t = 4, lr = "px", tr = "px" },
				pad_RB  = { r = 12, b = 0, rr = "px", br = "px" },
			
			},	
			
			arrangetype = "horiz",
			arrangedir = 1,		
			autosize  = 1,				
			ignored = 1,	
		
			style = "FETopFrameBackgroundStyle",		
			
			;
		
			
------------------- Tactical Groups 1-10 ---------------
			GetTacticGroupButton("btnControlGroup1","1","MainUI_UserEventData( eSelectGroup, 1)"),
			GetTacticGroupButton("btnControlGroup2","2","MainUI_UserEventData( eSelectGroup, 2)"),
			GetTacticGroupButton("btnControlGroup3","3","MainUI_UserEventData( eSelectGroup, 3)"),
			GetTacticGroupButton("btnControlGroup4","4","MainUI_UserEventData( eSelectGroup, 4)"),
			GetTacticGroupButton("btnControlGroup5","5","MainUI_UserEventData( eSelectGroup, 5)"),
			
			

			
			GetTacticGroupButton("btnControlGroup6","6","MainUI_UserEventData( eSelectGroup, 6)"),
			GetTacticGroupButton("btnControlGroup7","7","MainUI_UserEventData( eSelectGroup, 7)"),
			GetTacticGroupButton("btnControlGroup8","8","MainUI_UserEventData( eSelectGroup, 8)"),
			GetTacticGroupButton("btnControlGroup9","9","MainUI_UserEventData( eSelectGroup, 9)"),
			GetTacticGroupButton("btnControlGroup10","10","MainUI_UserEventData( eSelectGroup, 10)"),
			
			--{
				--type = "TextButton",				
				--Layout = {
					--size_WH = { w = button_h-2, h = button_h, wr = "px", hr = "px" },
					--margin_RB = { r = 1, b = 1, rr = "px", br = "px" },			
				--},				
				--buttonStyle = "HD_HUD_Type1",
				--Text = {
					--textStyle = "TaskbarHD_ButtonTextStyle_Red",
					--color = { 255, 0, 0, 255},
					--hAlign = "Center",
					--vAlign = "Center",					
					--text = "]",
				--},				
				--helpTip = "$4923", 
				--helpTipTextLabel = "commandsHelpTip", 				
				--onMouseClicked = "ClearAllControlGroups()", 	
			--},
		},

			
		--------Hide UI Button Frame...-----------
		{
			type = "Frame",			
			Layout = {	
				pos_XY = { x = .5, y = 0, xr = "par", yr = "px" },
				pivot_XY = {0.5, 0.0},
				size_WH = { w = 100, h = 12, wr = "px", hr = "px" },
				--pad_LT  = { l = 12, t = 8, lr = "px", tr = "px" },
				--pad_RB  = { r = 12, b = 0, rr = "px", br = "px" },
			
			},	
			name = "HideFrame",	
			--autosize  = 1,				
			ignored = 1,	
			;

			--taskbar hide button
			{
				type = "Button",
				name = "btnHide1",
				helpTip = "$2738",
				hotKeyID = 55,
				hidden=1,

				Layout = {
					pos_XY = { x = 0.5, y = 0, xr = "par", yr = "par" },
					pivot_XY = {0.5, 0.0},
					size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
					--max_WH = { w = 200, h = 24, wr = "px", hr = "px" },
				},
				ignored = 1,
				DefaultGraphic = {
					texture = "DATA:UI\\NewUI\\Taskbar\\RM_HideUIButton.tga",
					textureUV = { 0, 64, 128, 96 },
				},
				OverGraphic = {
					texture = "DATA:UI\\NewUI\\Taskbar\\RM_HideUIButton.tga",
					textureUV = { 0, 96, 128, 128 },
				},
				
				onMouseClicked = [[				
					UI_HideScreen('NewBuildMenu');
					UI_HideScreen('NewResearchMenu');	
					UI_HideScreen('NewLaunchMenu');	
					UI_HideScreen('ResourceMenu');						
					UI_HideScreen('NewTaskbar');		
					UI_ShowScreen('NewTaskbarRecover', ePopup);	
					UI_SetElementVisible('NewTaskbarRecover', 'btnRecover', 1);
				]],

				soundOnClicked = "SFX_ButtonClick", 
				
			},
		
			{
				type = "Button",		
				name = "btnHide2",	

				helpTip = "$2738",
				hotKeyID = 55,

				Layout = {
					size_WH = { w = 0, h = 0, wr = "par", hr = "px" },	
					max_WH = { w = 200, h = 24, wr = "px", hr = "px" },	
				},
				ignored = 1,							
				DefaultGraphic = {
					texture = "DATA:UI\\NewUI\\Taskbar\\RM_HideUIButton.tga",
					textureUV = { 0, 0, 128, 32 },
				},
				OverGraphic = {
					texture = "DATA:UI\\NewUI\\Taskbar\\RM_HideUIButton.tga",
					textureUV = { 0, 32, 128, 64 },
				},	
				

			},		
		}
	},
	
	----------------Lower Right Main Buttons----------------------

	-----------------Command Icons
	{	-- Command icon container (used to track anchors even when empty!)
		type = "Frame",
		Layout = {	
			pos_XY = { x = 1, y = 1, xr = "par", yr = "par" },
			pivot_XY = { 1.0, 1.0 },
		},
		autosize = 1,
		visible = 1,
		eventOpaque = 0,
		sizetype = "contain",
		mustupdate = 1,
		name = "CommandButtonsFrame",
		cursorType = "Normal",
		--backgroundColor = {255,0,0,255},
		
		Anchor_Spawns = {
			{
				anchorName = "Taskbar_LowerRight",
				relativePos = { 1.0, 0.0 },
			},	
		},
		Anchor_Binds = {
			scale = "Taskbar_Cmd_Scale",	-- RB = Right/Bottom
		},
		
		;
		{
			type = "Frame",	
			Layout = {	
				pos_XY = { x = 1, y = 1, xr = "par", yr = "par" },
				--size_WH = { w = 0.2, wr = "par" },
				pivot_XY = { 1.0, 1.0 },
				--pad_LT  = { l = 6, t = 0, lr = "px", tr = "px" },
				--pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
			},
			name = "Command_Palette",	
			arrangetype = "horiz",
			ignored = 1,
			visible = 1,
			autosize = 1,
			sizetype = "contain",
			arrangedir = -1,		
			hideWhenEmpty = 1,
			mustupdate = 1,
			--backgroundColor = {256,0,0,100},	
			--outerBorderWidth = 1,		
			--borderColor = {0,0,255,255},
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_PAD,
			--BackgroundGraphic = {
			--	type = "Graphic",
			--	texture = "Data:UI\\NewUI\\Styles\\LineDecorations2.tga",
			--	uvRect = { 2/32, 2/256, 30/32, 38/256 },
			--	patch_X = {  10, -8, 10, 0 },
			--	patch_Y = { 10,-16,10,  0 },
			--	patch_Scale = 1,
			--	patch_MaxScale = 1,						
			--},
				
			;
			-----------Specials & Custom Buttons------------	
			{
				type = "Frame",
				name = "specialButtons",     -- DO NOT RENAME THIS.  THE TUTORIAL NEEDS THIS NAME.

				Layout = {	
					pos_XY = { x = 0, y = 1, xr = "px", yr = "par" },
					--margin_RB = { r = 4, b = 8, rr = "px", br = "px" },
					--pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
					--pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
					--size_WH = { h = 1, hr = "par" },

					pivot_XY = { 0, 1 },
				},						
				--backgroundColor = {255,0,0,255},

				--BackgroundGraphic = BORDER_GRAPHIC_FRAME_RIGHTLINE,


				--name = "Command_Palette_Special",	
				arrangetype = "horiz",
				ignored = 1,
				visible = 1,
				autosize = 1,
				arrangedir = -1,
				arrangearray = 2,
				hideWhenEmpty = 1,
				mustupdate = 1,
							
				;
				-- Defined in TB_CommandPanel.lua	
				BTN_CMD_HARVEST,
				BTN_CMD_KAMIKAZE,			

				BTN_CMD_PING,
				BTN_CMD_PULSE,				
				BTN_CMD_DEFENCEFIELD,
				BTN_CMD_CLOAK,
				BTN_CMD_REPAIR,			
				BTN_CMD_MINES,
				BTN_CMD_HYPERSPACE,
				BTN_CMD_RALLYPOINT,
				BTN_CMD_RALLYOBJECT,
				BTN_CMD_MISSILEVOLLEY,
				BTN_CMD_BURSTATTACK,

				BTN_CMD_CUSTOM,
				BTN_CMD_GRAVWELL,
				BTN_CMD_DRONESACTIVATE,
				BTN_CMD_SPEEDBOOST,
				BTN_CMD_SALCAP,		
				BTN_CMD_CAPTURE,	
			},
			


			-----------General Command Buttons------------	
			{
				type = "Frame",	
				Layout = {	
					pos_XY = { x = 0, y = 1, xr = "px", yr = "par" },
					pad_LT  = { l = 2, t = 0, lr = "px", tr = "px" },
					--pad_RB  = { r = 6, b = 0, rr = "px", br = "px" },
					pivot_XY = { 0, 1 },
				},
				name = "Command_Palette_Common",
				arrangetype = "horiz",
				ignored = 1,
				visible = 1,
				autosize = 1,
				arrangedir = 1,		
				arrangearray = -2,
				hideWhenEmpty = 1,
				mustupdate = 1,
				BackgroundGraphic = BORDER_GRAPHIC_FRAME_LEFTLINE,
				;			
				
				-- Defined in TB_CommandPanel.lua
				BTN_CMD_MOVE,	
				BTN_CMD_ATTACK,
				BTN_CMD_MOVEATTACK,
				BTN_CMD_WAYPOINT,				
				

				BTN_CMD_DOCK,
				BTN_CMD_GUARD,

				BTN_CMD_CANCELORDERS,			
				BTN_CMD_RETIRE,
				BTN_CMD_SCUTTLE,	

			},
		},
	},
	
	--------------------------------------------------------------------------------------------

	---------------- Lower Left Panel -----------------
	{
		type = "Frame",
		name = "frame_LowerLeft",	
				
		Layout = {				
			pos_XY = { x = 0, y = 1.0, xr = "par", yr = "par" },	
			size_WH = { w = 0.75, h = 0.75, wr = "scr", hr = "scr" },
			pivot_XY = { 0.0, 1.0 },
		},			
		arrangetype = "horiz",
		autosize  = 1,
		autoarrange = 1,
		arrangedir = 1,	
		eventOpaque = 0,
		sizetype = "contain",

		--backgroundColor = {255,0,0,64},		
		
		Anchor_Spawns = {
			{
				anchorName = "Taskbar_LeftTop",
				relativePos = { 0.0, 0.0 },
			},
			{
				anchorName = "Taskbar_RightBot",
				relativePos = { 1.0, 1.0 },
			},
		},
		Anchor_Binds = {
			scale = "Taskbar_Selection_Scale",	-- LB = Left/Bottom
		},
		;
		
		------- Selection Back, Tactics, Stance --------
		{
			type = "Frame",
					
			Layout = {
				pos_XY = { x = 0, y = 1, xr = "px", yr = "par" },	
				pivot_XY = { 0.0, 1.0 },
			},			
			arrangetype = "vert",
			autosize  = 1,
			autoarrange = 1,
			arrangedir = 1,
			eventOpaque = 0,
			hideWhenEmpty = 1,

			--backgroundColor = {0,255,0,64},			
			;
			
			------- Selection Back --------
			{ 
				type = "Button", 	
				name = "btnShipBack",
						
				Layout = {
					size_WH = { w = 34, h = 34, wr = "px", hr = "px" },
				},
				stateIconOfs = { 0.0, 0.0 },
				stateIconeCells = { 0, 1, 2, 3, 4, 5, 6, 7 },

				IconBase = {			
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\back_arrow.tga",
					uvRect = { 0, 0, 1, 1 },
					Surface = STD_ARROW_BUTTON_SURFACE,				
				},

				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",

				helpTip = "$3362", 
				helpTipTextLabel = "commandsHelpTip", 						
				soundOnClicked = "SFX_ButtonClick", 
			},
			
			-------- Tactics / Stance --------
			{
				type = "Frame",
				name = "TacticsPanel",
				autosize = 1,
				autoarrange = 1,
				arrangetype = "vert",
				ignored = 1,
				
				Anchor_Binds = {
					visible = "SelectionPanelSGs_Anchor",
				},
				;
				
				---------- Tactics ------------	
				{
					type = "Frame",	
					Layout = {			
						pad_LT = { l = 2, t = 2, lr = "px", tr = "px" },
						pad_RB = { r = 2, b = 2, rr = "px", br = "px" },
					},	
					arrangetype = "vert",
					autosize = 1,	
					cursorType = "Normal",
					BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_THIN,
					;
					------------------------------------------
					{
						type = "ButtonHD",
						buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
						helpTip = "$3130",
						helpTipTextLabel = "commandsHelpTip",
						name = "btnAggressive",
						hotKeyID = 36,
						cursorType = "Normal",
						Layout = {					
							size_WH = { w = TACTICSICON_W, h = TACTICSICON_H, wr = "px", hr = "px" },
						},		
								
						stateIconOfs = { 0.0, 128/512 },
						stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
						IconBase = {
							--size = {4, 4},
							texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_aggressive.dds",
							uvRect = { 0/128, 0/512, 128/128, 128/512 },
							patch_X = { 4,-120, 4,0 },
							patch_Y = { 4,-120,4, 0 },
							patch_Scale = 1,
	
							Surface = THREESTATEBUTTONSURFACE,

						},
						soundOnClicked 		= "SFX_ButtonClick",
					},
					{
						type = "ButtonHD",
						buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
						helpTip = "$3131",
						helpTipTextLabel = "commandsHelpTip",
						name = "btnDefensive",
						hotKeyID = 35,

						Layout = {					
							size_WH = {  w = TACTICSICON_W, h = TACTICSICON_H, wr = "px", hr = "px" },
						},		

						stateIconOfs = { 0.0, 128/512 },
						stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
						IconBase = {
							--size = {4, 4},
							texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_defensive.dds",
							uvRect = { 0/128, 0/512, 128/128, 128/512 },
							patch_X = { 4,-120, 4,0 },
							patch_Y = { 4,-120,4, 0 },
							patch_Scale = 1,
	
							Surface = THREESTATEBUTTONSURFACE,

						},


					},
					{
						type = "ButtonHD",
						buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
						helpTip = "$3132",
						helpTipTextLabel = "commandsHelpTip",
						name = "btnPassive",
						hotKeyID = 34,

						Layout = {					
							size_WH = {  w = TACTICSICON_W, h = TACTICSICON_H, wr = "px", hr = "px" },
						},		

						stateIconOfs = { 0.0, 128/512 },
						stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
						IconBase = {
							--size = {4, 4},
							texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_passive.dds",
							uvRect = { 0/128, 0/512, 128/128, 128/512 },
							patch_X = { 4,-120, 4,0 },
							patch_Y = { 4,-120,4, 0 },
							patch_Scale = 1,
	
							Surface = THREESTATEBUTTONSURFACE,

						},
					},
				},
				
				---------- Stance Side Panel ------------	
				{
					type = "Frame",	
					Layout = {			
						pad_LT = { l = 2, t = 2, lr = "px", tr = "px" },
						pad_RB = { r = 2, b = 2, rr = "px", br = "px" },
					},
					Anchor_Spawns = {
						{
							anchorName = "SGIcons_Anchor",
							relativePos = { 1.0, 1.0 },
						},		
					},
					arrangetype = "vert",
					autosize = 1,	
					cursorType = "Normal",
					BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_THIN,
					;
					{
						type = "ButtonHD",
						buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
						helpTip = "$3136",
						helpTipTextLabel = "commandsHelpTip",
						name = "btnDamageSt",
						hotKeyID = 37,
						cursorType = "Normal",
						Layout = {					
							size_WH = { w = TACTICSICON_W, h = TACTICSICON_H*2/3, wr = "px", hr = "px" },
						},		
								
						stateIconOfs = { 0.0, 128/1024 },
						stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
						IconBase = {
							--size = {4, 4},
							texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_stance_dmg.dds",
							uvRect = { 0/128, 24/1024, 128/128, 104/1024 },
							patch_X = { 4,-120,4,0 },
							patch_Y = { 4,-72,4,0 },
							patch_Scale = 1,
	
							Surface = THREESTATEBUTTONSURFACE,

						},
						soundOnClicked 		= "SFX_ButtonClick",
					},
					{
						type = "ButtonHD",
						buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
						helpTip = "$3137",
						helpTipTextLabel = "commandsHelpTip",
						name = "btnEvasiveSt",
						hotKeyID = 38,
						cursorType = "Normal",
						Layout = {					
							size_WH = { w = TACTICSICON_W, h = TACTICSICON_H*2/3, wr = "px", hr = "px" },
						},		
								
						stateIconOfs = { 0.0, 128/1024 },
						stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
						IconBase = {
							--size = {4, 4},
							texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_stance_eva.dds",
							uvRect = { 0/128, 24/1024, 128/128, 104/1024 },
							patch_X = { 4,-120,4,0 },
							patch_Y = { 4,-72,4,0 },
							patch_Scale = 1,
	
							Surface = THREESTATEBUTTONSURFACE,

						},
						soundOnClicked 		= "SFX_ButtonClick",
					},
					{
						type = "ButtonHD",
						buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
						helpTip = "$3138",
						helpTipTextLabel = "commandsHelpTip",
						name = "btnNeutralSt",
						hotKeyID = 39,
						cursorType = "Normal",
						Layout = {					
							size_WH = { w = TACTICSICON_W, h = TACTICSICON_H*2/3, wr = "px", hr = "px" },
						},		
								
						stateIconOfs = { 0.0, 128/1024 },
						stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
						IconBase = {
							--size = {4, 4},
							texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_stance_neu.dds",
							uvRect = { 0/128, 24/1024, 128/128, 104/1024 },
							patch_X = { 4,-120,4,0 },
							patch_Y = { 4,-72,4,0 },
							patch_Scale = 1,
	
							Surface = THREESTATEBUTTONSURFACE,

						},
						soundOnClicked 		= "SFX_ButtonClick",
					},
				},
			},
		},
		
		-------- Title, Health, Selection Infos, SG Buttons --------
		{
			type = "Frame",
			name = "SelectionMasterFrame",
					
			Layout = {
				pos_XY = { x = 0, y = 1, xr = "px", yr = "par" },	
				pivot_XY = { 0.0, 1.0 },
			},			
			arrangetype = "vert",
			autosize  = 1,
			autoarrange = 1,
			arrangedir = 1,
			eventOpaque = 0,
			ignored = 1,
			hideWhenEmpty = 1,
			
			Anchor_Spawns = {
				{
					anchorName = "SelectionPanelSGs_Anchor",
					relativePos = { 1.0, 1.0 },
				},
			},
			;
			
			------- Title & Health --------
			{
				type = "Frame",		
				eventOpaque = 0,
				ignored = 1,
				visible = 1,
				hideWhenEmpty = 1,

				Layout = {
					pos_XY = { x=0, y=0, xr="px", yr="px" },
					size_WH = { w=304, h=34, wr = "px", hr = "px" },
					pad_LT = { l=4, t=0, lr = "px", tr = "px" },
					pad_RB = { r=4, b=4, rr = "px", br = "px" },
				},
				;
				-- Selected Unit Health
				{
					type = "ProgressBar",
					name = "unitSelectionHealth",

					Layout = {	
						size_WH = {  w=1, h = 8, wr="par", hr = "px"},
						pos_XY = { x = 0, y = 1, xr = "px", yr = "par" },
						pivot_XY = { 0, 1 },
					},
					progressColor = { 0, 255, 0, 255},
					useProgressAsTooltip = 1,
					ignored = 1,
				},
				------- Selected Unit Name Text
				{
					type = "TextButton",
					name = "unitname",
					eventOpaque = 0,
					ignored = 1,
					Layout = {
						size_WH = {  w=1, h = .7,  wr="par", hr = "par" },
						pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					},								
					Text = {				
						--textStyle = "RM_TaskbarHD_ButtonTextStyle",
						font = "ButtonFont",
						color = "RM_FETextBlueBright",
						dropShadow = 1,
						pixels  = 24,
						text = "",
						color = { 0, 128, 255, 255},
						hAlign = "Left",	
						vAlign = "Bottom",		
						rel = 0,
					},
				},
			},
			
			-------- Single Ship Selection Box ---------
			{
				type = "Frame",	
				name = "unitSingleSelection",	
				Layout = {			
					pad_LT = { l = 2, t = 4, lr = "px", tr = "px" },
					pad_RB = { r = 2, b = 4, rr = "px", br = "px" },
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },	
					size_WH = { w = 304, h = 124, wr = "px", hr = "px" },
				},

				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_PAD,
				backgroundColor = SELECTIONBACKGROUNDCOLOR,
				cursorType = "Normal",
				visible = 0,
				ignored = 1,
				;
				--ship icon
				{
					type = "Button",
					Layout = {	
						margin_LT = { l = 4, t = 2, lr = "px", tr = "px" },	
						pos_XY = { x = .25, y = 0, xr = "par", yr = "par" },
						size_WH = { w = .45, h = 100000, wr = "par", hr = "px" },	--original no stratch was 200x64							
						pivot_XY = { .5, 0 },	
						lockAspect=2,	
					},
					name = "unitIcon",
					onMouseClicked = "MainUI_UserEvent(eFocus)", 
					helpTip = "$4924", 
					helpTipTextLabel = "commandsHelpTip",   
					backgroundGraphicHAlign = "Center",
					backgroundGraphicVAlign = "Center",
					--backgroundColor = { 0, 10, 255, 200},
					;

				},
				{
						type = "TextLabel",
						name = "singleSelectionCount",	
						--backgroundColor          = {233,54,77,255},

						autosize=1,						
						Layout = {
							pos_XY = { x = 0, y = 1, xr = "par", yr = "par" },
							size_WH = { w = .5, h = .4, wr = "par", hr = "par" },
							pivot_XY = {0, 1},
						},			
						
						Text = {
							color = { 255, 255, 255, 255},
							minShrink = .1,
							type = "Text",
							font = "ButtonFont",
							color = "IGColorButtonText",
							dropShadow = 1,
							pixels  = 60,
							--style  = 1,
							hAlign = "Center",
							--text="XXX",
						},
						giveParentMouseInput = 1,
					},
				--subsystems
				{
					type = "Frame",
					Layout = {	
						pos_XY = { x = 0, y = 1, xr = "par", yr = "par" },
						size_WH = { w = .5, h = .4, wr = "par", hr = "par" },
						pivot_XY = {0, 1},
					},
					--backgroundColor = { 255, 255, 10, 200},
					;
					{
						type = "Frame",
						name = "subsystems",
						--clipchildren = 0,	
					
						Layout = {	
							pos_XY = { x = .5, y = 0, xr = "par", yr = "pax" },
							size_WH = { w = 1, h = 64, wr = "px", hr = "px" },
							pivot_XY = {.5, 0},
						},

						arrangetype = "horiz",
						visible=1,
						autoarrange=1,
						arrangedir = 0,
						arrangearray = 3,
						autosize = 1,
						sizetype = "contain",						
						--ignored = 1,

						--backgroundColor = { 255, 10, 255, 100},

						;
						BTN_SUBYSTEM_1,
						BTN_SUBYSTEM_2,
						BTN_SUBYSTEM_3,
						BTN_SUBYSTEM_4,
						BTN_SUBYSTEM_5,
						BTN_SUBYSTEM_6,
						BTN_SUBYSTEM_7,
						BTN_SUBYSTEM_8,
						BTN_SUBYSTEM_9,
						BTN_SUBYSTEM_10,
						BTN_SUBYSTEM_11,
						BTN_SUBYSTEM_12,
						BTN_SUBYSTEM_13,
						BTN_SUBYSTEM_14,
						BTN_SUBYSTEM_15,
						BTN_SUBYSTEM_16,
						BTN_SUBYSTEM_17,
						BTN_SUBYSTEM_18,
						-- subsystem buttons to copy graphics from when filling above subsystem list
						BTN_TEMPLATE_SUBSYSTEM_PRODUCTION,
						BTN_TEMPLATE_SUBSYSTEM_SENSOR,
						BTN_TEMPLATE_SUBSYSTEM_GENERIC,
						BTN_TEMPLATE_SUBSYSTEM_INNATE,	

					},
				},
				--------- Ship Role Frame -----------
				{
					type = "Frame",
					Layout = {	

						pos_XY = { x = 1, y = 0, xr = "par", yr = "par" },
						size_WH = { w = .5, h = .5, wr = "par", hr = "par" },	--original no stratch was 200x64							
						pivot_XY = { 1, 0 },	
						margin_LT = { l = 0, t = 2, lr = "scr", tr = "px" },
						--margin_RB  = { r = 4, b = 0, rr = "px", br = "px" },
					},		
					--backgroundColor = { 0, 255, 0, 200},
					arrangetype = "horiz",
					;
					{
						type = "TextLabel",
						name = "unitrole",

						Layout = {	
							pos_XY = { x = 40, y = 5, xr = "px", yr = "px" },			
							size_WH = { w = 1, h = 1, wr = "par", hr = "px" },	
							},
						wrapping = 1,
						autosize=1,								
						Text = {
							textStyle = "RM_IGShipDescriptionLabel_TextStyle",
							color = { 238, 188, 5, 255},		
							hAlign = "Center",
							vAlign = "Center",
							wrapping = 1,					--textStyle = "RM_TaskbarHD_ButtonTextStyle",
							font = "ButtonFont",
							color = "RM_FETextBlueBright",
							--dropShadow = 1,
							pixels  = 18,
							rel=0,
							text = "",
							--color = { 0, 128, 255, 255},

							},						
					},
					
				},

				--------- Ship Stats Info Frame -----------
				{
					type = "Frame",
					Layout = {	
						pos_XY = { x = 1, y = 1, xr = "par", yr = "par" },
						size_WH = { w = .5, h = .5, wr = "par", hr = "par" },	--original no stratch was 200x64							
						pivot_XY = { 1, 1 },	
						--margin_RB  = { r = 4, b = 0, rr = "px", br = "px" },
						--pad_RB  = { r = 4, b = 0, rr = "px", br = "px" },
					},		
					--backgroundColor = { 128, 0, 0, 200},
					arrangetype = "vert",
					;
					----------- Max Speed Frame
					{
						type = "Frame",
						name = "maxspeedframe",							
						Layout = {	
							--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },			
							size_WH = { w = 1.0, h = 20, wr = "par", hr = "px" },
							--margin_LT = { l = 8.0, t = 12.0, lr = "px", tr = "px" },
							--margin_RB = { r = 8.0, b = 12.0, rr = "px", br = "px" },
						},							
						arrangetype = "horiz",
						arrangedir = 1,	
						--backgroundColor = { 255, 255, 0, 255},
						;
						{
							type = "Frame",
							Layout = {	
								pos_XY = { x = 0.05, y = 0.5, xr = "par", yr = "par" },			
								size_WH = { w = 16, h = 16, wr = "px", hr = "px" },		
								pivot_XY = { 0.0, 0.5 },
								},
				
							backgroundGraphicHAlign = "Center",
							backgroundGraphicVAlign = "Center",
							
							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.dds",
								textureUV = { 0, 0, 20, 20 },
								},
						},
						{
							type = "TextLabel",
							name = "unitmaxspeed",
							Layout = {	
								pos_XY = { x = 0.25, y = 0.5, xr = "par", yr = "par" },			
								size_WH = { w = 0.7, h = 15, wr = "par", hr = "px" },
								pivot_XY = { 0.0, 0.5 },
							},
								
								autosize=1,
							Text = {
								textStyle = "RM_ShipInfoLabel_TextStyle",
								color = { 0, 198, 0, 255},
								vAlign = "Center",		
								hAlign = "Left",																	
								},
					
						},	
					},
					------------------ Attack Damage Stat
					{
						type = "Frame",
						name = "attackdamageframe",							
						Layout = {	
							--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },			
							size_WH = { w = 1.0, h = 20, wr = "par", hr = "px" },							
						},							
						arrangetype = "horiz",
						arrangedir = 1,
						;
						{
							type = "Frame",
							Layout = {	
								pos_XY = { x = 0.05, y = 0.5, xr = "par", yr = "par" },			
								size_WH = { w = 16, h = 16, wr = "px", hr = "px" },	
								pivot_XY = { 0.0, 0.5 },
							},
							backgroundGraphicHAlign = "Center",
							backgroundGraphicVAlign = "Center",
							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.dds",
								textureUV = { 20, 0, 42, 20 },
							},
						},
						{
							type = "TextLabel",
							name = "unitattackdamage",
							autosize=1,
							Layout = {	
								pos_XY = { x = 0.25, y = 0.5, xr = "par", yr = "par" },			
								size_WH = { w = 0.7, h = 15, wr = "par", hr = "px" },
								pivot_XY = { 0.0, 0.5 },
							},
							Text = {
								textStyle = "RM_ShipInfoLabel_TextStyle",
								color = {220, 37, 19, 255},
								hAlign = "Left",																	
							},
							
						},
					},

					------------------ Shield Stat
					{
						type = "Frame",
						name = "shieldsframe",							
						Layout = {	
							--pos_XY = { x = 0.0, y = 0.66, xr = "par", yr = "par" },			
							size_WH = { w = 1.0, h = 20, wr = "par", hr = "px" },								
						},							
						arrangetype = "horiz",
						arrangedir = 1,
						;
						{
							type = "Frame",
							Layout = {	
								pos_XY = { x = 0.05, y = 0.5, xr = "par", yr = "par" },			
								size_WH = { w = 16, h = 16, wr = "px", hr = "px" },		
								pivot_XY = { 0.0, 0.5 },
							},
							backgroundGraphicHAlign = "Center",
							backgroundGraphicVAlign = "Center",
							BackgroundGraphic = {
								texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.dds",
								textureUV = { 42, 0, 64, 20 },
							},
						},
						{
							type = "TextLabel",
							name = "unitshields",
							autosize=1,
							Layout = {	
								pos_XY = { x = 0.25, y = 0.5, xr = "par", yr = "par" },			
								size_WH = { w = 0.7, h = 15, wr = "par", hr = "px" },
								pivot_XY = { 0.0, 0.5 },
							},
							Text = {
								textStyle = "RM_ShipInfoLabel_TextStyle",
								color = { 0, 128, 255, 255},
								hAlign = "Left",															
							},
							
						},
					},






				},

			},

			-------- MultiSelection Box --------	
			{
				type = "Frame",		
				name = "UnitMultiSelection",	

				Layout = {
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					pad_LT = { l = 2, t = 4, lr = "px", tr = "px" },
					pad_RB = { r = 2, b = 2, rr = "px", br = "px" },
				},

				backgroundColor = SELECTIONBACKGROUNDCOLOR,

				arrangetype = "vert",
				visible = 0,
				ignored = 1,
				autosize = 1,
				arrangedir = -1,		
				arrangearray = 4,
				hideWhenEmpty = 1,
				cursorType = "Normal",

				arrangeSep = {	x=4, y=4, xr="px", yr="px",},		
				
				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_PAD,
				;
				BTN_SHIPSEL_1,
				BTN_SHIPSEL_2,
				BTN_SHIPSEL_3,
				BTN_SHIPSEL_4,
				BTN_SHIPSEL_5,
				BTN_SHIPSEL_6,
				BTN_SHIPSEL_7,
				BTN_SHIPSEL_8,
				BTN_SHIPSEL_9,
				BTN_SHIPSEL_10,
				BTN_SHIPSEL_11,
				BTN_SHIPSEL_12,
				BTN_SHIPSEL_13,
				BTN_SHIPSEL_14,
				BTN_SHIPSEL_15,
				BTN_SHIPSEL_16,
				BTN_SHIPSEL_17,
				BTN_SHIPSEL_18,
				BTN_SHIPSEL_19,
				BTN_SHIPSEL_20,
				BTN_SHIPSEL_21,
				BTN_SHIPSEL_22,
				BTN_SHIPSEL_23,
				BTN_SHIPSEL_24,
			},

			-------- Single Subsystem Selection Box --------
			{
				-- Requires these elements to work:
				-- subsystemIcon
				-- subsystemRole
				-- subsystemselected		
				
				type = "Frame",	
				name = "unitSubsystem",	
					
				Layout = {			
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 304, h = 124, wr = "px", hr = "px" },
					pad_LT = { l = 11, t = 8, lr = "px", tr = "px" },
					pad_RB = { r = 11, b = 0, rr = "px", br = "px" },
				},	
				
				backgroundColor = SELECTIONBACKGROUNDCOLOR,
				arrangetype="vert",
				visible = 0,
				ignored = 1,
				cursorType = "Normal",
					
				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME,
				;
				{
					type = "Button",
					name = "subsystemIcon",

					Layout = {	
						pos_XY = { x = 0.5, y = .4, xr = "par", yr = "par" },			
						size_WH = { w = 110.0, h = 64.0, wr = "px", hr = "px" },
						pivot_XY = { .5,  .5 },	
					},	
					--backgroundColor = { 255, 128, 0, 255},			
					onMouseClicked = "MainUI_UserEvent( eFocus)", 
					helpTip = "$4921", 
					helpTipTextLabel = "commandsHelpTip", 


				},
				----------- Subsystem's Role ---------------
				{
					type = "TextLabel",
					name = "SubsystemUnitRole",
					wrapping = 1,	

					Layout = {
						pos_XY = { x = .5, y = 1, xr = "par", yr = "par" },			
						size_WH = { w = 1, h = 32, wr = "par", hr = "px" },	
						pivot_XY = { .5,  1 },	
					},
												
					Text = {
						textStyle = "RM_ShipInfoLabel_TextStyle",
						--color = { 238, 188, 5, 255},		
						hAlign = "Center",
						vAlign = "Middle",
						font = "ButtonFont",
						color = "RM_FETextBlueBright",
						--dropShadow = 1,
						--pixels  = 16,
						color = { 0, 128, 255, 255},
						text = "Subsystem Role of Crazy Magnitude and Awesome.  Lorum Epson Dalorean",
					},
					--backgroundColor = { 255, 0, 255, 255},
				},
			},
			
			-------- SG Buttons --------
			{
				type = "Frame",		
				Layout = {			
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },	
					pivot_XY = { 0,  0 },	
					margin_LT = { l = 0, t = 2, lr = "px", tr = "px" },
				},	
				arrangetype = "horiz",
				autosize = 1,	

				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_PAD,
				;
				{
					type = "Frame",	
					name = "FormationPanel",				
					autosize=1,
					arrangetype = "horiz",
					;
					-- Defined in TB_FormationPanel -- 
					BTN_CLONE,
					BTN_LEAVE,
				},
			},	
		},

		-------- Selection Prev/Next --------
		{
			type = "Frame",
					
			Layout = {
				pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },	
				pivot_XY = { 0.0, 0.0 },
			},			
			arrangetype = "vert",
			autosize  = 1,
			autoarrange = 1,
			arrangedir = 1,
			eventOpaque = 0,
			ignored = 1,
			hideWhenEmpty = 1,
			;
			{
				type = "Button",					
				Layout = {
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 14, h = 31, wr = "px", hr = "px" },
				},
				buttonStyle = "IGNextButton",
				OverGraphic = {
					texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.mres",
					textureUV = { 13, 31, 0, 103},						
				},		
				name = "btnShipNext",
				ignored = 1,
				helpTip = "$2730",
				helpTipTextLabel = "commandsHelpTip",					
				soundOnClicked = "SFX_ButtonClick",
			},
			{
				type = "Button",					
				Layout = {
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 14, h = 31, wr = "px", hr = "px" },
				},
				buttonStyle = "IGPrevButton",
				OverGraphic = {
					texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.mres",
					textureUV = { 0, 31, 13, 103},						
				},				
				name = "btnShipPrev",
				ignored = 1,
				helpTip = "$2731",
				helpTipTextLabel = "commandsHelpTip",					
				soundOnClicked = "SFX_ButtonClick",
			},
		},
	},
}
---------------------------------------------------------------------------------
--UI Recover
NewTaskbarRecover = {	
	stylesheet = "HW2StyleSheet",	
	pixelUVCoords = 1,
	Layout = {		
		pos_XY = { x = 0.5, y = 1.0, xr = "scr", yr = "scr" },
		pivot_XY = { 0.5, 1.0 },
		size_WH = { w = button_w*1.5, h = button_h-3, wr = "px", hr = "px" },
	},
	--backgroundColor = { 255, 0, 255, 255},
	;		
	{
		type = "Button",
		Layout = {
			pos_XY = { x = 0.5, y = 1.0, xr = "par", yr = "par" },
			pivot_XY = {0.5, 1.0},
			size_WH = { w = 142, h = button_h-3, wr = "px", hr = "px" },
		},		
		name = "btnRecover", 
		ignored = 1,
		
		DefaultGraphic = {
			texture = "DATA:UI\\NewUI\\Taskbar\\RM_HideUIButton.tga",
			textureUV = { 0, 0, 128, 32 },
		},
		OverGraphic = {
			texture = "DATA:UI\\NewUI\\Taskbar\\RM_HideUIButton.tga",
			textureUV = { 0, 32, 128, 64 },
		},		
		onMouseClicked = [[	
			UI_HideScreen('NewTaskbarRecover');
			UI_HideScreen('NewTaskbarRecover');
			UI_ShowScreen('NewTaskbar', ePopup);	
			UI_ShowScreen('ResourceMenu', ePopup);	
			UI_SetElementVisible('NewTaskbar', 'btnHide1', 1);		
			UI_SetElementVisible('NewTaskbar', 'btnHide2', 0);			
			UI_SetElementVisible('NewTaskbarRecover', 'btnRecover', 0);		
		]],
		helpTip = "$2739",
		helpTipTextLabel = "commandsHelpTip",
		hotKeyID = 55,
		soundOnClicked = "SFX_ButtonClick", 
	},
}
