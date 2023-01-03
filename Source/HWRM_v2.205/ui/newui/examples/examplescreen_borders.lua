
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

-----------------------------------Defines----------------------------
EXAMPLECONTENT = {
	type = "Frame",
	name = "EXAMPLE_ScreenBorders",
	visible = 1,
		
	Layout = {
		size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "par" },			
	},
		
	backgroundColor = {0,0,0,127},
	
	--BackgroundGraphic = TOP_GRAPHIC_FILIGREE_1,
}


BACKGROUNDCOLOR = {0,0,0,127}


---------------------- Templates -------------------
			
WINDOW_BORDER = {
	type = "Graphic",
	texture = "Data:UI\\NewUI\\Styles\\LineDecorations.tga",
	--size = {40,16},
	uvRect = { 0/32, 72/128, 32/32, 88/128 },
	patch_X = {  8, -14, 8, 0 },
	patch_Y = { -2,8,-1,8,  0 },
	patch_Scale = 1,						
}


WINDOW_TEMPLATEBORDER = {

	BackgroundGraphic = {
		type = "Graphic",
		texture = "Data:UI\\NewUI\\Styles\\LineDecorations.tga",
		--size = {40,16},
		uvRect = { 0/32, 72/128, 32/32, 88/128 },
		patch_X = {  8, -14, 8, 0 },
		patch_Y = { -2,8,-1,8,  0 },
		patch_Scale = 1,						
	},

	Layout = {
		size_WH = {	w = 64.0, h = 256.0, wr = "px", hr = "px" },	
		pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
		pad_RB = { r = 16, b = 16, rr = "px", br = "px" },		
	},

	backgroundColor = BACKGROUNDCOLOR,

}



----------------------------------------------

EXAMPLE_SCREENBORDERS_HOLD = {
	type = "Frame",
	name = "EXAMPLE_ScreenBorders",
	visible = 0,
		
	Layout = {
		pos_XY = {	x = 0.0,y = 0.0,xr = "scr",	yr = "scr"	},			
		size_WH = {	w = 1.0, h = 1.0, wr = "scr", hr = "scr"},			
	},
		
	backgroundColor = {128,128,128,255},
	;
	------------Using Background Graphic Define------------------------
	{
		type = "Frame",
		name = "EXAMPLE_ScreenBorders",
		visible = 1,
		
		Layout = {
			pos_XY = {	x = 0.10, y = 0.10, xr = "par",	yr = "par"	},			
			size_WH = {	w = 640.0, h = 256.0, wr = "px", hr = "px" },		
			pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
			pad_RB = { r = 16, b = 16, rr = "px", br = "px" },			
		},
		
		backgroundColor = BACKGROUNDCOLOR,
		BackgroundGraphic = TOP_GRAPHIC_FILIGREE_1,
		;
		EXAMPLECONTENT,
	},
	---------------------Using Template--------------------------------
	{
		type = "Frame",
		name = "EXAMPLE_BordersUsingTemplate",
		visible = 1,
		
		Layout = {
			pos_XY = {	x = 0.30, y = 0.60, xr = "par",	yr = "par"	},								
		},				
		UseTemplate = WINDOW_TEMPLATEBORDER,
		;
		EXAMPLECONTENT,

	},
	---------------------Using Style--------------------------------
	{
		type = "Frame",
		name = "EXAMPLE_BordersUsingTemplate",
		--style = "ExampleBackgroundStyle",		
		visible = 1,
		
		Layout = {
			pos_XY = {	x = 0.10, y = 0.60, xr = "par",	yr = "par"	},	
			size_WH = {	w = 128.0, h = 256.0, wr = "px", hr = "px" },							
		},				
		
		;
		EXAMPLECONTENT,

	},

}


EXAMPLE_SCREENBORDERS = {
		type = "Frame",
		name = "EXAMPLE_BordersUsingTemplate",
		style = "PanelBackgroundStyle",		
		visible = 0,
		
		Layout = {
			pos_XY = {	x = 0.10, y = 0.20, xr = "par",	yr = "par"	},	
			size_WH = {	w = 128.0, h = 256.0, wr = "px", hr = "px" },							
		},			
		customData3 = 1,
		--DebugMarker = 1,
		;
		EXAMPLECONTENT,
		
	}
EXAMPLE_LOADINGBORDER_GRAPHIC = {

			texture = "DATA:UI\\NewUI\\Examples\\Textures\\Loading_Border_Patch.dds",
			uvRect = { 0/256, 0/256, 256/256, 256/256 },
			patch_X = { 96, -3, 24, -10, 24, -3, 96, 0 },
			patch_Y = { 96, -64, 96, 0 },
			patch_Scale = 1,
			
			}

	
