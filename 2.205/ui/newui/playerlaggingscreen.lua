dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

PlayerLaggingScreen = {

	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	RootElementSettings = {
		--backgroundColor = "IGColorBackground1",
		--backgroundColor = {0,128,0,200},	
		cursorType = "Normal",
	},
	eventOpaque = 0,
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	-- custom
	fstringMessage = "$2840",
	;

	{
		type = "Frame",
		Layout = {			
			--pivot_XY = { .5,1 },
			pos_XY = {	y=0.60, yr="par"},	
			size_WH = { w = .22, h = 1, wr = "par", hr = "px" },							
		},	
		backgroundColor = {0,0,0,128},	
		--Anchor_Binds = {
		--	pivotY = "Taskbar_SensorsButtonTop",
		--	pivotX = "Taskbar_SensorsButtonTop",
		--},			
		autosize = 1,

		arrangetype = "vert",

		outerBorderWidth = 1,
		borderColor = "IGColorOutline",
		;
		{
			type = "Frame",
			TitleText = "$5598",

			Layout = {			
				size_WH = { w = 1, h = 1, wr = "par", hr = "px" },		
				pad_LT = { l = 0, t = 4, lr = "px", tr = "px" },
				pad_RB = { r = 4, b = 0, rr = "px", br = "px" },			
			},	
			arrangeSep = {	x=PANEL_PAD_HORIZ, y=0, xr="scr", yr="scr",},	
			autosize=1,
			arrangetype="vert",
			;	
			-- message
			{
				type = "TextLabel",
				Layout = {								
					size_WH = { w = 1, h = 50/600, wr = "par", hr = "scr" },	
					pivot_XY = { .5, 0 },		
					pos_XY = {	x=0.5, xr="par"},			
					max_WH = { w = 1, h = 40/600, wr = "par", hr = "scr" },	
					pad_LT = { l = 0, t = 4, lr = "px", tr = "px" },
					--pad_RB = { r = 4, b = 2, rr = "px", br = "px" },	
				},	
				autosize=1,



				name = "laggingmsg",
				wrapping = 1,
				marginWidth = 8,		

				Text = {
					text="$2837",
					font = "ButtonFont",
					color = { 255, 255, 0, 255},
					hAlign = "Center",
					--vAlign = "Top",
					minShrink = 0.25,
				},
			},
			-- message
			{
				type = "TextLabel",
				Layout = {								
					size_WH = { w = 1, h = 50/600, wr = "par", hr = "scr" },	
					pivot_XY = { .5, 0 },		
					pos_XY = {	x=0.5,  xr="par"},			
					max_WH = { w = 1, h = 50/600, wr = "par", hr = "scr" },	
				},	
				autosize=1,

				name = "message",
				marginWidth = 8,
			

				Text = {
					text="WWWWWWWWWWWWWWWW",
					font = "ButtonFont",
					color = { 255, 255, 0, 255},
					hAlign = "Center",
					--vAlign = "Top",
					minShrink = 0.25,
				},
			},
			-- Don't tell me anymore checkbox


			{
				type = "Button",
				name = "btnNoMore",
				buttonStyle = "FECheckBoxButtonStyle",

				Layout = {			
					size_WH = {	w = 1000, h = 12/600, wr = "px", hr = "scr" },		
					pivot_XY = { 1, 0 },	
					pos_XY = {	x=1.0, y=0.0, xr="par", yr="par",},	
					lockAspect = 1,	
				},
				backgroundColor = {128,128,128,128},
				Text = {
					textStyle = "IGRadioButtonTextStyle",
					text = "$2842", -- STOP BUGGING ME
				},
				helpTip="$2842",
			--	backgroundColor = {255,0,255,200},
			},				


		},
		{
			type = "Frame",
			name = "frmRootbottombigfrm",			
		
			Layout = {
				margin_LT = { l = 0, t = PANEL_SPACING_VERT/2, lr = "scr", tr = "scr" },
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT/2, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },						
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },	
			},
			--backgroundColor = {0,0,0,255},
			autosize=1,

			;
			NewMenuButton("btnKick",		"$2841",	"",	0,	BTN_FOOTER_TINY_LAYOUT,	"FEButtonStyle1",					"UI_ToggleScreen( 'PlayerLaggingScreen', 0)"),	
			NewMenuButton("btnClose",		"$2843",	"",	0,	BTN_FOOTER_TINY_YES_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	"UI_ToggleScreen( 'PlayerLaggingScreen', 0)"),
					

		},
	},


}
