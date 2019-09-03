dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
LAUNCHMENUWIDTH = 200/800
OUTLINECOLOR = {124,200,196,255}
RESEARCHQUEUECOLOR = {64, 129, 249, 255}


-- colors of the ship group frames
RESEARCHGROUPCOLOR = {80, 175, 255, 255}

-- upgrade type colors
UGT_ABILITY_DFT = {180,165,75,255}
UGT_ABILITY_OVR = {225,225,225,255}
UGT_ABILITY_PRS = {255,255,255,255}

UGT_TECH_DFT = {255,109,67, 255}
UGT_TECH_OVR = {225,225,225,255}
UGT_TECH_PRS = {255,255,255,255}

UGT_UPGRADE_DFT = {75, 147, 180, 255}
UGT_UPGRADE_OVR = {225,225,225,255}
UGT_UPGRADE_PRS = {255,255,255,255}

dofilepath("data:ui/newui/build/collapsablequeue.lua")

--Load expanded options
dofilepath("data:ui/PlayersPatch_UI_Util.lua")
RefBuildResearchLaunchPanelsSCR = GetBuildResearchLaunchPanelsSCR()


-- returns an upgrade button with the given colors for the button
function GetResearchButton(_name, _defaultColor, _overColor, _pressedColor)

local Button = {
	type = "Button",
	name = _name,
	position = {2, 2},
	Layout = {	
		min_WH = {	w = 1, h = STD_LABEL_HEIGHT/1.85, wr = "par", hr = "scr" },			
		max_WH = {	w = 1, wr = "par" },		
		--pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
		pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = 0, rr = "scr", br = "scr" },	
	},
	visible = 0,
	enabled = 0,
	giveParentMouseInput = 0,
	soundOnClicked = "SFX_ResearchItemClick",
	autosize=1,
		--backgroundColor = COLOR_BLUE_SOLID,
		--borderWidth = 1,
	--	borderColor = { 0, 255, 255, 255},
	;
	
	{
		type = "Button",
		name = "btnMoreInfo",
		
		helpTip = "$5230", -- SHOW RESEARCH INFO
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		;
	},
	
	{
		type = "Button",
		--position = {4, 0},
		Layout = {	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },			
			pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
			pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = 0, rr = "scr", br = "scr" },	
		},
		arrangetype = "horiz",
		--autosize=1,
		DefaultGraphic = {
			size = {0, 0},
			texture = "DATA:UI\\NewUI\\Styles\\HWRM_Style\\ButtonSimple_Tintable.tga",
			uvRect = { 4/64, 4/32, 60/64, 28/32 },
			patch_X = { 10, -4, 10, 0 },
			patch_Y = { 10, -4, 10, 0 },
			patch_Scale = 1,	
			color = _defaultColor,
		},
		OverGraphic = {
			size = {0, 0},
			texture = "DATA:UI\\NewUI\\Styles\\HWRM_Style\\ButtonSimple_Tintable.tga",
			uvRect = { 4/64, 4/32, 60/64, 28/32 },
			patch_X = { 10, -4, 10, 0 },
			patch_Y = { 10, -4, 10, 0 },
			patch_Scale = 1,	
			color = _overColor,
		},
		PressedGraphic = {
			size = {0, 0},
			texture = "DATA:UI\\NewUI\\Styles\\HWRM_Style\\ButtonSimple_Tintable.tga",
			uvRect = { 4/64, 4/32, 60/64, 28/32 },
			patch_X = { 10, -4, 10, 0 },
			patch_Y = { 10, -4, 10, 0 },
			patch_Scale = 1,	
			color = _pressedColor,
		},
		--overColor = COLOR_SHIP_ITEMOVERCOLOR,
		--pressedColor = COLOR_SHIP_ITEMPRESSEDCOLOR,
		--flashColor = COLOR_SHIP_ITEMOVERCOLOR,

		flashColor = COLOR_SHIP_ITEMOVERCOLOR,

		autosize=1,
		arrangetype="horiz",

		helpTip = "$5226", -- CLICK ITEM TO RESEARCH
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		;
	
		-- Icon
		{
			type = "Frame",
			name = "frmIcon",

			Layout = {					
				pos_XY = {	x=0, y=.5, xr="px", yr="par",},	
				pivot_XY = { 0,  .5 },	
				size_WH = {	w = 10000, h = .8, wr = "px", hr = "par" },	
				lockAspect=1,
			},		


			--position = {2,2},
			--size = {9,9},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\speed.mres",
				textureUV = {0,0,9,9},
			},
			giveParentMouseInput = 1,
		},
		-- Research item area (icon, name and cost)
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

			-- Upgrade label
			{
				type = "TextLabel",
				--backgroundColor = {0,255,0,100},
			
				name = "lblUpgrade",
				--position = {13,0},
				autosize=1,
				Layout = {	
					size_WH = {	w = 0.825, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },	
					--pos_XY = {	y=.5, yr="par",},	
					--pivot_XY = { 0,  .5 },	
					--size_WH = {	w = 1, h = STD_LABEL_HEIGHT/2, wr = "par", hr = "scr" },			
				--	pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = LISTBOX_ITEM_PAD_VERT, lr = "scr", tr = "scr" },
				--	pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = LISTBOX_ITEM_PAD_VERT, rr = "scr", br = "scr" },	
				},
				giveParentMouseInput = 1,
				Text = {
					textStyle = "IGHeading2",
					color = {255,255,255,255},
					--hAlign = "Left",
					--vAlign = "Middle",
					--offset = {2, 0},
					--pixels = 18,
					--rel = 800,
					minShrink = 0.25,
		
				},
				
			},
		
			-- Cost label
			{
				type = "TextLabel",
				name = "lblCost",
				autosize=1,
				Layout = {	
					--size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },		
					--pos_XY = {	x=1, y=.5, xr="par", yr="par"},	
					--pivot_XY = { 1, .5 },			
				--	pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = LISTBOX_ITEM_PAD_VERT, lr = "scr", tr = "scr" },
					--pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = 0, rr = "scr", br = "scr" },	
				--	Flags = { canArrange = 0,hasVolume=0 },	
					size_WH = {w = .175, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
					pos_XY = { x = 1.0, xr = "par" },		
					pivot_XY = { 1,  0 },		
				},
				--size = { 37, 13 },
	
				giveParentMouseInput = 1,
				Text = {
					font = "ListBoxItemFont",
					color = "FEColorHeading3",
					hAlign = "Right",
					--hAlign = "Right",
					--vAlign = "Middle",
					--pixels  = 18,
					--rel = 800,
					minShrink = 0.25,
				--	offset = {-4, 0},
				},
			},
		},
	},
}
	
