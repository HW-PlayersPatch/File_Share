
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
-- GUI layout for the collapsable queues in the build and research managers

QUEUE_ITEM_HEIGHT = 20

-- _outlineColor => color of the queue outlines
-- _progressColor => color of the queue items progress bars
-- _droph => height of the drop down frame
function GetCollapsableQueue( _outlineColor, _progressColor, _droph )

local localCollapsableQueue = {
	type = "Frame",
	name = "collapsableQueue",
	--backgroundColor = {100,0,0,200},

	Layout = {		
		
		size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },										
						
	},	

	visible = 0,
	;
	
	-- Top frame
	{
		type = "Frame",
		name = "frameNonCollapsable",
		--size = {209, 20},
		Layout = {				
			size_WH = {	w = 1, h = QUEUE_ITEM_HEIGHT/600, wr = "par", hr = "scr" },		
						--pad_LT = { l = 4/800, t = 0, lr = "scr", tr = "px" },
			--pad_RB = { r = 4/800, b = 0, rr = "scr", br = "px" },	
			--			margin_RB = { r = 4/800, b = 0, rr = "scr", br = "px" },	
		},	


		--backgroundColor = {255,0,0,255},
		;
		
		-- border frame
		{
			type = "Frame",
			--position = {-1, 0},
			--size = {210, 19},
			Layout = {				
				size_WH = {	w = 1, h = QUEUE_ITEM_HEIGHT/600, wr = "par", hr = "scr" },		
			},	
	
			
			--borderColor = outlineColor,
			--borderWidth = 1,
		},
			
		-- frame to hold the header
		{
			type = "Frame",			
			Layout = {					
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
				--				margin_LT = { l = 8/800, t = 0.0, lr = "scr", tr = "px" },
				--margin_RB = { r = 8/800, b = 0.0, rr = "scr", br = "px" },		
			--pad_LT = { l = 4/800, t = 0, lr = "scr", tr = "px" },
			--pad_RB = { r = 4/800, b = 0, rr = "scr", br = "px" },	
			},	
			--arrangetype="horiz",
			arrangedir=1,
			arrangeSep = {	x=2/800, y=0, xr="scr", yr="px",},	
			--backgroundColor = {100,0,255,200},
			--borderColor = COLOR_WHITE_SOLID,
			--borderWidth = 1,
			backgroundColor = COLOR_BACKGROUND_HEADER,
			;

			-- frame to hold the actual header
			{
				type = "Frame",
				name = "frameBuildQueueHeader",	
				Layout = {					
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
					Flags = {
						hasVolume = 0,
						canArrange = 0,
					},
				},	
				--backgroundColor = {255,0,0,255},
				--arrangeweight=1,
			},

			
			-- title label (displayed when queue is empty)
			{
				type = "TextLabel",
				name = "lblNoTasksPending",
				visible = 0,
				--position = {0, 3},
				Layout = {					
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },	
					--pos_XY = { x = .5, y = .5, xr = "par", yr = "par" },
					--pivot_XY = { 0.5, 0.5 },
				},	
				Text = {
					font = "ChatFont",
					color = {172,172,172,255},
					hAlign = "Center",
					--offset = {18,0},	
				},
			},
			
			-- Pause build queue button
			{
				type = "Button",
				name = "btnPauseQueue",
		
				toggleButton = 1,

				Layout = {					
					pos_XY = { x = 0, y = .5, xr = "px", yr = "par" },
					size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },	
											
					pivot_XY = { 0, 0.5 },
					lockAspect=1,							
				},	
				--offset = {18,0},	
				--position = {180, 2},
				--size = { 13, 13},
				flashSpeed = 300,

				IconBase = {
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause.dds",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_DARK_SURFACE,
				},
				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Styles\\white.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_BUTTON_ALERT_SURFACE,
				},
		
				soundOnClicked = "SFX_ButtonClick",
		
				helpTip = "$5205", -- PAUSE QUEUE
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
			},
	
		




		},




		
	-- Expand / Collapse build queue buttons
	{
		type = "Button",
		name = "btnExpandQueue",
		
		Layout = {					
			pos_XY = { x = 1, y = .5, xr = "par", yr = "par" },
			size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },										
			pivot_XY = { 1, .5},
			lockAspect=1,		
					
		},	

		--position = {193, 3},
		--size = { 13, 13},
		flashSpeed = 300,
		
		IconBase = {
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.dds",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_ARROW_BUTTON_DARK_SURFACE,
		},
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\white.tga",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_BUTTON_SURFACE,
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5209", -- EXPAND QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "Button",
		name = "btnCollapseQueue",
		visible = 0,
		
		Layout = {					
			pos_XY = { x = 1, y = .5, xr = "par", yr = "par" },
			size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },										
			pivot_XY = { 1, 0.5 },
			lockAspect=1,							
		},	
		--position = {193, 3},
		--size = { 13, 13},
		flashSpeed = 300,

		IconBase = {
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.dds",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_ARROW_BUTTON_DARK_SURFACE,
		},
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\white.tga",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_BUTTON_SURFACE,
		},
		disabledColor 		= COLOR_LISTITEM_DISABLED,
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5210", -- COLLAPSE QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "Button",
		name = "btnExpandEmptyQueue",
		visible = 0,
		
		Layout = {					
			pos_XY = { x = 1, y = .5, xr = "par", yr = "par" },
			size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },										
			pivot_XY = { 1, .5 },
			lockAspect=1,							
		},	
		
		--position = {193, 3},
		--size = { 13, 13},
		flashSpeed = 300,
		
		--backgroundColor = COLOR_BUTTON_BGRD_DEFAULT,				
		--pressedColor = COLOR_BUTTON_BGRD_PRESSED,				
		--overColor = COLOR_BUTTON_BGRD_HOVER,				
		--disabledColor = COLOR_BUTTON_BGRD_DISABLED, 
		
		IconBase = {
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.dds",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_ARROW_BUTTON_DARK_SURFACE,
		},
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\white.tga",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_BUTTON_SURFACE,
		},

		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5209", -- EXPAND QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "Button",
		name = "btnCollapseEmptyQueue",
		visible = 0,
		
		Layout = {					
			pos_XY = { x = 1, y = .5, xr = "par", yr = "par" },
			size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },										
			pivot_XY = { 1, .5 },
			lockAspect=1,							
		},	

		--position = {193, 3},
		
		--size = { 13, 13},
		flashSpeed = 300,

		IconBase = {
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.dds",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_ARROW_BUTTON_DARK_SURFACE,
		},
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\white.tga",
			uvRect = { 0, 1, 1, 0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_BUTTON_SURFACE,
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5210", -- COLLAPSE QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},














	},
	
	-- Expandable frame
	{
		type = "Frame",
		name = "frameCollapsable",
		position = {0, 20},

		Layout = {					
			size_WH = {	w = 1, h = _droph/600, wr = "par", hr = "scr" },	
		},	
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
		--borderColor = _outlineColor,
		--	borderWidth = 1,
		--size = {209, _droph},
		--backgroundColor = {0,255,0,255},
		;
		-- border frame
		{
			type = "Frame",
			position = {-1, 0},
			Layout = {					
				size_WH = {	w = 1, h = _droph/600, wr = "par", hr = "scr" },	
			},	

		},
		
		-- Build queue list box
		{
			type = "ListBox",	
			name = "listQueue",
			listBoxStyle = "FEListBoxStyle",
			scrollBarSpace = 0,
			position = {0, 1},
			Layout = {					
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },	
			},	
		},
	},
	
	
	
	-- Label to display # of items in queue
	{
		type = "TextLabel",
		visible = 0,
		name = "lblItemCount",
		position = {138, 3},
		size = {20, 13},
		--backgroundColor = {200,0,0,255},
		dropShadow = 1,
		giveParentMouseInput = 1,
		Text = {
			font = "ChatFont",
			color = {255,255,255,255},
			hAlign = "Right",
			vAlign = "Center",
			offset = {-2, 0},
		},
	},
	---------------------------------------------------------- ITEMS TO CLONE ------------------------------
	-- Build queue list box item to clone
	{
		type = "ListBoxItem",
		name = "queueListBoxItem",
		--size = {192, 20},

		Layout = {					
			pad_LT = { l = 17/800, t = 0, lr = "scr", tr = "par" },
			--pad_RB = { r = 1/8, b = 1/8, rr = "par", br = "par" },	
			size_WH = {	w = 1, h = QUEUE_ITEM_HEIGHT/600, wr = "par", hr = "scr" },		
		},	
		arrangeSep = {	x=2/800, y=0, xr="scr", yr="px",},	

		visible = 0,
		enabled = 0,
		selectable = 0,
		arrangetype = "horiz",
		arrangedir=-1,
		--borderColor = COLOR_RED_SOLID,
		--borderWidth = 1,

		--borderWidth = 0,
		--borderColor = {0,0,0,0},
		--overBorderColor = {255,255,255,255},
		--pressedBorderColor = {255,255,255,255},
		--backgroundColor = {0,0,255,200},
		;
		
		{ -- Do not change the child/parent structure of this without changing code
			type = "ProgressBar",
			--progressColor = {240, 170, 0, 255},
			--position = {2,0},
			--size = {155,13},
			Layout = {					
				pos_XY = { x = 0, y = .5, xr = "px", yr = "par" },
				--pad_LT = { l = 4/800, t = 0, lr = "par", tr = "px" },
				--pad_RB = { r = 1/8, b = 1/8, rr = "par", br = "par" },	
				size_WH = {	w = 1, h = (QUEUE_ITEM_HEIGHT-4)/600, wr = "px", hr = "scr" },										
				pivot_XY = { 0, 0.5 },
				--size_WH = {	w = 1, h = 1, wr = "px", hr = "par"},							
			},	
			arrangeweight=1,

			name = "progressYella",
			--backgroundColor = {0,0,0,35},
			giveParentMouseInput = 1,
			backgroundColor = { 70, 74, 85, 190},
			progressColor = {255, 96, 31, 255},


			filledTextColor			= {255,255,255,255},
			emptyTextColor			= {32,216,234,255},
			--progressColor = {0, 170, 0, 255},

			Text = {
				font = "ButtonFont",
				color = {255,255,255,255},
				hAlign = "Middle",
				vAlign = "Middle",
				--dropShadow = 1,
				offset = {2,0},
			},
			

			;
			
			-- Ships name label (This -MUST- remain a child of the progress bar)
			-- Used in subsystem and ship queue
			{
				type = "TextLabel",			
				name = "lblName",
				position = {0,0},
				size = {157,13},
				giveParentMouseInput = 1,
				--dropShadow = 1,
				visible = 0, -- this gets custom rendered by QueueListBoxItem
				Text = {
					font = "ChatFont",
					color = {255,255,255,255},
					hAlign = "Left",
					vAlign = "Middle",
					offset = {2,0},
				},
			},
			
			-- Used for research queue (has a background icon)
			{
				type = "Frame",
				name = "frmResearchIcon",
				position = {2,2},
				--size = {13,13},
				Layout = {					
					pos_XY = {	x=0, y=.5, xr="px", yr="par",},	
					pivot_XY = { 0,  .5 },	
					size_WH = {	w = 10000, h = .8, wr = "px", hr = "par" },	
					lockAspect=1,
				},	

				visible = 0,
			},
			
			{
				type = "TextLabel",
				name = "lblResearchName",
				position = {13,0},
				size = {144,13},
				giveParentMouseInput = 1,
				visible = 0, 			-- this gets custom rendered by QueueListBoxItem
				Text = {
					font = "ChatFont",
					color = {255,255,255,255},
					hAlign = "Left",
					vAlign = "Middle",
					offset = {2,0},
				},
			},
		},
		
		{
			type = "Button",
			name = "btnCancelBuildQueueItem",
			flashSpeed = 300,

			Layout = {					
				pos_XY = { x = 0, y = .5, xr = "px", yr = "par" },
				size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },										
				pivot_XY = { 0, 0.5 },
				lockAspect=1,							
			},	

			--position = {159, 0},
			--size = { 13, 13},

			IconBase = {
				texture = "DATA:UI\\NewUI\\InGameIcons\\cancel.dds",
				uvRect = { 0, 1, 1, 0 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_ARROW_BUTTON_DARK_SURFACE,
			},
			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\white.tga",
				uvRect = { 0, 1, 1, 0 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_BUTTON_ALERT_SURFACE,
			},
			
			soundOnClicked = "SFX_ButtonClick",
			
			helpTip = "$5206", -- CANCEL QUEUE ITEM
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
		},
		
		{
			type = "Button",
			name = "btnMoveBuildQueueItemToTop",
			flashSpeed = 300,

			Layout = {					
				pos_XY = { x = 0, y = .5, xr = "px", yr = "par" },
				size_WH = {	w = QUEUE_ICON_WIDTH*2, h = 1000, wr = "scr_min", hr = "px" },										
				pivot_XY = { 0, 0.5 },
				lockAspect=1,							
			},	

			--position = {174, 0},
			--size = { 13, 13},

			IconBase = {
				texture = "DATA:UI\\NewUI\\InGameIcons\\move_to_top.dds",
				uvRect = { 0, 1, 1, 0 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_ARROW_BUTTON_DARK_SURFACE,
			},
			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\white.tga",
				uvRect = { 0, 1, 1, 0 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_BUTTON_SURFACE,
			},
			
			soundOnClicked = "SFX_ButtonClick",
			
			helpTip = "$5207", -- MOVE QUEUE ITEM TO TOP
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
		},
	},
}

return localCollapsableQueue;

end