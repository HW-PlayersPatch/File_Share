LoadingScreen = {
	Layout = {
		sector = 1,
		pos_XY = { x = 0, y = 0, xr = "scr", yr = "scr" },
		size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },
	},

	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	RootElementSettings = {
		backgroundColor = {0,0,0,255}, -- black background for letterbox effect
	},
	;
	
	-- Aspect Enforcement Frame
	{
		type = "Frame",
		
		Layout = {
			sector = 1,
			pos_XY = { x = 0.5, y = 0.5, xr = "scr", yr = "scr" },
			size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },
			pivot_XY = { 0.5, 0.5 },
			lockAspect = 16/9,
		},
		;
		
		-- Per-Level Dynamic Image 
		{
			type = "Frame",
			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
			},
			
			name = "bgImage",
			BackgroundGraphic = {
				size = { 0, 0 },
				texture = "DATA:UI/NewUI/Background/HW2_Loading.dds",
				textureUV = { 0, 0, 3840, 2160},
			},
		},
				
		-- background image 2
		{
			type = "Frame",

			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0.14, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 0.66, wr = "par", hr = "par" },
			},

			name = "bgImage2",

		},

		-- progress
		{
			type = "ProgressBar",
			
			Layout = {
				sector = 1,
				pos_XY = { x = 0.5, y = 0.90, xr = "par", yr = "par" },
				size_WH = { w = 1000, h = 32, wr = "px", hr = "px" },
				pivot_XY = { 0.5, 0.5 },
			},

			progressColor = {240, 170, 0, 255},
			name = "loadingProgress",
				
			filledTextColor			= {235,235,192,255},
			emptyTextColor			= {101,198,194,255},
				
			Text = 
			{
				font = "ButtonFont",
				dropShadow = 1,
				pixels = 24,
				vAlign = "Middle",
				hAlign = "Center",
				rel=0,
			},
				
			frameOfs = { 0.0, 16/64 },
			frameCells = { 0, 1, 2, 3 },
				
			frameArt = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Styles\\Progress_Lines.dds",
				uvRect = { 2/128, 2/128, 62/128, 30/128 },
				patch_X = { 8, -18, 8, -18, 8, 0 },
				patch_Y = { 13, -2, 13, 0 },
				patch_Scale = 1,
				--patch_AutoScale = 1,
				
				Surface = {
					surface = "ui_multistate";
					{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
					{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},
			},
				
			coreOfs = { 0.0, 32/128 },
			coreCells = { 0, 1, 2, 3 },
				
			coreArt = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Styles\\Progress_Lines.dds",
				uvRect = { 66/128, 2/128, 126/128, 30/128 },
				patch_X = { 12, -36, 12, 0 },
				patch_Y = { 6, -2, 4, -4, 4, -2, 6, 0 },
				patch_Scale = 1,
				patch_AutoScale = 1,
					
				fill = "DATA:UI\\NewUI\\Styles\\Fill_DotNoise01.tga",
				
				Surface = {
					surface = "ui_multistate";
					{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
					{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},
			},
		},
		
		-- text label for campaign title1
		{
			type = "TextLabel",
			name = "titleLabel1",
			visible = 0,
			
			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0.01, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 0.08, wr = "par", hr = "par" },
			},
			
			Text = {
				textStyle = "FEButtonTextStyle",
				color = {255,255,255,255},
				vAlign = "Middle",
				hAlign = "Center",
			},
		},
		
		-- text label for campaign title2
		{
			type = "TextLabel",
			name = "titleLabel2",
			visible = 0,
			
			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0.10, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 0.08, wr = "par", hr = "par" },
			},
			
			Text = {
				textStyle = "FEButtonTextStyle",
				color = {255,255,255,255},
				vAlign = "Middle",
				hAlign = "Center",
			},
		},
	},
}