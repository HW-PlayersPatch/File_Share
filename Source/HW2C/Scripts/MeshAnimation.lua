-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

inclusive = {
	"Normal", "Docked",
	"Normal", "Closed",
	"Normal", "CodeGreen",
	"Normal", "ResourceEnd",
	"Normal", "RepairEnd",
	"Normal", "DockPathClosed",
	"Normal", "DefenseFieldDeActivate",
	"Normal", "CloakFieldDeactivate",
	"Normal", "HyperspaceGateDeActivate",
	"Normal", "CaptureInActive"};

exclusive = {
	"Open", "Closed",
	"Closed", "Open",
	"CodeGreen", "CodeRed",
	"CodeRed", "CodeGreen",
	"ResourceStart", "ResourceDo", "ResourceStart", "ResourceEnd",
	"ResourceDo", "ResourceStart", "ResourceDo", "ResourceEnd",
	"ResourceEnd", "ResourceStart", "ResourceEnd", "ResourceDo",
	"RepairStart", "RepairDo", "RepairStart", "RepairEnd",
	"RepairDo", "RepairStart", "RepairDo", "RepairEnd",
	"RepairEnd", "RepairStart", "RepairEnd", "RepairDo",
	"DockPathClosed", "DockPathOpen",
	"DockPathOpen", "DockPathClosed",
	"Docked", "Launched",
	"Launched", "Docked",
	"DefenseFieldDeActivate", "DefenseFieldActivate",
	"DefenseFieldActivate", "DefenseFieldDeActivate",
	"CloakFieldDeactivate", "CloakFieldActivate",
	"CloakFieldActivate", "CloakFieldDeactivate",
	"HyperspaceGateDeActivate", "HyperspaceGateActivate",
	"HyperspaceGateActivate", "HyperspaceGateDeActivate",
	"Normal", "DoingFlightManeuver",
	"DoingFlightManeuver", "Normal",
	"CaptureActive", "CaptureInActive",
	"CaptureInActive", "CaptureActive"};
