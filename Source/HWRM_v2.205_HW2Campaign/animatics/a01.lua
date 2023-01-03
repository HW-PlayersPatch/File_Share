MovieScreen =
{
	displayName = "$4606",
	helpTip = "$4607",
	
	Layout = {size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },},

	stylesheet = "HW2StyleSheet",

	RootElementSettings = 
	{
		backgroundColor = {0,0,0,255},	
	},

	-- uncomment the following to enable speech playback during the animatic
	speechFilename = "locale:animatics/A01_speech.lua",

	;
	{
		type = "Movie",
		name = "MyMovie",

		Layout = {
			pos_XY = { x = 0.5, y = 0.5, xr = "par", yr = "par" },	
			pivot_XY = { 0.5, 0.5 },
			lockAspect=1920/1080,			
			size_WH = {	w = 100000, h = 1, wr = "px", hr = "par" },
			max_WH = {	w = 1, h = 1, wr = "par", hr = "par" },			
		},
		greyScale = 1,		
		--fitScreen = 1,

		filenameV = "data:animatics/animatic_01-02.webm",
		-- filenameA = "data:Sound/Music/ANIMATIC/A01_02",

		volumemultiplier = 0.77, -- Example of setting a volume multiplier on a video.
	},
}

