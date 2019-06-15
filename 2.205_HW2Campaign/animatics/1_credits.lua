MovieScreen =
{
	displayName = "$4636",
	helpTip = "$4637",
	
	Layout = {size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },},

	stylesheet = "HW2StyleSheet",
	backgroundColor = {0,0,0,255},
	
	;
	{
		type = "Movie",
		name = "MyMovie",

		filenameV = "data:animatics/animatic_16_credits.webm",
		filenameA = "data:Sound/Music/ANIMATIC/credits",

		Layout = {
			pos_XY = { x = 0.5, y = 0.5, xr = "par", yr = "par" },	
			pivot_XY = { 0.5, 0.5 },
			lockAspect=1920/1080,			
			size_WH = {	w = 100000, h = 1, wr = "px", hr = "par" },
			max_WH = {	w = 1, h = 1, wr = "par", hr = "par" },			
		},		

		--fitScreen = 1,
		
	},
}

