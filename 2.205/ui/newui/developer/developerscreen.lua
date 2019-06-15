dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
--dofilepath("data:/ui/newui/Developer/GameBalanceScreen_SpawnMenu.lua")
--dofilepath("data:/ui/newui/Developer/GameBalanceScreen_SelShipProps.lua")
--dofilepath("data:/ui/newui/Developer/GameBalanceScreen_AIMenu.lua")

DeveloperScreen = {
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
	--onShow = "GameBalanceScreenOnShow()",
	--onUpdate = "GameBalanceScreenOnUpdate()",
	;
	{

			type = "Frame",			
			
			Layout = {	
				pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },	
				size_WH = { w = 1, h = 16, wr = "scr", hr = "px" },

			},		
			name = "frame_UpperLeft",
			--autosize  = 1,
			autoarrange = 1,
			arrangetype = "vert",
			arrangedir = 1,		
			autoarrangeSpace = 0,
			--backgroundColor = {255,54,54,128},
;


		-- Menu Strip
		{
			type = "MenuStrip",
			name = "BalanceContextStrip",
			UseTemplate = TEMPLATE_MENUSTRIP,				
			;		
			NewMenuStripDropdownButton("Ship Tools", "Ship Tools", "Ship Debug Commands", nil, "shipContextMenu", "DeveloperScreen", true, true ),
			NewMenuStripDropdownButton("Renderer","Renderer", "Renderer Debug Commands", nil, "rendererContextMenu", "DeveloperScreen", true, true ),
			NewMenuStripDropdownButton("Misc","Misc", "Misc Debug Commands", nil, "miscContextMenu", "DeveloperScreen", true, true ),
			NewMenuStripDropdownButton("Player","PlayerLua", "", nil, "playerContextMenu", "DeveloperScreen", true, true ),
			NewMenuStripDropdownButton("Events","Events", "", nil, "eventsContextMenu", "DeveloperScreen", true, true ),
						
			NewMenuStripDropdownButton("Dead","Dead Options", "Options that don't work well.", nil, "deadContextMenu", "DeveloperScreen", true, true ),
		},

	},

	----------------------- Context Menus --------------------
		-- Right Click Plaer Context Menu
	{
		type = "ContextMenu",
		name = "shipContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		-- onOpening = "OnOpeningContextMenu(\"23\");",
		visible=0,
		;				
		NewContextMenuCheckButton("ShowDebugInfo",			"Show Debug Info",		"???",					"ShowDebugInfo(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowSelectorDebug",		"Show Selector Debug",	"???",					"ShowSelectorDebug(%b)","",0, true, true ),
		NewContextMenuCheckButton("ShowShipDebug",			"Show Ship Debug",		"???",					"ShowShipDebug(%b)"	,"",	0, true, true ),
		NewContextMenuCheckButton("ShowDebugVectors",		"Show Debug Vector",	"???",				"ShowDebugVectors(%b)"	,"",	0, true, true ),
		NewContextMenuCheckButton("ShowPathTolerance",		"Show Path Tolerance",	"???",					"ShowPathTolerance(%b)","",0, true, true ),
		NewContextMenuCheckButton("ShowResourceDebug",		"Show Resource Debug",	"???",					"ShowResourceDebug(%b)","",0, true, true ),
		NewContextMenuCheckButton("ShowWeaponDebug",		"Show Weapon Debug",	"???",					"ShowWeaponDebug(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowTargetDebug",		"Show Ship Target Debug",	"???",				"ShowShipTargetDebug(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowNavLightDebug",		"Show NavLight Debug",	"???",					"ShowNavLightDebug(%b)","",0, true, true ),
		NewContextMenuCheckButton("ShowShipAvoidance",			"ShowShipAvoidance",			"???","ShowShipAvoidance(%b)", "",	0, true, true ),
		NewContextMenuCheckButton("ShowFormationAvoidance",		"ShowFormationAvoidance",		"???","ShowFormationAvoidance(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowAsteroidAvoidance",		"ShowAsteroidAvoidance",		"???","ShowAsteroidAvoidance(%b)", "",	0, true, true ),
		
		NewContextMenuCheckButton("AIPaths",			"AI Paths",				"Does Not Work ATM",	"ShowAIPaths(%b)","",		0, true, true ),
	},

	---------------RENDERER CONTEXT MENU OPTIONS -------------------------
	{
		type = "ContextMenu",
		name = "rendererContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		visible=0,
		;
		NewContextMenuCheckButton("ShowCollision",		"Show Collision",		"Shows Collision Boxes","ShowCollision(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowCapsules",		"Show Capsules",		"???",					"ShowCapsules(%b)","",		0, true, true ),
		NewContextMenuCheckButton("Background",			"Trippy Background",	"???",					"ShowBackground(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowLevelVolumes",	"Show Level Volumes",	"???",					"ShowLevelVolumes(%b)","",	0, true, true ),
		NewContextMenuCheckButton("EnableATIDisplay",	"Enable ATI Display",	"???",					"EnableATIDisplay(%b)","",	1, true, true ),
		NewContextMenuCheckButton("toggleNavLights",	"toggleNavLights",		"???",					"toggleNavLights(%b)","",	1, true, true ),
		NewContextMenuCheckButton("cameraCollision",	"cameraCollision",		"???",					"cameraCollision(%b)","",	1, true, true ),
	},

		---------------MISC CONTEXT MENU OPTIONS -------------------------
	{
		type = "ContextMenu",
		name = "miscContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		visible=0,
		;
		NewContextMenuCheckButton("showNISDebug",		"show NIS Debug",	"???","showNISDebug(%b)","",	0, true, true ),
		NewContextMenuCheckButton("winLose",			"winLose",			"???","winLose(%b)","",	0, true, true ),
		NewContextMenuCheckButton("unlock",				"unlock",			"???","unlock(%b)","",	0, true, true ),
		NewContextMenuCheckButton("statMon",			"statMon",			"???","statMon(%b)","",	0, true, true ),
		NewContextMenuCheckButton("statMonLog",			"statMonLog",		"???","statMonLog(%b)","",	0, true, true ),
		NewContextMenuCheckButton("StatMonProfiling",	"StatMonProfiling",	"???","StatMonProfiling(%b)","",	0, true, true ),
		


		NewContextMenuCheckButton("enableTaskProfiles",	"enableTaskProfiles",			"???","enableTaskProfiles(%b)","",	0, true, true ),
		NewContextMenuCheckButton("showHeartbeats",		"showHeartbeats",			"???","showHeartbeats(%b)","",	0, true, true ),
		
		NewContextMenuCheckButton("debugRegionMode",	"debugRegionMode",			"???","debugRegionMode(%b)","",	0, true, true ),
		NewContextMenuCheckButton("persistentFeedback",	"persistentFeedback",			"???","persistentFeedback(%b)","",	0, true, true ),
		
		NewContextMenuCheckButton("interpolation",		"interpolation",			"???","interpolation(%b)","",	0, true, true ),
		NewContextMenuCheckButton("weaponTest",			"weaponTest",			"???","weaponTest(%b)","",	0, true, true ),
		NewContextMenuCheckButton("showSquadrons",			"showSquadrons",			"???","showSquadrons(%b)","",	0, true, true ),
		
		NewContextMenuCheckButton("showATIBounds",			"showATIBounds",			"???","showATIBounds(%b)","",	0, true, true ),
		NewContextMenuCheckButton("showMadStates",			"showMadStates",			"???","showMadStates(%b)","",	0, true, true ),
		

		NewContextMenuCheckButton("ToggleGodMode",				"ToggleGodMode",				"???","ToggleGodMode(%b)", "isGodMode()",	0, true, true ),
		


		-- These are actions more than toggles.  Need to make new control for them
		--Scar_Reload
		NewContextMenuCheckButton("reloadFlightManeuvers",		"reloadFlightManeuvers",		"???","reloadFlightManeuvers()","",	0, true, true ),
		NewContextMenuCheckButton("ReloadEffectEvents",		"ReloadEffectEvents",		"???","ReloadEffectEvents()","",	0, true, true ),
		NewContextMenuCheckButton("rulesProfiler",		"rulesProfiler",		"???","rulesProfiler()","",	0, true, true ),
		NewContextMenuCheckButton("gamemisc_dumprules",		"gamemisc_dumprules",		"???","gamemisc_dumprules()","",	0, true, true ),

		NewContextMenuCheckButton("Sound_Reload",		"Sound_Reload",		"???","Sound_Reload()","",	0, true, true ),

		NewContextMenuCheckButton("ForceBallistics",	"Force Ballistics",		"Force bullets to fly with honor", "toggleForceBallistics(%b)","",	0, true, true ),
		NewContextMenuCheckButton("LogBallistics",		"Log Ballistics",		"Log hit/miss stats for bullets", "toggleLogBallistics(%b)","",	0, true, true ),
		
		NewContextMenuCheckButton("SetAutoPause",	"Auto Pause",		"Pause after any un-paused frame", "setAutoPause(%b)","",	0, true, true ),
	
		NewContextMenuCheckButton("bentusidialog",	"bentusidialog",		"", "UI_SetScreenVisible('bentusidialog', %b)","",	0, true, true ),

		NewContextMenuCheckButton("ShowInfo",			"Show Info",			"???",					"ShowInfo(%b)","",			0, true, true ),
		NewContextMenuCheckButton("LocalPlayerToCpu",	"LocalPlayerToCpu",		"???",					"LocalPlayerToCpu(%b)","",	0, true, true ),
		NewContextMenuCheckButton("FOW",				"Fog of War",			"Shows Enemies",		"FOWVis(%b)","",			1, true, true ),
	},

		---------------PLAYER LUA CONTEXT MENU OPTIONS -------------------------
	{
		type = "ContextMenu",
		name = "playerContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		visible=0,
		;
		NewContextMenuButton("GrantAllResearch",				"Grant All Research",				"???",		"Player_GrantAllResearch(0)",	 true, true ),
		NewContextMenuButton("InstantlyGatherAllResources",		"Instantly Gather All Resources",	"???",		"Player_InstantlyGatherAllResources(0)", true, true ),
		NewContextMenuButton("eSwitchPlayer",					"eSwitchPlayer",					"Cycles through players",	"MainUI_UserEvent(eSwitchPlayer)",			true, true ),
	},

	---------------MAIN EVENTS CONTEXT MENU OPTIONS -------------------------
	{
		type = "ContextMenu",
		name = "eventsContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		visible=0,
		;
		--NewContextMenuButton("eMenu",			"eMenu",			"???",	"MainUI_UserEvent(eMenu)",			true, true ),
		--NewContextMenuButton("eCancel",			"eCancel",			"???",	"MainUI_UserEvent(eCancel)",		true, true ),
		--NewContextMenuButton("eCancelOrders",	"eCancelOrders",	"???",	"MainUI_UserEvent(eCancelOrders)",	true, true ),
		--NewContextMenuButton("eCancelGroup",	"eCancelGroup",		"???",	"MainUI_UserEvent(eCancelGroup)",	true, true ),
		--NewContextMenuButton("eFocusHome",		"eFocusHome",		"???",	"MainUI_UserEvent(eFocusHome)",		true, true ),
		--NewContextMenuButton("eTacticalOverlay","eTacticalOverlay",	"???",	"MainUI_UserEvent(eTacticalOverlay)",	true, true ),
		--NewContextMenuButton("eScuttle",		"eScuttle",			"???",	"MainUI_UserEvent(eScuttle)",		true, true ),
		--NewContextMenuButton("ePreviousTactic",	"ePreviousTactic",	"???",	"MainUI_UserEvent(ePreviousTactic)",	true, true ),
		--NewContextMenuButton("eNextTactic",		"eNextTactic",		"???",	"MainUI_UserEvent(eNextTactic)",	true, true ),
		--NewContextMenuButton("eMove",			"eMove",			"???",	"MainUI_UserEvent(eMove)",			true, true ),
		--NewContextMenuButton("eHarvest",		"eHarvest",			"???",	"MainUI_UserEvent(eHarvest)",		true, true ),
		--NewContextMenuButton("eGuard",			"eGuard",			"???",	"MainUI_UserEvent(eGuard)",			true, true ),
		--NewContextMenuButton("eResearchManager","eResearchManager", "???",	"MainUI_UserEvent(eResearchManager)",true, true ),
		--NewContextMenuButton("eFocus",			"eFocus",			"???",	"MainUI_UserEvent(eFocus)",			true, true ),
		--NewContextMenuButton("eSelectAllVisible","eSelectAllVisible","???",	"MainUI_UserEvent(eSelectAllVisible)",true, true ),
		--NewContextMenuButton("eDock",			"eDock",			"???",	"MainUI_UserEvent(eDock)",			true, true ),
		--NewContextMenuButton("eNextFocus",			"eNextFocus",			"???",	"MainUI_UserEvent(eNextFocus)",			true, true ),
		--NewContextMenuButton("ePreviousFocus",			"ePreviousFocus",			"???",	"MainUI_UserEvent(ePreviousFocus)",			true, true ),
		
		--NewContextMenuButton("eBuildManager",			"eBuildManager",			"???",	"MainUI_UserEvent(eBuildManager)",			true, true ),
		--NewContextMenuButton("eLaunchManager",			"eLaunchManager",			"???",	"MainUI_UserEvent(eLaunchManager)",			true, true ),
		--NewContextMenuButton("eGroup",			"eGroup",			"???",	"MainUI_UserEvent(eGroup)",			true, true ),
		--NewContextMenuButton("eSelectGroup",			"eSelectGroup",			"???",	"MainUI_UserEvent(eSelectGroup)",			true, true ),
		--NewContextMenuButton("eShiftModifier",			"eShiftModifier",			"???",	"MainUI_UserEvent(eShiftModifier)",			true, true ),
		--NewContextMenuButton("eControlModifier",			"eControlModifier",			"???",	"MainUI_UserEvent(eControlModifier)",			true, true ),
		--NewContextMenuButton("eFocusModifier",			"eFocusModifier",			"???",	"MainUI_UserEvent(eFocusModifier)",			true, true ),
		--NewContextMenuButton("eSensorsManager",			"eSensorsManager",			"???",	"MainUI_UserEvent(eSensorsManager)",			true, true ),
		--NewContextMenuButton("eParade",			"eParade",			"???",	"MainUI_UserEvent(eParade)",			true, true ),
		--NewContextMenuButton("eSwitchPlayer",			"eSwitchPlayer",			"???",	"MainUI_UserEvent(eSwitchPlayer)",			true, true ),
		--NewContextMenuButton("eQuickSave",			"eQuickSave",			"???",	"MainUI_UserEvent(eQuickSave)",			true, true ),
		--NewContextMenuButton("eQuickLoad",			"eQuickLoad",			"???",	"MainUI_UserEvent(eQuickLoad)",			true, true ),
		--NewContextMenuButton("eQuickSaveDeterministic",			"eQuickSaveDeterministic",			"???",	"MainUI_UserEvent(eQuickSaveDeterministic)",			true, true ),
		--NewContextMenuButton("eQuickLoadDeterministic",			"eQuickLoadDeterministic",			"???",	"MainUI_UserEvent(eQuickLoadDeterministic)",			true, true ),
		--NewContextMenuButton("eRestartLevel",			"eRestartLevel",			"???",	"MainUI_UserEvent(eRestartLevel)",			true, true ),
		--NewContextMenuButton("ePause",			"ePause",			"???",	"MainUI_UserEvent(ePause)",			true, true ),
		--NewContextMenuButton("eHyperspace",			"eHyperspace",			"???",	"MainUI_UserEvent(eHyperspace)",			true, true ),
		--NewContextMenuButton("eSensorPing",			"eSensorPing",			"???",	"MainUI_UserEvent(eSensorPing)",			true, true ),
		--NewContextMenuButton("eRepair",			"eRepair",			"???",	"MainUI_UserEvent(eRepair)",			true, true ),
		--NewContextMenuButton("eSpecialAttack",			"eSpecialAttack",			"???",	"MainUI_UserEvent(eSpecialAttack)",			true, true ),
		--NewContextMenuButton("eRallyPoint",			"eRallyPoint",			"???",	"MainUI_UserEvent(eRallyPoint)",			true, true ),
		--NewContextMenuButton("eRallyObject",			"eRallyObject",			"???",	"MainUI_UserEvent(eRallyObject)",			true, true ),
		--NewContextMenuButton("eRetire",			"eRetire",			"???",	"MainUI_UserEvent(eRetire)",			true, true ),
		--NewContextMenuButton("eMoveAttack",			"eMoveAttack",			"???",	"MainUI_UserEvent(eMoveAttack)",			true, true ),
		--NewContextMenuButton("eMilitary",			"eMilitary",			"???",	"MainUI_UserEvent(eMilitary)",			true, true ),
		--NewContextMenuButton("eDefenseField",			"eDefenseField",			"???",	"MainUI_UserEvent(eDefenseField)",			true, true ),
		--NewContextMenuButton("eCloak",			"eCloak",			"???",	"MainUI_UserEvent(eCloak)",			true, true ),
		--NewContextMenuButton("eCapture",			"eCapture",			"???",	"MainUI_UserEvent(eCapture)",			true, true ),
		--NewContextMenuButton("eKamikaze",			"eKamikaze",			"???",	"MainUI_UserEvent(eKamikaze)",			true, true ),
		--NewContextMenuButton("eSalCap",			"eSalCap",			"???",	"MainUI_UserEvent(eSalCap)",			true, true ),


		-- TO TEST
		--NewContextMenuButton("eWaypoint",			"eWaypoint",			"???",	"MainUI_UserEvent(eWaypoint)",			true, true ),
		--NewContextMenuButton("eDelete",			"eDelete",			"???",	"MainUI_UserEvent(eDelete)",			true, true ),
		--NewContextMenuButton("eZoom",			"eZoom",			"???",	"MainUI_UserEvent(eZoom)",			true, true ),
		--NewContextMenuButton("eWaypointMode",			"eWaypointMode",			"???",	"MainUI_UserEvent(eWaypointMode)",			true, true ),
		--NewContextMenuButton("eScriptReload",			"eScriptReload",			"???",	"MainUI_UserEvent(eScriptReload)",			true, true ),
		--NewContextMenuButton("eShipScriptReload",			"eShipScriptReload",			"???",	"MainUI_UserEvent(eShipScriptReload)",			true, true ),
		--NewContextMenuButton("eHUD",			"eHUD",			"???",	"MainUI_UserEvent(eHUD)",			true, true ),
		--NewContextMenuButton("eScreenShot",			"eScreenShot",			"???",	"MainUI_UserEvent(eScreenShot)",			true, true ),
		--NewContextMenuButton("eTactics",			"eTactics",			"???",	"MainUI_UserEvent(eTactics)",			true, true ),
		--NewContextMenuButton("eChat",			"eChat",			"???",	"MainUI_UserEvent(eChat)",			true, true ),
		--NewContextMenuButton("eFixedFormation",			"eFixedFormation",			"???",	"MainUI_UserEvent(eFixedFormation)",			true, true ),
		--NewContextMenuButton("eTurboEnable",			"eTurboEnable",			"???",	"MainUI_UserEvent(eTurboEnable)",			true, true ),
		--NewContextMenuButton("eNISTest",			"eNISTest",			"???",	"MainUI_UserEvent(eNISTest)",			true, true ),
		--NewContextMenuButton("eFlightManeuverTest",			"eFlightManeuverTest",			"???",	"MainUI_UserEvent(eFlightManeuverTest)",			true, true ),
		--NewContextMenuButton("eDropMinesInstant",			"eDropMinesInstant",			"???",	"MainUI_UserEvent(eDropMinesInstant)",			true, true ),
		--NewContextMenuButton("eSubtitleOk",			"eSubtitleOk",			"???",	"MainUI_UserEvent(eSubtitleOk)",			true, true ),
		--NewContextMenuButton("eCustomActivate",			"eCustomActivate",			"???",	"MainUI_UserEvent(eCustomActivate)",			true, true ),
		--NewContextMenuButton("eCustomDeActivate",			"eCustomDeActivate",			"???",	"MainUI_UserEvent(eCustomDeActivate)",			true, true ),

		--NewContextMenuButton("eWeaponNext",			"eWeaponNext",			"???",	"MainUI_UserEvent(eWeaponNext)",			true, true ),
		--NewContextMenuButton("eWeaponLeft",			"eWeaponLeft",			"???",	"MainUI_UserEvent(eWeaponLeft)",			true, true ),
		--NewContextMenuButton("eWeaponRight",			"eWeaponRight",			"???",	"MainUI_UserEvent(eWeaponRight)",			true, true ),
		--NewContextMenuButton("eWeaponDown",			"eWeaponDown",			"???",	"MainUI_UserEvent(eWeaponDown)",			true, true ),
		--NewContextMenuButton("eWeaponUp",			"eWeaponUp",			"???",	"MainUI_UserEvent(eWeaponUp)",			true, true ),
		--NewContextMenuButton("eWeaponsFire",			"eWeaponsFire",			"???",	"MainUI_UserEvent(eWeaponsFire)",			true, true ),
		--NewContextMenuButton("eWeaponCentre",			"eWeaponCentre",			"???",	"MainUI_UserEvent(eWeaponCentre)",			true, true ),
		
		--NewContextMenuButton("eRenderToggle",			"eRenderToggle",			"???",	"MainUI_UserEvent(eRenderToggle)",			true, true ),
		--NewContextMenuButton("eSuperTurbo",			"eSuperTurbo",			"???",	"MainUI_UserEvent(eSuperTurbo)",			true, true ),
		--NewContextMenuButton("eCameraDump",			"eCameraDump",			"???",	"MainUI_UserEvent(eCameraDump)",			true, true ),
				
		--NewContextMenuButton("eDeployMines",			"eDeployMines",			"???",	"MainUI_UserEvent(eDeployMines)",			true, true ),
		
		--NewContextMenuButton("eFiltersToggle",			"eFiltersToggle",			"???",	"MainUI_UserEvent(eFiltersToggle)",			true, true ),
		--NewContextMenuButton("eTempWaypoint",			"eTempWaypoint",			"???",	"MainUI_UserEvent(eTempWaypoint)",			true, true ),
		--NewContextMenuButton("eHW1SPHyperspace",			"eHW1SPHyperspace",			"???",	"MainUI_UserEvent(eHW1SPHyperspace)",			true, true ),
		
		--NewContextMenuButton("eCustomToggle",			"eCustomToggle",			"???",	"MainUI_UserEvent(eCustomToggle)",			true, true ),
		
		--NewContextMenuButton("eUINavAccept",			"eUINavAccept",			"???",	"MainUI_UserEvent(eUINavAccept)",			true, true ),
		--NewContextMenuButton("eUINavCancel",			"eUINavCancel",			"???",	"MainUI_UserEvent(eUINavCancel)",			true, true ),

	},


		---------------DEAD CONTEXT MENU OPTIONS -------------------------
	{
		type = "ContextMenu",
		name = "deadContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		visible=0,
		;

		NewContextMenuCheckButton("Wireframe",			"Wireframe",			"???",					"Wireframe(%b)","",		0, true, true ),
		NewContextMenuCheckButton("showShadowMap",		"Show ShadowMap",		"???",					"showShadowMap(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowEngines",		"Show Engines",			"???",					"ShowEngines(%b)","",		1, true, true ),
		NewContextMenuCheckButton("RenderEffects",		"Render Effects",		"???",					"RenderEffects(%b)","",	1, true, true ),
		NewContextMenuCheckButton("RenderShips",		"Render Ships",			"???",					"RenderShips(%b)","",		1, true, true ),
		NewContextMenuCheckButton("ShowAABB",			"Show AABB",			"???",					"ShowAABB(%b)","",			0, true, true ),
		NewContextMenuCheckButton("ShowOctree",			"Show Octree",			"???",					"ShowOctree(%b)","",		0, true, true ),
		NewContextMenuCheckButton("ShowDecalRefMesh",	"Show Decal RefMesh",	"???",					"ShowDecalRefMesh(%b)","",	0, true, true ),
		NewContextMenuCheckButton("ShowObbFaces",		"Show Obb Faces",		"???",					"ShowObbFaces(%b)","",		0, true, true ),
		NewContextMenuCheckButton("ShowUnitCaps",		"Show Unit Caps",		"???",					"ShowUnitCaps(%b)","",		0, true, true ),
		
		
			{
				type = "ContextMenuItem",
				UseTemplate = TEMPLATE_CONTEXTMENUITEM,

				name = "Droptest",
				ignored = 1,
				--Layout = _buttonLayout,
				autosize=1,
				helpTip = "help",

				visible = 1,

				-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
				soundOnEnter 		= "SFX_ButtonEnter",
				soundOnClicked 		= "SFX_ButtonClick",
				text = "SubMenu Test", 		
				--backgroundColor = { 0, 255, 255, 255},	
				;
				NewContextMenuCheckButton("Title",				"Title",			"TitleofAction",		"","",			1, true, true ),
				{
					type = "ContextMenuItem",
					UseTemplate = TEMPLATE_CONTEXTMENUITEM,

					name = "DroptestSub",
					ignored = 1,
					--Layout = _buttonLayout,
					autosize=1,
					helpTip = "help",

					visible = 1,

					-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
					soundOnEnter 		= "SFX_ButtonEnter",
					soundOnClicked 		= "SFX_ButtonClick",
					text = "SubMenu child", 	
					;
				},			

			},


	
	},


}
