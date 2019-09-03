dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

OUTLINECOLOR = COLOR_SCROLLGRIP_BORDER_PRESSED

--Load expanded options
dofilepath("data:ui/PlayersPatch_UI_Util.lua")
RefBuildResearchLaunchPanelsSCR = GetBuildResearchLaunchPanelsSCR()


NewLaunchMenu = {

	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		--backgroundColor = "IGColorBackground1",
		Layout = {	
			size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
		},

		--autosize=1,
	},
	giveParentMouseInput = 1,
	eventOpaque = 0,

	--
	soundOnShow = "SFX_LaunchMenuONOFF",
	soundOnHide = "SFX_LaunchMenuONOFF",
	
	shipHealthColor = {0,255,0,255},
		
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	

	onShow = "UI_SubtitleNarrow()",
	onHide = "UI_SubtitleWide()",

	
	-- custom values
	fstringDockedCount = "$2667",	-- localizer string to show number of docked ships, ie. "500/500"
	drawToShipLineStubLength = 10,	
	drawToShipLineColor = OUTLINECOLOR,
	drawToShipLineAnchor = "Anchor_ShipLineLaunch",
	;	
	{
		type = "Frame",
		name = "LaunchMenuRoot",
		Layout = {
			pivot_XY = { 1.0, 0.0 },					
			pos_XY = {	x=1, y=0, xr="par", yr="scr",},	

			max_WH = {	w = .3,  wr = "scr" },	
			size_WH = {	w = RefBuildResearchLaunchPanelsSCR,  wr = "scr" },	--400
			min_WH = {	w = .1,  wr = "scr" },	
		},		

		Anchor_Binds = {
			pivotY = "Taskbar_UpperRight",
			edgeB = "Taskbar_LowerRight",
			--edgeR = "Taskbar_UpperRight",
		},

		eventOpaque = 1,
		giveParentMouseInput = 0,
		backgroundColor = "IGColorBackground1",
		cursorType = "Normal",
		;
		-- This Frame is used for padding
		{
			type = "Frame",
			name = "LaunchMenuMainInnerFrame",

			Layout = {
				pad_LT  = { l = BUILDPANEL_PAD_HORIZ, t = BUILDPANEL_PAD_VERT, lr = "scr_min", tr = "scr" },
				pad_RB  = { r = BUILDPANEL_PAD_HORIZ, b = 0, rr = "scr_min", br = "scr" },
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },						
			},
			--borderWidth = 1,
			--borderColor = { 0, 255, 255, 255},

			arrangetype = "vert",
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME,
			;

			
	------------------------- Ships that can launch -------------------------
			{
				type = "Frame",
				name = "ShipsToLaunchFrame",	

				Layout = {	
					max_WH = {	w= 1.0, h = .5,  wr="par", hr = "par_min" },	
					min_WH = {	w = 1.0, h = .1, wr = "par", hr = "par" },
				},

				BackgroundGraphic = DECO_GRID,
				backgroundColor = COLOR_BACKGROUND_SUBPANEL,
				;
				{
					type = "Frame",
					name = "JustForTheSideDecoLines",					
					Layout = {				
						size_WH = {	w = 1, h = 1.0, wr = "par", hr = "par" },							
					},	
					BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
					arrangetype = "horiz"
					;

					-- Prev button
					{
						type = "Button",
						name = "btnPrev",
						buttonStyle = "IGPrevButton",
						toggleButton = 0,
						Layout = {								
							size_WH = {	w = 16/800, h = 1, wr = "scr_min", hr = "par" },
						},
						helpTip = "$5219", -- PREV LAUNCH SHIP
						helpTipTextLabel = "commandsHelpTip",
						helpTipScreen = "NewTaskbar",
						
						Anchor_Spawns = 
						{
							{
								anchorName = "Anchor_ShipLineLaunch",
								relativePos = { -0.5, 0.5 },
							},
						},

					},
					---------------- Ship Selection	Area		
					{
						type = "Frame",
						name = "LaunchFromShipIconArea",
						arrangeweight = 1,

						Layout = {								
							size_WH = {	w = 0, h = 1.0, wr = "px", hr = "par" },
							pad_RB  = { r = 0, b = BUILDPANEL_PAD_VERT, rr = "scr", br = "scr" },  -- To Get the health bar off the bottom
						},		
						;				
						-- Ship graphic
						{	
							type = "Frame",
							name = "frameShipGraphic",

							Layout = {		
								max_WH = {	w = 10000, h = 1.0, wr = "px", hr = "par" },		
								size_WH = {	w = 10000, h = 1.0, wr = "px", hr = "par" },								
								pos_XY = { x = 0.5, xr = "par" },		
								pivot_XY = { .5,  0 },		
								lockAspect=2,
								Flags = {hasVolume = 0 },		
							},		

							backgroundGraphicHAlign = "Center",
							backgroundGraphicVAlign = "Center",
							helpTip = "$5217", -- CLICK ICON TO FOCUS
							helpTipTextLabel = "commandsHelpTip",
							helpTipScreen = "NewTaskbar",
						},
						-- Health Bar
						{
							type = "ProgressBar",
							name = "launchShipHealth",

							backgroundColor = { 0, 128, 0, 255},
							progressColor = { 0, 255, 0, 255},
							borderColor = { 0, 0, 0, 255},
							outerBorderWidth = 1,
					
							Layout = {								
								size_WH = {	w = 1, h = 4.0, wr = "par", hr = "px" },
								pos_XY = { y = 1.0, yr = "par" },		
								pivot_XY = { 0,  1 },			
							},							
						},	
						-- Choose ship combo box
						{					
							type = "DropDownListBox",
							name  = "launchShipList",
							backgroundColor          = COLOR_LISTITEM,
							BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
							dropDownListBoxStyle = "IGDropDownListBoxStyle",
							autosize = 1,
					
							Layout = {		
								pos_XY = { y = 0.0, yr = "par" },							
								size_WH = {	w = 1, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr" },
							},
							visible = 1,
					
		
							ListBox = {
								type = "ListBox",
								listBoxStyle = "FEListBoxStyle_Bordered",
								name = "comboBuildShipListBox",
								Layout = {								
									size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },									
								},	
								backgroundColor = "IGColorBackground1",
								BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
							},
		
							helpTip = "$5216", -- SELECT LAUNCH SHIP
							helpTipTextLabel = "commandsHelpTip",
							helpTipScreen = "NewTaskbar",
						},
				

					},
					-- Next button
					{
						type = "Button",
						name = "btnNext",
						toggleButton = 0,
						buttonStyle = "IGNextButton",
						Layout = {								
							size_WH = {	w = 16/800, h = 1, wr = "scr_min", hr = "par" },		
						},
						helpTip = "$5218", -- NEXT LAUNCH SHIP
						helpTipTextLabel = "commandsHelpTip",
						helpTipScreen = "NewTaskbar",
					},
				},
			},

			---------------------- Stay Docked / Autolaunch buttons ----------------------
			{
				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },						
				},	

				arrangetype = "vert",
				autosize=1,
				;
	
				{
					type = "RadioButton",
					name = "stayDockedButton",
					
					Layout = {								
						size_WH = {w = .8, h = STD_LABEL_HEIGHT/2, wr = "par", hr = "scr",},
					},
					
					buttonStyle = "IGRadioButtonStyle",
					Text = {
						text = "$2662",		-- STAY DOCKED
						textStyle = "IGRadioButtonTextStyle",
						minShrink = 0.25,
					},
			
					helpTip = "$5222", -- SHIPS WILL REMAIN DOCKED
					helpTipTextLabel = "commandsHelpTip",
					helpTipScreen = "NewTaskbar",
			
				},
				{
					type = "RadioButton",
					name = "autoLaunchButton",
					
					Layout = {								
						size_WH = {w = .8, h = STD_LABEL_HEIGHT/2, wr = "par", hr = "scr",},
					},
					
					buttonStyle = "IGRadioButtonStyle",
					Text = {
						text = "$2663",		-- AUTO LAUNCH
						textStyle = "IGRadioButtonTextStyle",
						minShrink = 0.25,
					},
			
					helpTip = "$5223", -- SHIPS WILL AUTOLAUNCH
					helpTipTextLabel = "commandsHelpTip",
					helpTipScreen = "NewTaskbar",
				},
			},

			
			-- docked ship title/count
			{
				type = "Frame",
				Layout = {						
					size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },		
					pad_LT = { l = TITLE_PAD_HORIZ, t = TITLE_PAD_VERT, lr = "scr", tr = "scr" },
					pad_RB = { r = TITLE_PAD_HORIZ, b =TITLE_PAD_VERT, rr = "scr", br = "scr" },		
				},		
				backgroundColor = {27, 69, 85, 128},
				autosize=1,
				--backgroundColor = OUTLINECOLOR,
				;
				{
					type = "TextLabel",

					Layout = {								
						size_WH = {w = .70, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
					},
					autosize=1,

					Text = {
						textStyle = "IGHeading2",
						text = "$2666",		-- DOCKED SHIPS
						color = COLOR_LABEL_TITLETEXT,
						vAlign = "Middle",
						minShrink = 0.25,
					},
				},
				{
					type = "TextLabel",
					name = "dockedCountLabel",

					Layout = {								
						size_WH = {w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
						pos_XY = { x = 1.0, xr = "par" },		
						pivot_XY = { 1,  0 },		
					},	
					autosize=1,

					Text = {
						textStyle = "IGHeading2",
						color = COLOR_LABEL_VALUETEXT, 
						vAlign = "Middle",
						hAlign = "Right",
						text = "12/12",
						minShrink = 0.25,
					},
				},
			},	

			------------------- docked ships list box
			{
				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
					--pad_LT = { l = 8.0, t = 8.0, lr = "px", tr = "px" },
					--pad_RB = { r = 8.0, b = 8.0, rr = "px", br = "px" },					
				},	
				arrangeweight = 1.0,
				autosize=1,
				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
				;
		
				{
					type = "ListBox",
					name = "dockedShipList",
					marginWidth = 2,
					marginHeight = 2,
				
					Layout = {			
						size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
						--margin_LT = { l = 8.0, t = 0.0, lr = "px", tr = "px" },
						--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },			
					},

					scrollBarSpace = 2,
					marginWidth = 2,
					marginHeight = 0,
				
					--contentsOuterBorderWidth = 2,
					--contentsBorderColor = OUTLINECOLOR,
					scrollBarPageSize = 100,
					scrollBarStepSize = 3,

					multiSelect = 1,

					listitemsArrangeArray = 4,
					listitemsArrangeType = "vert",

					helpTip = "$5220", -- SELECT SHIPS TO LAUNCH
					helpTipTextLabel = "commandsHelpTip",
					helpTipScreen = "NewTaskbar",
					arrangeweight = 1.0,
				},
			},

			--------------Launch and autolaunch buttons
			{
				type = "Frame",
				Layout = {							
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
					margin_RB = { r = 0.0, b = 2.0, rr = "px", br = "px" },					
				},	

				arrangetype = "horiz",
				autosize=1,
				;

				-- Launch button
				{
					type = "TextButton",
					name = "launchButton",
					Layout = {	
						size_WH = {	w = .5, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },						
					},	
					buttonStyle = "FEButtonStyle1_Outlined_Chipped",			
	
					Text = {
						text = "$2664",
						--pixels = (16),
						rel = 1080,
						minShrink = 0.25,
						--textStyle = "IGButtonTextStyle",
					},
					wrapping = 1,
					helpTip = "$5225", -- LAUNCH SELECTED SHIPS ONLY
					helpTipTextLabel = "commandsHelpTip",
					helpTipScreen = "NewTaskbar",
				},
	
				-- Launch All button
				{
					type = "TextButton",
					name = "launchAllButton",

					Layout = {	
						size_WH = {	w = .5, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },	
						--size_WH = {	w = .5, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },						
					},	
			
					buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",			
					
					Text = {
						text = "$2665",
						--pixels = (16),
						rel = 1080,
						minShrink = 0.25,
						--textStyle = "IGButtonTextStyle",
					},
					helpTip = "$5224", -- LAUCNH ALL SHIPS
					helpTipTextLabel = "commandsHelpTip",
					helpTipScreen = "NewTaskbar",
				},

			},




		},
		-- Drag Handle for size
		{
			type = "DragHandle",
			dragType = "sizeL",
			Layout = {			
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = BUILDPANEL_PAD_HORIZ, h = 1.0, wr = "scr_min", hr = "par" },
				pivot_XY = { 0.0, 0.0 },
				Flags = { canArrange = 0,hasVolume=0 },			
			},	
			overColor = {0,80,80,64},
			--backgroundColor = {255,0,0,128},
			--backgroundColor = COLOR_RED_SOLID,
			elementToDrag = "LaunchMenuRoot",
			cursorType = "Drag_LR",
		},


	},

	-- help tip	text label
	{
		type = "TextLabel",
		name = "helpTipTextLabel",
		--position = { 0, 441 },
		visible = 0,
		size = { 210, 19},
		ignored=1,
		marginWidth = 6,
		Text = {
			textStyle = "IGHeading2",
			hAlign = "Left",
			color = { 255, 255, 255, 255},
		},
	},

