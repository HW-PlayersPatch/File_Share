-- Lua screen def'n for controls tab in the options screens
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
KEYBTNWIDTH = 240
SBARSPACE = 19
LABELWIDTH = .5
--612, 264
function GetControlsTab(_width, _height, _linecolor)

local LBOXHEIGHT = _height - 24

local LocalControlsTab = {
	type = "Frame",
	name = "m_frameControlsTab",
	--size = {_width, _height},
	Layout = {
		pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
		size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
	},

	visible = 0,
	arrangetype = "vert",
	;
	
	-- List box to hold all items
	{
		type = "ListBox",
		--listBoxStyle = "FEListBoxStyle_Bordered",

		name = "m_listControls",
		Layout = {			
			size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "px" },
		},
		arrangeweight=1,
		--size = {_width-2,LBOXHEIGHT},
		scrollBarPageSize = 200,
		--backgroundColor = {0,220,0,100},
		--arrangeSep = {	x=0, y= LISTBOX_ITEM_PAD_VERT, xr="scr", yr="scr"},
		--ScrollBar = {
		--	pageSize = 200,
		--},
	},

	{
		type = "Frame",
		--position = { 0, 154},
		--size = { 345, 19},
		autosize=1,
			
		Layout = {
			pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
			pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
			size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },		
							
		},		
		--borderWidth = 1,
		--borderColor = "IGColorOutline",

		BackgroundGraphic = BORDER_GRAPHIC_FRAME,
		backgroundColor = COLOR_BACKGROUND_PANEL,
		arrangetype = "horiz",
		arrangeSep = {	x=PANEL_PAD_HORIZ, y=0, xr="scr", yr="scr",},		
		;

		-- BUTTONS			
		NewMenuButton("m_btnRestoreDefaults",	"$5097",	"$5099",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	nil),
		NewMenuButton("m_btnReset",				"$5182",	"$5098",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	nil),
			

	},
	-- Buttons below scrollbar
	

	
	-- Items
	
	-- Header item to clone
	{
		type = "ListBoxItem",
		name = "m_headerListBoxItemToClone",
		size = {_width - SBARSPACE, 15},
		selectable = 0,
		visible = 0,
		ignored=1,
		;
		{
			type = "TextLabel",
			name = "m_lblHeaderTitle",
			size = {_width - SBARSPACE, 13},
			Text = {
				color = {255,215,0,255},
				offset = {7,0},
			},
		},
	},
	
	-- Non editable item to clone
	{
		type = "ListBoxItem",
		name = "m_nonEditableListBoxItemToClone",
		Layout = {							
			margin_LT = { l = 0, t = PANEL_PAD_VERT/2, lr = "scr", tr = "scr" },	
			size_WH = {	w = 1.0, h = 19.0/800, wr = "par", hr = "scr" },	
		},
		
		--size = {_width - SBARSPACE, 19},
		visible = 0,
		selectable =0,
		arrangetype = "horiz",
		ignored=1,
		;
		{
			type = "TextLabel",
			name = "m_lblKeyName",

			Layout = {	
				size_WH = {w = LABELWIDTH, h = 1, wr = "par", hr = "par",},
			},

			Text = {
				font = "FEHeading4",
				color = {255,255,255,255},
				vAlign = "Middle",
				offset = {30, 0},
			},
		},
		
		{
			type = "TextButton",
			enabled = 0,
			name = "m_btnKey",
			buttonStyle = "FEButtonStyle1NoEnterSound",

			Layout = {	
				size_WH = {w = 1-LABELWIDTH, h = 1, wr = "par", hr = "par",},
				pivot_XY = { 0.0, 0.5 },
				pos_XY = {	y=0.5, yr="par",},		
			},

			--position = {_width - KEYBTNWIDTH - 2 - SBARSPACE, 0},
			Text = {
				font = "ButtonFont",
				color = {255,255,255,255},
				vAlign = "Middle",
				hAlign = "Center",
			},
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$5183", -- "THIS KEY CANNOT BE REASSINGED",
			ignored=1,
		}
	},
	
	-- Editable item to clone
	{
		type = "ListBoxItem",
		name = "m_editableListBoxItemToClone",
		Layout = {							
			margin_LT = { l = 0, t = PANEL_PAD_VERT/2, lr = "scr", tr = "scr" },	
			size_WH = {	w = 1.0, h = 24.0/800, wr = "par", hr = "scr" },	
		},
		--size = {_width - SBARSPACE, 19},
		visible = 0,
		pressedColor = {255,255,255,50},
		arrangetype = "horiz",
		ignored=1,
		;
		{
			type = "TextLabel",
			name = "m_lblKeyName",
			Layout = {	
				size_WH = {w = LABELWIDTH, h = 1, wr = "par", hr = "par",},
			},

			Text = {
				textStyle = "FEHeading4",
				color = {255,255,255,255},
				vAlign = "Middle",
				offset = {30, 0},
			},
			--backgroundColor = {255,0,0,255},
		},
		
		{
			type = "TextButton",
			name = "m_btnKey",
			buttonStyle = "FEButtonStyle1NoEnterSound",
			--width = KEYBTNWIDTH,
			Layout = {	
				size_WH = {w = 1-LABELWIDTH, h = 1, wr = "par", hr = "par",},
				pivot_XY = { 0.0, 0.5 },
				pos_XY = {	y=0.5, yr="par",},		
			},
			--position = {_width - KEYBTNWIDTH - 2 - SBARSPACE, 0},
			Text = {
				font = "ButtonFont",
				color = {255,255,255,255},
				vAlign = "Middle",
				hAlign = "Center",
			},
			helpTipTextLabel = "m_lblHelpText",
			helpTip = "$5184", -- "CLICK TO REASSIGN KEY",
		}
	},
}

