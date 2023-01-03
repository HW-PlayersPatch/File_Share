dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

PropertyEditorScreen = {
	--size = { 0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	autosize=1,
	

	RootElementSettings = {
		--backgroundColor          = {255,255,0,255},
	--	autosize=1,
	clipchildren=0,
	giveParentMouseInput = 1,
	eventOpaque = 0,
	},

	Layout = {					
		
		size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
	},
	giveParentMouseInput = 1,
	eventOpaque = 0,
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	--backgroundColor          = {255,0,0,255},
	;
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"PROPERTY EDITOR", 
		-- SubtitleText = "$2899", -- PLAYERS//
		--autosize=1,
		arrangetype = "vert",
		Layout = {	
				max_WH = {w=400, h=100, wr="px", hr="px"},		
				size_WH = {w=1, h=100, wr="par", hr="px"},
		},
		AllowDrag = 1,


		;

		{
			type = "PropertyGrid",
			name = "PropertyGrid",
			UseTemplate = PROPERTYGRID_DEFAULTSTYLE,
			Layout = {						
				size_WH = {x=1, y=1, xr="par", yr="par"},
			},
		},

	},

	--PREFAB_DRAGICON,




}
