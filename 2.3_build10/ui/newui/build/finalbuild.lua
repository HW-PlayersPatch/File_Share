dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

LAUNCHMENUWIDTH = 210/800
OUTLINECOLOR = COLOR_SCROLLGRIP_BORDER_PRESSED
SHIPQUEUECOLOR = COLOR_SCROLLGRIP_BORDER_DEFAULT
SUBQUEUECOLOR = COLOR_SCROLLGRIP_BORDER_HOVER

DISABLEDICONCOLOR = { 90, 155, 211, 100}

UNITCAPSREACHEDCOLOR1 = {180,0,0,255} -- outline color
UNITCAPSREACHEDCOLOR2 = {255,0,0, 30} -- background color

dofilepath("data:ui/newui/build/collapsablequeue.lua")

--Load expanded options
dofilepath("data:ui/PlayersPatch_UI_Util.lua")
RefBuildResearchLaunchPanelsSCR = GetBuildResearchLaunchPanelsSCR()


NewBuildMenu = {

	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {			
		Layout = {		
			size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
		},
	},
	--backgroundColor = {0,255,0,128},
		giveParentMouseInput = 1,
	eventOpaque = 0,
	--autosize=1,
	--
	soundOnShow = "SFX_BuildMenuONOFF",
	soundOnHide = "SFX_BuildMenuONOFF",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	onShow = "UI_SubtitleNarrow()",
	onHide = "UI_HideScreen(\"BuildInfo\"); UI_SubtitleWide()",
	
	
	-- Custom to build menu	
	textureFolder = "DATA:\\UI\\NewUI\\Build",
	drawToShipLineStubLength = 10,
	drawToShipLineColor = OUTLINECOLOR,
	drawToShipLineAnchor = "Anchor_ShipLineBuild",

	neverAvailBorderColor = {0,0,0,255}, -- disabled color for facility buttons that are never available
	notYetAvailBorderColor = DISABLEDICONCOLOR, -- disabled color for facility buttons that are not yet available
	unitCapsReachedColor = UNITCAPSREACHEDCOLOR2,
	unitCapsReachedTextColor = UNITCAPSREACHEDCOLOR1,
	buildItemUnavailableColor = COLOR_LISTITEM_DISABLED,


	fstringRU = "$2640",  -- The localizer id for a string that says RU (appears to the left of the ship price on the items)
	fstringQueue = "$2641", -- The localizer id for the format string for the build queue item
	fstringSubsytemsReplace = "$2565", -- REPLACE : %d
	
	queuesFramePos = 494, -- y position of the bottom of the collapsable queues frame
	
	shipNameDisabledColor = {175,175,175,64},
	
	shipQueueTitle = "$2566",--Ship Queue (Empty)
	subsystemQueueTitle = "$2567",--Subsystem Queue (Empty)
		
	subsysColor = SUBQUEUECOLOR,
	
	menuColor = OUTLINECOLOR,
	
	fstringHardpoints = "$2568",		-- format string for harpoint slots at top of menu
	fstringUnitCaps = "$2569",  -- format string for unit caps headers (%06x is for the color [ red when maxed out ])
	
	arrangetype = "vert",
	;
	{
		type = "Frame",
		name = "BuildMenuRoot",
		Layout = {
			pivot_XY = { 1.0, 0.0 },					
			pos_XY = {	x=1, y=0, xr="par", yr="scr",},	

			max_WH = {	w = .3,  wr = "scr" },	
			size_WH = {	w = RefBuildResearchLaunchPanelsSCR,  wr = "scr" },	--420
			min_WH = {	w = .1,  wr = "scr" },	
		},
		cursorType = "Normal",
		
		Anchor_Binds = {
			pivotY = "Taskbar_UpperRight",
			edgeB = "Taskbar_LowerRight",
			--edgeR = "Taskbar_UpperRight",		
		},

		eventOpaque = 1,
		giveParentMouseInput = 0,
		backgroundColor = "IGColorBackground1",
		;

		-- This Frame is used for padding
		{
			type = "Frame",
			name = "BuildMenuMainInnerFrame",

			Layout = {
				pad_LT  = { l = BUILDPANEL_PAD_HORIZ, t = BUILDPANEL_PAD_VERT/3, lr = "scr_min", tr = "scr" },
				pad_RB  = { r = BUILDPANEL_PAD_HORIZ, b = BUILDPANEL_PAD_VERT/3, rr = "scr_min", br = "scr" },
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },						
			},
			--borderWidth = 1,
			--borderColor = { 0, 255, 255, 255},

			arrangetype = "vert",
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME,
			;
			-- Anchor frame
			{
				type = "Frame",
				Layout = {
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
					Flags = { hasVolume = 0, canArrange = 0, canUniform = 0, canMeasure = 0 },				
				},
				visible=0,
				borderWidth = 1,
				borderColor = { 255, 255, 255, 255},
				backgroundColor = COLOR_RED_SOLID,
				Anchor_Spawns = 
				{
					{
						anchorName = "BuildMenu_LeftSide",
						relativePos = { 0.0, 0.0 },
					},		
					{
						anchorName = "BuildMenu_RightSide",
						relativePos = { 1.0, 0.0 },
					},		
					{
						anchorName = "BuildMenu_Bottom",
						relativePos = { 0.0, 1.0 },
					},	
				},

			},
			---------------------- Ship Selection Area ----------------------
			{
				type = "Frame",
				name = "ShipsThatBuildFrame",		

				Layout = {	
					max_WH = {	w= 1.0, h = .4,  wr="par", hr = "par_min" },	
					min_WH = {	w = 1.0, h = .1, wr = "par", hr = "par" },
				},

		
				BackgroundGraphic = DECO_GRID,
				backgroundColor = COLOR_BACKGROUND_SUBPANEL,

				--borderWidth = 1,
				--borderColor = { 255, 255, 255, 255},
				--backgroundColor = COLOR_RED_SOLID,
				;
				{
					type = "Frame",
					name = "JustForTheSideDecoLines",		
					Layout = {
						size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },						
					},
					BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
					arrangetype = "horiz",
					;
					-- Prev button
					{
						type = "Button",
						name = "btnPrev",
						buttonStyle = "IGPrevButton",
						toggleButton = 0,
						Layout = {								
							size_WH = {	w = 16/800, h = 1, wr = "scr_min", hr = "par" },
						--	Flags = {hasVolume = 0 },
						},
						helpTip = "$5203", -- PREVIOUS BUILD SHIP
						helpTipTextLabel = "commandsHelpTip",
						helpTipScreen = "NewTaskbar",
						
						Anchor_Spawns = 
						{
							{
								anchorName = "Anchor_ShipLineBuild",
								relativePos = { -0.5, 0.5 },
							},
						},
					},						
					-- Vertical frame for the ship, dropdown and health
					{
						type = "Frame",
						name = "BuildShipIconArea",
						arrangeweight = 1,

						Layout = {								
							size_WH = {	w = 0, h = 1.0, wr = "px", hr = "par" },
							pad_RB  = { r = 0, b = BUILDPANEL_PAD_VERT, rr = "scr", br = "scr" },  -- To Get the health bar off the bottom
						},		
						--borderWidth = 1,
						--borderColor = { 0, 0, 255, 255},
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
							helpTip = "$5201", -- CLICK ICON TO FOCUS
							helpTipTextLabel = "commandsHelpTip",
							helpTipScreen = "NewTaskbar",

							--borderWidth = 1,
							--borderColor = { 255, 255, 255, 255},
						},
						-- Health Bar
						{
							type = "ProgressBar",
							name = "buildShipHealth",

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
							name  = "comboBuildShip",
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
								name = "comboBuildShipListBox",
								Layout = {							
									size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },										
								},
								backgroundColor = "IGColorBackground1",
								BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
							},
		
							helpTip = "$5200", -- SELECT BUILD SHIP
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
						--	Flags = {hasVolume = 0 },
						},
						helpTip = "$5202", -- NEXT BUILD SHIP
						helpTipTextLabel = "commandsHelpTip",
						helpTipScreen = "NewTaskbar",
					},

				},
			},
			---------------------- END Ship Selection Area ----------------------

			---------------------- Subsystem stat labels ----------------------
			{
				type = "Frame",
				Layout = {		
					max_WH = {	w= 1.0, wr="par" },	
					min_WH = {	w = 1.0, wr = "par", },	
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
					margin_LT = { l = 8.0, t = 0.0, lr = "px", tr = "px" },
					margin_RB = { r = 8.0, b = 2.0, rr = "px", br = "px" },					
				},	

				arrangetype = "vert",
				autosize=1,
				--backgroundColor = COLOR_BLUE_SOLID,
				--borderWidth = 1,
				--borderColor = { 0, 255, 255, 255},
				;
				-- Production Slots
				{
					type = "Frame",
					Layout = {			
						size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },						
					},	
					autosize = 1,
					hideWhenEmpty = 1,
					;
					-- hardpoint names
					{
						type = "TextLabel",
						name = "lblProductionHeading",
						autosize=1,
						ignored = 1,
						Layout = {			
							size_WH = {	w = .7, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
						},

						dropShadow = 1,
						Text = {
							text = "$2815", -- "Production Slots",
							textStyle = "IGHeading2",
							minShrink = 0.25,
						},
					},
					-- hardpoint status count
					{
						type = "TextLabel",
						name = "lblProductionCount",
						ignored = 1,
						Layout = { 
							size_WH = {w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
							pos_XY = { x = 1.0, xr = "par" },		
							pivot_XY = { 1,  0 },	
							
						},

						autosize = 1,
	
						dropShadow = 1,

						Text = {
						textStyle = "IGHeading2",
							hAlign = "Right",
							minShrink = 0.25,
						},						
					},

				},

				-- Module Slots
				{
					type = "Frame",
					Layout = {			
						size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },						
					},	
					autosize = 1,
					hideWhenEmpty = 1,
					;
					-- module label
					{
						type = "TextLabel",
						name = "lblModuleHeading",
						autosize=1,
						ignored = 1,
						Layout = {			
							size_WH = {	w = .7, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },							
						},

						dropShadow = 1,
						Text = {
							text = "$2816", -- "Module Slots",
							textStyle = "IGHeading2",
							minShrink = 0.25,
						},

					},
					-- module count
					{
						type = "TextLabel",
						name = "lblModuleCount",
						ignored = 1,
						Layout = {								
							size_WH = {w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
							pos_XY = { x = 1.0, xr = "par" },		
							pivot_XY = { 1,  0 },	
						},

						autosize = 1,
	
						dropShadow = 1,
						Text = {
						textStyle = "IGHeading2",
							hAlign = "Right",
							minShrink = 0.25,
							},
					},

				},
				
				-- Sensors Slots
				{
					type = "Frame",
					Layout = {			
						size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },						
					},	
					autosize = 1,
					hideWhenEmpty = 1,
					;
					-- sensors label
					{
						type = "TextLabel",
						name = "lblSensorsHeading",
						autosize=1,
						ignored = 1,

						Layout = {								
							size_WH = {w = .70, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
						},

						dropShadow = 1,
						Text = {
							text = "$2817", -- "Sensors Slots",
							textStyle = "IGHeading2",
							minShrink = 0.25,
						},

					},
					-- sensors count
					{
						type = "TextLabel",
						name = "lblSensorsCount",
						ignored = 1,

						Layout = {								
							size_WH = {w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
							pos_XY = { x = 1.0, xr = "par" },		
							pivot_XY = { 1,  0 },		
						},	

						autosize = 1,
	
						dropShadow = 1,
						Text = {
						textStyle = "IGHeading2",
							hAlign = "Right",
							minShrink = 0.25,
							},
					},

				},

			},
			---------------------- END Subsystem stat labels ----------------------
						-------- Horizontal Facility Icons
			{
				type = "Frame",
				name = "frameButtonGroup",

				Layout = {
					pad_LT  = { l = TITLE_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
					pad_RB  = { r = 0, b = 0, rr = "scr", br = "scr" },	
					size_WH = {	w = 1, h = FACILITY_BUTTON_HEIGHT, wr = "par", hr = "scr" },
					max_WH = {	w = 1, h = FACILITY_BUTTON_HEIGHT, wr = "par", hr = "scr" },
				},	
				autoarrangeSpace = 2,
				arrangetype = "horiz",
				autosize=1,
				helpTip = "$5211", -- SELECT FACILITY
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
				--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
				backgroundColor = COLOR_BACKGROUND_SUBPANEL,
				;
		
				-- Normal facility buttons	
				GetFacilityButton("Utility", "$2623", 94, { 0/64, 320/512, 64/64, 384/512 }),
				GetFacilityButton("Corvette", "$2624", 91, { 0/64, 64/512, 64/64, 128/512 }),
				GetFacilityButton("Capital", "$2625", 93, { 0/64, 192/512, 64/64, 256/512 }),
				GetFacilityButton("SubSystemModule", "$2643", 95, { 0/64, 384/512, 64/64, 448/512 }),
				GetFacilityButton("SubSystemSensors", "$2644", 97, { 0/64, 448/512, 64/64, 512/512 }),
				GetFacilityButton("Fighter", "$2627", 90, { 0/64, 0/512, 64/64, 64/512 }),
				GetFacilityButton("Frigate", "$2628", 92, { 0/64, 128/512, 64/64, 192/512 }),
				GetFacilityButton("Platform", "$2629", 96, { 0/64, 256/512, 64/64, 320/512 }),
				GetFacilityButton("Resource", "$2638", 109, { 0/64, 320/512, 64/64, 384/512 }),
				GetFacilityButton("NonCombat", "$2639", 110, { 0/64, 448/512, 64/64, 512/512 }),

			},


			------------------------Ship Build Area------------------
			{
				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
					--margin_LT = { l = 0.0, t = 8/600, lr = "px", tr = "scr" },
					--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },					
				},	
				--backgroundColor = COLOR_RED_SOLID,
				
				arrangetype = "vert",
				autosize=1,
				;

				----------------- Facility Sub Heading -----------------
				{
					type = "Frame",
					Layout = {						
						size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },		
						pad_LT = { l = TITLE_PAD_HORIZ, t = TITLE_PAD_VERT, lr = "scr", tr = "scr" },
						pad_RB = { r = TITLE_PAD_HORIZ, b =TITLE_PAD_VERT, rr = "scr", br = "scr" },		
					},	
					backgroundColor = COLOR_BACKGROUND_HEADER,
					autosize=1,

					--borderWidth = 2,
					--borderColor = { 0, 255, 0, 255},


					;
					{
						type = "TextLabel",
						name = "lblCurrentFacility",

						Layout = {								
							size_WH = {w = .70, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
						},
						autosize=1,
						Text = {
							textStyle = "IGHeading2",
							color = COLOR_LABEL_TITLETEXT, 
							--offset = {6,0},
							vAlign = "Middle",
							minShrink = 0.25,
						},
					},
	
					-- Unit caps label
					{
						type = "TextLabel",
						name = "lblFacilityUnitCaps",

						Layout = {		
							pivot_XY = { 1, 0.0 },					
							pos_XY = {	x=1, y=0.0, xr="par", yr="par"},						
							size_WH = {w = .25, h = STD_LABEL_HEIGHT/2, wr = "par", hr = "scr",},
							Flags = {hasVolume = 0 },
						},	
						--autosize=1,
						--backgroundColor = COLOR_BLUE_SOLID,
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
			},

			----------------------------------------------------------------
			{
				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 100.0, wr = "par", hr = "px" },
					max_WH = {	w = 1, wr = "par" },	
					min_WH = {	w = 1, wr = "par" },
					--margin_LT = { l = 0.0, t = 8/600, lr = "px", tr = "scr" },
					--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },					
				},	
				--backgroundColor = COLOR_RED_SOLID,
				arrangetype = "horiz",
				name = "BuildAreaFil",
				autosize=1,
				arrangeweight = 1.0,
				--backgroundColor = COLOR_BLUE_SOLID,
				--borderWidth = 1,
				--borderColor = { 255, 255, 255, 255},
				--backgroundColor = COLOR_RED_SOLID,
				--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
				backgroundColor = COLOR_BACKGROUND_SUBPANEL,
				;
				
				
				------------------- Vertical Build Buttons -----------------
				-- NOTICE: The names of these buttons must match the family names (the strcmp is case insensitive)
			--	{
			--		type = "Frame",
			--		name = "frameButtonGroup",

			--		Layout = {
			--			pad_LT  = { l = TITLE_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
			--			pad_RB  = { r = 0, b = 0, rr = "scr", br = "scr" },	
			--			size_WH = {	w = FACILITY_BUTTON_HEIGHT*.95, h = 1, wr = "scr", hr = "par" },
						--max_WH = {	w = FACILITY_BUTTON_HEIGHT, wr = "scr" },
			--		},	



			--		autoarrangeSpace = 2,
			--		arrangetype = "vert",
			--		autosize=1,
			--		helpTip = "$5211", -- SELECT FACILITY
			--		helpTipTextLabel = "commandsHelpTip",
			--		helpTipScreen = "NewTaskbar",
					--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
			--		backgroundColor = COLOR_BACKGROUND_SUBPANEL,
			--		;
		
					-- Normal facility buttons	
			--		GetFacilityButton("Utility", "$2623", 94, { 0/64, 320/512, 64/64, 384/512 },1),
			--		GetFacilityButton("Corvette", "$2624", 91, { 0/64, 64/512, 64/64, 128/512 },1),
			--		GetFacilityButton("Capital", "$2625", 93, { 0/64, 192/512, 64/64, 256/512 },1),
			--		GetFacilityButton("SubSystemModule", "$2643", 95, { 0/64, 384/512, 64/64, 448/512 },1),
			--		GetFacilityButton("SubSystemSensors", "$2644", 97, { 0/64, 448/512, 64/64, 512/512 },1),
			--		GetFacilityButton("Fighter", "$2627", 90, { 0/64, 0/512, 64/64, 64/512 },1),
			--		GetFacilityButton("Frigate", "$2628", 92, { 0/64, 128/512, 64/64, 192/512 },1),
			--		GetFacilityButton("Platform", "$2629", 96, { 0/64, 256/512, 64/64, 320/512 },1),
			--		GetFacilityButton("Resource", "$2638", 109, { 0/64, 320/512, 64/64, 384/512 },1),
			--		GetFacilityButton("NonCombat", "$2639", 110, { 0/64, 448/512, 64/64, 512/512 },1),

			--	},
		
				----------------------- Build List Box -----------------------
		
				{

					type = "Frame",
					Layout = {			
						size_WH = {	h = 1.0,  hr = "par" },	
						--pad_LT = { l = 8.0, t = 8.0, lr = "px", tr = "px" },
						--pad_RB = { r = 8.0, b = 8.0, rr = "px", br = "px" },					
					},	

					--borderWidth = 1,
					--borderColor = { 0, 255, 255, 255},
					arrangeweight = 1.0,
					--autosize=1,
					--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
					--backgroundColor = COLOR_GREEN_SOLID,

					backgroundColor = COLOR_BACKGROUND_SUBPANEL,
					;
		
					{
						type = "ListBox",
						name = "listBuild",
						listBoxStyle = "FEListBoxStyle_Bordered",

						--marginWidth = 2,
						--marginHeight = 2,

						Layout = {			
							size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
		
						},	

						scrollBarSpace = 2,		
		
						--contentsOuterBorderWidth = 2,
						--contentsBorderColor = OUTLINECOLOR,
						scrollBarPageSize = 100,
						scrollBarStepSize = 3,

						--backgroundColor = COLOR_RED_SOLID,
				
						;
					},
				},


			},

			
		----------------- Show all button ---------------
		{
			type = "Frame",
			Layout = {			
					size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },	
					pad_LT = { l = 8.0, t = 2.0, lr = "px", tr = "px" },
					pad_RB = { r = 8.0, b = 2.0, rr = "px", br = "px" },							
			},	

			backgroundColor = COLOR_BACKGROUND_SUBPANEL,
			autosize=1,
			;
			{
				type = "TextButton",
				name = "btnShowAll",
				toggleButton = 1,

				buttonStyle = "FEButtonStyle1_Chipped",
			
				Layout = {			
					size_WH = {	w = 1, h = LISTBOXITEM_HEIGHT, wr = "par", hr = "scr" },	
					pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
					pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },							
				},	

				Text = {
					text = "$5212", -- "SHOW ALL FACILITIES",
					minShrink = 0.25,
				},
		
				helpTipTextLabel = "lblCurrentFacility",
				helpTip = "$2630", -- SHOW ALL FACILITIES
			
				hotKeyID = 98,
				--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
			},
	},

		
	-- Frame to hold expandable build queues.
	{
		type = "Frame",
		--position = {0,393},
		name = "frameQueues",
			
		Layout = {			
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },		
				margin_LT = { l = 0.0, t = 2.0, lr = "px", tr = "px" },
			--	margin_RB = { r = 0.0, b = 4.0, rr = "px", br = "px" },		
		},	
		--backgroundColor = COLOR_BACKGROUND_SUBPANEL,
		----backgroundColor = COLOR_WHITE_SOLID,
		autosize = 1,
		autoarrange = 1,
		autoarrangeSpace = 1,
		arrangetype = "vert",
		--autoarrangeWidth = 393,
		customData = 4, --Amount of spacing to put between queue frame and bottom of build list
		borderWidth = 1, 
		borderColor = OUTLINECOLOR,
		--backgroundColor = COLOR_BLUE_SOLID,
	},
	{
		type = "Frame",
		name = "gg",
		autosize = 1,
		visible=0,
		ignored=1,

		--backgroundColor = COLOR_BLUE_SOLID,
		;
		-- Collapsable build queue to clone
		GetCollapsableQueue( OUTLINECOLOR, SHIPQUEUECOLOR,80 ),
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
			cursorType = "Drag_LR",
			--backgroundColor = {255,0,0,128},
			--backgroundColor = COLOR_RED_SOLID,
			elementToDrag = "BuildMenuRoot",

		},

	},


	
