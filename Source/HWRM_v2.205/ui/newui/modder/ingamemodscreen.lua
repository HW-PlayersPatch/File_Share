dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

InGameModScreen = {
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		clipchildren=0,
		giveParentMouseInput = 1,
		eventOpaque = 0,
	},

	Layout = {		
		size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
	},
	giveParentMouseInput = 1,
	eventOpaque = 0,
	backgroundColor = {255,0,0,128},
	;

}