------------------------------------------------------------------
--------------------- ITEMS TO CLONE -----------------------
	 -- Ship name dropdown item to clone
	{
		type = "TextListBoxItem",
		name = "launchShipItem",
		pressedColor = COLOR_LISTITEM,

		buttonStyle = "IGListBoxItemButtonStyle",			
		resizeToListBox = 1,

		visible = 0,
		enabled = 0,
		ignored = 1,

		Text = {
			textStyle = "IGListBoxItemTextStyle",
			minShrink = 0.25,
		},
	},

	-- docked ships item to insert into list box
	{

		type = "ListBoxItem",
		name = "dockedShipItem",
		helpTipTextLabel = "helpTipTextLabel",
		resizeToListBox = 0,
		visible = 0,
		ignored=1,
		toggleButton = 1,		

		Layout = {
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
			size_WH = { w = .25, h = 1000, wr = "par", hr = "px" },
			--min_WH = { w = .1, h = 10000, wr = "scr_min", hr = "px" },
			--max_WH = { w = .3, h = 10000, wr = "par", hr = "px" },
			lockAspect=2,
		},		

		--DefaultGraphic = {
		--	texture = "DATA:UI\\NewUI\\Taskbar\\ship_button.mres",
		--	textureUV = { 1,1,84,31},
		--},
		--OverGraphic = {
		--	texture = "DATA:UI\\NewUI\\Taskbar\\ship_button.mres",
		--	textureUV = { 1,33,84,63},
		--},
		--PressedGraphic = {
		--	texture = "DATA:UI\\NewUI\\Taskbar\\ship_button.mres",
		--	textureUV = { 1,65,84,95},
		--},
		--DisabledGraphic = {
		--	texture = "DATA:UI\\NewUI\\Taskbar\\ship_button.mres",
		--	textureUV = { 1,97,84,127},
		--},

		overColor = COLOR_SHIP_ITEMOVERCOLOR,
		pressedColor = COLOR_SHIP_ITEMPRESSEDCOLOR,
		flashColor = COLOR_SHIP_ITEMOVERCOLOR,

		helpTipTextLabel = "commandsHelpTip",		
		soundOnClicked 		= "SFX_ButtonClick",


		;
		{
			type = "Frame",
			name = "shipIcon",			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
				
			},		
			giveParentMouseInput = 1,
			backgroundGraphicHAlign = "Center",
			backgroundGraphicVAlign = "Center",
			;
			{
				type = "ProgressBar",
				backgroundColor = { 99, 101, 99, 255},
				progressColor = { 51, 255, 0, 255},				
				Layout = {
					pos_XY = { x = 0.12, y = 0.8, xr = "par", yr = "par" },
					size_WH = { w = 0.76, h = 0.075, wr = "par", hr = "par" },
				},				
				name = "shipHealth",
				giveParentMouseInput = 1,
			},
			{
				type = "TextLabel",							
				Layout = {
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
					size_WH = { w = 0.89, h = 0.8, wr = "par", hr = "par" },
				},			
				name = "shipCount",
				Text = {
					--textStyle = "TaskbarHD_ButtonTextStyle",
					color = { 255, 255, 255, 255},
					hAlign = "Right",
					vAlign = "Bottom",
					font = "ButtonFont",
					minShrink = .1,
				},
				giveParentMouseInput = 1,
			},
		},

	},
}
