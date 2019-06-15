dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

SpeechRecall = {
	--size = { 225, 119, 351, 266},
	stylesheet = "HW2StyleSheet",
	
	Layout = {						
		pos_XY = {	x=0.5, y=0.5, xr="scr", yr="scr",},	
		pivot_XY = { 0.5, 0 },	
	},
	autosize=1,

	RootElementSettings = {
		autosize=1,
		Anchor_Binds = {
			pivotY = "Subtitle_LocationBottomCenter",
			pivotX = "Subtitle_LocationBottomCenter",
		},
		cursorType = "Normal",
	},
	
	soundOnShow = "SFX_ObjectiveMenuONOFF",
	soundOnHide = "SFX_ObjectiveMenuONOFF",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;
	
	{
		type = "Frame",
		Layout = {
			--pivot_XY = { 0.5, 0.5 },					
			--pos_XY = {	x=0.32, y=0.42, xr="par", yr="par",},									
		},	
		autosize = 1,
		arrangetype = "vert",	
		;
		
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$2940", -- SPEECH RECALL
			-- SubtitleText = "$2941", -- PLAY MOVIES
			autosize=1,

			arrangetype = "vert",

			;
			{
				type = "ListBox",
				listBoxStyle = "FEListBoxStyle_Bordered",
				position = { 0, 0},
				size = { 320, 174+39},
				name = "listSpeech",
				hugBottom = 1,
				autoHideScrollbar = 0,
			},



		},

		---------------- Close Button
		{
			type = "Frame",
			--size = {486, 18},
			--size = {SAVELOAD_WIDTH-8, 18},

			Layout = {
				--pos_XY = {	x = 0.10, y = 0.20, xr = "par",	yr = "par"	},	
				margin_LT = { l = 0, t = 0, lr = "scr", tr = "scr" },
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		

			autosize=1,
			
			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,
				
			arrangetype = "horiz",
			;
			
			{
				type = "TextButton",
				name = "m_btnAccept",

				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.5, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 1, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				buttonStyle = "FEButtonStyle1_Alert_Chipped",	
				Text = {
					text = "$2642",  -- CLOSE
				},
				onMousePressed = "UI_ToggleScreen( 'SpeechRecall', 0)",
			},
		},	
	},
	------------ Item to clone
	{
		
		type = "ListBoxItem",
		name = "listItem",
		autosize = 1,
		visible = 0,
		ignored = 1,
		marginHeight = 2,
		resizeToListBox = 1,
		Layout = {
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },					
		},	
		
		arrangetype = "horiz",
		;
		
		{
			type = "Frame",
			name = "icon",
			--position = { 0, 2},
			--size = { 16, 8},
			Layout = {				
				pos_XY = { x = 1, y = .5, xr = "px", yr = "par" },
				pivot_XY = { 0.0, 0.5 },
				size_WH = { w = 1000, h = 8/600, wr = "px", hr = "scr" },		
				lockAspect=2,			
			},	

			
		},
		
		{
			type = "TextLabel",
			name = "text",
			--position = {18, 0},	
			size = { 260, 13},
			wrapping = 1,
			--arrangeweight = 1,
			autosize = 1,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				vAlign = "Top",
				hAlign = "Left",
			},
		},
	},
}
