
----------- Command Panel Buttons ----------
-- OPTION_VIDEO_RESOLUTION
-- OPTION_VIDEO_WINDOWED
-- OPTION_GAMEPLAY_MOUSESENSITIVITY
-- OPTION_GAMEPLAY_MOUSEPAN
-- OPTION_GAMEPLAY_NLIPS
-- OPTION_GAMEPLAY_SELECTIONPRIORITY
-- OPTION_GAMEPLAY_RIGHTCLICKMENU
-- OPTION_GAMEPLAY_SUBTITLES


------- Custom Commands
-- SPACER
OPTION_VIDEO_UISPACER = {
	type = "Frame",
	size = {608, 13},
}

-- Screen res embedded
OPTION_VIDEO_RESOLUTION = { 
	type = "ListBoxItem",

	visible = 1,
	ignored = 1,
	autosize = 1,
	resizeToListBox = 1,
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	overColor = {255,255,255,64},
	backgroundColor = {255,255,255,16},
	;
							
	{
		type = "TextLabel",

		Layout = {	
			size_WH = {w = .4, h = 1, wr = "par", hr = "par",},
		},

		autosize=1,
		Text = {
			textStyle = "FEHeading4",
			hAlign = "Left",
			vAlign = "Middle",
			text = "$5129",
		},
		;
		{
			type = "Frame",
			Layout = {
				size_WH = { w = 1, h = 2, wr = "par", hr = "px" },
				pos_XY = { x = 0, y = 1, xr = "par", yr = "par" },
				Flags = { limitParent_Y = 1 },
			},
			backgroundColor = {0,0,0,64},
		},
	},
													
	{
		type = "DropDownListBox",
		name = "m_comboVideoResolution",
		enabled = 1,
		Layout = {	
			size_WH = {w = 1, h = DROPDOWN_HEIGHT, wr = "px", hr = "scr",},
		},
		arrangeweight = 1,
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
								
		helpTipTextLabel = "m_lblHelpText", 
		helpTip = "$5189", -- "SPECIFY SCREEN RESOLUTION",

		ListBox = {
			type = "ListBox",
			width = 400,
			listBoxStyle = "FEListBoxStyle_Bordered",
			backgroundColor = {0,0,0,255},
			;
		},
	},
}


OPTION_VIDEO_WINDOWED = { -- Screen mode embedded
	type = "ListBoxItem",
							
	visible = 1,
	ignored = 1,
	autosize = 1,
	resizeToListBox = 1,
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	overColor = {255,255,255,64},
	backgroundColor = {255,255,255,16},
	;
							
	{
		type = "TextLabel",
		
		Layout = {	
			size_WH = {w = .4, h = 1, wr = "par", hr = "par",},
		},

		autosize=1,
		Text = {
			textStyle = "FEHeading4",
			hAlign = "Left",
			vAlign = "Middle",
			text = "$2971",
		},
		;
		{
			type = "Frame",
			Layout = {
				size_WH = { w = 1, h = 2, wr = "par", hr = "px" },
				pos_XY = { x = 0, y = 1, xr = "par", yr = "par" },
				Flags = { limitParent_Y = 1 },
			},
			backgroundColor = {0,0,0,64},
		},
	},
													
	{
		type = "DropDownListBox",
		name = "m_comboFullscreen",
		enabled = 1,

		Layout = {	
			size_WH = {w = 1, h = DROPDOWN_HEIGHT, wr = "px", hr = "scr",},
		},
		arrangeweight = 1,

		dropDownListBoxStyle = "FEDropDownListBoxStyle",
								
		helpTipTextLabel = "m_lblHelpText", 
		helpTip = "$2972",

		ListBox = {
			type = "ListBox",
			width = 400,
			listBoxStyle = "FEListBoxStyle_Bordered",
			backgroundColor = {0,0,0,255},
			;	
								
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "$2974",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 1,
			},
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "$2973",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 1,
			},
		},
	},
}
-----------------------------------------------------------------------
--- Options
OPTION_VSYNC = {
	name = "CFG_Frame_Sync",
	title = "$2890", -- VSYNC
	helpText = "$2891",
	Choices = {
		{
			text = "$2892",
		},
		{
			text = "$2893",
		},
		{
			text = "$2894",
		},
	},
}

OPTION_ANTIALIAS = {
	name = "CFG_Anti_Alias",
	title = "$2888",-- Antialias
	helpText = "$2889",
	Choices = {
		{
			text = "$2892",
		},
		{
			text = "x2",
		},
		{
			text = "x4",
		},
		{
			text = "x8",
		},
		{
			text = "x16",
		},
	},
}

