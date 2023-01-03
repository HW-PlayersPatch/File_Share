
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")


	

EXAMPLE_RMCONTROLS = {
		type = "RmWindow",
		name = "Example_RM_Window",
		
		visible = 0,
		
		Layout = {
			pos_XY = {	x = 0.10, y = 0.20, xr = "par",	yr = "par"	},	
			size_WH = {	w = 512, h = 512, wr = "px", hr = "px" },		
								
		},				
		
		WindowTemplate = PANEL_WINDOWSTYLE,

		TitleText = "WAFFLECOPTER",
		--autosize=1,
		--sizetype = "contain",
		;	
		-- Insert Contents here
		{	
		type = "Frame",
		name = "Bob",
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
			size_WH = {w = 255.0,	h = 100.0,wr = "px",	hr = "px"	},		
			},	
		backgroundColor = {0,255,0,64},
		},

	}


