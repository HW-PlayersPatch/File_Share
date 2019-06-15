dofilepath("data:ui/newui/Taskbar/TaskbarDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

-- STYLE SHEET FOR HOMEWORLD RM ELEMENTS / UISCREENS
HW2StyleSheet = {
	-- Define default styles to use from this stylesheet
	defaultElementStyle = "DefaultStyle",
	defaultTextStyle = "DefaultTextStyle",
	defaultButtonStyle = "DefaultButtonStyle",
	defaultScrollBarStyle = "DefaultScrollBarStyle",
	defaultScrollViewStyle = "DefaultScrollViewStyle",
	defaultListBoxStyle = "FEListBoxStyle",
	defaultDropDownListBoxStyle = "FEDropDownListBoxStyle",
	defaultTextInputStyle = "DefaultTextInputStyle",
	defaultTableStyle = "FETableStyle",
	defaultGraphNodeStyle = "DefaultGraphNodeStyle",
	defaultContextMenuStyle = "DefaultContextMenuStyle",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	--------------------------------------------------------------------------------------
	-- GENERIC STRING ATTRIBUTES
	StringAttributes = {
		;
		
		
		{
			name = "RM_FEColorDisabled",
			string = "109,114,115,255",
		},
		
		---------------------- Text Colors ------------------
		{
			name = "RM_FETextBlack",
			string = "0,0,0,255",
		},
		{
			name = "RM_FETextBlueBright",
			string = "195,246,235,255",
		},
		{
			name = "RM_FETextBlueNormal",
			string = "97,126,121,255",
		},
		{
			name = "RM_FETextColor",
			string = "89,120,128,255",
		},	
		{
			name = "RM_FEBrightTextColor",
			string = "209,255,251,255",
		},		
		{
			name = "RM_FEColorHeading2",
			string = "255,255,255,255",	-- White
		},
		{
			name = "RM_FEColorHeading3",
			string = "209,255,251,255",		-- Yellow
		},

		-------------------------------------------------





		{
			name = "FEColorHeading1",
			string = "66,132,164,255",		-- Blue
		},
		{
			name = "FEColorHeading2",
			string = "255,255,255,255",	-- White
		},
		{
			name = "FEColorHeading3",
			string = "255,216,0,255",		-- Yellow
		},
		{
			name = "FEColorHeading4",
			string = "255,255,255,255",	-- White
		},
		{
			name = "FEColorBackground1", 	-- Screen panel background
			string = "0,0,0,170",
			--string = "100, 0, 0, 100", --debug
		},
		{
			name = "FEColorBackground2", 	-- Modal window background (when whole screen darkens)
			string = "0,0,0,127",--69
			--string = "255, 255, 255, 150",--debug
		},
		{
			name = "FEColorDialog", -- Dialog background color
			string = "0,0,26, 255",
			--string = "0, 100, 0, 200", -- debug
		},
		{
			name = "FEColorOutline", 	
			string = "65,130,165,255",
		},
		{
			name = "FEColorPopupOutline", 	
			string = "55,150,255,255",
		},
		
		-- ELEMENT COLORS
		{
			name = "FEColorScrollButtonDefault",
			string = "56,162,250,255",
		},
		{
			name = "FEColorScrollButtonOver",
			string = "255,255,255,255",
		},
		{
			name = "FEColorScrollButtonPressed",
			string = "56,162,250,255",
		},
		{
			name = "FEColorScrollButtonDisabled",
			string = "151,151,151,255",
		},
		{
			name = "FEColorDisabled",
			string = "151,151,151,255",
		},
		
		-- IN GAME ATTRIBUTES
		{
			name = "IGColorBackground1", 	-- Window background
			string = "0,0,0,150",
		},
		{
			name = "IGColorOutline",
			string = "65,130,165,255",
		},
		{
			name = "IGColorProgress1",
			string = "255,216,0,255", -- Yella
		},
		{
			name = "IGColorProgress2",
			string = "51,244,0,255", -- Green
		},
		{
			name = "IGColorButton",
			string = "0,0,0,0",
		},
		{
			name = "IGColorButtonBorder",
			string = "0,175,255,255",
		},
		{
			name = "IGColorButtonOverBorder",
			string = "255,255,255,255",
		},
		{
			name = "IGColorButtonPressedBorder",
			string = "0,175,255,255",
		},
		{
			name = "IGColorButtonFlash",
			string = "48,108,136,255",
		},
		{
			name = "IGColorButtonFlashBorder",
			string = "0,175,255,255",
		},
		{
			name = "IGColorButtonText",
			string = "255,225,0,245",
		},
		{
			name = "IGColorButtonOver",
			string = "255,255,0,255",
		},
		{
			name = "IGColorButtonPressed",
			string = "48,108,136,255",
		},
		{
			name = "IGColorButtonDisabled",
			string = "0,0,0,0",
		},
		{
			name = "IGColorButtonDisabledBorder",
			string = "48,108,136,255",
		},
		{
			name = "IGColorButtonDisabledText",
			string = "48,108,136,255",
		},
		
		-- FACILITY BUTTONS
		{
			name = "IGColorFacilityDisabled",
			string = "255,255,255,200",
		},
		
	},
	
	
	--------------------------------------------------------------------------------------
	-- DEFAULT STYLES
	
	DefaultTextStyle = {
		type = "Text",
		color = COLOR_WHITE_SOLID,			
		hAlign = "Left",
		vAlign = "Middle",
		font = "default",
		pixels = (24*2),
		rel = 2160,
		--pixels = 16,
		--rel = 400,
	},	
	
	-- This is the default style for ALL interface elements
	DefaultStyle = {
		type = "InterfaceElement",
		position = {0, 0},
		size = {100, 100},
		enabled = 1,
		visible = 1,
	},
		
	DefaultButtonStyle = {
		type = "Button",
		-- We dont actually have to specify this here because if we dont, the loader will use the default style, which is set to "DefaultStyle"
		style = "DefaultStyle", 
		
		toggleButton = 0, -- This means that the default button will is not a toggle button
		pressed = 0,        -- This means that the button is not pressed by default
		
		size = {120, 13},  -- Override
	},
		
	
	-- Default ScrollBar Style
	DefaultScrollBar_ScrollVertButtonStyle = {
		type = "Button",
		
		size = {13,13},				
		soundOnClicked = "SFX_ScrollButtonClick",
	},
	
	DefaultScrollBar_ScrollHorzButtonStyle = {
		type = "Button",
		
		size = {13,13},				
		soundOnClicked = "SFX_ScrollButtonClick",
	},
	
	DefaultScrollBar_TrackVertStyle = {
		
		Layout = {						
			size_WH = {	w = 1.0, h = 17.0, wr = "par", hr = "px" },		
			min_WH = {	w = 1.0, h = SCROLLGRIP_MINHEIGHT, wr = "par", hr = "scr_min" },						
		},	


		IconBase = MENU_SCROLLGRIP_BORDER_GRAPHIC,
		DefaultGraphic = MENU_SCROLLGRIP_GRAPHIC,

		soundOnClicked = "", -- No sound on trackbar
		soundOnReleased = "SFX_ScrollBarPage",
	},
	
	DefaultScrollBar_TrackHorzStyle = {
		Layout = {						
			size_WH = {	w = 17.0, h = 1.0, wr = "px", hr = "par" },		
			min_WH = {	w = SCROLLGRIP_MINHEIGHT, h = 1, wr = "scr_min", hr = "par" },						
		},	
		
		IconBase = MENU_SCROLLGRIP_BORDER_GRAPHIC,
		DefaultGraphic = MENU_SCROLLGRIP_GRAPHIC,

		soundOnClicked = "", -- No sound on trackbar
		soundOnReleased = "SFX_ScrollBarPage",
	},
	
	DefaultScrollBarStyle = {
		type = "ScrollBar",
		ignored=1,
		range = {0, 0},
		scrollPosition = 0,
		stepSize = 5,
		pageSize = 20,
		orientation = "Vertical",

		soundOnPage = "SFX_ScrollBarPage",
		
		TrackFrame = {
			type = "Frame",
			backgroundColor = COLOR_SCROLLBAR_DEFAULT,
		},
		
		-- The scroll buttons will use the scroll button style and overide the name and graphics properties
		UpButton = {
			type = "Button",
			buttonStyle = "DefaultScrollBar_ScrollVertButtonStyle",
			Layout = {						
				size_WH = {	w = 1.0, h = 1000.0, wr = "par", hr = "px" },			
				pos_XY = {	x=0, y=1, xr="par", yr="par",},					
				lockAspect=1,					
			},	
			
			--size = { 26, 15},

			disabledColor = {0,0,0,0},
			
			DisabledGraphic = {
					size = {13,13},
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					--Surface = STD_ARROW_BUTTON_SURFACE,
					color = "FEColorScrollButtonDisabled",
				},
			;
			{
				type = "Button",
				--size = {13,13},
				Layout = {						
					size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },
				},	
				position = {0,0},
				
				giveParentMouseInput = 1,
				
				borderWidth = 1,
				
				--backgroundColor = "FEColorScrollButtonDefault",				
				--borderColor = "FEColorScrollButtonDefault",
				--
				--pressedColor = "FEColorScrollButtonDefault",
				--pressedBorderColor = "FEColorScrollButtonOver", -- white
				
				--overColor = "FEColorScrollButtonDefault",
				--overBorderColor = "FEColorScrollButtonOver",
				
				--disabledColor = "FEColorScrollButtonDisabled", -- grey
				--disabledBorderColor = "FEColorScrollButtonDisabled", -- grey
				
				--IconBase = MENU_SCROLLGRIP_BORDER_GRAPHIC,
				--DefaultGraphic = MENU_SCROLLGRIP_GRAPHIC,

				IconBase = {
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_DARK_SURFACE,
				},
				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Styles\\white.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_BACK_SURFACE,
				},

			},
		},
		DownButton = {
			type = "Button",
			buttonStyle = "DefaultScrollBar_ScrollVertButtonStyle",
			
			Layout = {						
				size_WH = {	w = 1.0, h = 1000.0, wr = "par", hr = "px" },			
				pos_XY = {	x=0, y=1, xr="par", yr="par",},					
				lockAspect=1,					
			},	
			
			disabledColor = {0,0,0,0},
			
			DisabledGraphic = {
					size = {13,13},
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					--Surface = STD_ARROW_BUTTON_SURFACE,
					color = "FEColorScrollButtonDisabled",
				},
			;
			{
				type = "Button",
				
				Layout = {						
					size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },
				},	
				--position = {0,2},
				
				giveParentMouseInput = 1,
				
				borderWidth = 1,

				IconBase = {
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
					uvRect = { 0, 0, 1, 1 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_DARK_SURFACE,
				},
				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Styles\\white.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_BACK_SURFACE,
				},

			},
		},




		LeftButton = {
			type = "Button",
			buttonStyle = "DefaultScrollBar_ScrollHorzButtonStyle",
			--size = { 15, 13},
			Layout = {						
				size_WH = {	w = 1000.0, h = 1.0, wr = "px", hr = "par" },			
				pos_XY = {	x=0, y=0, xr="par", yr="par",},					
				lockAspect=1,					
			},	

			disabledColor = {0,0,0,0},
			DisabledGraphic = {
				size = {13,13},
				texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_horiz.tga",
				uvRect = { 0, 0, 1, 1 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_ARROW_BUTTON_SURFACE,
				color = "FEColorScrollButtonDisabled",
			},
			;
			{
				type = "Button",
				Layout = {						
					size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },
				},	
				--position = {0,0},
				
				giveParentMouseInput = 1,
				
				borderWidth = 1,

				IconBase = {
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_horiz.tga",
					uvRect = { 0, 0, 1, 1 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_DARK_SURFACE,
				},
				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Styles\\white.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_BACK_SURFACE,
				},			

			},
		},
		
		RightButton = {
			type = "Button",
			buttonStyle = "DefaultScrollBar_ScrollHorzButtonStyle",
			
			Layout = {						
				size_WH = {	w = 1000.0, h = 1.0, wr = "px", hr = "par" },			
				pos_XY = {	x=1, y=0, xr="par", yr="par",},	
				pivot_XY = { 1.0, 0.0 },	
				lockAspect=1,					
			},	
			
			disabledColor = {0,0,0,0},
		--	backgroundColor = {0,255,0,100},
		--						borderWidth = 1,
		--borderColor = {0,0,255,255},
			DisabledGraphic = {
				size = {13,13},
				texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_horiz.tga",
				uvRect = { 0, 0, 1, 1 },
				patch_ResScale = RES_SCALE,		
				Surface = STD_ARROW_BUTTON_SURFACE,
				color = "FEColorScrollButtonDisabled",
			},
			;
			{
				type = "Button",
				Layout = {						
					size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },
				},	
				--position = {2,0},
				
				giveParentMouseInput = 1,
				
				borderWidth = 1,

				IconBase = {
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_horiz.tga",
					uvRect = { 1, 1, 0, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_DARK_SURFACE,
				},
				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Styles\\white.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_BACK_SURFACE,
				},		
				


			},
		},
		
		
		-- Since no button style is defined for these, they will use the default button style to init.
		-- However, we override the size, name and graphics of the default button style
		TrackVertButton = {
			type = "Button",
			buttonStyle = "DefaultScrollBar_TrackVertStyle",
		},
		TrackHorzButton = {
			type = "Button",
			name = "trackHorzButton",
			buttonStyle = "DefaultScrollBar_TrackHorzStyle",
		},
	},
	
	DefaultScrollViewStyle = {
		type = "ScrollView",
		
		-- overrides
		name = "noNameScrollView",
		--size = {250, 250},
		--backgroundColor = {255,0,0,255},
		--scrollHorz = 1,
		showScrollBar = 1,		-- Enable scroll bar by default
		scrollVert = 1,
		--contentsSize = {500,500},
		--scrollPosition = {0, 0},
		--autosize=1,
		arrangetype = "Horiz",
		--contentsBackgroundColor = {0,255,0,255},


		VertScrollBar = {
			type = "ScrollBar",
			
			name = "DefaultScrollView_vertScrollBar",
			--orientation = "Vertical",		
			
			Layout = {	
				size_WH = {w = SCROLLBAR_WIDTH, h = SCROLLBAR_WIDTH, wr = "scr_min", hr = "scr_min",},
				--pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },	
				--pivot_XY = { 1.0, 0.0 },	
			},

			
							
		},
		
		HorzScrollBar = {
			type = "ScrollBar",
			
			name = "DefaultScrollView_horzScrollBar",
			orientation = "Horizontal",						
		},
	},






	DefaultTextInputStyle = {
		type = "TextInput",
		
		cursorPosition = 0,
		cursorDelay = 350,
		
		cursorWidth = 1,
		cursorColor = {255,255,255,255},
		
		autosize = 0,
		marginWidth = 3,
		
		maxTextLength = 256,
			
		Text = {			
			color = {255,255,255,255},
			font = "ButtonFont",
			vAlign = "Middle",
			hAlign = "Left",	
		},
		
		soundOnPressed = "SFX_TextInputClicked",
		soundOnAccept = "SFX_TextInputAccept",
	},

	----	
	---------------------------------------------------------------------------------------------------------------------------------
	-- TEXT STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	

	RM_MenuButton_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueBright",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
				
		pixels = (24),
		rel = 1080,
	},	

	RM_MenuButtonLarge_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueBright",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
		pixels = (38*2),
		rel = 2160,
	},	

	RM_MessageLabel_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueBright",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
		pixels = (60),
		rel = 2160,
	},	

	RM_GenericLabelLarge_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueBright",
		vAlign = "Middle",
		hAlign = "Left",
		offset = {0, 0},
		pixels = (24*2),
		rel = 2160,
	},	

	RM_DescriptionLabel_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueNormal",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
		pixels = (22*2),
		rel = 2160,
	},	

	RM_ShipInfoLabel_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueNormal",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
		pixels = (22),
		rel = 0,
	},	

	RM_ListOption_Unselected_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueNormal",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
		pixels = (22*2),
		rel = 2160,
	},	

	RM_IGShipDescriptionLabel_TextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueNormal",
		vAlign = "Middle",
		hAlign = "Center",
		offset = {0, 0},
		pixels = (14*2),
		rel = 2160,
	},	



	
	----------------------------------------------------------------------------------------------------
	-- Remastered Styles
	----------------------------------------------------------------------------------------------------
	
	-------------- Backgrounds ---------------

				---- Original HW2 Style Name
	FEPopupBackgroundStyle = {
		type = "InterfaceElement",		
		--marginHeight = 10,	
		Layout = {	
			pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
			pad_RB = { r = 16, b = 16, rr = "px", br = "px" },			
		},
		backgroundColor = COLOR_BACKGROUND_POPUP,
		BackgroundGraphic = BORDER_GRAPHIC_FRAME2,
	},
	
	FEPanelBackgroundStyle = {
		type = "InterfaceElement",		
			
		Layout = {	
			pad_LT = { l = 8, t = 8, lr = "px", tr = "px" },
			pad_RB = { r = 8, b = 8, rr = "px", br = "px" },			
		},
		
		backgroundColor = COLOR_BACKGROUND_POPUP,
		BackgroundGraphic = BORDER_GRAPHIC_FRAME,
	},

	FETopFrameBackgroundStyle = {
		type = "InterfaceElement",
	
		--BackgroundGraphic = BORDER_GRAPHIC_TOPFRAME,
		
	},

	
	
	PanelBackgroundStyle = {
		type = "InterfaceElement",
		backgroundColor = {0,0,0,127},
			
		Layout = {
			--pos_XY = {	x = 0.10, y = 0.10, xr = "par",	yr = "par"	},			
			--size_WH = {	w = 128.0, h = 256.0, wr = "px", hr = "px" },		
			pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
			pad_RB = { r = 16, b = 16, rr = "px", br = "px" },			
		},

		BackgroundGraphic = BORDER_GRAPHIC_FRAME,
	},


