OPTION_LIGHTING_QUALITY = {
	name = "CFG_Light_Quality",
	title = "$2878",-- Lighting Quality
	helpText = "$2879",
	Choices = {
		{
			text = "$5101",
		},
		{
			text = "$2960",
		},
	},
}

OPTION_SHADOW_QUALITY = {
	name = "CFG_Shadow_Quality",
	title = "$2550",--SHADOWS
	helpText = "$2551",--TOGGLE SHIP SHADOWS
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
		{
			text = "$2960",
		},
		{
			text = "$4800",
		}
	},
}

OPTION_SCAR_QUALITY = {
	name = "CFG_Scar_Quality",
	title = "$2895",
	helpText = "$2896",
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
		{
			text = "$2960",
		},
	},
}

OPTION_SCAR_COVERAGE = 	{
	name = "CFG_Scar_Coverage",
	title = "$2897",
	helpText = "$2898",
	Choices = {
		{
			text = "$2979",
		},
		{
			text = "$2980",
		},
		{
			text = "$2981",
		},
		{
			text = "$2982",
		},
		{
			text = "$2983",
		},
	},
}

OPTION_DEPTHBIAS = 	{
	name = "CFG_DepthBias_FX",
	title = "$2582",--DEPTH BIAS
	helpText = "$2583",--TURN ON OR OFF DYNAMIC REDUCTION OF GEOMETRY
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
	},
}

OPTION_MOTIONBLUR = {
	name = "CFG_MotionBlur_FX",
	title = "$2584",--MOTION BLUR
	helpText = "$2585",--TOGGLE MOTION BLUR
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
	},
}

OPTION_BLOOM = {
	name = "CFG_Bloom_FX",
	title = "$2963",
	helpText = "$2964",
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
	},
}

OPTION_GODRAYS = {
	name = "CFG_GodRays_FX",
	title = "$2965",
	helpText = "$2966",
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
		{
			text = "$2960",
		},
	},
}

OPTION_DOF = {
	name = "CFG_DoF_FX",
	title = "$2967",
	helpText = "$2968",
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$2969",
		},
		{
			text = "$2970",
		},
	},
}

OPTION_UIFX = {
	name = "CFG_UI_FX",
	title = "$2975",
	helpText = "$2976",
	Choices = {
		{
			text = "$5100",
		},
		{
			text = "$5101",
		},
		{
			text = "$2960",
		},
	},
}

--------------------------------------------------------------------
OPTION_TEXTURE_QUALITY = {
	name = "CFG_Texture_Detail",
	title = "$2882",--!TRANSLATE!
	helpText = "$2883",
	Choices = {
		{
			text = "$2884",
		},
		{
			text = "1",
		},
		{
			text = "2",
		},
		{
			text = "$2885",
		},
		{
			text = "4",
		},
		{
			text = "5",
		},
		{
			text = "$2886",
		},
		{
			text = "7",
		},
		{
			text = "8",
		},
		{
			text = "$2887",
		},
	},
}


OPTION_TEXTURE_SIZE = {
	name = "CFG_Texture_Size",
	title = "$2880",
	helpText = "$2881",
	--mask = "CFG_Expanded_UI", -- mask can be used to hide options based on another (at BOOT only)
	Choices = {
		{
			text = "512",
		},
		{
			text = "1024",
		},
		{
			text = "2048",
		},
		{
			text = "4096",
		},
		{
			text = "8192",
		},
	},
}

OPTION_FX_CLONE = { -- FX OPTION FRAME TO CLONE
	type = "ListBoxItem",
	visible = 0,
	ignored = 1,
	autosize = 1,
	name = "m_fxFrameToClone",
	helpTipTextLabel = "m_lblHelpText",
	arrangetype = "horiz",
	overColor = {255,255,255,64},
	backgroundColor = {255,255,255,16},
	resizeToListBox = 1,
	;
					
	{
		type = "TextLabel",
		name = "m_lblFXTitle",

		Layout = {	
			size_WH = {w = .4, h = 1, wr = "par", hr = "par",},
		},

		autosize=1,
		Text = {
			textStyle = "FEHeading4",
			hAlign = "Left",
			vAlign = "Middle",
			text = "$5140",
		},
		;
		{
			type = "Frame",
			Layout = {
				size_WH = { w = 1, h = 2, wr = "par", hr = "px" },
				pos_XY = { x = 0, y = 1, xr = "par", yr = "par" },
				Flags = { limitParent_Y = 1 },
			},
			backgroundColor = {0,0,0,64},
		},
	},
											
	{
		type = "DropDownListBox",
		Layout = {	
			size_WH = {w = 1, h = DROPDOWN_HEIGHT, wr = "px", hr = "scr",},
		},
		arrangeweight = 1,
		name = "m_comboFX",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
							

	},
}