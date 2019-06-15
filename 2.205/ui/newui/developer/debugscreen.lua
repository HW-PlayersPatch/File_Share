dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DebugScreen = {
	--size = { 0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	autosize=1,
	

	RootElementSettings = {
		backgroundColor          = {255,0,0,255},
		autosize=1,
	},

	Layout = {						
		pivot_XY = { 0, 0.5 },					
		pos_XY = {	x=0, y=0.5, xr="par", yr="par",},		
	},
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	backgroundColor          = {255,0,0,255},
	;
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"DEBUG", 
		-- SubtitleText = "$2899", -- PLAYERS//
		autosize=1,
		arrangetype = "vert",
		;
		NewMenuButton("m_dumpcamera",	"OutputCameraInformation",	"",	0,	nil,	"FEButtonStyle1",	"OutputCameraInformation();"),		
		NewMenuButton("m_togglenavlights",	"ToggleNavLights",	"",	0,	nil,	"FEButtonStyle1",	"toggleNavLights(0);"),
		NewMenuButton("m_statmon",	"Statmonitor",	"",	0,	nil,	"FEButtonStyle1",	"statMon(1);"),
		NewMenuButton("m_rules",	"Rules",	"",	0,	nil,	"FEButtonStyle1",	"rulesProfiler(1);"),

	},
	PREFAB_DRAGICON,
}
