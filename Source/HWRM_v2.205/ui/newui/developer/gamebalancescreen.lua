dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:/ui/newui/Developer/GameBalanceScreen_SpawnMenu.lua")
dofilepath("data:/ui/newui/Developer/GameBalanceScreen_SelShipProps.lua")
dofilepath("data:/ui/newui/Developer/GameBalanceScreen_AIMenu.lua")

GameBalanceScreen = {
	stylesheet = "HW2StyleSheet",
	--autosize=1,
	
	RootElementSettings = {
		clipchildren=0,
		giveParentMouseInput = 1,
		eventOpaque = 0,

	},

	Layout = {					
		--pos_XY = { x = 0.5, y = .8, xr = "par", yr = "scr" },
		--pivot_XY = {0.5, 0.0},
		size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
	},
	giveParentMouseInput = 1,
	eventOpaque = 0,
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	onShow = "GameBalanceScreenOnShow()",
	onUpdate = "GameBalanceScreenOnUpdate()",
	onHide = "GameBalanceScreenOnHide()",
	;
	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		name = "GameBalanceScreenWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"Balance", 
		--MenuStripName = "BalanceContextStrip",
		--autosize=1,
		arrangetype = "vert",
		AllowDrag = 1,
		HasCloseButton = 1,
		--HasMinimizeButton = 1,
		DisablesParentScreenOnClose = 1,


		Layout = {					
			pos_XY = { x = 0.05, y = .05, xr = "scr", yr = "scr" },
			pad_RB  = { r = 0, b = 0, rr = "px", br = "px" },
			size_WH = {	w = 640, h = 530, wr = "px", hr = "px" },	
			--max_WH = {	w = .42, wr = "scr" },
			--min_WH = {	w = .42, wr = "scr" },
		},
		;


		{
			type = "Frame",
			name = "frmRootbottombigfrm",
			
		
			Layout = {
				--pivot_XY = { 0.5, 0.5 },					
				--pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
				size_WH = {	w = 1, h = 400, wr = "par", hr = "px" },	
			},		

			--autosize=1,
			arrangetype = "vert",

			;

			-- TAB FRAMES
			{
				type = "TabControl",
				name = "m_balanceTabControl",
				position = {0,0},
				--backgroundColor = {255,0,0,255},
				TabButtonStyle = 	"OptionTabButtonStyle",
				UseTemplate = TEMPLATE_TABCONTROL,	-- TabControls must use a template
			
				--autosize=1,
					
				Layout = {			
					size_WH = {	w = 1.0, h = 1, wr = "par", hr = "par" },	
				},
					
				;		
				BALANCE_SPAWNMENU,
				BALANCE_AIMENU,
				--BALANCE_SELSHIPPROPS,
				--PREFAB_DRAGICON,
			},

			-- Menu Strip
			--{
			--	type = "MenuStrip",
			--	name = "BalanceContextStrip",
			--	UseTemplate = TEMPLATE_MENUSTRIP,				
			--	;		
				--NewMenuStripDropdownButton("bob", "_text", "_helptip", nil, "testContextMenu", "GameBalanceScreen", true, true ),
			--	NewMenuStripDropdownButton("AITools", "AI Tools", "Misc AI Debug Commands", nil, "aiContextMenu", "GameBalanceScreen", true, true ),
			--	NewMenuStripDropdownButton("Renderer","Renderer", "Renderer Debug Commands", nil, "rendererContextMenu", "GameBalanceScreen", true, true ),
			--	NewMenuStripDropdownButton("Misc","Misc", "Misc Debug Commands", nil, "miscContextMenu", "GameBalanceScreen", true, true ),
			--	NewMenuStripDropdownButton("Dead","Dead Options", "Options that don't work well.", nil, "deadContextMenu", "GameBalanceScreen", true, true ),
			--},

		},

		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm",			
		
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			;		
				-- BUTTONS
				NewMenuButton("m_btnReloadFlightMan",		"Reload Flight Man",	"",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	"reloadFlightManeuvers()"),	
				NewMenuButton("m_btnReloadSelectedShip",	"Reload Selected Ship",	"",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined",	"reloadSelectedSobStatic()"),	
				--NewMenuButton("m_btnPlayMovie",		"$3586",	"$3587",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
					
		},
	},


}
