dofilepath("data:ui/newui/Taskbar/TaskbarDefines.lua")

----------- Formation Buttons ----------
--
-- BTN_CAPITALPHALANX
-- BTN_FRIGATELINE 
-- BTN_FIGHTERSCREEN
-- BTN_DELTA
-- BTN_BROAD
-- BTN_X
-- BTN_CLAW
-- BTN_WALL
-- BTN_SPHERE


function GetFormationButton(_name, _helptip, _hotkeyID, _customID, _texture, _mouseclick, _layout)

	local _buttonLayout 

	if(_layout == nil) then
		_buttonLayout = {		
			size_WH = { w = FORMATIONICON_W, h = FORMATIONICON_H, wr = "px", hr = "px" },			
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
		}
	else
		_buttonLayout = _layout
	end


	local FormationButton = {
		type = "ButtonHD",
		name = _name,	
		ignored = 1,
		visible = 1,
		
		onMouseClicked = _mouseclick,

		helpTip = _helptip,		
		helpTipTextLabel = "commandsHelpTip",

		hotKeyID = _hotkeyID,	

		buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
		--stateBaseOfs = { 0.0, 64/512 },
		--stateBaseCells = { 0, 1, 2, 3,       2, 3, 2, 7 },
		--BackgroundGraphic = MENU_COMMANDBUTTON_GRAPHIC,

		Layout = _buttonLayout,
		
		customData3 = _customID,

		stateIconOfs = { 0.0, 128/512 },
		stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
		soundOnClicked 		= "SFX_ButtonClick",

		IconBase = {
			texture = _texture,
			uvRect = { 0/128, 0/512, 128/128, 128/512 },
			patch_X = { 4,-120, 4,0 },
			patch_Y = { 4,-120,4, 0 },
			patch_Scale = 1,
		
			Surface = {
				surface = "ui_multistate";
				{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},
		},
	}


	return FormationButton

end

BTN_CLONE	= GetFormationButton("btnCloneSGF",	"$3135",	31,	-1, "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_cancel.dds",	"")
--
BTN_LEAVE	= {
		type = "ButtonHD",
		name = "btnLeave",	
		ignored = 1,
		visible = 1,
		
		onMouseClicked = "leaveStrikeGroup()",
		onMouseShiftClicked = "leaveStrikeGroupAlt(1)",	
		--onMouseCtrlClicked = "leaveStrikeGroupAlt(2)",	

		helpTip = "$5522",		
		helpTipShift =  "$5523",
		--helpTipCtrl =  "$5524",

		hotKeyID = 200,	
		hotKeyIDShift = 201,	
		--hotKeyIDCtrl = 202,	


		buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
		--stateBaseOfs = { 0.0, 64/512 },
		--stateBaseCells = { 0, 1, 2, 3,       2, 3, 2, 7 },
		--BackgroundGraphic = MENU_COMMANDBUTTON_GRAPHIC,

		Layout = {	
			size_WH = { w = FORMATIONICON_W, h = FORMATIONICON_H, wr = "px", hr = "px" },	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
		},
		
		customData3 = -1,

		stateIconOfs = { 0.0, 128/512 },
		stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
		soundOnClicked 		= "SFX_ButtonClick",

		IconBase = {
			texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_cancel.dds",
			uvRect = { 0/128, 0/512, 128/128, 128/512 },
			patch_X = { 4,-120, 4,0 },
			patch_Y = { 4,-120,4, 0 },
			patch_Scale = 1,
		
			Surface = {
				surface = "ui_multistate";
				{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},
		},
	}





--GetFormationButton("btnLeave",	"$3135",	31,	-1, "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_cancel.dds",	"leaveStrikeGroup()", {	size_WH = { w = FORMATIONICON_W, h = FORMATIONICON_H, wr = "px", hr = "px" },	pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },})