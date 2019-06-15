dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

------------------------- Defines that are used for the Taskbar -------------------------

-- This is used to adjust scale steps. #s are divided by this #
TASKBAR_SCALE = 1

SELECTIONBACKGROUNDCOLOR = { 20, 20, 20, 80}

-- Subsystems
SUBSYSICON_W = 26 / TASKBAR_SCALE
SUBSYSICON_H = 14 / TASKBAR_SCALE

-- Formations
FORMATIONICON_W = 30 / TASKBAR_SCALE
FORMATIONICON_H = 30 / TASKBAR_SCALE

-- Tactics
TACTICSICON_W = 30 / TASKBAR_SCALE
TACTICSICON_H = 30 / TASKBAR_SCALE

-- MultiSelect Ship Icons
MULTISELECTICON_W = 70 / TASKBAR_SCALE
MULTISELECTICON_H = 24 / TASKBAR_SCALE

-- Small Subsystem Icons
SMALLSUBSYSTEMICON_W = 24 / TASKBAR_SCALE
SMALLSUBSYSTEMICON_H = 16 / TASKBAR_SCALE


THREESTATEBUTTONSURFACE = {
	surface = "ui_multistate";
	{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
	{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
	{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
	{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
}
