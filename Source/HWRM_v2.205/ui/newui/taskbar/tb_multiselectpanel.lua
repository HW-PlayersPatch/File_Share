dofilepath("data:ui/newui/Taskbar/TaskbarDefines.lua")

-- Ship MultiSelect Buttons
-- BTN_SHIPSEL_1
-- BTN_SHIPSEL_2
-- BTN_SHIPSEL_3
-- BTN_SHIPSEL_4
-- BTN_SHIPSEL_5
-- BTN_SHIPSEL_6
-- BTN_SHIPSEL_7
-- BTN_SHIPSEL_8
-- BTN_SHIPSEL_9
-- BTN_SHIPSEL_10
-- BTN_SHIPSEL_11
-- BTN_SHIPSEL_12
-- BTN_SHIPSEL_13
-- BTN_SHIPSEL_14
-- BTN_SHIPSEL_15
-- BTN_SHIPSEL_16
-- BTN_SHIPSEL_17
-- BTN_SHIPSEL_18
-- BTN_SHIPSEL_19
-- BTN_SHIPSEL_20
-- BTN_SHIPSEL_21
-- BTN_SHIPSEL_22
-- BTN_SHIPSEL_23
-- BTN_SHIPSEL_24

if(NewShipSelectButton==nil) then

	function NewShipSelectButton( _name )
		
		local ShipSelButton = 
		{
		type = "Button",
		name = _name,
		ignored = 1,
					
		Layout = {
			size_WH = { w = MULTISELECTICON_W, h = MULTISELECTICON_H, wr = "px", hr = "px" }
		},	

		stateIconOfs = { 0.0, 0.0 },
		stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },	
		cursorType = "Normal",

		BackgroundGraphic = {
	
			size = {0, 0},
			texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
			uvRect = { 20/128, 20/128, 48/128, 48/128 },
			patch_X = { 7, -1, 7, 0 },
			patch_Y = { 7, -1, 7, 0 },
			patch_ResScale = RES_SCALE,
		
			Surface = {
				surface = "ui_multistate_tint";
				{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "tint_0", float4 = {27, 69, 85, 64} },
				{ prop = "tint_1", float4 = COLOR_BUTTON_BGRD_HOVER },
				{ prop = "tint_2", float4 = COLOR_BUTTON_BGRD_CLICKED },
				{ prop = "tint_d", float4 = COLOR_BUTTON_BGRD_FLASH },
			},
		},
				
		-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
		soundOnEnter 		= "SFX_ButtonEnter",
		soundOnClicked 		= "SFX_ButtonClick",
		
		;		
		{
		    -- The ship icon is put into this frame.
			type = "Frame",
			name = "shipIcon",			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
				
			},		
			giveParentMouseInput = 1,
			backgroundGraphicHAlign = "Center",
			backgroundGraphicVAlign = "Center",
		},
		{
			type = "ProgressBar",
			backgroundColor = { 99, 101, 99, 255},
			progressColor = { 51, 255, 0, 255},				
			Layout = {
				pos_XY = { x = 0.12, y = 0.82, xr = "par", yr = "par" },
				size_WH = { w = 0.76, h = 0.075, wr = "par", hr = "par" },
			},				
			name = "shipHealth",
			giveParentMouseInput = 1,
		},
		{
			type = "TextLabel",	
			--backgroundColor          = {233,54,77,255},
			--borderColor 		= {255,162,255,255},
			--borderWidth 		= 2,
			autosize=1,						
			Layout = {
				--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				pos_XY = { x = 1, y = .25, xr = "par", yr = "par" },
				pivot_XY = { 1, 0 },				
				size_WH = { w = 1, h = .45, wr = "px", hr = "par" },
				margin_RB  = { r = 4, b = 0, rr = "px", br = "px" },
			},			
			name = "shipCount",
			Text = {
				--textStyle = "TaskbarHD_ButtonTextStyle",
				color = { 255, 255, 255, 255},
				--rel = 1080,
				minShrink = .1,
				--hAlign = "Right",
				--vAlign = "Bottom",
				type = "Text",
				font = "ButtonFont",
				color = "IGColorButtonText",
				dropShadow = 1,
				--pixels  = 20,
				style  = 1,
				hAlign = "Right",
			},
			giveParentMouseInput = 1,
		},
		
	




			
		}
		return ShipSelButton
	end
end

-- Ship buttons					
BTN_SHIPSEL_1 = NewShipSelectButton("btnShip01")	
BTN_SHIPSEL_2 = NewShipSelectButton("btnShip02")	
BTN_SHIPSEL_3 = NewShipSelectButton("btnShip03")	
BTN_SHIPSEL_4 = NewShipSelectButton("btnShip04")	
BTN_SHIPSEL_5 = NewShipSelectButton("btnShip05")	
BTN_SHIPSEL_6 = NewShipSelectButton("btnShip06")	
BTN_SHIPSEL_7 = NewShipSelectButton("btnShip07")	
BTN_SHIPSEL_8 = NewShipSelectButton("btnShip08")	
BTN_SHIPSEL_9 = NewShipSelectButton("btnShip09")	
BTN_SHIPSEL_10 = NewShipSelectButton("btnShip10")	
BTN_SHIPSEL_11 = NewShipSelectButton("btnShip11")	
BTN_SHIPSEL_12 = NewShipSelectButton("btnShip12")	
BTN_SHIPSEL_13 = NewShipSelectButton("btnShip13")	
BTN_SHIPSEL_14 = NewShipSelectButton("btnShip14")	
BTN_SHIPSEL_15 = NewShipSelectButton("btnShip15")	
BTN_SHIPSEL_16 = NewShipSelectButton("btnShip16")	
BTN_SHIPSEL_17 = NewShipSelectButton("btnShip17")	
BTN_SHIPSEL_18 = NewShipSelectButton("btnShip18")	
BTN_SHIPSEL_19 = NewShipSelectButton("btnShip19")	
BTN_SHIPSEL_20 = NewShipSelectButton("btnShip20")	
BTN_SHIPSEL_21 = NewShipSelectButton("btnShip21")	
BTN_SHIPSEL_22 = NewShipSelectButton("btnShip22")	
BTN_SHIPSEL_23 = NewShipSelectButton("btnShip23")	
BTN_SHIPSEL_24 = NewShipSelectButton("btnShip24")	
