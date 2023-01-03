--
-- Definitions for buttons in NewTaskbar and right click menus for custom commands.
--

--This table defines a list of custom command ID's, NewTaskbar button names, and right click menu display names for all custom commands in the game.
--NOTE: commandID must be a number between 0 and 31 and must match the number used with the CustomCommand add ability on a ship definition.
--The following values are defined for the control commandID:
--
--INFO_CMD_Move
--INFO_CMD_Attack
--INFO_CMD_AttackMove
--INFO_CMD_Guard
--INFO_CMD_Dock
--INFO_CMD_Stop
--INFO_CMD_Waypoints
--INFO_CMD_Harvest
--INFO_CMD_Hyperspace
--INFO_CMD_Retire
--INFO_CMD_SensorPing
--INFO_CMD_EMP
--INFO_CMD_DefenseField
--INFO_CMD_Cloak
--INFO_CMD_Repair
--INFO_CMD_Mines
--INFO_CMD_RallyPoint
--INFO_CMD_RallyObject
--INFO_CMD_Scuttle
--INFO_CMD_Capture
--INFO_CMD_Salvage
--INFO_CMD_SalCap
--INFO_CMD_Kamikaze
--INFO_CustomStart          --Add 0 to 31 to this value to define one of 32 possible custom commands
--INFO_SpecialAttackStart   --Add 0 to 15 to this value to define one of 16 possible special attacks
--INFO_FormationsStart      --Add 0 to 15 to this value to define one of 16 possible formations
--INFO_TacticsStart         --Add 0 to 15 to this value to define one of 16 possible tactics
--INFO_TaskbarTypes_MAX     --Maximum number of commandID's (any command with an ID set to this or higher will be ignored)

--This table defines a list of values mainUIDefine can be set to to map a command info record to a main UI command.

--MUI_CancelCommand = 0,
--MUI_WaypointCommand,
--MUI_WaypointModeCommand,
--MUI_DeleteCommand,
--MUI_FocusCommand,
--MUI_NextFocusCommand,
--MUI_PreviousFocusCommand,
--MUI_AttackCommand,
--MUI_MoveCommand,
--MUI_StopCommand,
--MUI_CreateGroupCommand,
--MUI_SelectGroupCommand,
--MUI_SetSelectionCommand,
--MUI_TacticalOverlayToggleCommand,
--MUI_DockCommand,
--MUI_GuardCommand,
--MUI_ParadeCommand,
--MUI_HarvestCommand,
--MUI_ShiftModifierCommand,
--MUI_ControlModifierCommand,
--MUI_FocusModifierCommand,
--MUI_ZoomCommand,
--MUI_SensorsManagerToggleCommand,
--MUI_OrderFeedbackCommand,
--MUI_SelectAllVisibleCommand,
--MUI_FocusHomeCommand,
--MUI_HyperspaceCommand,
--MUI_RepairCommand,
--MUI_SpecialAttackCommand,
--MUI_SetRallyPoint,
--MUI_SetRallyObject,
--MUI_RetireCommand,
--MUI_DropMinesCommand,
--MUI_MoveAttackCommand,
--MUI_MilitaryCommand,
--MUI_DefenseFieldCommand,
--MUI_CloakCommand,
--MUI_CaptureCommand,
--MUI_SensorPingCommand,
--MUI_DeployMinesCommand,
--MUI_ScuttleCommand,
--MUI_TempWaypointCommand,
--MUI_HW1SPHyperspaceCommand,
--MUI_SalvageCommand,          // GBX:pdeupree - Added for support of ships that have this command
--MUI_SalCapCommand,           // GBX:pdeupree - Support for Homeworld 1 SalCap Corvette
--MUI_CustomCommand,           // GBX:pdeupree - Added to support custom defined commands
--MUI_KamikazeCommand,         // GBX:pdeupree - Adding user control hooks for existing Kamikaze order


