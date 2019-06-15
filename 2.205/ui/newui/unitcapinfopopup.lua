-- Displays detailed information about unit caps when the user
--  mouses over the units menu
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

--UnitCapInfoPopupWidth = 225
UnitCapInfoPopupWidth = 235
MAXHEIGHT = 325

UnitCapInfoPopup= {

	maxColor = {255,0,0,255}, -- color for max pop reached
	availColor = {0,255,0,255},	-- color for pop available
	
	--size = {32, 71, 100, 200},
	autosize = 1,
	RootElementSettings = {

		autosize = 1,
		--backgroundColor          = {255,128,0,255},

		Layout = {	
			pad_LT  = { l = 8, t = 0, lr = "px", tr = "px" },
		},	
		
		Anchor_Binds = {
			pivotX = "Taskbar_LeftButtonsTopRight",
			pivotY = "Taskbar_LeftButtonsTopRight",
		},
	},
	
	soundOnShow = "SFX_RecallMenuONOFF",
	soundOnHide = "SFX_RecallMenuONOFF",	
	
	onShow = "UI_SetButtonPressed('NewTaskbar', 'btnFleet', 1); UI_HideScreen('BuildQueueMenu'); UI_HideScreen('EventsScreen')",
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnFleet', 0)", 
	
	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	arrangetype = "vert",
	clickThrough = 1,	
	;	

	{
		type = "Frame",
		name = "MainFrame",
		autosize = 1,
		giveParentMouseInput = 1,
		autoarrange = 1,

		arrangetype = "vert",

		;
		
		-- Frame to hold all unit caps
		{
			type = "Frame",
			name = "frmItems",
			autosize = 1,
			giveParentMouseInput = 1,
			arrangetype = "vert",
		},
		

	},


	-------------------- CLONES ---------------------------
		
	-- Tab spacer frame to clone
	{
		type = "Frame",
		name = "frmTabSpacer",
		size = {10, 1},
		--size = {1, 1},
		giveParentMouseInput = 1,
	},

	-- Title to clone
	{
		type = "TextLabel",
		name = "lblNameToClone",

		autosize=1,
		ignored = 1,
		--position = {4,0},
		Layout = {
			--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
			size_WH = { w = 1, h = STD_LABEL_HEIGHT, wr = "px", hr = "scr" },
								
		},

		--size = {UnitCapInfoPopupWidth-16, 15},
		Text = {
			textStyle = "IGHeading2",
			--minShrink = 0.25,
		},
		giveParentMouseInput = 1,
		dropShadow = 1,
		visible = 0,
	},
	
	-- Unit cap item to clone
	{
		type = "Frame",
		name = "frmItemToClone",
		autosize = 1,		
		giveParentMouseInput = 1,
		visible = 0,
		arrangetype = "horiz",

		Layout = {
			size_WH = { w = 1, h = 1, wr = "1", hr = "px" },								
		},
		;
		
		{
			type = "Frame",
			name = "frmName",
			autosize=1,
			arrangetype = "horiz",

			;
		},
		
		
		{	
			type = "TextLabel",
			name = "lblUnitCap",
			autosize=1,
			--backgroundColor = { 0, 255, 0, 200 },
			Layout = {
				min_WH = { w = 85, wr = "px" },
				pad_LT  = { l = 8, t = 1, lr = "px", tr = "px" },				
			},
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Right",
				--vAlign = "Middle",
				text = "<c %06x>%d</c>\/%d",
				minShrink = 0.25,
				--offset = {-6,0},
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},		
	},
		



}
	