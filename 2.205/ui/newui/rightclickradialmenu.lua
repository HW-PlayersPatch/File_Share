dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

RightClickRadialMenu = {
	
	stylesheet = "HW2StyleSheet",

	RootElementSettings = {
		eventOpaque = 0,
	},
	
	Layout = {					
		size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },		
	},
	--giveParentMouseInput = 1,
	eventOpaque = 0,
	--claimMousePress = 1,

	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords


	;

		{
		type = "ContextMenu",
		name = "rightclickradialContextMenu",
		UseTemplate = TEMPLATE_CONTEXTMENU,
		;
		NewContextMenuButton("Title",				"Title",			"TitleofAction",		"MainUI_UserEventData( eMove,0 )",	true, true ),
		
		NewContextMenuButton("TargetName",			"Target Name",		"NameofTarget",			"",	 true, true ),
		--NewContextMenuCheckButton("OrdersOption",		"ORDERS",			"???",					"",	"",			0, true, true ),
		--NewContextMenuCheckButton("SpecialOption",		"SPECIAL",			"???",					"",	"",			0, true, true ),
		--NewContextMenuCheckButton("TacticsOption",		"TACTICS",			"???",					"",	"",			0, true, true ),
		--NewContextMenuCheckButton("StrikeGroupOption",	"STRIKE GROUP",		"???",					"",	"",			0, true, true ),
		--NewContextMenuCheckButton("focusOption",		"FOCUS",			"???",					"",	"",			0, true, true ),

		{
				type = "ContextMenuItem",
				UseTemplate = TEMPLATE_CONTEXTMENUITEM,

				text = "ORDERS", 	
				forceSubItemFill = 1,
				
				--backgroundColor = { 0, 255, 255, 255},	
				;
				-- FYI: INFO_ defines are only available to this screen 
				NewContextMenuButtonData("btnMove",			"MOVE",			"TitleofAction",		"MainUI_UserEventData( eMove,0 )",								0,0,INFO_CMD_Move,	true, true ),
				NewContextMenuButtonData("btnAttack",		"ATTACK",		"TitleofAction",		"MainUI_UserEventDataTarget( eAttack,eContextMenuTarget,1 )",	0,0,INFO_CMD_Attack, true, true ),
				NewContextMenuButtonData("btnGuard",		"GUARD",		"TitleofAction",		"MainUI_UserEventDataTarget( eGuard,eContextMenuTarget,1 )",	0,0,INFO_CMD_Guard, true, true ),
				NewContextMenuButtonData("btnDock",			"DOCK",			"TitleofAction",		"MainUI_UserEventDataTarget( eDock,eContextMenuTarget,1 )",		0,0,INFO_CMD_Dock, true, true ),
				NewContextMenuButtonData("btnWaypoint",		"WAYPOINT",		"TitleofAction",		"MainUI_UserEventData( eWaypoint, 0 )",							0,0,INFO_CMD_Waypoints, true, true ),
				NewContextMenuButtonData("btnStop",			"STOP",			"TitleofAction",		"MainUI_UserEventData( eStop, 0 )",								0,0,INFO_CMD_Stop, true, true ),
				NewContextMenuButtonData("btnRetire",		"RETIRE",		"TitleofAction",		"MainUI_UserEventDataTarget( eRetire,eContextMenuTarget, 1 )",	0,0,INFO_CMD_Retire, true, true ),
				NewContextMenuButtonData("btnHarvest",		"HARVEST",		"TitleofAction",		"MainUI_UserEventDataTarget( eHarvest,eContextMenuTarget, 1 )",	0,0,INFO_CMD_Harvest, true, true ),

			},



	},




	-- the root frame for the menu... add children to this
	{
		type = "Frame",
		name = "menu",
		position = { 0, 0},
		autosize = 1,
		--autoarrange = 1,
		arrangetype="vert",			
		visible = 1,
		arrangeSep = {	x=0, y=2/600, xr="scr", yr="scr"},
		--backgroundColor = "IGColorBackground1",
		--backgroundColor = COLOR_BLUE_SOLID,
		--BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		backgroundColor = COLOR_BLUE_SOLID,
	},
	
	-- item to clone to make sub-menus
	{
		type = "Frame",
		name = "subMenu",
		position = { 0, 0},
		arrangetype="vert",		
		arrangeSep = {	x=0, y=2/600, xr="scr", yr="scr"},
		autosize = 1,
		autoarrange = 1,
		visible = 0,
		--backgroundColor = "IGColorBackground1",
		--backgroundColor = COLOR_YELLOW_SOLID,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
	},
	
	-- menu title to clone and insert into menu
	{
		type = "TextLabel",
		name = "menuLabel",
		position = {0, 0},
		size = { 130, 13},
		wrapping = 1,
		--autosize = 1,
		visible = 0,
		Text = {
			textStyle = "RightClickMenu_ButtonTextStyle",
			hAlign = "Left",
			color = { 255, 255, 255, 255},
		},
		backgroundColor = COLOR_LISTITEM_TITLEBAR,
	},
	
	-- menu item to clone and insert into menu
	{
		type = "Frame",
		name = "menuItem",
		autosize = 1,
		visible = 0,
		--backgroundColor = COLOR_PURPLE_SOLID,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		--borderWidth = 1,
		--borderColor = { 0, 175, 255, 255},
		;
		
		{
			type = "TextButton",
			name = "text",
			buttonStyle = "RightClickMenu_ButtonStyle",
			position = {0,0},
			size = {130, 13},
			Text = {
				textStyle = "RightClickMenu_ButtonTextStyle",
				hAlign = "Left",
				offset = { 3, 0},
			},


			--disabledColor = { 255, 0, 0, 255 },
			;
			
			{
				type = "Frame",
				name = "rightarrow",
				position = { 120, 1},
				size = { 11, 9},
				visible = 0,
				BackgroundGraphic = {
					size = {11, 9},
					texture = "DATA:UI\\NewUI\\InGameIcons\\menuarrow.tga",
					textureUV = { 0, 0, 11, 9 },
				},
			},
		},
	},
}