------------------------------------------------------------------
--------------------- ITEMS TO CLONE -----------------------
	 -- Ship name dropdown item to clone
	{
		type = "TextListBoxItem",
		name = "buildShipDropDownListBoxItem",	
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
	
	-------------------- SHOW ALL - SHIP ITEM----------------------------
	{
		type = "Button",
		--size = {185,15},
		ignored = 1,
		name = "showAllItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		
		Layout = {			
			size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
		},
		autosize=1,
		arrangetype = "horiz",
		flashColor = {255,255,255,65},
		
		soundOnClicked 		= "SFX_BuildItemClick",
		--backgroundColor = COLOR_PURPLE_SOLID
		;
		
			
		-- ship name / price button
		{
			type = "Button",

			Layout = {			
				size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
			},

			ignored = 1,
			overColor = COLOR_SHIP_ITEMOVERCOLOR,
			pressedColor = COLOR_SHIP_ITEMPRESSEDCOLOR,
			flashColor = COLOR_SHIP_ITEMOVERCOLOR,
			arrangetype = "horiz",
			autosize=1,

			--overBorderColor = {255,255,255,255},
			--pressedBorderColor = {255,255,255,255},
			--pressedColor = {0,175,255,127},
			--flashColor = {0,175,255,127},
			--borderWidth = 1,
			--backgroundColor = {255,0,0,255},
			--backgroundColor = COLOR_GREEN_SOLID,
			helpTip = "$5204", -- CLICK ITEM TO BUILD
			helpTipShift = "$5199", -- Shift CLICK ITEM TO BUILD
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			;
			
			-- more info button
			{
				type = "Button",
				name = "buildInfo",
				--position = {3, 2},
				size = {13, 13},
				Layout = {	
						--pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
						--pivot_XY = { 0.0, 0.5 },
						lockAspect=1,
				},

				DefaultGraphic = {
					texture = "data:ui\\newui\\Styles\\ArrowButtons\\arrow_horiz.tga",
					uvRect = { 0, 1, 1, 0 },
					color = COLOR_BUTTON_BGRD_HOVER,
				},

				--PressedGraphic = {
				--	texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				--	textureUV = {0,0,13,13},
				--	color = COLOR_SHIP_ITEMPRESSEDCOLOR,
				--},
			
				helpTip = "$5213", -- SHOW BUILD INFO
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
			},
			-- The actual info area
			{
				type = "Frame",
				Layout = {			
					size_WH = {	h = STD_LABEL_HEIGHT, hr = "scr" },		
					pad_RB = { r = TITLE_PAD_HORIZ, b =0, rr = "scr", br = "scr" },						
				},	
				autosize = 1,
				arrangeweight=1,
				--backgroundColor = COLOR_RED_SOLID,
				;
			
			
				-- Ship name label
				{
					type = "TextLabel",
					name = "lblShipName",
					autosize = 1,
					Layout = {			
						size_WH = {	w = .7, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
					},
					ignored = 1,		
					giveParentMouseInput = 1,
					Text = {				
						textStyle = "IGHeading2",
						color = {255,255,255,255},
					--	offset = {5,0},
						--hAlign = "Left",
						--vAlign = "Middle",
						minShrink = 0.25,
					},
				},
				-- Ship name label (UNIT CAPS REACHED)
				{
					type = "TextLabel",
					name = "lblShipNameUnitsReached",
					visible = 0,
					autosize = 1,
					Layout = {			
						size_WH = {	w = .7, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
					},
					ignored = 1,			
					giveParentMouseInput = 1,
					Text = {				
						textStyle = "IGHeading2",
						color = UNITCAPSREACHEDCOLOR1,
						--offset = {5,0},
						--hAlign = "Left",
						--vAlign = "Middle",
						minShrink = 0.25,
					},
				},
			
				-- Ship price label
				{
					type = "TextLabel",
					name = "lblShipPrice",
					autosize = 1,
					Layout = {			
						size_WH = {w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
						pos_XY = { x = 1.0, xr = "par" },		
						pivot_XY = { 1,  0 },						
					},
					giveParentMouseInput = 1,
					Text = {
						font = "ListBoxItemFont",
						hAlign = "Right",
						--vAlign = "Middle",
						color = "FEColorHeading3",
						minShrink = 0.25,
						--offset = {-4, 0},
					},
				},
			},
		},
	},
	
	
	------------------  SHOW ALL - FAMILY ITEM------------------------------
	{
		type = "ListBoxItem",
		--size = {188,13},
		ignored = 1,
		name = "showAllFamilyItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		autosize = 1,
		
		Layout = {			
			size_WH = {	w = 1, h = STD_LABEL_HEIGHT*2, wr = "par", hr = "scr" },			
			pad_LT = { l = 0, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },				
		},
		--backgroundColor = COLOR_RED_SOLID,
		--Layout = {	
		--	size_WH = {	w = 1, h = 31/600, wr = "par", hr = "scr"},
		--},
		--backgroundColor = COLOR_BLUE_SOLID,
		;
		
		{
			type = "Frame",
			--position = {3,2},
			autosize = 1,
			arrangetype = "vert",
			
			Layout = {			
				size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
			},


			--autoarrange = 1,
			;
			-- header w / title
			{
				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },
					pad_RB = { r = TITLE_PAD_HORIZ, b =0, rr = "scr", br = "scr" },			
					pad_LT = { l = TITLE_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },					
				},	
				autosize = 1,
				backgroundColor = COLOR_LISTITEM_TITLEBAR,
				;
			
				{
					type = "TextLabel",
					name = "lblTitle",
					--size = {185, 13},
				
					Layout = {			
						size_WH = {	w = .65, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
					},
				
					autosize=1,
					ignored = 1,
					--BackgroundGraphic = {
					--	texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					--	textureUV = {0,0,185,13},
					--	color = COLOR_SHIP_ITEMDEFAULTCOLOR,
					--},
				
					Text = {	
						textStyle = "RM_GenericLabelLarge_TextStyle",		
						--font = "ListBoxItemFont",
						vAlign = "Middle",
						hAlign = "Left",
						--offset = {4,0},
						minShrink = 0.25,
						--color = {0,0,0,255},
					},
					
				},
				
				{
					type = "TextLabel", -- used to display unit caps
					name = "lblShowAllFamilyUnitCaps",
					Layout = {		
						size_WH = {w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
						pos_XY = { x = 1.0, xr = "par" },		
						pivot_XY = { 1,  0 },		
						--size_WH = {	w = .25, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
					},
					autosize=1,
					visible = 0,
					Text = {
						font = "ListBoxItemFont",
						vAlign = "Middle",
						hAlign = "Right",
						--offset = {-3, 0},
						color = {240,240,255,255},
						minShrink = 0.25,
					},
				
				},
			
			},
			-- Item tray (holds small show all items)
			{
				type = "Frame",
				name = "frmSmallShipItems",
				autosize = 1,
				autoarrange = 1,

				Layout = {			
					size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
				},

				--size = {185, 13},
				ignored = 1,
				BackgroundGraphic = {
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,14,185,25},
					color = COLOR_SHIP_ITEMDEFAULTCOLOR,
				},

				backgroundColor = COLOR_LISTITEM,
								
			},

		},
	},
	
	-- BUILD ITEM - BIG ICON
	{
		type = "ListBoxItem",
		name = "m_buildItemToClone",
		--size = {188,31}, 
		Layout = {	
			size_WH = {	w = 1, h = 34/600, wr = "par", hr = "scr"},		
			max_WH = {	w = 1, h = 100, wr = "par", hr = "px"},			
			margin_LT = { l = 0.0, t = 4.0/600, lr = "px", tr = "scr_min" },
			--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },			
		
		},
		ignored = 1,
		
		visible = 0,
		enabled = 0,
		selectable = 0,
		arrangetype = "horiz",
		--flashColor = COLOR_SHIP_ITEMOVERCOLOR,
		flashColor = {255,255,255,65},
		disabledColor 		= COLOR_LISTITEM_DISABLED,
		soundOnClicked 		= "SFX_BuildItemClick",
		backgroundColor = {13, 40, 59, 128},
		BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
		;

			--helpTip = "$5213", -- SHOW BUILD INFO
			--helpTipTextLabel = "commandsHelpTip",
			--helpTipScreen = "NewTaskbar",
		--},
		
		-- Button (for mouse over effect etc)
		{
			type = "Button",
			name = "m_btnItemButton",
			--position = {18, 1},
			--size = {170, 30},
			Layout = {	
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
				pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = LISTBOX_ITEM_PAD_VERT, lr = "scr", tr = "scr_min" },
				pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = LISTBOX_ITEM_PAD_VERT, rr = "scr", br = "scr_min" },	
				
			},
			--backgroundColor = COLOR_RED_SOLID,
			--arrangeweight=1,
			--autosize=1,
			ignored = 1,
			-- temp, pending textures
			--borderWidth = 1,
			--borderColor = {80,175,255,255},
			--overBorderColor = OUTLINECOLOR,
			--disabledBorderColor = {0,0,0,255}, -- color for already built item
			--pressedBorderColor = {185,136,0,255},
			
			
			overColor = COLOR_SHIP_ITEMOVERCOLOR,
			pressedColor = COLOR_SHIP_ITEMPRESSEDCOLOR,
			flashColor = COLOR_SHIP_ITEMOVERCOLOR,
			

			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,

			
			helpTip = "$5204", -- CLICK ITEM TO BUILD
			helpTipShift = "$5199", -- Shift CLICK ITEM TO BUILD
			disabledHelpTip = "$5214", -- ITEM CURRENTLY UNAVAILABLE
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			;
			{
				type = "Frame",
				name = "ShipSelectionFrameForMarging",
				Layout = {	
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},				
					--margin_LT = { l = 0.0, t = 8.0, lr = "px", tr = "px" },
					margin_RB = { r = 8.0/800, b = 0.0, rr = "scr_min", br = "px" },			
		
				},
				--arrangetype = "horiz",
				;
				-- Ship icon
				{
					type = "Frame",
					name = "frameIcon",
					--position = {8, 3},
					--size = {48, 24},
					Layout = {	
						max_WH = {	w = .3, h = 1, wr = "par", hr = "par"},	
						size_WH = {	h = 1,hr = "par"},	
						pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
						pivot_XY = { 0.0, 0.5 },
						lockAspect=2,
					},
				
					giveParentMouseInput = 1,
					backgroundGraphicVAlign = "Center",
				},
				{
					type = "Frame",
					name = "TextStack",
					Layout = {	
						min_WH = {	w = .7, h = 1, wr = "par", hr = "par"},				
						--margin_LT = { l = 0.0, t = 8.0, lr = "px", tr = "px" },
						--margin_RB = { r = 4.0/800, b = 0.0, rr = "scr_min", br = "px" },		
						pos_XY = { x = 1.0, xr = "par" },		
						pivot_XY = { 1,  0 },								
						size_WH = {	w = .5, h = 1, wr = "par", hr = "par"},	
					},
					arrangetype = "vert",

					--backgroundColor = COLOR_RED_SOLID,
					;
					-- Ship name label
					{
						type = "TextLabel",
						name = "lblShipName",
						autosize=1,
						Layout = {	
						--	pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },	
							size_WH = {w = 1, h = .5, wr = "par", hr = "par",},
						--	pivot_XY = { 1.0, 0.0 },
						},
						--size = {154,12},
						ignored = 1,
						Text = {
							color = COLOR_BUTTON_TEXT_DEFAULT,
							font = "ListBoxItemFont",
							hAlign = "Right",
							vAlign = "Top",
							offset = {-1,0},
							minShrink = 0.25,
						},
						giveParentMouseInput = 1,
						dropShadow = 1,

					},
			
					-- Ship price label
					{
						type = "TextLabel",
						name = "lblShipPrice",
						Layout = {	
							size_WH = {w = .5, h = .4, wr = "par", hr = "par",},
							pos_XY = { x = 1.0, y = 1.0, xr = "par", yr = "par" },	
							pivot_XY = { 1.0, 1.0 },
						},
						
						ignored = 1,
						Text = {
							color = "FEColorHeading3",
							font = "ListBoxItemFont",
							hAlign = "Right",
							vAlign = "Bottom",
							offset = {-2,0},
							minShrink = 0.25,
						},
						giveParentMouseInput = 1,
						dropShadow = 1,
					},
					-- Subsystem Replace label
					{
						type = "TextLabel",
						name = "lblShipPriceReplace",
						Layout = {	
							size_WH = {w = 1, h = .5, wr = "par", hr = "par",},
							pos_XY = { x = 1.0, y = 1.0, xr = "par", yr = "par" },	
							pivot_XY = { 1.0, 1.0 },
						},
						size = {154,12},
						ignored = 1,
						visible = 0,
						Text = {
							color = {255,255,255,255},
							font = "ListBoxItemFont",
							hAlign = "Right",
							vAlign = "Center",
							offset = {-2,0},
							minShrink = 0.25,
						},
						giveParentMouseInput = 1,
						dropShadow = 1,
					},
					-- Not avail label
					{
						type = "TextLabel",
						name = "lblNotAvailable",
						visible = 0,
						--position = {13, 14},
						Layout = {	
							size_WH = {w = 1, h = .5, wr = "par", hr = "par",},
							pos_XY = { x = 1.0, y = 1.0, xr = "par", yr = "par" },	
							pivot_XY = { 1.0, 1.0 },
						},
						size = {154,12},
						ignored = 1,
						Text = {
							color = {100,100,100,128},
							font = "ListBoxItemFont",
							hAlign = "Right",
							vAlign = "Center",
							offset = {-2,0},
							minShrink = 0.25,
						},
						giveParentMouseInput = 1,
						dropShadow = 1,
					},
					-- lblAlreadyBuilt
					{
						type = "TextLabel",
						name = "lblAlreadyBuilt",
						visible = 0,
						Layout = {	
							size_WH = {w = 1, h = .5, wr = "par", hr = "par",},
							pos_XY = { x = 1.0, y = 1.0, xr = "par", yr = "par" },	
							pivot_XY = { 1.0, 1.0 },
						},
						size = {154,12},
						ignored = 1,
						Text = {
							text = "$2637", -- "BUILT",
							textStyle = "IGButtonTextStyle",
							color = {255,255,255,128},
							font = "ListBoxItemFont",
							hAlign = "Right",
							minShrink = 0.25,
						},
						giveParentMouseInput = 1,
						dropShadow = 1,
					},
				},
			},
		},

	
	-- EMPTY ITEM
	{
		type = "ListBoxItem",
		--size = {188,31}, 
		size = {10,13},
		ignored = 1,
		name = "m_emptyBuildItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		--backgroundColor = COLOR_PURPLE_SOLID,

		;
		
		-- Info label
		{
			type = "Button",
			position = {3,1},
			size = {0,0},
		},
		
		-- Button 
		{
			type = "Button",
			position = {18, 1},
			size = {0, 0},
			ignored = 1,			
			;
		}
	},
	
	-- EMPTY SHOW ALL ITEM
	{
		type = "ListBoxItem",
		size = {10,13},
		ignored = 1,
		name = "m_emptyShowAllItemToClone",
		--visible = 1,
		enabled = 0,
		selectable = 0,
		--autosize = 1,
		--backgroundColor = COLOR_YELLOW_SOLID,
		--backgroundColor = COLOR_PURPLE_SOLID,
		--	borderColor = COLOR_WHITE_SOLID,
		--	borderWidth = 1,
		;
		
		{
			type = "Frame",
			position = {3,2},
			autosize = 1,
			;
			-- header w / title
			{
				type = "Frame",
				position = {0,0},
				ignored = 1,

			},
			
			-- Item tray (holds small show all items)
			{
				type = "Frame",
				position = {0,13},
				ignored = 1,

				;
				
				-- more info frame
				{
					type = "Frame",
					position = {3, 4},
				},
				
				--ship name / price frame
				{
					type = "Frame",
					position = {18,4},
					ignored = 1,

				},
			},
			-- footer
			{
				type = "Frame",
				position = {0, 5},
				ignored = 1,

			},
		},
	},



	},
}
