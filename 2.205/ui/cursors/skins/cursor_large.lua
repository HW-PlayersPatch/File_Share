-- Cursor Config

Cursor_Info = {
	DisplayName = "$3062",
	SymbolicName = "Default_Large"
}

Cursor = {
	InfoText = {
		font = "LocationCardFont",	
		color = {132,209,233,255},
		vAlign = "Middle",
		hAlign = "Center",
		--dropShadow = 1,
		pixels = 52,
		rel = 2160,
	},

	InfoArea = {
		size = {0, 0},
		texture = "DATA:UI\\NewUI\\Elements\\ui_textshadow.tga",
		uvRect = { 4/32, 4/32, 28/32, 28/32 },
		patch_X = { 9, -6, 9, 0 },
		patch_Y = { 9, -6, 9, 0 },
		patch_PadX = { 8, -8 },
		patch_PadY = { 4, -4 },
		patch_Scale = 1,
	},
	
	Tip_Above = 8,
	Tip_Below = 96,

	Min_Height = 768,
	Min_Scale = 0.6,
	
	Mid_Height = 1080,
	Mid_Scale = 1.0,
	
	Max_Height = 2160,
	Max_Scale = 1.5,
	;
	
	-- Cursor defines...
	{
		Type = "Normal",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
	},
	
	{
		Type = "Attack",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				100, 94, 152, 146,
				126, 120 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "ForceAttack",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				13, 158, 73, 219,
				43, 189 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 125,
	},
	
	{
		Type = "Add",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				19, 96, 67, 144,
				43, 120 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Eye",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				430, 98, 487, 142,
				458, 119 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Shield",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				184, 164, 230, 213,
				207, 188 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Support",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				348, 380, 404, 435,
				377, 407 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Dock",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				181, 91, 233, 148,
				207, 120 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Cloak",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				259, 98, 317, 142,
				288, 120 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Mine",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				179, 235, 236, 291,
				207, 264 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Waypoint",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				255, 165, 319, 209,
				287, 188 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Resource",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				275, 309, 301, 356,
				287, 333 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Move",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				263, 236, 314, 287,
				287, 259 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "RelativeMove",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				176, 302, 238, 363,
				207, 333 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Hand",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				300, 4, 375, 83,
				306, 10 },
			offset = { 0, 0 },
		},
		
		Tip_Below = 80,
	},
	
	{
		Type = "Capture",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				181, 91, 233, 148,
				207, 120 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Hyperspace",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				345, 157, 407, 219,
				376, 188 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "FormGate",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				101, 162, 153, 214,
				126, 188 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "SpecialAttack",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				186, 385, 231, 429,
				208, 407 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "RallyPoint",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				17, 308, 68, 359,
				41, 333 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "DefenseField",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				348, 91, 405, 149,
				376, 120 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "MoveAttack",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				344, 230, 402, 288,
				373, 259 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Military",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				97, 235, 156, 293,
				126, 264 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "Salvage",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_overlays.dds",
			iconRect = {
				427, 302, 489, 364,
				458, 333 },
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
	
	{
		Type = "PanLeft",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pans.anim",
			iconRect = {
				4, 83, 80, 147,
				8, 115 },
			offset = { 0, 0 },
		},
	},
	
	{
		Type = "PanRight",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pans.anim",
			iconRect = {
				84, 83, 160, 148,
				156, 115 },
			offset = { 0, 0 },
		},
	},
	
	{
		Type = "PanUp",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pans.anim",
			iconRect = {
				2, 2, 66, 79,
				34, 6 },
			offset = { 0, 0 },
		},
	},
	
	{
		Type = "PanDown",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pans.anim",
			iconRect = {
				70, 2, 134, 78,
				102, 74 },
			offset = { 0, 0 },
		},
	},
	
	{
		Type = "Drag_LR",
		Layer0 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pulse.anim",
			iconRect = {
				0, 0, 60, 84,
				4, 4 },
			offset = { 0, 0 },
		},
		Layer1 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pans.anim",
			iconRect = {
				4, 83, 80, 147,
				80, 115 },
			iconScale = 0.5,
			offset = { 40, 84 },
		},
		Layer2 = {
			texture = "DATA:UI\\Cursors\\ui_cursor_pans.anim",
			iconRect = {
				84, 83, 160, 148,
				84, 115 },
			iconScale = 0.5,
			offset = { 40, 84 },
		},
		
		Tip_Below = 120,
	},
}