return Button

end




-- UI Screen
NewResearchMenu = {

	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		Layout = {	
			size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
		},	
	},
	giveParentMouseInput = 1,
	eventOpaque = 0,

	--
	soundOnShow = "SFX_ResearchMenuONOFF",
	soundOnHide = "SFX_ResearchMenuONOFF",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords

	fStringCost = "%d", -- Formatted string for the cost label
	
	abilitiesText = "$2861", -- Text string for "ABILITIES"
	techText = "$2862", -- Text string for "TECHNOLOGY"
	
	onHide = "UI_HideScreen(\"ResearchInfo\"); UI_SubtitleWide()",
	onShow = "UI_HideScreen('NewBuildMenu'); UI_HideScreen('NewLaunchMenu'); UI_ShowScreen('ResourceMenu', ePopup); UI_SubtitleNarrow()",
	
	queuesFramePos = 494, -- y position of the bottom of the collapsable queues frame
	
	queueTitle = "$2570",
	
	menuColor = OUTLINECOLOR,
	
	itemIconUV = {0,0,9,9},
	
	-- display priority for ships that have no build data (eg. mship)
	defaultDisplayPriority = 1,
	
	-- family wide upgrade icon hookups
	FamilyIcons = {
		{"Vaygr", "Fighter","Vgr_LanceFighter"},
		{"Vaygr", "Corvette","Vgr_MinelayerCorvette"},
		{"Vaygr", "Frigate","Vgr_InfiltratorFrigate"},
		{"Vaygr", "Capital","Vgr_ShipYard"},
		{"Vaygr", "Flagship","Vgr_Mothership"},
		{"Vaygr", "Utility","Vgr_Probe_ECM"},
		{"Vaygr", "Platform","Vgr_HyperSpace_Platform"},
		--{"Vaygr", "SubSystemModule","Vgr_C_Module_Research"},
		--{"Vaygr", "SubSystemSensors","Vgr_C_Sensors_Advanced"},
		{"Hiigaran", "Fighter","Hgn_Bomber"},
		{"Hiigaran", "Corvette","Hgn_MinelayerCorvette"},
		{"Hiigaran", "Frigate","Hgn_DefenseFieldFrigate"},
		{"Hiigaran", "Capital","Hgn_Shipyard"},
		{"Hiigaran", "Flagship","Hgn_MotherShip"},
		{"Hiigaran", "Platform","Hgn_GunTurret"},
		{"Hiigaran", "Utility","Hgn_ECMProbe"},
		--{"Hiigaran", "SubSystemModule",""},
		--{"Hiigaran", "SubSystemSensors",""},
		{"Kushan", "Fighter","Kus_Interceptor"},
		{"Kushan", "Corvette","Kus_LightCorvette"},
		{"Kushan", "Frigate","Kus_AssaultFrigate"},
		{"Kushan", "Capital","Kus_Destroyer"},
		{"Kushan", "Flagship","Kus_Mothership"},
		{"Kushan", "NonCombat","Kus_ResearchShip"},
		{"Taiidan", "Fighter","Tai_Interceptor"},
		{"Taiidan", "Corvette","Tai_LightCorvette"},
		{"Taiidan", "Frigate","Tai_AssaultFrigate"},
		{"Taiidan", "Capital","Tai_Destroyer"},
		{"Taiidan", "Flagship","Tai_Mothership"},
		{"Taiidan", "NonCombat","Tai_ResearchShip"},
	},
	;


	
	{
		type = "Frame",
		name = "ResearchMenuRoot",
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
		;

		-- This Frame is used for padding
		{
			type = "Frame",
			name = "LaunchMenuMainInnerFrame",

			Layout = {
				pad_LT  = { l = BUILDPANEL_PAD_HORIZ, t = BUILDPANEL_PAD_VERT/2, lr = "scr_min", tr = "scr" },
				pad_RB  = { r = BUILDPANEL_PAD_HORIZ, b = 0, rr = "scr_min", br = "scr" },
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },						
			},
			--borderWidth = 1,
			--borderColor = { 0, 255, 255, 255},
			
			arrangetype = "vert",
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME,
			;


--------------------------------------- Research Facility Area -----------------------------

			{
				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 100.0, wr = "par", hr = "px" },
					max_WH = {	w = 1, wr = "par" },	
					min_WH = {	w = 1, wr = "par" },				
				},	
				--backgroundColor = COLOR_RED_SOLID,
				arrangetype = "vert",
				name = "BuildAreaFil",
				autosize=1,

				backgroundColor = COLOR_BACKGROUND_SUBPANEL,
				;

				-- Facility Buttons
				-- NOTICE: The names of these buttons must match the family names (the strcmp is case insensitive)
				{
					type = "Frame",
					name = "m_frameButtonGroup",

					Layout = {
						--size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },
						pad_LT  = { l = TITLE_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
						pad_RB  = { r = 0, b = 0, rr = "scr", br = "scr" },	
						size_WH = {	w = 1, h = FACILITY_BUTTON_HEIGHT, wr = "par", hr = "scr" },
						max_WH = {	w = 1, h = FACILITY_BUTTON_HEIGHT, wr = "par", hr = "scr" },
					},	
					autoarrangeSpace = 2,
					arrangetype = "horiz",			
					autosize=1,
					helpTip = "$5228", -- SELECT RESEARCH FACILITY
					helpTipTextLabel = "commandsHelpTip",
					helpTipScreen = "NewTaskbar",
					backgroundColor = COLOR_BACKGROUND_SUBPANEL,
					--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
					;
						GetFacilityButton("Utility", "$5231", 94, { 0/64, 320/512, 64/64, 384/512 }),
						GetFacilityButton("Corvette", "$5232", 91, { 0/64, 64/512, 64/64, 128/512 }),
						GetFacilityButton("Capital", "$5233", 93, { 0/64, 192/512, 64/64, 256/512 }),				
						GetFacilityButton("Fighter", "$5234", 90, { 0/64, 0/512, 64/64, 64/512 }),
						GetFacilityButton("Frigate", "$5235", 92, { 0/64, 128/512, 64/64, 192/512 }),
						GetFacilityButton("Platform", "$5236", 96, { 0/64, 256/512, 64/64, 320/512 }),
						GetFacilityButton("NonCombat", "$5280", 110, { 0/64, 448/512, 64/64, 512/512 }),
				

						--GetFacilityButton("Resource", "$2638", 109, { 0/64, 320/512, 64/64, 384/512 }),
						--GetFacilityButton("SubSystemModule", "$2643", 95, { 0/64, 384/512, 64/64, 448/512 }),
						--GetFacilityButton("SubSystemSensors", "$2644", 97, { 0/64, 448/512, 64/64, 512/512 }),
				},

			},

			
			--------------------- Subheading area----------------------
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
				-- Current Facility Sub Heading
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
						name = "lblCurrentFacility",

						Layout = {								
							size_WH = {w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr",},
						},
						autosize=1,
						Text = {
							textStyle = "IGHeading2",
							color = COLOR_LABEL_TITLETEXT, 
							--offset = {6,0},
							vAlign = "Middle",
							minShrink = 0.25,
						},
						backgroundColor = {27, 69, 85, 128},
					},
				},
			},


			{

				type = "Frame",
				Layout = {			
					size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },	
					--pad_LT = { l = 8.0, t = 8.0, lr = "px", tr = "px" },
					--pad_RB = { r = 8.0, b = 8.0, rr = "px", br = "px" },					
				},	

				--borderWidth = 1,
				--borderColor = { 0, 255, 255, 255},
				arrangeweight = 1.0,
				autosize=1,
				--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
				

				backgroundColor = COLOR_BACKGROUND_SUBPANEL,
				;

				-- Research List Box
				{
					type = "ListBox",				
					name = "m_listResearch",
					listBoxStyle = "FEListBoxStyle_Bordered",

					--marginWidth = 2,
					--marginHeight = 2,

					Layout = {			
						size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
		
					},


					scrollBarSpace = 2,
					--marginWidth = 2,
					--marginHeight = 0,
		
					--contentsOuterBorderWidth = 2,
					--contentsBorderColor = OUTLINECOLOR,		
					scrollBarPageSize = 100,
					scrollBarStepSize = 3,

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
						--margin_LT = { l = 8.0, t = 0.0, lr = "px", tr = "px" },
						--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },							
					},	

					Text = {
						text = "$5237", -- "SHOW ALL FACILITIES",
						minShrink = 0.25,
					},
		
					helpTipTextLabel = "lblCurrentFacility",
					helpTip = "$5229", -- SHOW ALL FACILITIES
		
					hotKeyID = 98,
				},
			},

			-- Frame to hold expandable research queues.
			{
				type = "Frame",
				--position = {0,393},
				name = "frameQueues",
			
				Layout = {			
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },		
						margin_LT = { l = 0.0, t = 2.0, lr = "px", tr = "px" },
						margin_RB = { r = 0.0, b = 4.0, rr = "px", br = "px" },		
				},	
				backgroundColor = COLOR_BACKGROUND_SUBPANEL,
				autosize = 1,
				autoarrange = 1,
				autoarrangeSpace = 0,
				--autoarrangeWidth = 393,
				customData = 4, --Amount of spacing to put between queue frame and bottom of build list
				--outerBorderWidth = 1, 
				--borderColor = OUTLINECOLOR,
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
			--backgroundColor = {255,0,0,128},
			overColor = {0,80,80,64},
			cursorType = "Drag_LR",
			elementToDrag = "ResearchMenuRoot",
		},
	},






	--------------------------------------------------------------
	
	{	-- RESEARCH ITEM TO CLONE
		type = "ListBoxItem",
		name = "shipUpgradeItemToClone",	
		--size = {188,80},
		
		autosize = 1,
		--minSize = {188, 0},
		visible = 0,
		backgroundColor = COLOR_BACKGROUND_SUBPANEL,
		Layout = {			
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},			
			margin_LT = { l = 8.0, t = 8.0, lr = "px", tr = "px" },
			--margin_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },	
		},

		flashColor = {255,255,255,65},
		disabledColor 		= COLOR_LISTITEM_DISABLED,
		--backgroundColor = COLOR_LISTITEM,
		BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,	
		;
		
		-- 
		{
			type = "Frame",
			--position = {3,1},
			arrangetype = "vert",
			Layout = {	
				size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
				pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
				pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = LISTBOX_ITEM_PAD_VERT, rr = "scr", br = "scr" },
					--pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = LISTBOX_ITEM_PAD_VERT*2, lr = "scr", tr = "scr" },
					--pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = LISTBOX_ITEM_PAD_VERT*2, rr = "scr", br = "scr" },	
			},

			autosize = 1,
			--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
			;
			-- header frame
			{
				type = "Frame",
				Layout = {	
					size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
						pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = LISTBOX_ITEM_PAD_VERT, lr = "scr", tr = "scr" },
					pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = LISTBOX_ITEM_PAD_VERT, rr = "scr", br = "scr" },	
				},
				autosize=1,
				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
				backgroundColor = COLOR_LISTITEM_TITLEBAR,
				--backgroundColor = COLOR_PURPLE_SOLID,
				;
				-- Ship name label
				{
					type = "TextLabel",
					name = "lblShipName",
					
					Layout = {			
						size_WH = {	w = 1, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },						
					},
					autosize=1,
					ignored = 1,
					
					Text = {				
						--textStyle = "RM_GenericLabelLarge_TextStyle",
						font = "ListBoxItemFont",
						vAlign = "Middle",
						hAlign = "Left",						
						offset = {4,0},
						--pixels  = 60,
						--color = {0, 0, 0, 255}, -- Black
						minShrink = 0.25,
					},


				},
			},
			-- middle frame
			{
				type = "Frame",
				autosize = 1,
				Layout = {	
					size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
				--	pad_LT  = { l = LISTBOX_ITEM_PAD_HORIZ, t = LISTBOX_ITEM_PAD_VERT, lr = "scr", tr = "scr" },
				--	pad_RB  = { r = LISTBOX_ITEM_PAD_HORIZ, b = LISTBOX_ITEM_PAD_VERT, rr = "scr", br = "scr" },	
				},
				--arrangeweight=1,
				overColor = COLOR_SHIP_ITEMOVERCOLOR,
				pressedColor = COLOR_SHIP_ITEMPRESSEDCOLOR,
				flashColor = COLOR_SHIP_ITEMOVERCOLOR,
				--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
				--backgroundColor = COLOR_PURPLE_SOLID,
				arrangetype = "vert",
				;
				
				-- ship icon & info
				{
					type  = "Frame",
					--position = {2,2},
					Layout = {	
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},

					},
					autosize = 1,

					;
					
					-- Ship icon
					{
						type = "Frame",						
						name = "researchIconFrame",
						Layout = {	
							size_WH = {	w = 1, h = 34/600, wr = "par", hr = "scr"},		
							pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
							pivot_XY = { 0.0, 0.5 },
							lockAspect=2,
						},


					--	Layout = {	
					--		pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
					--		max_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
					--		size_WH = {	w = 1, h = 32/600, wr = "par", hr = "scr"},
					--		pivot_XY = { 0.0, 0.5 },
					--		lockAspect=2,	
					--	},
					--	--size = {64, 32},
						
						--backgroundColor = {100,100,100,150},
					},
				},
				
				-- upgrades tray
				{
					type = "Frame",
					Layout = {	
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
					},

					--position = {0, 35},
					--size = {184, 46},				
					autosize = 1,				
					autoarrange = 1,
					autoarrangeSpace = 2,
					name = "upgradesFrame",
				},
			},
		},
	},
	
	{	-- *EMPTY* RESEARCH ITEM TO CLONE
		type = "ListBoxItem",
		size = {188,80},
		
		autosize = 1,
		minSize = {188, 0},
		visible = 0,
		ignored=1,
		name = "emptyShipUpgradeItemToClone",			
		;
		
		-- 
		{
			type = "Frame",
			position = {3,1},
			autoarrange = 1,
			autoarrangeWidth = 186,
			autosize = 1,
			;
			-- header frame
			{
				type = "Frame",
				size = {185, 13},
				--BackgroundGraphic = {
				--	position = {0, 0},
				--	texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres",
				--	textureUV = {0,0,185,13},
				--	color = {0,0,0,255},
				--},
			},
			-- middle frame
			{
				type = "Frame",
				minSize = {185, 0},
				--size = {185, 45},
				autosize = 1,
				--BackgroundGraphic = {
				--	texture = "data:ui\\newui\\InGameIcons\\show_all_borders.mres",
				--	textureUV = {0,14,185,25},
				--	color = {0,0,0,255},
				--},
				;
				
				-- Empty upgrade item graphics
				{
					type = "Frame",
					position = {3, 37},
					size = {13, 13},
				--	BackgroundGraphic = {
				--		texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				--		textureUV = {0,0,13,13},
				--		color = {0,0,0,255},
				--	},
					;
				},
		
				{
					type = "Frame",
					position = {18, 37},
					size = {164, 13},
					
				--	BackgroundGraphic = {
				--		texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				--		textureUV = {16,0,180,13},
				--		color = {0,0,0,255},
				--	},
				},
			},

		},
	},
	
	-- Upgrade button to clone (FOR UPGRADES THAT APPLY TO A SINGLE SHIP)
	GetResearchButton("btnUpgradeToClone", UGT_UPGRADE_DFT, UGT_UPGRADE_OVR, UGT_UPGRADE_PRS),
	
	-- Upgrade button to clone (FOR UPGRADES THAT APPLY TO ALL SHIPS)	
	GetResearchButton("btnUpgradeToClone2", UGT_TECH_DFT, UGT_TECH_OVR, UGT_TECH_PRS),
	
	-- Upgrade button to clone (FOR ABILITIES)
	GetResearchButton("btnUpgradeToClone3", UGT_ABILITY_DFT, UGT_ABILITY_OVR, UGT_ABILITY_PRS),
	
	
	GetCollapsableQueue( OUTLINECOLOR, RESEARCHQUEUECOLOR, 94 ), 
	

}
