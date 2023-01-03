
ChatFloating = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		--autosize = 1,
		--backgroundColor = {0,255,0,200},	

	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	clickThrough = 1,  -- mouse can click through to game
	--backgroundColor = {0,255,0,200},	



	;
	
	-- chat display
	{
		type = "Frame",
		Layout = {			
				pivot_XY = { .5, 0 },
				size_WH = { w = .45, h = 100/600, wr = "scr", hr = "scr" },				
		},			
		Anchor_Binds = {
			pivotY = "Taskbar_ResourceBottomCenter3",
			pivotX = "Taskbar_ResourceBottomCenter3",
		},	
		name = "listChat",
		arrangetype = "vert",
		arrangedir=-1,

	},
	
	-- chat item
	{
		type = "Frame",
		name = "listItem",
		Layout = {	
			--pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
			pad_LT = { l = 4, t = 2, lr = "px", tr = "px" },
			pad_RB = { r = 4, b = 2, rr = "px", br = "px" },		
		},
		--	backgroundColor = {0,255,255,200},	
		autosize = 1,
		visible = 0,
		ignored=1,

		;
				
		{
			type = "TextLabel",
			name = "text",
			Layout = {							
				size_WH = {	w = 1, h = 1 , wr = "par", hr = "px" },						
			},	

			wrapping = 1,
			autosize = 1,
			Text = {
				font = "ChatFont",
				color = { 255, 255, 255, 255},
				hAlign = "Left",
			},
			dropShadow = 1,
		},
	},
}
