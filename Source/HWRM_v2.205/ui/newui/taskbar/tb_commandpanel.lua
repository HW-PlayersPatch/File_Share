dofilepath("data:ui/newui/Taskbar/TaskbarDefines.lua")

----------- Command Panel Buttons ----------
-- BTN_CMD_HARVEST
-- BTN_CMD_HYPERSPACE
-- BTN_CMD_PING
-- BTN_CMD_PULSE
-- BTN_CMD_MISSILEVOLLEY
-- BTN_CMD_BURSTATTACK
-- BTN_CMD_DEFENCEFIELD
-- BTN_CMD_CLOAK
-- BTN_CMD_REPAIR
-- BTN_CMD_KAMIKAZE
-- BTN_CMD_MINES

-- BTN_CMD_ATTACK
-- BTN_CMD_MOVEATTACK
-- BTN_CMD_GUARD
-- BTN_CMD_DOCK
-- BTN_CMD_CANCELORDERS
-- BTN_CMD_WAYPOINT
-- BTN_CMD_RETIRE
-- BTN_CMD_RALLYPOINT
-- BTN_CMD_RALLYOBJECT
-- BTN_CMD_SCUTTLE

-------- Command Buttom Template -----------
if(GetCommandButton == nil) then
	function GetCommandButton(_name, _helptip, _hotkeyID, _texture, _mouseclick, _mouserightclick)

		local CommandButton = {

				type = "ButtonHD",
				
				buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
				name = _name,
				onMouseClicked = _mouseclick,
				onMouseRightClicked = _mouserightclick,
				helpTip = _helptip,
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = _hotkeyID,
				selectable = 1,
				ignored = 1,

				Layout = {					
					size_WH = { w = 48, h = 48, wr = "px", hr = "px" },
				},		

				stateIconOfs = { 0.0, 128/512 },
				stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },

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
				;
				{		
					type = "CooldownFrame",
					name = "cmdCooldownFrame",
					UseTemplate = TEMPLATE_COMMAND_COOLDOWNFRAME,	

					Layout = {	
							size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
						},	

					--backgroundColor = {255,0,0,255},
					cooldownDuration = 100,
					cooldownProgress = 24,
					reverse = 0,
					drawText = 1,
			},
		}

		return CommandButton

	end
end

----------------------------------------------------------------------------------------------------------------


 