----------------------------- INTERFACE ITEM STYLES --------------------------------

		
FEListBoxItemButtonStyle = 
	{
		type = "Button",	
			
		Layout = {
			pos_XY = {	x = 0, y = 0, xr = "px",	yr = "px"	},			
			size_WH = {	w = 1.0, h = LISTBOXITEM_HEIGHT, wr = "par", hr = "scr" },			
		},

		--size = {192, 13},
		
		--borderWidth = 1,
		
		--borderColor = {255,0,0,255},
		backgroundColor = COLOR_LISTITEM,
		
		--overBorderColor = {0,0,0,0},
		overColor = COLOR_LISTITEM_HOVER,
		
		--pressedBorderColor = {56, 162,250,255},
		pressedColor = COLOR_LISTITEM_SELECTED,	
		pressoverColor = COLOR_LISTITEM_SELECTHOVER,
		disabledColor 		= COLOR_LISTITEM_DISABLED,
		--disabledBorderColor 	= {152, 152, 152, 255},
		--disabledTextColor 	= {152, 152, 152, 255},
		
		soundOnEnter 		= "SFX_ListBoxItemEnter",
		soundOnClicked 		= "SFX_ListBoxItemClick",
	},

	FEListBoxStyle = {
		type = "ListBox",

		selected = 0,
		leftScroll = 0,			-- Do not use left handed scroll bar by default
		showScrollBar = 1,		-- Enable scroll bar by default
		
		ScrollBar = {
			type = "ScrollBar",			-- Again, since we dont specify a style, this will use the default scroll bar style			
			name = "ListBoxStyle_scrollBar",

			Layout = {	
				size_WH = {w = SCROLLBAR_WIDTH, h = SCROLLBAR_WIDTH, wr = "scr_min", hr = "scr_min",},
				--pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },	
				--pivot_XY = { 1.0, 0.0 },	
			},

		},

		arrangetype = "Horiz",

		marginHeight = 2,
		scrollBarSpace = 2,
		
		--backgroundColor = { 0, 255, 0, 125 },
		;		

	},
	FEListBoxStyle_Bordered = {
		type = "ListBox",

		selected = 0,
		leftScroll = 0,			-- Do not use left handed scroll bar by default
		showScrollBar = 1,		-- Enable scroll bar by default
		
		ScrollBar = {
			type = "ScrollBar",			-- Again, since we dont specify a style, this will use the default scroll bar style			
			name = "ListBoxStyle_scrollBar",
			
			range = { 0, 0 },	-- Do not be active unless given actual data...

			Layout = {	
				size_WH = {w = SCROLLBAR_WIDTH, h = SCROLLBAR_WIDTH, wr = "scr_min", hr = "scr_min",},
				--pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },	
				--pivot_XY = { 1.0, 0.0 },	
			},

		},

		arrangetype = "Horiz",

		marginHeight = 2,
		scrollBarSpace = 2,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		;		

	},

	


	RM_FEButtonStyleFlat = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		--marginWidth = 16,
		autosize  = 1,
		stateIconOfs = { 0.0, 32/256 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		--outerBorderWidth = DEBUG_DRAWBORDER,		
		--borderColor = {255,0,0,255},
		
		Layout = {
			
					pad_LT  = { l = 8, t = 8, lr = "px", tr = "px" },
					pad_RB  = { r = 8, b = 8, rr = "px", br = "px" },
		},

			
		IconBase = {
			size = {4, 4},
			texture = "DATA:UI\\NewUI\\Styles\\RM_Buttons_Patched_Flat.tga",
			uvRect = { 224/256, 0/256, 256/256, 32/256 },
			patch_X = { 12, -8, 12, 0 },
			patch_Y = { 12, -8, 12, 0 },
			patch_Scale = 1,		
			
			Surface = {
				surface = "ui_multistate";
				{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},
		},
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_FEButtonTextStyle",
			--dropShadow = 1,
		},
	},	

	RM_FEButtonCommand = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		--marginWidth = 16,
		autosize  = 1,
		stateIconOfs = { 0.0, 64/128 },
		stateIconCells = { 0, 0, 0, 1, 1 },
		
		--outerBorderWidth = DEBUG_DRAWBORDER,		
		--borderColor = {255,0,0,255},
		
		Layout = {
			
					pad_LT  = { l = 8, t = 8, lr = "px", tr = "px" },
					pad_RB  = { r = 8, b = 8, rr = "px", br = "px" },
		},

			
		IconBase = MENU_COMMANDBUTTON_GRAPHIC,
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_FEButtonTextStyle",
			--dropShadow = 1,
		},
	},	



	FEButtonStyle1 = 
	{
		type 				= "Button",
		size 				= {120, 24},
		autosize=1,
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					--size_WH = {w = .5, h = 24, wr = "par", hr = "px",},					
					--pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
					--pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
					--margin_LT  = { l = 0, t = 0, lr = "scr", tr = "scr" },
					--margin_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },
					--min_WH  = {	w = INGAMEMENU_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },	
					
		
		},

			
		BackgroundGraphic = MENU_BUTTON_GRAPHIC,
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_MenuButton_TextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	

	FEButtonStyle_Bordered = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					--size_WH = {w = .5, h = 24, wr = "par", hr = "px",},					
					--pad_LT  = { l = BUTTON_HORIZ_SPACING, t = BUTTON_VERT_SPACING, lr = "scr", tr = "scr" },
					--pad_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },	
					--margin_LT  = { l = 0, t = 0, lr = "scr", tr = "scr" },
					--margin_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },
		},

		--BackgroundGraphic = BORDER_GRAPHIC_BUTTON_OUTLINE,
		--IconBase = MENU_BUTTON_GRAPHIC_LARGE,
		IconBase = MENU_BUTTON_BORDER_GRAPHIC,
		BackgroundGraphic = MENU_BUTTON_GRAPHIC,
		
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
			textStyle = "RM_TaskbarHD_ButtonTextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	

	FEButtonStyle1_Chipped = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					--size_WH = {w = .5, h = 24, wr = "par", hr = "px",},					
					--pad_LT  = { l = BUTTON_HORIZ_SPACING, t = BUTTON_VERT_SPACING, lr = "scr", tr = "scr" },
					--pad_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },	
					--margin_LT  = { l = 0, t = 0, lr = "scr", tr = "scr" },
					--margin_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },
		},

			
		IconBase = MENU_BUTTON_GRAPHIC_CHIPPED,
		
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
			textStyle = "RM_MenuButton_TextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	

	FEButtonStyle1_Alert_Chipped = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					--size_WH = {w = .5, h = 24, wr = "par", hr = "px",},					
					--pad_LT  = { l = BUTTON_HORIZ_SPACING, t = BUTTON_VERT_SPACING, lr = "scr", tr = "scr" },
					--pad_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },	
					--margin_LT  = { l = 0, t = 0, lr = "scr", tr = "scr" },
					--margin_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },
		},

			
		IconBase = MENU_BUTTON_ALERT_GRAPHIC_CHIPPED,
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,
		flashTextColor				= COLOR_BUTTON_TEXT_DEFAULT,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		backgroundColor = { 255, 0, 0, 255 },
		Text = 
		{
			textStyle = "RM_MenuButton_TextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	





	FEButtonStyle1_Outlined = 
	{
		type 				= "Button",
		--size 				= {120, 24},
		
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {				
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
		},

		BackgroundGraphic = BORDER_GRAPHIC_BUTTON_OUTLINE,
		IconBase = MENU_BUTTON_GRAPHIC_SMALL,
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_MenuButton_TextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	

	FEButtonStyle1_Outlined_Chipped = 
	{
		type 				= "Button",
		--size 				= {120, 24},
		
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
				pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					--size_WH = {w = .5, h = 24, wr = "par", hr = "px",},					
					--margin_LT  = { l = BUTTON_HORIZ_SPACING, t = BUTTON_VERT_SPACING, lr = "scr", tr = "scr" },
					--margin_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },
					--margin_LT  = { l = 0, t = 0, lr = "scr", tr = "scr" },
					--margin_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },
					--pad_LT  = { l = BUTTON_HORIZ_SPACING, t = BUTTON_VERT_SPACING, lr = "scr", tr = "scr" },
					--pad_RB  = { r = BUTTON_HORIZ_SPACING, b = BUTTON_VERT_SPACING, rr = "scr", br = "scr" },	
		},

		BackgroundGraphic = BORDER_GRAPHIC_BUTTON_OUTLINE,
		IconBase = MENU_BUTTON_GRAPHIC_SMALL_CHIPPED,
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_MenuButton_TextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	

	FEButtonStyle1_Alert_Outlined_Chipped = 
	{
		type 				= "Button",
		--size 				= {120, 24},
		
		--marginWidth = 16,

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
		},

		BackgroundGraphic = BORDER_GRAPHIC_BUTTON_OUTLINE,
		IconBase = MENU_BUTTON_ALERT_GRAPHIC_SMALL_CHIPPED,
		
		textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
		disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_MenuButton_TextStyle",
			hAlign = "Center",
			vAlign = "Center",	
			--dropShadow = 1,
		},
	},	

























		




	
	
	
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- FRONT END STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	
	
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- TEXT STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	
	
	RM_FEButtonTextStyle = {
		type = "Text",
		font = "ButtonFont",
		color = "RM_FETextBlueBright",
		dropShadow = 0,
		hAlign = "Center",
		vAlign = "Middle",
	},
	
	FEHeading1 = {
		type = "Text",
		font = "Heading1Font",
		color = "FEColorHeading1",
		vAlign = "Middle",
		hAlign = "Left",
		offset = {0, 0},
	},	
	FEHeading2 = {
		type = "Text",
		font = "Heading2Font",
		color = "FEColorHeading2",
		vAlign = "Middle",
		hAlign = "Left",
		offset = {0, 0},
	},	

	FEHeading3 = {
		type = "Text",
		font = "Heading3Font",
		color = "FEColorHeading3",		
		vAlign = "Middle",
		hAlign = "Left",
		offset = {0, 0},	
	},	
	RM_FEHeading3 = {
		type = "Text",
		font = "RM_Heading3Font",
		color = "RM_FEColorHeading3",		
		vAlign = "Middle",
		hAlign = "Left",
		offset = {0, 0},	
	},	

	FEHeading4 = {
		type = "Text",
		font = "Heading4Font",
		color = "FEColorHeading4",
		vAlign = "Middle",
		hAlign = "Left",
		offset = {0, 0},
	},
	FEHelpTipTextStyle = {
		type = "Text",
		font = "ButtonFont",	
		color = {255,255,255,255},
		vAlign = "Middle",
		hAlign = "Left",		
	},
	
	FEButtonTextStyle = {
		type = "Text",
		font = "ButtonFont",	
		color = COLOR_BUTTON_TEXT_DEFAULT,
		vAlign = "Middle",
		hAlign = "Center",
	},
	FEListBoxItemTextStyle = {
		type = "Text",
		font = "ButtonFont",
		color = {255,255,255,255},
		vAlign = "Middle",
		hAlign = "Left",
		offset = {4,0},
	},
	FEListBoxItemTextStyle_MAX = {
		type = "Text",
		font = "ButtonFont",
		color = {0,0,0,255},
		vAlign = "Middle",
		hAlign = "Left",
		offset = {4,0},
	},
	FETableTitleTextStyle = {
		type = "Text",
		font = "Blender",
		color = "RM_FETextBlueBright",
		vAlign = "Middle",
		hAlign = "Left",
		offset = {4, 0},	
	},
	FETableCellTextStyle = {
		type = "Text",
		font = "ListBoxItemFont",
		vAlign = "Middle",
		hAlign = "Left",
		offset = {4, 0},	
		color = {255,255,255,255},
	},

	SubtitleSPTextStyle = {
		type = "Text",
		font = "SPSubtitleFont",
		vAlign = "Top",
		hAlign = "Left",
		offset = {4, 0},	
		color = {255,255,255,255},
	},
	SubtitleGenericTextStyle = {
		type = "Text",
		font = "GenericSubtitleFont",
		vAlign = "Top",
		hAlign = "Left",
		offset = {4, 0},	
		color = {255,255,255,255},
	},
	SubtitleLocationCardTextStyle = {
		type = "Text",
		font = "LocationCardFont",
		vAlign = "Top",
		hAlign = "Center",
		offset = {0, 0},	
		color = {255,0,0,255},
		pixels = (60),
		typeFace = 2,
		rel = 2160,
	},
	

		


	----------------------------------- RM Button Styles ------------------------------------

	

	RM_FEButtonStyleRed = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		marginWidth = 16,

		stateIconOfs = { 0.0, 32/256 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
		Layout = {
					--pivot_XY = { 0.0, 0.0 },					
					--pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
					--size_WH = {w = .5, h = 24, wr = "par", hr = "px",},					
					--pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
					--pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
		},

			
		IconBase = {
			size = {4, 4},
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched_RM.tga",
			uvRect = { 32/128, 0/256, 64/128, 32/256 },
			patch_X = { 12, -8, 12, 0 },
			patch_Y = { 12, -8, 12, 0 },
			patch_Scale = 1,
			--marginHeight = 90,
			marginWidth = 32,

			--fill = "DATA:UI\\NewUI\\Styles\\Fill_ScreenWhite.tga",
			--scaleFill = { 0, 1 },
			
			Surface = {
				surface = "ui_multistate";
				{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},
		},
		
		textColor			= {255,255,255,255},
		overTextColor			= {200,200,200,255},
		pressedTextColor			= {0,0,0,255},
		disabledTextColor			= "RM_FEColorDisabled",

		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_FEButtonTextStyle",
			--dropShadow = 1,
		},
	},	

	




	
	
	
	RM_FEButtonStyleShipSel = 
	{
		type 				= "Button",
		size 				= {120, 24},
		
		--marginWidth = 16,
		--autosize  = 1,
		--toggleButton = 1,
		--stateIconOfs = { 0.0, 0.0 },
		--stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		--BackgroundGraphic = MENU_BUTTON_GRAPHIC,
		
		
		stateBaseOfs = { 0.0, 32/256 },
		stateBaseCells = { 0, 1, 2, 3, 4, 5,6, 7 },
			
		BackgroundGraphic = {
			size = {4, 4},
			texture = "DATA:UI\\NewUI\\Styles\\RM_Buttons_Patched_Flat.tga",
			uvRect = { 0/256, 0/256, 32/256, 32/256 },
			patch_X = { 12, -8, 12, 0 },
			patch_Y = { 12, -8, 12, 0 },
			patch_Scale = 1,		
			
			Surface = {
				surface = "ui_multistate";
				{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},
		},
		
		textColor			= "RM_FETextColor",
		overTextColor			= "RM_FEBrightTextColor",
		pressedTextColor			= {209,255,251,255},
		disabledTextColor			= "RM_FEColorDisabled",
		pressedColor 		= "FEColorOutline",
		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "RM_FEButtonTextStyle",
			--dropShadow = 1,
		},
		;		
		{
		    -- The ship icon is put into this frame.
			type = "Frame",
			name = "shipIcon",			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
				
			},		
			giveParentMouseInput = 1,
			backgroundGraphicHAlign = "Center",
			backgroundGraphicVAlign = "Center",
			},
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
				--backgroundColor          = {233,54,77,255},
				--borderColor 		= {255,162,255,255},
				--borderWidth 		= 2,
				autosize=1,						
				Layout = {
					--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
					pos_XY = { x = 1, y = .25, xr = "par", yr = "par" },
					pivot_XY = { 1, 0 },				
					size_WH = { w = 1, h = .45, wr = "px", hr = "par" },
					margin_RB  = { r = 2, b = 0, rr = "px", br = "px" },
				},			
				name = "shipCount",
				Text = {
					--textStyle = "TaskbarHD_ButtonTextStyle",
					color = { 255, 255, 255, 255},
					--rel = 1080,
					minShrink = .1,
					--hAlign = "Right",
					--vAlign = "Bottom",
					type = "Text",
					font = "ButtonFont",
					color = "IGColorButtonText",
					dropShadow = 1,
					--pixels  = 20,
					style  = 1,
					hAlign = "Center",
				},
				giveParentMouseInput = 1,
			},
		
	},	

	---------------------------------------------------------------------------------------------------------------------------------
	-- BUTTON STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	
	FEButtonStyle2 = 
	{
		type 				= "Button",
		size 				= {120, 13},
			
		stateIconOfs = { 0.0, 16/128 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			
		IconBase = {
			size = {361, 276},
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 33/64, 1/128, 63/64, 15/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_Scale = 1,
			
			Surface = {
				surface = "ui_multistate";
				{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},
		},
		
		textColor			= {255,215,0,255},
		overTextColor			= {255,215,0,255},
		pressedTextColor			= {255,215,0,255},
		disabledTextColor			= "FEColorDisabled",

		-- NOTE: if you dont want an onEnter sound for your button, use FEButtonStyle2NoEnterSound instead!
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		Text = 
		{
			textStyle = "FEButtonTextStyle",
			dropShadow = 1,
		},
	},
	
	-- These are used for buttons that are not meant to have enter sounds (eg. menus)
	FEButtonStyle1NoEnterSound = {
		type = "Button",
		buttonStyle = "FEButtonStyle1",
		soundOnEnter = "",
	},
	FEButtonStyle2NoEnterSound = {
		type = "Button",
		buttonStyle = "FEButtonStyle1",
		soundOnEnter = "",
	},
	
	









	FETabButtonStyle = {
		type 				= "Button",
		size 				= {90, 15},
			
		borderWidth 		= 2,
		
		backgroundColor          = {0,0,0,0},
		borderColor 		= "FEColorOutline",
		textColor			= "FEColorOutline",
		
		overColor 			= {0,175,255,127},
		overBorderColor 		= "FEColorOutline",
		overTextColor		= {255,215,0,255},
		
		pressedColor 		= "FEColorOutline",
		pressedBorderColor 	= "FEColorOutline",
		pressedTextColor 	= {255,255,255,255},
		
		disabledColor 		= {0, 0, 0, 255},
		disabledBorderColor 	= {152, 152, 152, 255},
		disabledTextColor 	= {152, 152, 152, 255},
		
		flashColor 			= {255,255,255,255},
		
		soundOnEnter 		= "SFX_TabEnter",
	},
	
	
	

	
	FEListBoxItemButtonStyle_MAX = {
		type = "Button",
		buttonStyle = "FEListBoxItemButtonStyle",
		
		backgroundColor = {77,54,33,255},
		overColor = {161, 95, 17, 255},
		pressedBorderColor = {250,162,56,255},
		pressedColor = {161, 95, 17, 255},
	},
	
	FEListBoxItemButtonStyle_DEF = {
		type = "Button",
		buttonStyle = "FEListBoxItemButtonStyle",
		
		backgroundColor = {33,77,54,255},
		overColor = {17,161,95, 255},
		pressedBorderColor = {56,250,162,255},
		pressedColor = {17,161,95, 255},
	},
	

	FETableTitleButtonStyle = {
		backgroundColor = COLOR_LISTITEM_TITLEBAR_COMPLETED,
		defaultColor = {200,200,200,255},
		overColor = COLOR_LISTITEM_TITLEBAR,
		pressedColor = COLOR_LISTITEM_TITLEBAR_COMPLETED,

		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
	},


	FECheckBoxButtonStyle = {
		type = "Button",
		
		toggleButton = 1,
		--size = {13, 13},

		--backgroundColor          = {33,54,77,255},
		--borderColor 		= {56,162,250,255},
		--borderWidth 		= 2,
		
		--disabledColor 		= {50,50,50,255},
		--disabledBorderColor 	= {152, 152, 152, 255},
		--disabledTextColor 	= {152, 152, 152, 255},
		
		flashColor 			= {254,116,7,  255},
		
		soundOnButtonPressed	= "SFX_CheckBoxUnchecked",
		soundOnButtonUnpressed = "SFX_CheckBoxChecked",

		--stateBaseOfs = { 0.0, 16/128 },
		--stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		--TintGraphics = 1,
		
		--disabledBorderColor = COLOR_BUTTON_BGRD_DISABLED,
		--backgroundBorderColor = COLOR_BUTTON_BGRD_DEFAULT,
		--overBorderColor = COLOR_BUTTON_BGRD_PRESSED,
		--pressedBorderColor = COLOR_BUTTON_BGRD_HOVER,
			
		BackgroundGraphic = {
			size = {13,13},
			texture = "DATA:\\UI\\NewUI\\Elements\\checkbox_blank.tga",
			uvRect = { 0, 1, 1, 0 },
			--color = {56,162,250,255},
		},

		PressedGraphic = {
			size = {13,13},
			texture = "DATA:\\UI\\NewUI\\Elements\\checkbox_pressed.tga",
			uvRect = { 0, 1, 1, 0 },
			--color = {56,162,250,255},
		},
		
		DisabledPressedGraphic = {
			size = {13,13},
			texture = "DATA:\\UI\\NewUI\\Elements\\checkbox_disabledpressed.tga",
			uvRect = { 0, 1, 1, 0 },
			--color = {152,152,152,255},
		},
	},
	
	--  FIXME: use check box for temp
	FERadioButtonStyle = {
		type = "Button",
		buttonStyle = "FECheckBoxButtonStyle",
	},
	
	FEReadyButtonStyle = {
		type = "Button",
		buttonStyle = "FECheckBoxButtonStyle",
		soundOnButtonPressed = "SFX_ReadyButtonChecked",
		soundOnButtonUnpressed = "SFX_ReadyButtonUnchecked",
	},
	
	
		
	
	
	
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- OTHER STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	FEScrollBarStyle = {
		type = "ScrollBar",
		scrollBarStyle = "DefaultScrollBarStyle",		
	},
	
	
	
	FEDropDownListBoxStyle = {
		type = "DropDownListBox",	
		
		--size = { 208, 13},
		
		itemsToShowOnDrop = 10,
		
		soundOnClicked = "SFX_DropDownListClick",
		soundOnEnter 	= "SFX_DropDownListEnter",

		--borderWidth = 1,
		--borderColor = {0,0,255,255},
		--borderColor = "FEColorScrollButtonDefault",
		--overBorderColor = "FEColorScrollButtonPressed",
		--pressedBorderColor = "FEColorScrollButtonPressed",
		--backgroundColor = COLOR_WHITE_SOLID,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		
		ListBox = {
			type = "ListBox",
			name = "listLevelsListBox",
			listBoxStyle = "FEListBoxStyle",
			size = { 208, 130},
			backgroundColor = {0,0,0,235},
			scrollBarSpace = 1,
			soundOnExit = "",
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
			--backgroundColor = COLOR_GREEN_SOLID,
		},
		
		Button = {

				type = "Button",
				--size = {13,13},
				--position = {2,0},
				Layout = {								
					size_WH = {	w =SCROLLBAR_WIDTH, h = 1, wr = "scr_min", hr = "par" },
					pivot_XY = { 1.0, .5 },					
					pos_XY = {	x=1, y=.5, xr="par", yr="par",},	
					lockAspect=1,		
				},	

				backgroundColor = {255,0,0,128},
				soundOnClicked = "SFX_DropDownListClick",
				giveParentMouseInput = 1,
				--borderColor = "FEColorScrollButtonDefault",
				--borderWidth = 1,
				
				
				IconBase = {
					texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
					uvRect = { 0, 0, 1, 1 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_SURFACE,
				},
				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Styles\\white.tga",
					uvRect = { 0, 1, 1, 0 },
					patch_ResScale = RES_SCALE,		
					Surface = STD_ARROW_BUTTON_DARK_SURFACE,
				},



			--	stateIconOfs = { 0.0, 0.0 },
			--	stateIconeCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
					--	IconBase = MENU_SCROLLGRIP_BORDER_GRAPHIC,
		--DefaultGraphic = MENU_SCROLLGRIP_GRAPHIC,
			--	IconBase = {			
			--		texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_vert.tga",
			--		uvRect = { 0, 1, 1, 0 },
			--		patch_X = { -4/4,56/4,-4/4,0 },
			--		patch_Y = { -4/4,56/4,-4/4,0 },
			--		patch_ResScale = RES_SCALE,		
			--		Surface = STD_ARROW_BUTTON_SURFACE,				
			--	},

				--BackgroundGraphic = {
				--	texture = "DATA:UI\\NewUI\\Styles\\white.tga",
				--	uvRect = { 0, 1, 1, 0 },
				--	patch_ResScale = RES_SCALE,		
				--	Surface = STD_ARROW_BUTTON_BACK_SURFACE,
				--},

			},


		
	},
	
	FETextInputStyle = {
		type = "TextInput",
		size = {120, 13},
		
		borderWidth = 1,
		
		backgroundColor = { 62, 86, 98, 255},
		disabledColor = { 62, 86, 98, 63},
		borderColor = { 112, 157, 180, 255},
		disabledBorderColor = { 112, 157, 180, 63},
		borderWidth = 1,
			
		Text = {			
			color = {255,255,255,255},
			font = "Blender",
			vAlign = "Middle",
			hAlign = "Left",	
		},
		
		-- sound set in default style
	},
	
	FEChatTextInputStyle = {
		type = "TextInput",
		
		size = {120, 21},
		backgroundColor = { 62, 86, 98, 255},
		borderColor = { 112, 157, 180, 255},
		borderWidth = 1,
		
		--marginWidth = 5,
			
		Text = {			
			color = {255,255,255,255},
			font = "Blender",
			vAlign = "Middle",
			hAlign = "Left",	
		},
		
		-- sound set in default style
	},
		
	FETableStyle = {
		type = "Table",
		--size = {300, 200},
		
		--backgroundColor = {0,255,0,255},
		arrangetype="vert",

		showColumnTitles = 1,
		showRowTitles = 0,
				
		headerSpacing = 6,
		
		cellSpacing = {2, 2},
		
		sortByColumn = 0,
		
		defaultRowHeight = 24,  --32/600
		defaultColWidth = .1, 
		
		titleHeight = 20,  --20/600
		
		-- scrollview
		scrollHorz = 0,
		scrollVert = 1,
		--contentsSize = {300,400},
		scrollPosition = {0, 0},
		
		selectedRowColor = "FEColorOutline",
		
		DefaultColTitleCell = {
			type = "TableCell",		
			resizeChildren = 0,	
			name = "hw2tablecoltitle",
			;
			{
				type = "TextButton",
				
				buttonStyle = "FETableTitleButtonStyle",
								
				Text = {
					textStyle = "FETableTitleTextStyle",
				},
			},
		},
		
		DefaultCell = {
			type = "TableCell",
			name = "hw2tablecell",
			resizeChildren = 1,	
			giveParentMouseInput = 1,
			arrangetype="horiz",
			--			backgroundColor = {255,255,255,127},
			--			disabledColor= {255,0,0,127},
			--			outerBorderWidth = 2,   
			--			borderColor = { 0, 175, 255, 255},
			--			overBorderColor = {255,255,255,255},
			--			disabledBorderColor = {175,175,175,255},
			;
			{
				type = "TextLabel",
				name = "lblDefaultCell",
				giveParentMouseInput = 1,
				marginWidth = 4,
				--backgroundColor = {255,175,255,127},
				Text = {
					textStyle = "FEListBoxItemTextStyle",
					vAlign = "Middle",
					hAlign = "Left",
					offset = {0,0},
					color = {255,255,255,255},
				},
				autosize=1,
				Layout = {
					pos_XY = {	y = .5, yr = "par"	},	
					pivot_XY = { 0.0, .5 },	
					--pos_XY = {	x = 0, y = 0, xr = "scr",	yr = "scr"	},	
					--size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },							
				},		

			},
			{
				type = "Frame",
				name = "CellIcon",
				--giveParentMouseInput = 1,
				marginWidth = 4,
				--backgroundColor = {255,175,255,127},
				--enabled=0,
				visible=0,
				--helpTip = "$3421",		
				ignored=1,
				Layout = {
					--pos_XY = {	x = 1, y = 0, xr = "par",	yr = "par"	},	
					--pivot_XY = { 1.0, 0.0 },	
					size_WH = {	w = 1000.0, h = 1.0, wr = "px", hr = "par" },		
					lockAspect=1,					
				},	
				stateBaseOfs = { 0.0, 32/64 },
				stateBaseCells = { 0, 0, 0, 0, 0 },

				BackgroundGraphic = {
					texture = "DATA:UI\\NewUI\\Multiplayer\\SeverIcons.tga",
					uvRect = { 32/256, 32/64, 64/256, 0/64 },

					patch_ResScale = RES_SCALE,		
					Surface = THREESTATEBUTTONSURFACE,
				},


			},



		},




	},
	
	FESliderStyle = {
		type = "ScrollBar",
		orientation = "Horizontal",
		resizeToParent = 0,
		--size = {212, 13},
		range = {0, 100},
		stepSize = 1,
		pageSize = 20,
		TrackVertButton = {
			type = "Button",
			buttonStyle = "DefaultScrollBar_TrackVertStyle",
			--maxSize = {13, 17}, -- The trackbars do not resize on the slider controls
			Layout = {						
				max_WH = {	w = 1, h = 17.0/600, wr = "par", hr = "scr" },	
			},	
		},
		TrackHorzButton = {
			type = "Button",
			name = "trackHorzButton",
			buttonStyle = "DefaultScrollBar_TrackHorzStyle",
			--maxSize = {17, 13},-- The trackbars do not resize on the slider controls
			Layout = {						
				max_WH = {	w = 17.0/800, h = 1.0, wr = "scr", hr = "par" },	
			},	
		},
	},
	
	FESliderLabelStyle = {
		type = "InterfaceElement",
		borderColor = {151,179,153,255},
		borderWidth = 1,
		backgroundColor = {16,38,46,127},
		--size = {40, 13},


		--marginWidth = 4,
	
	},
	
	FEBorderListBoxStyle = {
		type = "ListBox",
		size = { 200, 100},
		borderColor = "IGColorOutline",
		borderWidth = 1,
		marginWidth = 3,
		marginHeight = 3,
		scrollBarSpace = 6,
	},

	FEInfoButtonStyle = {
		type = "Button",
		size = {16,16},
		DefaultGraphic = {
			texture = "data:ui/newui/network/infobutton.mres",
			textureUV = {0,0,16,16},
			color = {56,162,250},
		},
		OverGraphic = {
			texture = "data:ui/newui/network/infobutton.mres",
			textureUV = {0,0,16,16},
			color = {255,255,255,255},
		},
		PressedGraphic = {
			texture = "data:ui/newui/network/infobutton.mres",
			textureUV = {0,0,16,16},
			color = {255,255,255,255},
		},
	},	
	
	
	
	
	
	
	
	
	
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- IN GAME STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- TEXT STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	IGHeading1 = { -- (largest)
		type = "Text",
		textStyle = "FEHeading3",
	},
	
	IGHeading2 = {
		type = "Text",
		textStyle = "FEHeading4",
	},
	
	IGHeading3 = { 
		type = "Text",
		textStyle = "FEHeading4",
	},
	
	IGButtonTextStyle = {
		type = "Text",
		textStyle = "FEButtonTextStyle",
	},
	
	IGListBoxItemTextStyle = {
		type = "Text",
		textStyle = "FEListBoxItemTextStyle",
	},
		
	
	IGListBoxItemButtonStyle = {
		type = "Button",
		buttonStyle = "FEListBoxItemButtonStyle",
	},
	
	IGHelpTipTextStyle = {
		type = "Text",
		font = "ButtonFont",	
		color = {255,255,255,255},
		vAlign = "Middle",
		hAlign = "Left",		
	},
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- BUTTON STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	IGButtonStyle1 = {
		type = "Button",
		buttonStyle = "FEButtonStyle1",
	},
	
	IGButtonStyle1NoEnterSound = {
		type = "Button",
		buttonStyle = "FEButtonStyle1NoEnterSound",
	},
	
	IGRadioButtonStyle = {
		type = "Button",
		toggleButton = 1,

		stateBaseOfs = { 0.0, 16/128 },
		stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			
		BackgroundGraphic = MENU_RADIOBUTTON_GRAPHIC,

		soundOnClicked = "SFX_CheckBoxChecked",
	},
	
	IGRadioButtonTextStyle = {
		type = "Text",
		font = "ButtonFont",
		color = {255,255,255,255},
		hAlign = "Left",
		vAlign = "Middle",
		offset = {16,0},
	},
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- OTHER STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	IGListBoxStyle = {
		type = "ListBox",
		listBoxStyle = "FEListBoxStyle",
	},
	
	IGDropDownListBoxStyle = {
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
	},
	
	IGCheckBoxStyle = {
		type = "Button",
		buttonStyle = "FECheckBoxButtonStyle",
	},
	
	OptionTabButtonStyle = {
		
		type 				= "Button",
		size 				= {90, 15},
			
		--borderWidth 		= 2,
		
		BackgroundGraphic = MENU_COMMANDBUTTON_GRAPHIC,

		soundOnClicked 		= "SFX_ButtonClick",

		backgroundColor     = COLOR_TAB_BACKGROUND_DEFAULT,
		--backgroundColor     = COLOR_RED_SOLID,
		--TintGraphics = 1,
		--borderColor 		= COLOR_TAB_BORDER_DEFAULT,
		textColor			= COLOR_BUTTON_TEXT_DEFAULT,
		
		overColor 			= COLOR_TAB_BACKGROUND_HOVER,
		--overBorderColor 	= COLOR_TAB_BORDER_HOVER,
		overTextColor		= COLOR_BUTTON_TEXT_HOVER,
		
		pressedColor 		= COLOR_TAB_BACKGROUND_PRESSED,
		--pressedBorderColor 	= COLOR_TAB_BORDER_PRESSED,
		pressedTextColor 	= COLOR_BUTTON_TEXT_PRESSED,
		
		disabledColor 		= {0, 0, 0, 255},
		--disabledBorderColor 	= {152, 152, 152, 255},
		disabledTextColor 	= {0, 0, 0, 255},
		
		flashColor 			= {255,78,78,64},
		
		soundOnEnter 		= "SFX_TabEnter",

		Text = {
			text = "Default",
			textStyle = "FEButtonTextStyle",
		},
				

	},
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- BUILD MENU STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	BuildManagerButton1 = {
		type = "Button",
		buttonStyle = "IGButtonStyle1",
		
		size = {23,23},
	},
	
	BuildManagerButton2 = {
		type = "Button",
		buttonStyle = "FEButtonStyle2",
	},
	
	IGButtonFacility = {
		type = "Button",
		
		size = {24,25},
		
		soundOnEnter 		= "SFX_FacilityTabEnter",
			
		flashColor = {0,0,0,0},
		flashBorderColor = {0,0,0,0},
		borderWidth = 0,
	},
	
	
	-- for selecting next build / launch ship
	IGPrevButton = {
		type = "Button",

		Layout = {								
			size_WH = {	w = 13/800, h = 1, wr = "scr", hr = "par" },
		},	

		stateIconOfs = { 0.0, 0.0 },
		stateIconeCells = { 0, 1, 2, 3, 4, 5, 6, 7 },

		IconBase = {			
			texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_horiz.tga",
			uvRect = { 0, 0, 1, 1 },
			patch_X = { -4/4,56/4,-4/4,0 },
			patch_Y = { -4/4,56/4,-4/4,0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_ARROW_BUTTON_SURFACE,				
		},

		soundOnEnter = "SFX_ButtonEnter",
		soundOnClicked = "SFX_ButtonClick",
	},
	
	-- for selecting previous build / launch ship
	IGNextButton = {
		type = "Button",

		Layout = {								
			size_WH = {	w = 13/800, h = 1, wr = "scr", hr = "par" },		
		},	

		stateIconOfs = { 0.0, 0.0 },
		stateIconeCells = { 0, 1, 2, 3, 4, 5, 6, 7 },

		IconBase = {			
			texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\arrow_horiz.tga",
			uvRect = { 1, 0, 0, 1 },
			patch_X = { -4/4,56/4,-4/4,0 },
			patch_Y = { -4/4,56/4,-4/4,0 },
			patch_ResScale = RES_SCALE,		
			Surface = STD_ARROW_BUTTON_SURFACE,				
		},

		soundOnEnter = "SFX_ButtonEnter",
		soundOnClicked = "SFX_ButtonClick",
	},
		
	
	
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- TASKBAR STYLES
	---------------------------------------------------------------------------------------------------------------------------------

	Taskbar_MenuButtonTextStyle =
	{
		type = "Text",
		font = "ButtonFont",
		color = "IGColorButtonText",
		size  = 8,
		style  = 1,
		hAlign = "Center",
	},
	
	TaskbarHD_ButtonTextStyle =
	{
		type = "Text",
		font = "ButtonFont",
		color = "IGColorButtonText",
		dropShadow = 1,
		pixels  = 20,
		style  = 1,
		hAlign = "Center",
	},

	RM_TaskbarHD_ButtonTextStyle =
	{
		type = "Text",
		font = "ButtonFont",
		color = "RM_FETextBlueBright",
		dropShadow = 0,
		--pixels  = 20,
		--style  = 1,
		hAlign = "Center",
		vAlign = "Middle",
		
	},

	RM_TaskbarHD_ButtonTextStyle_Yellow =
	{
		type = "Text",
		font = "ButtonFont",
		color = "RM_FETextBlack",
		dropShadow = 0,
		--style  = 1,
		hAlign = "Center",
		vAlign = "Middle",
		pixels = (22*2),
		rel = 2160,
	},

	RM_TaskbarHD_ButtonTextStyle_Red =
	{
		type = "Text",
		font = "ButtonFont",
		color = "RM_FETextBlack",
		dropShadow = 0,
		--pixels  = 20,
		--style  = 1,
		hAlign = "Center",
		vAlign = "Middle",
		
	},



	TaskbarHD_ButtonTextStyle_Red =
	{
		type = "Text",
		font = "ButtonFont",
		color = { 255, 0, 0, 255},
		overTextColor = { 255, 0, 0, 255},
		dropShadow = 1,
		--pixels  = 20,
		style  = 1,
		hAlign = "Center",
	},
	
		

	Taskbar_SensorsButtonStyle =
	{
		type = "Button",
		size = {96, 13},
		backgroundColor = { 238, 188, 5, 255},
		overColor = { 187, 146, 4, 255},
		flashColor = { 255, 255, 255, 255},
		flashSpeed = 250,
		
		soundOnClicked 		= "SFX_ButtonClick",
	},
	
	
	HD_HUD_Type1 = 
	{
		type 				= "Button",
		
		Layout = {
			pos_XY = {x = 0.0, y = 0.0, xr = "px", yr = "px" },
			size_WH = { w = 18.0, h = 14.0, wr = "px", hr = "px" },
		},
		
		stateBaseOfs = { 0.0, 16/128 },
		stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 1/64, 1/128, 31/64, 15/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_PadX = {3, -3},
			patch_PadY = {2, -2},
			patch_Scale = 1,
		},
		
		--overColor = { 255, 0, 0, 255},
		--flashColor = { 255, 255, 255, 255},
		--flashSpeed = 250,
		
		textColor			= "IGColorButtonText",
		overTextColor			= "IGColorButtonOver",
		pressedTextColor			= "IGColorButtonPressed",
		disabledTextColor			= "FEColorDisabled",

		Text = 
		{
			textStyle = "TaskbarHD_ButtonTextStyle",
			--dropShadow = 1,
			pixels = 8,
		},
	},
	
	HD_HUD_Type2 = 
	{
		type 				= "Button",
		
		Layout = {
			pos_XY = {x = 0.0, y = 0.0, xr = "px", yr = "px" },
			size_WH = { w = 18.0, h = 14.0, wr = "px", hr = "px" },
		},
		
		stateBaseOfs = { 0.0, 16/128 },
		stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 33/64, 1/128, 63/64, 15/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_PadX = {3, -3},
			patch_PadY = {2, -2},
			patch_Scale = 1,
		},
		
		textColor			= {255,215,0,255},
		overTextColor			= {255,215,0,255},
		pressedTextColor			= {255,215,0,255},
		disabledTextColor			= "FEColorDisabled",

		Text = 
		{
			textStyle = "TaskbarHD_ButtonTextStyle",
			dropShadow = 1,
			pixels = 8,
		},
	},
	
	
	
	
	TaskbarHD_ShipButtonStyle =
	{
		type = "Button",

		;		

	},
	
	Taskbar_CommandButtonStyle =
	{
		type = "Button",
		size = {30, 30},
		stateBaseOfs = { 0.0, 0.2 },
		stateBaseCells = { 0, 1, 2, 3, 4 },

		soundOnClicked 		= "SFX_ButtonClick",
	},
		
	RM_TaskbarHD_CommandButtonStyle =
	{
		type = "Button",
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },		
		},

		BackgroundGraphic = MENU_COMMANDBUTTON_GRAPHIC,
		stateBaseOfs = { 0.0, 64/512 },
		--stateBaseCells = { 0, 1, 2, 3,       2, 3, 2, 7 },
		stateBaseCells = { 0, 1, 2, 3,       3, 3, 3, 7 },
		soundOnClicked 		= "SFX_ButtonClick",
		cursorType = "Normal",
	},
	
	RM_TaskbarHD_CommandButtonToggleStyle =
	{
		type = "Button",
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },		
		},

		IconBase = MENU_COMMANDBUTTON_GRAPHIC,
		stateIconOfs = { 0.0, 64/512 },
		stateIconCells = { 0, 1, 2, 3, 3, 3, 2, 7 },

		soundOnClicked 		= "SFX_ButtonClick",
	},


	RM_ButtonTabStyle =
	{
		type = "Button",

		--size 				= {90, 15},
		autosize=1,
			
		borderWidth 		= 2,
		
		backgroundColor     = COLOR_TAB_BACKGROUND_DEFAULT,
		borderColor 		= COLOR_TAB_BORDER_DEFAULT,
		textColor			= COLOR_BUTTON_TEXT_DEFAULT,
		
		overColor 			= COLOR_TAB_BACKGROUND_HOVER,
		overBorderColor 	= COLOR_TAB_BORDER_HOVER,
		overTextColor		= COLOR_BUTTON_TEXT_HOVER,
		
		pressedColor 		= COLOR_TAB_BACKGROUND_PRESSED,
		pressedBorderColor 	= COLOR_TAB_BORDER_PRESSED,
		pressedTextColor 	= COLOR_BUTTON_TEXT_PRESSED,
		
		disabledColor 		= {0, 0, 0, 255},
		disabledBorderColor 	= {152, 152, 152, 255},
		disabledTextColor 	= {0, 0, 0, 255},
		
		flashColor 			= {255,255,255,255},
		
		soundOnEnter 		= "SFX_TabEnter",

		Text = {
				text = "X",
				textStyle = "FEButtonTextStyle",
		},
	},



	RM_TaskbarHD_ButtonTabStyle =
	{
		type = "Button",
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },		
		},

		IconBase = MENU_TABBUTTON_GRAPHIC,
		stateIconOfs = { 0.0, 64/512 },
		stateIconCells = { 0, 1, 2, 2, 5, 4, 4, 6 },

		soundOnClicked 		= "SFX_ButtonClick",
	},

	RM_TaskbarHD_ButtonTabLeftVertStyle =
	{
		type = "Button",
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },		
		},

		IconBase = MENU_TABBUTTON_LEFT_VERT_GRAPHIC,
		stateIconOfs = { 0.0, 64/512 },
		stateIconCells = { 0, 1, 2, 2, 5, 4, 4, 6 },

		soundOnClicked 		= "SFX_ButtonClick",
	},

	RM_TaskbarHD_MenuButtonStyle =
	{
		type = "Button",
		size = {32, 32},


		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },			
			--size_WH = { w = 64.0, h = 64.0, wr = "px", hr = "px" },
		},
		stateBaseOfs = { 0.0, 128/1024 },
		stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		soundOnClicked 		= "SFX_ButtonClick",
	},


	Taskbar_SubsystemButtonStyle =
	{
		type = "Button",
		name = "subsystem1",
		size = { 32, 24},
		helpTipTextLabel = "commandsHelpTip",
		
		soundOnClicked 		= "SFX_ButtonClick",
		;
		{
			type = "Frame",
			name = "icon",
			size = { 32, 24},
			giveParentMouseInput = 1,
		},
	},
	
	TaskbarHD_SubsystemButtonStyle =
	{
		type = "Button",
		name = "subsystem1",
		
		Layout = {
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
			size_WH = { w = SMALLSUBSYSTEMICON_W, h = SMALLSUBSYSTEMICON_H, wr = "px", hr = "px" },
		},
		
		helpTipTextLabel = "commandsHelpTip",		
		--backgroundColor = {0, 255, 0, 200},
		soundOnClicked 		= "SFX_ButtonClick",
		;
		{
			type = "Frame",
			name = "icon",
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = SMALLSUBSYSTEMICON_W, h = SMALLSUBSYSTEMICON_H, wr = "px", hr = "px" },
			},
			giveParentMouseInput = 1,
		},
	},

	---------------------------------------------------------------------------------------------------------------------------------
	-- RIGHT CLICK MENU STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	RightClickMenu_ButtonTextStyle =
	{
		type = "Text",
		font = "ButtonFont",
		color = COLOR_BUTTON_TEXT_DEFAULT,
		size  = 8,
		style  = 1,
		hAlign = "Center",
	},
	
	RightClickMenu_ButtonStyle =
	{
		type = "Button",
		toggleButton = 1,
		--borderWidth = 1,
		--borderColor = { 0, 175, 255, 255},
		overColor = { 48, 108, 136, 255},
		overBorderColor = { 255, 255, 255, 255},
		pressedColor = { 48, 108, 136, 255},
		disabledBorderColor = COLOR_BUTTON_TEXT_DISABLED,
		disabledTextColor = COLOR_BUTTON_TEXT_DISABLED,
		disabledColor = COLOR_BUTTON_BGRD_DISABLED,
		backgroundColor = COLOR_BUTTON_BGRD_DEFAULT,
		soundOnClicked 		= "SFX_RightClickMenuClick",
	},

	---------------------------------------------------------------------------------------------------------------------------------
	-- DIPLOMACY SCREEN STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	DiplomacyScreen_ButtonTextStyle =
	{
		type = "Text",
		font = "ButtonFont",
		color = { 0, 175, 255, 255},
		size  = 8,
		style  = 1,
		hAlign = "Center",
	},
	
	DiplomacyScreen_ButtonStyle =
	{
		type = "Button",
		buttonStyle = "FEButtonStyle1",
	},

	DiplomacyScreen_PlayerButtonTextStyle =
	{
		type = "Text",
		font = "ButtonFont",
		color = { 255, 255, 255, 255},
		size  = 8,
		style  = 1,
		hAlign = "Left",
		
		soundOnClicked 		= "SFX_ButtonClick",
	},
	
	DiplomacyScreen_PlayerButtonStyle =
	{

			type = "Button",
			--size = {219, 27},

			disabledColor 		= COLOR_LISTITEM_DISABLED,
					toggleButton = 1,
			--borderWidth = 1,
			borderColor = "IGColorOutline",
			--disabledColor = COLOR_BUTTON_BGRD_DISABLED,
			--backgroundColor = COLOR_BUTTON_BGRD_DEFAULT,  -- WHITE
			--	overColor = COLOR_BUTTON_BGRD_HOVER,
			--	clickedColor = COLOR_BUTTON_BGRD_CLICKED,
			--	pressedColor = COLOR_BUTTON_BGRD_PRESSEDDEFAULT,
			--	pressoverColor = COLOR_BUTTON_BGRD_PRESSEDHOVER,
			--	pressclickColor = COLOR_BUTTON_BGRD_PRESSEDCLICKED,	
			--	flashColor = "IGColorButtonPressed",
			arrangetype = "horiz",
			--arrangeSep = {	x=PANEL_PAD_HORIZ, y=0, xr="scr", yr="scr",},	
			autosize=1,
			overColor = COLOR_SHIP_ITEMOVERCOLOR,
			pressedColor = COLOR_SHIP_ITEMPRESSEDCOLOR,
			flashColor = COLOR_SHIP_ITEMOVERCOLOR,			
			backgroundColor = COLOR_LISTITEM,
			pressoverColor = COLOR_BUTTON_BGRD_PRESSEDHOVER,
			disabledBorderColor = "IGColorOutline",
			overBorderColor = {255, 255, 255, 255},
			flashBorderColor = {255, 255, 255, 255},
			flashSpeed = 250,
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
			soundOnClicked = "SFX_ButtonClick",

			autosize=1,

			Layout = {			
				pad_LT = { l = 4/800, t = 4/600, lr = "scr", tr = "scr" },
				pad_RB = { r = 4/800, b = 4/600, rr = "scr", br = "scr" },		
		
			},	

			arrangetype = "horiz",
			;
					
			{
				type = "Frame",
				--position = { 4, 7},
				ignored=1,  -- Only want to reserve space for one!

				Layout = {			
					pivot_XY = { 0, .5 },
					pos_XY = {	x=0, y=0.5, xr="px", yr="par",},		
					size_WH = { w = 100, h = .65, wr = "px", hr = "par" },	
					lockAspect=1,			
				},	

				name = "iconrequest",
				visible = 0,
				BackgroundGraphic = {
					size = { 11, 11},
					texture = "DATA:UI\\NewUI\\InGameIcons\\allyrequest.tga",
					textureUV = { 0, 0, 11, 11 },
				},
				giveParentMouseInput = 1,
			},
														
			{
				type = "Frame",
				--position = { 4, 7},
				ignored=0,  

				Layout = {			
					pivot_XY = { 0, .5 },
					pos_XY = {	x=0, y=0.5, xr="px", yr="par",},		
					size_WH = { w = 100, h = .65, wr = "px", hr = "par" },	
					lockAspect=1,			
				},	

				name = "iconallies",
				visible = 0,
				BackgroundGraphic = {
					size = { 11, 11},
					texture = "DATA:UI\\NewUI\\InGameIcons\\allies.tga",
					textureUV = { 0, 0, 11, 11 },
				},
				giveParentMouseInput = 1,
			},
			-- Text Frame
			{
				type = "Frame",
				Layout = {			
						pivot_XY = { 0, .5 },
						pos_XY = {	x=0, y=0.5, xr="px", yr="par",},		
						--size_WH = { w = .45, h = 100/600, wr = "scr", hr = "scr" },				
				},		
				autosize=1,
				giveParentMouseInput = 1,
				;
				{
					type = "TextLabel",
					name = "name",
					eventOpaque = 0,
					autosize=1,

					Text = {
						textStyle = "DiplomacyScreen_PlayerButtonTextStyle",
						pixels  = 18,
						rel=0,
					},
					giveParentMouseInput = 1,
				},

				--This is for calculating width.  USes the max size of a player name (16) with the widdest letter W
				{
					type = "TextLabel",
					name = "dummy",
					visible=0,
					eventOpaque = 0,
					autosize=1,
					backgroundColor = COLOR_RED_SOLID,  -- WHITE

					Text = {
						textStyle = "DiplomacyScreen_PlayerButtonTextStyle",
						text= "WWWWWWWWWWWWWWWW",
												pixels  = 18,
						rel=0,
					},
					giveParentMouseInput = 1,
				},
			},
			{
				name = "teamcolor",
				type = "Frame",

				Layout = {			
					--pivot_XY = { 0, .5 },
					--pos_XY = {	x=0, y=0.5, xr="px", yr="par",},									
					size_WH = { w = 1000, h = 1, wr = "px", hr = "par" },			
					lockAspect=4,	
				},		

				backgroundColor = { 94, 151, 48, 255},
				--outerBorderWidth = 1,
				--borderColor = { 255, 0, 0, 255},

				visible = 0,
				giveParentMouseInput = 1,
				;
				{
					name = "teamstripe",
					type = "Frame",
							
					Layout = {										
						size_WH = { w = 1, h = 1, wr = "par", hr = "par" },				
					},		
							
					BackgroundGraphic = {
						size = { 40, 16},
						texture = "Data:UI\\NewUI\\Network\\m_stripes.tga",
						uvRect = { 0, 1, 1, 0 },  
					},
					giveParentMouseInput = 1,
				},
				{
					name = "emblem",
					type = "Frame",

					Layout = {			
						pivot_XY = { 0, .5 },
						pos_XY = {	x=.05, y=0.5, xr="par", yr="par",},									
						size_WH = { w = 1000, h = .99, wr = "px", hr = "par" },	
						lockAspect=1,			
					},	

					BackgroundGraphic = {
						texture = "DATA:Badges/Hiigaran.tga",
						uvRect = {0.0,1.0,1.0,0.0},
					},
					giveParentMouseInput = 1,
				},
			},
		
	},
	
	---------------------------------------------------------------------------------------------------------------------------------
	-- RESEARCH MANAGER POPUP STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	ResearchInfoTextStyle = {
		type = "Text",
		font = "ChatFont",
		color = { 255, 255, 255, 255},		
		hAlign = "Left",
	},

	---------------------------------------------------------------------------------------------------------------------------------
	-- IN GAME CHAT SCREEN STYLES
	---------------------------------------------------------------------------------------------------------------------------------
	Chat_PlayerButtonStyle =
	{
		type = "Button",

		size = { 100, 13},
		marginWidth = 3,
		backgroundColor = COLOR_BUTTON_BGRD_DEFAULT,	
		overColor = COLOR_BUTTON_BGRD_HOVER,
		pressedColor = COLOR_BUTTON_BGRD_PRESSED,
		disabledColor = COLOR_BUTTON_BGRD_DISABLED,

		disabledBorderColor = "IGColorOutline",
		textColor = { 255, 255, 255, 255},
		overTextColor = { 255, 255, 255, 255},
		pressedTextColor = { 255, 255, 255, 255},
		disabledTextColor = { 255, 255, 255, 128},

		Text = {
			textStyle = "Taskbar_MenuButtonTextStyle",
			hAlign = "Left",
		},
		
		soundOnClicked 		= "SFX_ButtonClick",
	},

	Chat_GroupButtonStyle =
	{
		type = "Button",

		size = { 100, 13},
		marginWidth = 3,
		backgroundColor = COLOR_BUTTON_ALERT_BGRD_DEFAULT,	
		overColor = COLOR_BUTTON_ALERT_BGRD_HOVER,
		pressedColor = COLOR_BUTTON_ALERT_BGRD_PRESSED,
		disabledColor = COLOR_BUTTON_ALERT_BGRD_DISABLED,

		disabledBorderColor = "IGColorOutline",
		textColor = { 255, 255, 255, 255},
		overTextColor = { 255, 255, 255, 255},
		pressedTextColor = { 255, 255, 255, 255},
		disabledTextColor = { 255, 255, 255, 128},

		Text = {
			textStyle = "Taskbar_MenuButtonTextStyle",
			hAlign = "Left",
		},
		
		soundOnClicked 		= "SFX_ButtonClick",
	},



	------Example Styles---------------------
	ExampleBackgroundStyle = {
		type = "InterfaceElement",
		backgroundColor = {0,0,0,127},
			
		Layout = {
			pos_XY = {	x = 0.10, y = 0.10, xr = "par",	yr = "par"	},			
			size_WH = {	w = 128.0, h = 256.0, wr = "px", hr = "px" },		
			pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
			pad_RB = { r = 16, b = 16, rr = "px", br = "px" },			
		},

		BackgroundGraphic = BORDER_GRAPHIC_FRAME,
	},



	DefaultGraphNodeStyle = {
		type = "GraphNode",

		Layout = {		
			pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
			--pivot_XY = { 0.5, 1.0 },
			size_WH = { w = 200, h = 80, wr = "px", hr = "px" },
			pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
			pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
		
			},	

			backgroundColor          = {255,0,0,255},
			RightPinFrame = "OutputPinFrame",
			LeftPinFrame = "InputPinFrame",
			DefaultPinToClone = "DefaultPinStyle",

			;
			{
				type = "Frame",	
				name = "OutputPinFrame",	
				Layout = {					
					pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },
					pivot_XY = { 1.0, 0 },
					size_WH = { w = 24, h = 1, wr = "px", hr = "par" },
				},		


				arrangetype = "vert",
				arrangedir = 1,		
				eventOpaque = 0,
				backgroundColor = { 0, 255, 0, 255},
						
				;		
			},
			{
				type = "Frame",	
				name = "InputPinFrame",	
				Layout = {					
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
					pivot_XY = { 0.0, 0 },
					size_WH = { w = 24, h = 1, wr = "px", hr = "par" },
				},		


				arrangetype = "vert",
				arrangedir = 1,		
				eventOpaque = 0,
				backgroundColor = { 0, 255, 0, 255},
						
				;		
			},



			{
				type = "GraphPin",	
				name = "DefaultPinStyle",	
				Layout = {					
					--pos_XY = { x = 1.0, y = 0.0, xr = "par", yr = "par" },
					--pivot_XY = { 1.0, 0 },
					size_WH = { w = 16, h = 16, wr = "px", hr = "px" },
				},		

				visible=0,
				arrangedir = 1,		
				backgroundColor = { 0, 0, 255, 255},
				overColor = { 255, 0, 255, 255},		
				;		
			},
		},



	DefaultContextMenuStyle	= {
			type = "ContextMenu",		
			Layout = { size_WH = {	w = 1.0, h = 1.0, wr = "scr", hr = "scr" },	},	
			eventOpaque = 0,
			forceSubItemFill = 1,

			contextItemFrame = {
				type = "Frame",
				name = "contextItemFrame",
			
				arrangetype = "vert",
				autosize=1,
				Layout = {		
					pad_LT = {	l = 4.0, t = 4.0, lr = "px", tr = "px" },		
					pad_RB = {	r = 4.0, b = 4.0, rr = "px", br = "px" },	
				},	

				backgroundColor = COLOR_CONTEXTMENU_BGRD,
				BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKTB_THINLR,


			},
		}







}