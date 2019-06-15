dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

GenericScreen = {

	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	clickThrough = 1,
		Layout = {			
			pos_XY = {	x=42/800, y=90/600, xr="scr", yr="scr",},	
		},
	RootElementSettings = {
		arrangetype = "vert",
		arrangeSep = {	x=0, y= TITLE_PAD_VERT, xr="scr", yr="scr"},	

		autosize=1,
	},
	pixelUVCoords = 1,
	
	;

	{
		type = "Frame",
		name = "txtFrm",
		position = {0,0},
		size = {200,15},
		ignored=1,
		;
		{
			type = "TextLabel",
			position = {0, 0},
			size = {200,15},
			name = "lblText",
			visible = 0,
			Text = {
				text = "$5182",
				textStyle="IGHeading2",
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
	},
	
	{
		type="Frame",
		name="gfc1",

		visible = 0,
		Layout = {			
				size_WH = {	w = 128/800, h = 1000, wr = "scr", hr = "px" },			
				lockAspect=2,				
		},

		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Tutorial\\ATI_ShipExample.tga",
			textureUV = {0,0,512,256}
			},
		;
		{
			type="Frame",	
			Layout = {			
				size_WH = {	w = .9, h = .8, wr = "par", hr = "par" },	
				pos_XY = { x = .5, y = .5, xr = "par", yr = "par" },		
				pivot_XY = { .5,  .5 },		
			},
			borderWidth = 2,
			borderColor = { 0, 255, 0, 255},
		},
	},							
	
	{
		type="Frame",
		name="gfc2",
		visible = 0,
		Layout = {			
				size_WH = {	w = 128/800, h = 1000, wr = "scr", hr = "px" },			
				lockAspect=2,				
		},

		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Tutorial\\ATI_ShipExample.tga",
			textureUV = {0,0,512,256}
			},
		;
		{
			type="Frame",	
			Layout = {			
				size_WH = {	w = .9, h = .8, wr = "par", hr = "par" },	
				pos_XY = { x = .5, y = .5, xr = "par", yr = "par" },		
				pivot_XY = { .5,  .5 },		
			},
			borderWidth = 2,
			borderColor = { 255, 0, 0, 255},
		},
	},
	
	{
		type="Frame",
		name="gfc3",
		visible = 0,
		Layout = {			
				size_WH = {	w = 128/800, h = 1000, wr = "scr", hr = "px" },			
				lockAspect=2,				
		},

		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Tutorial\\ATI_ShipExample.tga",
			textureUV = {0,0,512,256}
			},
		;
		{
			type="Frame",	
			Layout = {			
				size_WH = {	w = .9, h = .8, wr = "par", hr = "par" },	
				pos_XY = { x = .5, y = .5, xr = "par", yr = "par" },		
				pivot_XY = { .5,  .5 },		
			},
			borderWidth = 2,
			borderColor = { 255, 255, 0, 255},
		},
	},
}