-- Name, HelpTip, hotkey, texture, mouseclickevent
BTN_CMD_HARVEST			= GetCommandButton("btnResource",		"$2723", 12,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_resource.dds",		"MainUI_UserEventData( eHarvest, 0); MainUI_UserEventData( eHarvest, 1);")
BTN_CMD_HYPERSPACE		= GetCommandButton("btnHyperspace",		"$2725", 11,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_hyperspace.dds",	"MainUI_UserEvent( eHyperspace)")
BTN_CMD_PING			= GetCommandButton("btnPing",			"$2769", 147,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_ping.dds",			"MainUI_UserEvent( eSensorPing)")
BTN_CMD_PULSE			= GetCommandButton("btnEMP",			"$2768", 146,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_pulse.dds",			"MainUI_UserEventData2( eSpecialAttack, 0, 2)")
BTN_CMD_MISSILEVOLLEY	= GetCommandButton("btnMissileVolley",	"$4941", 148,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_missilevolley.dds",	"MainUI_UserEventData2( eSpecialAttack, 0, 6)")
BTN_CMD_BURSTATTACK		= GetCommandButton("btnBurstAttack",	"$4942", 172,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_burstattack.dds",	"MainUI_UserEventData2( eSpecialAttack, 0, 7)")
BTN_CMD_DEFENCEFIELD	= GetCommandButton("btnDefenseField",	"$2765", 143,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_defense.dds",		"MainUI_UserEvent( eDefenseField)")
BTN_CMD_CLOAK			= GetCommandButton("btnCloak",			"$2766", 144,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_cloak.dds",			"MainUI_UserEvent( eCloak)")
BTN_CMD_REPAIR			= GetCommandButton("btnRepair",			"$2726", 20,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_repair.dds",		"MainUI_UserEvent( eRepair)")
BTN_CMD_KAMIKAZE		= GetCommandButton("btnKamikaze",		"$2771", 171,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_kamikaze.dds",		"MainUI_UserEvent( eKamikaze )")
BTN_CMD_MINES			= GetCommandButton("btnMines",			"$2772", 24,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_mines.dds",			"MainUI_UserEvent( eDropMinesInstant)")
BTN_CMD_MOVE			= GetCommandButton("btnMove",			"$2717", 10,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_move.dds",			"MainUI_UserEvent( eMove)")

BTN_CMD_ATTACK			= GetCommandButton("btnAttack",			"$2718", 115,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_attack.dds",		"MainUI_UserEventData( eControlModifier, 0)")
BTN_CMD_MOVEATTACK		= GetCommandButton("btnAttackMove",		"$2724", 25,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_moveatk.dds",		"MainUI_UserEvent( eMoveAttack )")
BTN_CMD_GUARD			= GetCommandButton("btnGuard",			"$2719", 14,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_guard.dds",			"MainUI_UserEvent( eGuard)")
BTN_CMD_DOCK			= GetCommandButton("btnDock",			"$2720", 15,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_dock.dds",			"MainUI_UserEvent( eDock)")
BTN_CMD_CANCELORDERS	= GetCommandButton("btnCancelOrders",	"$2722", 17,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_stop.dds",			"MainUI_UserEvent( eCancelOrders)")
BTN_CMD_WAYPOINT		= GetCommandButton("btnWaypoint",		"$2727", 56,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_waypoint.dds",		"MainUI_UserEvent( eTempWaypoint)")
BTN_CMD_RETIRE			= GetCommandButton("btnRetire",			"$2728", 23,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_retire.dds",		"MainUI_UserEvent( eRetire)")
BTN_CMD_RALLYPOINT		= GetCommandButton("btnRally",			"$2721", 21,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_rallypnt.dds",		"MainUI_UserEvent( eRallyPoint)")
BTN_CMD_RALLYOBJECT		= GetCommandButton("btnRallyObject",	"$2767", 22,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_rallyobj.dds",		"MainUI_UserEventData( eRallyObject, 0 )")
BTN_CMD_SCUTTLE			= GetCommandButton("btnScuttle",		"$2773", 5,		"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_scuttle.dds",		"MainUI_UserEvent( eScuttle)")
BTN_CMD_SALCAP			= GetCommandButton("btnSalCap",			"$2807", 180,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_capture.dds",		"MainUI_UserEventData( eSalCap, 0)")
BTN_CMD_CAPTURE			= GetCommandButton("btnCapture",		"$2807", 145,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_capture.dds",		"MainUI_UserEventData( eCapture, 0)")

-- Toggle Buttons ?
BTN_CMD_DRONESACTIVATE	= GetCommandButton("btnDronesActivate",	"$2958", 174,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_dronefrigate.dds",		"MainUI_UserEventData( eCustomToggle, 2 );")  
BTN_CMD_SPEEDBOOST		= GetCommandButton("btnSpeedActivate",	"$2959", 173,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_speedburst.dds",		"MainUI_UserEventData( eCustomToggle, 3 );")   				
BTN_CMD_GRAVWELL		= GetCommandButton(	"btnGravWellActivate",	"$2957", 170,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_gravewellgenerator.dds",		"MainUI_UserEventData( eCustomActivate, 1 );" , "MainUI_UserEventData( eCustomDeActivate, 1 );")
BTN_CMD_CUSTOM			= GetCommandButton(	"btnCustomActivate",	"$2956", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_specialattack.dds",				"MainUI_UserEventData( eCustomActivate, 0 );" , "MainUI_UserEventData( eCustomDeActivate, 0 );")		