-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

buildFamily = {
	{name = "Fighter_Hgn"},
	{name = "Corvette_Hgn"},
	{name = "Mover_Hgn"},
	{name = "Frigate_Hgn"},
	{name = "SuperCap_Hgn"},
	{name = "Shipyard_Hgn"},
	{name = "Battlecruiser_Hgn"},
	{name = "Flagship_Hgn"},
	{name = "Utility_Hgn"},
	{name = "Probe_Hgn"},
	{name = "Platform_Hgn"},
	{name = "SubSystem_Hgn"},
	{name = "SubSystemLarge_Hgn"},
	{name = "Fighter_Vgr"},
	{name = "Corvette_Vgr"},
	{name = "Frigate_Vgr"},
	{name = "SuperCap_Vgr"},
	{name = "Shipyard_Vgr"},
	{name = "Battlecruiser_Vgr"},
	{name = "Flagship_Vgr"},
	{name = "Utility_Vgr"},
	{name = "Probe_Vgr"},
	{name = "Platform_Vgr"},
	{name = "SubSystem_Vgr"},
	{name = "SubSystemLarge_Vgr"},
	{name = "NotBuildable"},}
displayFamily = {
	{name = "Fighter", stringParam = "$2100", numParam = 1},
	{name = "Corvette", stringParam = "$2101", numParam = 2},
	{name = "Frigate", stringParam = "$2102", numParam = 3},
	{name = "Capital", stringParam = "$2103", numParam = 4},
	{name = "Flagship", stringParam = "$2104", numParam = 6},
	{name = "Platform", stringParam = "$2105", numParam = 7},
	{name = "Utility", stringParam = "$2106", numParam = 8},
	{name = "SubSystemModule", stringParam = "$2107", numParam = 9},
	{name = "SubSystemSensors", stringParam = "$2108", numParam = 10},
	{name = "Munition", stringParam = "$2109", numParam = 11},
	{name = "Megalith", stringParam = "$2110", numParam = 12},}
attackFamily = {
	{name = "Fighter", numParam = 1},
	{name = "Corvette", numParam = 1},
	{name = "Frigate", numParam = 1},
	{name = "Utility", numParam = 1},
	{name = "Munition", numParam = 1},
	{name = "SmallCapitalShip", numParam = 1},
	{name = "BigCapitalShip", numParam = 1},
	{name = "Mothership", numParam = 1},
	{name = "Emplacement", numParam = 1},
	{name = "UnAttackable", numParam = 0},
	{name = "SubSystem", numParam = 1},
	{name = "Resource", numParam = 1},
	{name = "ResourceLarge", numParam = 1},
	{name = "Capturer", numParam = 1},
	{name = "Chimera", numParam = 1},}
dockFamily = {
	{name = "Mover"},
	{name = "Fighter"},
	{name = "Corvette"},
	{name = "Frigate"},
	{name = "Utility"},
	{name = "Controller"},
	{name = "Platform"},
	{name = "SuperCap"},
	{name = "BattleCruiser"},
	{name = "Transport"},
	{name = "Shipyard"},
	{name = "Flagship"},
	{name = "Resource"},
	{name = "Inhibitor"},
	{name = "LargeSalvage"},
	{name = "UltraCap"},
	{name = "CantDock"},}
avoidanceFamily = {
	{name = "None", numParam = 0},
	{name = "DontAvoid", numParam = 1},
	{name = "Strikecraft", numParam = 2},
	{name = "Utility", numParam = 3},
	{name = "Frigate", numParam = 4},
	{name = "SmallRock", numParam = 5},
	{name = "Capital", numParam = 6},
	{name = "SuperCap", numParam = 7},
	{name = "BattleCruiser", numParam = 8},
	{name = "MotherShip", numParam = 9},
	{name = "BigRock", numParam = 10},
	{name = "SuperPriority", numParam = 11},}
collisionFamily = {
	{name = "Small", numParam = 0},
	{name = "Big", numParam = 1},
	{name = "Unmoveable", numParam = 2},}
autoFormationFamily = {
	{name = "Fighter", numParam = 0},
	{name = "Corvette", numParam = 1},
	{name = "Frigate", numParam = 2},
	{name = "CapShip", numParam = 3},
	{name = "SuperCap", numParam = 4},}
armourFamily = {
	{name = "Unarmoured"},
	{name = "LightArmour"},
	{name = "MediumArmour"},
	{name = "HeavyArmour"},
	{name = "SubSystemArmour"},
	{name = "TurretArmour"},
	{name = "ResArmour"},
	{name = "MoverArmour"},
	{name = "PlanetKillerArmour"},
	{name = "MineArmour"},
	{name = "ChunkArmour"},}
unitcapsFamily = {
	{name = "Fighter", numParam = 1, stringParam = "$2113"},
	{name = "Corvette", numParam = 10, stringParam = "$2114"},
	{name = "Frigate", numParam = 20, stringParam = "$2115"},
	{name = "Capital", numParam = 30, stringParam = "$2116"},
	{name = "Platform", numParam = 40, stringParam = "$2117"},
	{name = "Utility", numParam = 50, stringParam = "$2118"},
	{name = "Mothership", numParam = 60, stringParam = "$2119"},
	{name = "DreadNaught", numParam = 70, stringParam = "$2120"},
	{name = "SPMovers", numParam = 80, stringParam = "$2121"},
	{name = "SinglePlayerMisc", numParam = 90, stringParam = "This should not be displayed"},
	{name = "CommStation", numParam = 100, stringParam = "This should not be displayed"},}
unitcapsShipType = {
	{name = "MinelayerCorvette", numParam = 11, stringParam = "$2135"},
	{name = "Mover", numParam = 12, stringParam = "$2121"},
	{name = "TorpedoFrigate", numParam = 21, stringParam = "$2122"},
	{name = "CaptureFrigate", numParam = 22, stringParam = "$2123"},
	{name = "DefenseFieldFrigate", numParam = 23, stringParam = "$2124"},
	{name = "Destroyer", numParam = 31, stringParam = "$2125"},
	{name = "Carrier", numParam = 32, stringParam = "$2126"},
	{name = "Battlecruiser", numParam = 33, stringParam = "$2127"},
	{name = "Shipyard", numParam = 34, stringParam = "$2128"},
	{name = "HyperspacePlatform", numParam = 41, stringParam = "$2129"},
	{name = "ResourceCollector", numParam = 51, stringParam = "$2130"},
	{name = "ResourceController", numParam = 52, stringParam = "$2131"},
	{name = "Probe", numParam = 53, stringParam = "$2132"},
	{name = "ECMProbe", numParam = 54, stringParam = "$2133"},
	{name = "ProximitySensor", numParam = 55, stringParam = "$2134"},}
