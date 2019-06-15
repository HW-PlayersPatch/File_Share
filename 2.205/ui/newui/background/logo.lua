	BACKGROUND_LOGO = {
		type = "Frame",
		visible = 1,
		
		Layout = {
			sector = 1,
			size_WH = { w = 0.5, h = 0.5, wr = "scr", hr = "scr" },
			pivot_XY = { 0.5, 0.5 },
			pos_XY = { x = .25, y = .35, xr = "scr", yr = "scr" },
			lockAspect=2,
		},

		BackgroundGraphic = {
			type = "Graphic",
			uvRect = { 0, 1, 1, 0 },
			texture = "Data:UI\\NewUI\\Background\\logo.tga",
		},
	}