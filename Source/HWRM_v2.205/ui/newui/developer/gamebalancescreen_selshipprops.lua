dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
UI_LoadUILibrary("data:/ui/newui/Developer/GameBalanceScreen_Code.lua")



BALANCE_SELSHIPPROPS={
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"Selected Ship", 
		autosize=1,
		--arrangetype = "vert",
		AllowDrag = 1,

		Layout = {					

		},
		
		;

		{
			type = "Frame",		
			Layout = {	
					pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
					size_WH = {	w = .4, h = 100, wr = "scr", hr = "px" },	
					max_WH = {	w = .4, wr = "scr" },
					min_WH = {	w = .4, wr = "scr" },
			},	
			name = "frame_LeftTabs",
			arrangetype = "horiz",
			autosize  = 1,
			arrangeSep = {	x=8, y=8, xr="px", yr="px",},
			--backgroundColor = {255,0,0,255},
			;
			{
				type = "PropertyGrid",
				name = "PropertyGrid",
				UseTemplate = PROPERTYGRID_DEFAULTSTYLE,
				Layout = {						
					size_WH = {x=1, y=1, xr="par", yr="par"},
				},
				ObjectType = "ship",

			},

		},
}