return LocalControlsTab

end


--------------------------------------------------------
-- Key order
KeyBindingList = {

	---------------------------------------------------
	-- Selection
	{
		title = 5190, 
		keys = {
			43, 1,	-- select all ships
			164, 1,  	-- select idle harvesters
			26, 1,	-- military selection, key up modifier can only be assigned a single key 
			18, 0,	-- cancel
			6, 1,	-- select ships not in strikegroups
		},
	},
	
	---------------------------------------------------
	-- Camera
	{
		title = 5195, 
		keys = {
			42, 1,	-- focus on selected
			41, 1,	-- focus on flagship
			163, 1, 	-- focus on last event
			44, 1,	-- next focus
			45, 1,	-- prev focus
			--46, 1,	-- zoom in
			--47, 1,	-- zoom out
			151, 1,       -- pan forward
			153, 1,       -- pan backward
			155, 1,       -- pan left
			157, 1,       -- pan right
			159, 1,       -- pan up
			161, 1,       -- pan down
			
		},
	},
	
	---------------------------------------------------
	-- Orders
	{
		title = 5191, 
		keys = {
			10, 1, 	-- move
			25, 1,	-- attack move
			56, 1,  -- waypoint
			17, 1,	-- stop
			14, 1,	-- guard
			15, 1,	-- dock
			11, 1,	-- hyperspace
			12, 1, 	-- harvest keyup modifier
			146, 1,	-- EMP
			170, 1,	-- Gravwell Generator
			148, 1, -- Missile Volley  -- GBX:pdeupree - 
			172, 1, -- Burst Attack  -- GBX:bburleson - 
			173, 1, -- Speed Burst  -- GBX:bburleson - 
			174, 1, -- Drones Activate  -- GBX:bburleson - 
			20, 1,	-- repair
			24, 1,	-- drop mines			
			143, 1,	-- defense field
			144, 1,	-- cloak
			145, 1,	-- capture
			147, 1,	-- sensor ping
			171, 1, 	-- kamikaze
			7, 1, 	-- special attack
			21, 1,	-- rally point
			22, 1,	-- rally to object
			16, 1,	-- parade
			23, 1,	-- retire
			5, 1,	-- scuttle
			180,1,  -- Salcap

			168, 1, -- GBX:pdeupree - custom
			169, 1, -- GBX:pdeupree - custom
		},
	},
	
	---------------------------------------------------
	-- Control Groups
	{
		title = 5192, 
		keys = {
			60, 1,	-- assign groups 1-10
			61, 1,
			62, 1,
			63, 1,
			64, 1,
			65, 1,
			66, 1,
			67, 1,
			68, 1,
			69, 1,
			
			70, 1,	-- select groups 1-10
			71, 1,
			72, 1,
			73, 1,
			74, 1,
			75, 1,
			76, 1,
			77, 1,
			78, 1,
			79, 1,
			
			166, 1, -- clear selected from all groups
			167, 1, -- clear all groups
		},
	},
	
	---------------------------------------------------
	-- Tactics & Formations
	{
		title = 5194, 
		keys = {
			32, 1,	-- prev tactic
			33, 1,	-- next tactic			
			36, 1,	-- offensive tactics
			35, 1,	-- defensive tactics
			34, 1,	-- passive tactics
			37, 1,	-- aggresive stance
			38, 1,	-- evasive stance
			39, 1,	-- neutral stance 
			28, 1,	-- form capital phalanx
			29, 1,	-- form Frigate Line
			30, 1,	-- form Fighter Screen
			103, 1,	-- Delta Formation
			104, 1,	-- Broad Formation
			105, 1, 	-- X Formation
			106, 1,	-- Claw Formation
			107, 1, 	-- Wall Formation
			108, 1,	-- Sphere Formation
			200, 1,	-- Disband Formation (clear all history)
			201, 1,	-- Undo Formation (Step back in history)
			--202, 1,	-- Form Combat Formations 
		},
	},
	
		---------------------------------------------------
	-- Task bar
	{
		title = 5193, 
		keys = {
			50, 1,	-- build menu
			51, 1,	-- build menu (toggle)
			49, 1,	-- research menu
			52, 1,	-- launch menu
			53, 1,	-- launch menu (toggle)
			54, 1,	-- sensors manager
			139, 1,	-- global build Q menu
			149, 1,	-- unit cap info
			137, 1,	-- objectives screen
			140, 1,	-- events screen
			141, 1,	-- diplomacy screen
			142, 1,	-- speech recall
			131, 1,	-- chat
			150, 1,       -- special commands toggle
			48, 1,	-- tactical overlay
			55, 1,	-- toggle HUD (taskbar)
		},
	},
	
	---------------------------------------------------
	-- Build & Research
	{
		title = 5196, 
		keys = {
			90, 1,	-- select build facilities
			91, 1,	
			92, 1,
			93, 1,
			94, 1,
			109, 1,
			95, 1,
			110, 1,
			96, 1,
			97, 1,
			98, 1,
			
			80, 1,	-- send build order 0-9
			81, 1,
			82, 1,
			83, 1,
			84, 1,
			85, 1,
			86, 1,
			87, 1,
			88, 1,
			89, 1,
			
			99, 1,	-- cancel ship at top of ship queue
			100, 1,	-- pause ship queue
			101, 1,	-- cancel sub at top of sub queue
			102, 1,	-- pause sub queue
		},
	},
	
	---------------------------------------------------
	-- System
	{
		title = 5197, 
		keys = {
			4, 1, 		-- menu
			40, 1,	-- pause
			125, 1,	-- quick save
			126, 1,	-- quick load
			129, 1,	-- restart level
			130, 1,	-- screen shot
			2, 0, 		-- exit
		},
	},


	-- UINAV options
	--{
	--	title = 4200, 
	--	keys = {
	--		200, 1, 		-- accept
	--		201, 1,			-- cancel
	--
	--	},
	--},
	---------------------------------------------------
	-- Unassigned / FIXME
	--{
	--	title = 5198, -- loc id
	--	keys = {
			--1, 1 ,  -- keyId, enabled
			
			--3, 1
			
			--27, 1,
			
			--37, 1,	-- speed x2
			--38, 1,	-- speed /2
			--39, 1,	-- speed normal
			
			--56, 1,	-- waypoint editing
			--57, 1,	-- waypoint editing
			
			-- removed
			--103, 1,	-- assign group 11-20???? wtF how do you select
			--104, 1,
			--105, 1,
			--106, 1,
			--107, 1,
			--108, 1,
			--109, 1,
			--110, 1,
			--111, 1,
			--112, 1,
			
			--113, 1,	-- shift modifier
			--114, 1,	-- shift modifier
			--115, 1,	-- control modifer
			--116, 1,	-- control player
			--117, 1, -- focus modifier
			--118, 1, -- focus modifier
			--119, 1,	-- switch player
			--120, 1,	-- ship script reload
			--121, 1,	-- script reload
			
			--122, 1,	-- flight manuever testing
			--123, 1,
			--124, 1,
			
			--127, 1, -- deterministic qsave/load (debug)
			--128, 1,
			
			
			--132, 1,
			
			--133, 1,	-- render toggle
			--134, 1,	-- super turbo
			--135, 1,	-- super turbo off
			--136, 1,	-- sensors manager filter
			
			--148, 1,
		--},
	--},
}


FE_CONTROLSOPTION_TAB = {


			type = "TabPage",
			name = "m_tabControls",
			text = "$5109",
			helpTip = "$5239", -- "CHANGE KEYBOARD AND CONTROL SETTINGS",
				
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
				pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
				pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
			},
			;
					
			{
				type = "Frame",
				position = {0,0},
				Layout = {
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
					size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
								
				},

				;
						
				-- load the controls tab from data:ui/newui/controlstab.lua
				GetControlsTab(612, 264, "FEColorOutline"),
			},


}