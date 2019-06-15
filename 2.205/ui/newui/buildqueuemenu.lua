-- These need to be the same as in finalbuild.lua (build menu)
SHIPQUEUECOLOR = {246, 212, 0, 255}
SUBQUEUECOLOR = {224, 150, 0 , 255}
RESEARCHQUEUECOLOR = {64, 129, 249, 255}

-- These need to be the same as in research.lua (research menu)

MENUWIDTH = 200

SHIPTEXTCOLOR = { 170, 227, 255, 255}

ITEMTEXTCOLOR = {255,255,255,255}

MAXHEIGHT = 325

PROGRESSBGCOLOR = { 70, 74, 85, 190}

BuildQueueMenu = {
	--size = {32, 71, MENUWIDTH, 500},
	stylesheet = "HW2StyleSheet",
	--clickThrough = 1,

	RootElementSettings = {
		
		autosize = 1,
		eventOpaque = 0,
		cursorType = "Normal",
	},

	soundOnShow = "SFX_GlobalQueueONOFF",
	soundOnHide = "SFX_GlobalQueueONOFF",
	
	onShow = "UI_SetButtonPressed('NewTaskbar', 'btnQueue', 1); UI_HideScreen('UnitCapInfoPopup'); UI_HideScreen('EventsScreen')",
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnQueue', 0)", 
	
	eventOpaque = 0,
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	-- custom values
	fstringBuild = "$2641",
	
	Regions = {
		{0,0,65, -1}, -- -1 means region will size to screen height
	},
	;
	
	-- root frame to insert build queue items
	{
		type = "Frame",
		eventOpaque = 0,
		--backgroundColor = {255,0,0,64},

		Layout = {	
			pad_LT  = { l = 4, t = 0, lr = "px", tr = "px" },
			pos_XY = { x=0, y=0, xr="px", yr="px" },
			size_WH = { w=0.5, h=1, wr="scr", hr="px" },	-- irrelevent becuase we ignore events...
		},	
		
		Anchor_Binds = {
			pivotX = "Taskbar_LeftButtonsTopRight",
			edgeT = "Taskbar_LeftButtonsTopRight",
			edgeB = "Taskbar_LeftTop",
		},
		;
		{
			type = "Frame",
			name = "buildQueueFrame",
			autosize = 1,
			autoarrange = 1,
			arrangetype = "vert",
			arrangedir = 1,	
			sizetype = "contain",
			eventOpaque = 0,
			--backgroundColor = {0,0,255,64},
		},
	},

	-- build queue item to clone
	{
		type = "Button",
		name = "buildQueueItem",
		position = { 0, 0},
		size = { MENUWIDTH, 36},
		visible = 0,
		eventOpaque = 0,
		clickThrough = 1,
		;
		
		-- ship name
		{
			type = "TextLabel",
			position = { 2, 0},
			size = { MENUWIDTH-4, 12},
			name = "shipName",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = SHIPTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			clickThrough = 1,
			eventOpaque = 0,
		},
			
		-- open build mgr button
		{
			type = "Button",
			name = "btnOpenBuildMgr",
			position = {0, 12},
			size = {64,24},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5450",--OPEN BUILD MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			--backgroundColor = {200,0,0,200},
			;
			
			-- ship progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = SHIPQUEUECOLOR,
				position = { 2, 2},
				size = { 40, 8},
				name = "buildProgress",
				giveParentMouseInput = 1,
			},
	
			-- pause and cancel buttons
			{
				type = "Button",
				name = "pauseButton",
				position = { 44, 2},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			{
				type = "Button",
				name = "cancelButton",
				position = { 54, 2},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			
			-- subsystem progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = SUBQUEUECOLOR,
				position = { 2, 14},
				size = { 40, 8},
				name = "subsystemBuildProgress",
				giveParentMouseInput = 1,
			},
	
			-- subsystem pause and cancel buttons
			{
				type = "Button",
				name = "subsystemPauseButton",
				position = { 44, 14},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			{
				type = "Button",
				name = "subsystemCancelButton",
				position = { 54, 14},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
		},

		{
			type = "TextLabel",
			position = { 65, 12},
			size = { MENUWIDTH-66, 12},
			name = "buildText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			clickThrough = 1,
			eventOpaque = 0,
		},
		
		{
			type = "TextLabel",
			position = { 65, 24},
			size = { MENUWIDTH-66, 12},
			name = "subsystemBuildText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			clickThrough = 1,
			eventOpaque = 0,
		},
	},
	
	-- battle cruiser item to clone (can only build subsystems)
	{
		type = "Button",
		name = "subsystemQueueItem",
		position = { 0, 0},
		size = { MENUWIDTH, 24},
		visible = 0,
		eventOpaque = 0,
		clickThrough = 1,
		;
		
		-- title
		{
			type = "TextLabel",
			position = { 2, 0},
			size = { MENUWIDTH-4, 12},
			name = "shipName",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = SHIPTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			eventOpaque = 0,
			clickThrough = 1,
		},
			
		-- open research mgr button
		{
			type = "Button",
			name = "btnOpenBuildMgr",
			position = {0, 12},
			size = {64,12},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5451",--OPEN RESEARCH MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;
	
			-- progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = SUBQUEUECOLOR,
				position = { 2, 2},
				size = { 40, 8},
				name = "subsystemBuildProgress",
				giveParentMouseInput = 1,
			},
	
			-- pause and cancel buttons
			{
				type = "Button",
				name = "subsystemPauseButton",
				position = { 44, 2},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
			},
			{
				type = "Button",
				name = "subsystemCancelButton",
				position = { 54, 2},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
			},
		},

		{
			type = "TextLabel",
			position = { 65, 12},
			size = { MENUWIDTH-66, 13},
			name = "subsystemBuildText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			eventOpaque = 0,
			clickThrough = 1,
		},
	},
	
	-- research queue item to clone
	{
		type = "Button",
		name = "researchQueueItem",
		position = { 0, 0},
		size = { MENUWIDTH, 24},
		visible = 0,
		eventOpaque = 0,
		clickThrough = 1,
		;
		
		-- title
		{
			type = "TextLabel",
			position = { 2, 0},
			size = { MENUWIDTH-4, 12},
			name = "shipName",
			Text = {
				text = "$3126", -- RESEARCH
				font = "ChatFont",
				hAlign = "Left",
				color = SHIPTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			eventOpaque = 0,
			clickThrough = 1,
		},
			
		-- open research mgr button
		{
			type = "Button",
			name = "btnOpenResearchMgr",
			position = {0, 12},
			size = {64,12},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5451",--OPEN RESEARCH MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;
			
			
	
			-- progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = RESEARCHQUEUECOLOR,
				position = { 2, 2},
				size = { 40, 8},
				name = "researchProgress",
				giveParentMouseInput = 1,
			},
	
			-- pause and cancel buttons
			{
				type = "Button",
				name = "pauseButton",
				position = { 44, 2},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
			},
			{
				type = "Button",
				name = "cancelButton",
				position = { 54, 2},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
			},
		},

		{
			type = "TextLabel",
			position = { 65, 12},
			size = { MENUWIDTH-66, 13},
			name = "researchText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
			eventOpaque = 0,
			clickThrough = 1,
		},
	},
}
