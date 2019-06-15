dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

EmblemSelect = {

	stylesheet = "HW2StyleSheet",
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;

	{
		type = "Frame",
		name = "frmRootbottombigfrm",
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
						
		},	
		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
		;
		{ -- root frame
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,

			TitleText = "$2785", -- EMBLEM
			-- SubtitleText = "$2786",  -- SELECT//

			autosize=1,

			;
		
			-- emblem list box
			{
				type = "ListBox",
				listBoxStyle = "FEListBoxStyle_Bordered",
				Layout = {			
					size_WH = {	w = .5, h = .8, wr = "scr", hr = "scr" },		
				},
				name = "emblemList",
				--borderColor = "FEColorPopupOutline",
				backgroundColor = {0,0,0,0},
				listitemsArrangeArray = 8,
				listitemsArrangeType = "vert",
			},

		},

		{
			type = "Frame",
						
			Layout = {
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		

			autosize = 1,
			
			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,

			;
			-- Cancel button
			{
				type = "TextButton",
				name = "cancelbutton",

				Layout = {
					pivot_XY = { 0.0, 0.5 },					
					pos_XY = {	x=0.0, y=0.5, xr="par", yr="par",},		
					size_WH = {	w = NAVIGATION_SMALL_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
				},	

				buttonStyle = "FEButtonStyle1_Outlined_Chipped",
				
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$2613",  -- CANCEL
				Text = {
					text = "$2613",  -- CANCEL
				},
			
				onMouseClicked = "UI_HideScreen( 'EmblemSelect');",

			},

			-- Ok button
			{
				type = "TextButton",
				name = "acceptbutton",
				buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",

				Layout = {
					pivot_XY = { 1.0, 0.5 },					
					pos_XY = {	x=1.0, y=0.5, xr="par", yr="par",},			
					size_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },					
				},	
					
				Text = {
					text = "$2612",  -- OK
				},
				
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$2612",  -- OK
			},

		},
		
		-- emblem items to insert into list box
		{
			type = "ListBoxItem",
			name = "emblemItem",
			ignored=1,
			visible = 0,
			Layout = {		
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },	
				size_WH = {	w = .125, h = 1000, wr = "par", hr = "px" },		
				lockAspect=1,
			},
			--size = { 70, 70},
			backgroundColor = { 118, 174, 207, 255 },
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0 },
			overBorderColor = { 0, 0, 0, 0 },
			pressedBorderColor = { 255, 255, 255, 255 },
			helpTipTextLabel = "helpTip",
			allowDoubleClicks = 1,
			resizeToListBox = 0,
			;
		
			{
				type = "Frame",
				name = "emblem",
				--position = {3, 3},
				Layout = {			
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
				},
				BackgroundGraphic = {
					size = {64, 64},
					texture = "DATA:Badges/Hiigaran.tga",
					--uvRect = {0.0,0.0,1.0,1.0},
					uvRect = { 0, 1, 1, 0 },
				},
				giveParentMouseInput = 1,
			},
			{
				type = "TextLabel",
				name = "imageError",
				ignored=1,
				visible = 0,
				position = {0, 0},
				Layout = {			
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
				},
				wrapping = 1,
				backgroundColor = { 0, 0, 0, 255},
				borderWidth = 1,
				borderColor = { 0, 0, 0, 0 },
				marginWidth = 2,
				Text = {
					font = "ChatFont",
					text = "$2790",
					hAlign = "Center",
					vAlign = "Center",
					color = { 255, 255, 255, 255},
				},
			},
		},
	},
}












	


	

