dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")


SCREENWIDTH = 200	--200
SCREENHEIGHT = 600	--100
LAUNCHMENUWIDTH = 145/540
BOTTOMYPOS = 710	--497

EventsScreen = {
	--size = { 32, BOTTOMYPOS - 2, SCREENWIDTH, 2},
	stylesheet = "HW2StyleSheet",		

	soundOnShow = "SFX_RecallMenuONOFF",
	soundOnHide = "SFX_RecallMenuONOFF",
	
	RootElementSettings = {
		autosize = 1,

		Layout = {	
			pad_LT  = { l = 4, t = 0, lr = "px", tr = "px" },
		},	
		Anchor_Binds = {
			pivotX = "Taskbar_LeftButtonsTopRight",
			pivotY = "Taskbar_LeftButtonsTopRight",
		},
		cursorType = "Normal",
		eventOpaque = 0,
	},

	eventOpaque = 0,
	onShow = "UI_HideScreen('UnitCapInfoPopup'); UI_HideScreen('BuildQueueMenu')",

	-- custom to events screen
	bottomYPos = BOTTOMYPOS,
	;
	{
		type = "ListBox",
		name = "listEvents",
		listBoxStyle = "FEListBoxStyle",
		maxItems = 64,
		eventOpaque = 0,
		hugBottom = 1,
		leftScroll = 1,
		scrollBarPageSize = 76,
		scrollBarStepSize = 13,
		autoHideScrollbar = 1,
		TintGraphics = 1,
		backgroundColor = { 0.0, 0.0, 0.0, 5.0 },
		--arrangeorder = -1,
		Layout = {

			size_WH = {	w = LAUNCHMENUWIDTH, h = .25, wr = "scr", hr = "scr" },	
			--max_WH = { w = LAUNCHMENUWIDTH, h = .25, wr="scr",hr="scr"},
		},
		
	},	
	-------------------------------------------------------
	-- Event item to clone
	-------------------------------------------------------
	{
		type = "ListBoxItem",
		name = "listItem",
		--autosize = 1,
		visible = 0,
		ignored = 1,
		--backgroundColor = COLOR_BLUE_SOLID,
		clickThrough = 1,
		arrangetype = "horiz",
		resizeToListBox = 1,
		eventOpaque = 0,



		;		
		{
			type = "Button",
			name = "icon",
			Layout = {								
				size_WH = {	w = 1000, h = EVENTBUTTON_HEIGHT, wr = "px", hr = "scr" },
				lockAspect=1,					
			},		
			denyParentMouseInput = 1,
			IconBase = {
				texture = "DATA:UI\\NewUI\\Taskbar\\eventicon.tga",
				uvRect = { 0, 1, 1, 0 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_EVENT_BUTTON_SURFACE,
			},

			helpTip = "$5456",--CLICK ICON TO FOCUS
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
		},		
		{
			type = "TextLabel",
			name = "text",
			--backgroundColor = COLOR_RED_SOLID,
			Layout = {						
				margin_LT = { l = LISTBOXITEM_ICON_PAD_HORIZ, t = 0, lr = "scr", tr = "px" },
				pos_XY = { x = EVENTBUTTON_HEIGHT, y = 0.0, xr = "scr", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "px" },
			},		
			clickThrough = 1,
			eventOpaque = 0,
			giveParentMouseInput = 1,
			size = { SCREENWIDTH - 20, 12},
			wrapping = 1,
			autosize = 1,
			Text = {
				textStyle = "RM_DescriptionLabel_TextStyle",
				hAlign = "Left",
			},

		},
	},	

	-------------------------------------------------------
	-- Objective item to clone
	-------------------------------------------------------
	{
		type = "ListBoxItem",
		name = "listObjectiveItem",
		--autosize = 1,
		ignored = 1,
		visible = 0,
		--backgroundColor = COLOR_YELLOW_SOLID,
					clickThrough = 1,
			eventOpaque = 0,
		arrangetype = "horiz",
		giveParentMouseInput = 1,
		resizeToListBox = 1,

		;		
		{
			type = "Button",
			
			Layout = {								
				size_WH = {	w = 1000, h = EVENTBUTTON_HEIGHT, wr = "px", hr = "scr" },
				lockAspect=1,		
			},		

			name = "icon",

			stateIconOfs = { 0.0, 0.0 },
			stateIconeCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			denyParentMouseInput = 1,
			IconBase = {
				texture = "DATA:UI\\NewUI\\Taskbar\\objectiveicon.tga",
				uvRect = { 0, 1, 1, 0 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_EVENT_BUTTON_SURFACE,
			},

			helpTip = "$5457",--CLICK TO VIEW OBJECTIVES
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
		},		
		{
			type = "TextLabel",
			name = "text",

			Layout = {						
				margin_LT = { l = LISTBOXITEM_ICON_PAD_HORIZ, t = 0, lr = "scr", tr = "px" },
				pos_XY = { x = EVENTBUTTON_HEIGHT, y = 0.0, xr = "scr", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "px" },
			},		
			clickThrough = 1,
			eventOpaque = 0,
			
			giveParentMouseInput = 1,

			wrapping = 1,
			autosize = 1,
			Text = {
				textStyle = "RM_TaskbarHD_ButtonTextStyle",
				hAlign = "Left",
			},
		},
	},
}
