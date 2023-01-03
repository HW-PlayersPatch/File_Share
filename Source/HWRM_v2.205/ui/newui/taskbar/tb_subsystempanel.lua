
----------- Subsystem Buttons ----------
-- BTN_SUBYSTEM_1
-- BTN_SUBYSTEM_2
-- BTN_SUBYSTEM_3
-- BTN_SUBYSTEM_4
-- BTN_SUBYSTEM_5
-- BTN_SUBYSTEM_6
-- BTN_SUBYSTEM_7
-- BTN_SUBYSTEM_8
-- BTN_SUBYSTEM_9
-- BTN_SUBYSTEM_10
-- BTN_SUBYSTEM_11
-- BTN_SUBYSTEM_12
-- BTN_SUBYSTEM_13
-- BTN_SUBYSTEM_14
-- BTN_SUBYSTEM_15
-- BTN_SUBYSTEM_16
-- BTN_SUBYSTEM_17
-- BTN_SUBYSTEM_18

----------- Subsystem Style Template Buttons ----------
-- BTN_TEMPLATE_SUBSYSTEM_PRODUCTION
-- BTN_TEMPLATE_SUBSYSTEM_SENSOR
-- BTN_TEMPLATE_SUBSYSTEM_GENERIC
-- BTN_TEMPLATE_SUBSYSTEM_INNATE
--------------------------------------------

BTN_SUBYSTEM_1 = {
	type = "Button",
	name = "subsystem1",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_2 = {
	type = "Button",
	name = "subsystem2",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_3 = {
	type = "Button",
	name = "subsystem3",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_4 = {
	type = "Button",
	name = "subsystem4",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_5 = {
	type = "Button",
	name = "subsystem5",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_6 = {
	type = "Button",
	name = "subsystem6",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_7 = {
	type = "Button",
	name = "subsystem7",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_8 = {
	type = "Button",
	name = "subsystem8",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_9 = {
	type = "Button",
	name = "subsystem9",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_10 = {
	type = "Button",
	name = "subsystem10",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_11 = {
	type = "Button",
	name = "subsystem11",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_12 = {
	type = "Button",
	name = "subsystem12",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_13 = {
	type = "Button",
	name = "subsystem13",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_14 = {
	type = "Button",
	name = "subsystem14",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_15 = {
	type = "Button",
	name = "subsystem15",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_16 = {
	type = "Button",
	name = "subsystem16",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_17 = {
	type = "Button",
	name = "subsystem17",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}

BTN_SUBYSTEM_18 = {
	type = "Button",
	name = "subsystem18",
	ignored = 1,
	buttonStyle = "TaskbarHD_SubsystemButtonStyle",
}






---------------------  Subsytem "Template" Styles ----------------
BTN_TEMPLATE_SUBSYSTEM_PRODUCTION = {
	type = "Button",
	name = "subsystem_production",
	visible = 0,
	ignored = 1,
	Layout = {	
		pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
		size_WH = { w = 32.0, h = 24.0, wr = "px", hr = "px" },
	},
	DefaultGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 0, 0, 32, 24 },
	},
	OverGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 0, 24, 32, 48 },
	},
	PressedGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 0, 48, 32, 72 },
	},
	DisabledGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 0, 0, 32, 24 },
		color = { 255, 255, 255, 200},
	},
	helpTip = "$2811",
	soundOnClicked = "SFX_ButtonClick",
}



BTN_TEMPLATE_SUBSYSTEM_SENSOR = {
	type = "Button",
	name = "subsystem_sensor",
	visible = 0,
	ignored = 1,
	Layout = {	
		pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
		size_WH = { w = 32.0, h = 24.0, wr = "px", hr = "px" },
	},
	DefaultGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 32, 0, 64, 24 },
	},
	OverGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 32, 24, 64, 48 },
	},
	PressedGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 32, 48, 64, 72 },
	},
	DisabledGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 32, 0, 64, 24 },
		color = { 255, 255, 255, 200},
	},
	helpTip = "$2813",
	soundOnClicked = "SFX_ButtonClick",
}
			
		
			
			
BTN_TEMPLATE_SUBSYSTEM_GENERIC = {
	type = "Button",
	name = "subsystem_generic",
	visible = 0,
	ignored = 1,
	Layout = {	
		pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
		size_WH = { w = 32.0, h = 24.0, wr = "px", hr = "px" },
	},
	DefaultGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 64, 0, 96, 24 },
	},
	OverGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 64, 24, 96, 48 },
	},
	PressedGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 64, 48, 96, 72 },
	},
	DisabledGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 64, 0, 96, 24 },
		color = { 255, 255, 255, 200},
	},
	helpTip = "$2812",
	soundOnClicked = "SFX_ButtonClick",
}
			
			
			
BTN_TEMPLATE_SUBSYSTEM_INNATE = {
	type = "Button",
	name = "subsystem_innate",
	visible = 0,
	ignored = 1,
	Layout = {	
		pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
		size_WH = { w = 32.0, h = 24.0, wr = "px", hr = "px" },
	},
	DefaultGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 96, 0, 128, 24 },
	},
	OverGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 96, 24, 128, 48 },
	},
	PressedGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 96, 48, 128, 72 },
	},
	DisabledGraphic = {
		texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button.mres",
		textureUV = { 96, 0, 128, 24 },
		color = { 255, 255, 255, 200},
	},
	helpTip = "$2814",
	soundOnClicked = "SFX_ButtonClick",
}