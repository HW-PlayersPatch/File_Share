-- LUA CONFIG FOR THE FE BACKGROUND
Background = {
	size = {0, 0, 1200, 800},
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		--backgroundColor = {0,0,0,255},
	},
	
	Layout = {
		sector = 1,
		size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	preUI = 1,

	;
	
	{
		type = "Frame",
		visible = 1,
		
		Layout = {
			sector = 1,
			--pos_XY = { x = 0.5, y = 0.5, xr = "par", yr = "par" },
			size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },
			pivot_XY = { 0.5, 0.5 },
			pos_XY = { x = .5, y = .5, xr = "scr", yr = "scr" },
			--size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },

			lockAspect=-2,
		},

		BackgroundGraphic = {
			type = "Graphic",
			--size = {2048, 1024},
			--textureUV = { 0, 0, 2048, 1024},
			uvRect = { 0, 1, 1, 0 },
			texture = "Data:UI\\NewUI\\Background\\main_bg.tga", -- multires texture
		
		},
		--BackgroundVideo = {
		--	filenameV = "data:animatics/mainmenu.webm",
		--	loop = 1,
		--	fitScreen = 1,
		--	fixedAspectRatio = 1,
		--},
	},
}