CustomCommandDefinitions =
{
    {
        commandID = INFO_CMD_Move,
        activateButtonName = "btnMove",
        rightClickDisplayName = "$3151",
        mainUIDefine = MUI_MoveCommand,
    },
    {
        commandID = INFO_CMD_Attack,
        activateButtonName = "btnAttack",
        rightClickDisplayName = "$3152",
        mainUIDefine = MUI_AttackCommand,
    },
    {
        commandID = INFO_CMD_AttackMove,
        activateButtonName = "btnAttackMove",
    },
    {
        commandID = INFO_CMD_Guard,
        activateButtonName = "btnGuard",
        rightClickDisplayName = "$3153",
        mainUIDefine = MUI_GuardCommand,
    },
    {
        commandID = INFO_CMD_Dock,
        activateButtonName = "btnDock",
        rightClickDisplayName = "$3154",
        mainUIDefine = MUI_DockCommand,
    },
    {
        commandID = INFO_CMD_Stop,
        activateButtonName = "btnCancelOrders",
        rightClickDisplayName = "$3156",
        mainUIDefine = MUI_StopCommand,
    },
    {
        commandID = INFO_CMD_Waypoints,
        activateButtonName = "btnWaypoint",
        rightClickDisplayName = "$3155",
        mainUIDefine = MUI_WaypointCommand,
    },
    {
        commandID = INFO_CMD_Harvest,
        activateButtonName = "btnResource",
        rightClickDisplayName = "$3172",
        mainUIDefine = MUI_HarvestCommand,
    },
    {
        commandID = INFO_CMD_Hyperspace,
        activateButtonName = "btnHyperspace",
        mainUIDefine = MUI_HyperspaceCommand,
    },
    {
        commandID = INFO_CMD_Retire,
        activateButtonName = "btnRetire",
        rightClickDisplayName = "$3157",
        mainUIDefine = MUI_RetireCommand,
    },
    {
        commandID = INFO_CMD_SensorPing,
        activateButtonName = "btnPing",
        rightClickDisplayName = "$3177",
        mainUIDefine = MUI_SensorPingCommand,
    },
    {
        commandID = INFO_CMD_DefenseField,
        activateButtonName = "btnDefenseField",
        rightClickDisplayName = "$3173",
        mainUIDefine = MUI_DefenseFieldCommand;
    },
    {
        commandID = INFO_CMD_Cloak,
        activateButtonName = "btnCloak",
        rightClickDisplayName = "$3174",
        mainUIDefine = MUI_CloakCommand,
    },
    {
        commandID = INFO_CMD_Repair,
        activateButtonName = "btnRepair",
        rightClickDisplayName = "$3189",
        mainUIDefine = MUI_RepairCommand,
    },
    {
        commandID = INFO_CMD_Mines,
        activateButtonName = "btnMines",
        rightClickDisplayName = "$3180",
        mainUIDefine = MUI_DeployMinesCommand,
    },
    {
        commandID = INFO_CMD_RallyPoint,
        activateButtonName = "btnRally",
        mainUIDefine = MUI_SetRallyPoint,
    },
    {
        commandID = INFO_CMD_RallyObject,
        activateButtonName = "btnRallyObject",
        mainUIDefine = MUI_SetRallyObject,
    },
    {
        commandID = INFO_CMD_Scuttle,
        activateButtonName = "btnScuttle",
        rightClickDisplayName = "$3181",
        mainUIDefine = MUI_ScuttleCommand,
    },
    {
        commandID = INFO_CMD_Capture,
		activateButtonName = "btnCapture",
        rightClickDisplayName = "$3175",
        mainUIDefine = MUI_CaptureCommand,
    },
    {
        commandID = INFO_CMD_Salvage,
        rightClickDisplayName = "$3176",
        mainUIDefine = MUI_SalvageCommand,
    },
    {
        commandID = INFO_CMD_SalCap,
		activateButtonName = "btnSalCap",
        rightClickDisplayName = "$3178",
        mainUIDefine = MUI_SalCapCommand,
    },
    {
        commandID = INFO_CMD_Kamikaze,
        activateButtonName = "btnKamikaze",
        rightClickDisplayName = "$5307",
        mainUIDefine = MUI_KamikazeCommand,
    },
    {
        commandID = INFO_CustomStart + 0,
        activateButtonName = "btnCustomActivate",
        rightClickDisplayName = "$5515",
    },
    {
        commandID = INFO_CustomStart + 1,
        activateButtonName = "btnGravWellActivate",
        rightClickDisplayName = "$5516",
    },
    {
        commandID = INFO_CustomStart + 2,
        activateButtonName = "btnDronesActivate",
        rightClickDisplayName = "$5517",
    },
    {
        commandID = INFO_CustomStart + 3,
        activateButtonName = "btnSpeedActivate",
        rightClickDisplayName = "$5518",
    },
    -- SpecialAttacks have an unused "sentinel" at the beginning of the list, so these start at 1, not 0.
    {
        commandID = INFO_SpecialAttackStart + 1,
        activateButtonName = "btnEMP",
        rightClickDisplayName = "$2400",
    },		
    {
        commandID = INFO_SpecialAttackStart + 2,
        rightClickDisplayName = "$2401",
    },
    {
        commandID = INFO_SpecialAttackStart + 3,
        rightClickDisplayName = "$2402",
    },
    {
        commandID = INFO_SpecialAttackStart + 4,
        rightClickDisplayName = "$2403",
    },
	{
        commandID = INFO_SpecialAttackStart + 5,
        activateButtonName = "btnMissileVolley",
        rightClickDisplayName = "$4941",
    },		
		{
        commandID = INFO_SpecialAttackStart + 6,
        activateButtonName = "btnBurstAttack",
        rightClickDisplayName = "$4942",
    },		
}
