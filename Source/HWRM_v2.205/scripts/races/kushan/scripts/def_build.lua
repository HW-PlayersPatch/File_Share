Ship = 0
SubSystem = 1
build =
{
--Fighters---------------
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Scout",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"$11000",
		Description =			"$11001",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Interceptor",
		RequiredResearch =		"FighterChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		11,
		DisplayedName =			"$11002",
		Description =			"$11003",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Defender",
		RequiredResearch =		"DefenderSubSystems",
		RequiredShipSubSystems =	"",
		DisplayPriority =		12,
		DisplayedName =			"$11006",
		Description =			"$11007",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_AttackBomber",
		RequiredResearch =		"FighterChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		13,
		DisplayedName =			"$11004",
		Description =			"$11005",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"Kus_CloakedFighter",
		RequiredResearch =		"CloakedFighter",
		RequiredShipSubSystems =	"",
		DisplayPriority =		14,
		DisplayedName =			"$11008",
		Description =			"$11009",
	},
--Corvettes--------------
	{
		Type =					Ship,
		ThingToBuild =			"Kus_RepairCorvette",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		20,
		DisplayedName =			"$11022",
		Description =			"$11023",
	},
    --
    -- ***WARNING***
    -- This next stanza is referenced by index in DataHW1Campaign/LevelData/Campaign/HomeworldClassic/Kushan/Build.lua.
    -- If you modify it, please keep taht other one up to date!
    --
	{
		Type =					Ship,
		ThingToBuild =			"Kus_SalvageCorvette",
		RequiredResearch =		"CorvetteChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		21,
		DisplayedName =			"$11020",
		Description =			"$11021",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_LightCorvette",
		RequiredResearch =		"CorvetteDrive",
		RequiredShipSubSystems =	"",
		DisplayPriority =		22,
		DisplayedName =			"$11012",
		Description =			"$11013",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_HeavyCorvette",
		RequiredResearch =		"HeavyCorvetteUpgrade",
		RequiredShipSubSystems =	"",
		DisplayPriority =		23,
		DisplayedName =			"$11014",
		Description =			"$11015",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"Kus_MultiGunCorvette",
		RequiredResearch =		"FastTrackingTurrets",
		RequiredShipSubSystems =	"",
		DisplayPriority =		24,
		DisplayedName =			"$11016",
		Description =			"$11017",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_MinelayerCorvette",
		RequiredResearch =		"MinelayingTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		25,
		DisplayedName =			"$11018",
		Description =			"$11019",
	},
--Frigates---------------
	{
		Type =					Ship,
		ThingToBuild =			"Kus_AssaultFrigate",
		RequiredResearch =		"CapitalShipChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		51,
		DisplayedName =			"$11024",
		Description =			"$11025",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_IonCannonFrigate",
		RequiredResearch =		"IonCannons",
		RequiredShipSubSystems =	"",
		DisplayPriority =		52,
		DisplayedName =			"$11026",
		Description =			"$11027",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_SupportFrigate",
		RequiredResearch =		"CapitalShipDrive",
		RequiredShipSubSystems =	"",
		DisplayPriority =		50,
		DisplayedName =			"$11028",
		Description =			"$11029",
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_DroneFrigate",
		RequiredResearch =		"DroneTechnology",
		RequiredShipSubSystems =	"",
		DisplayPriority =		53,
		DisplayedName =			"$11030",
		Description =			"$11031",
	},
--Capital Ships----------
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Destroyer",
		RequiredResearch =		"SuperHeavyChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		72,
		DisplayedName =			"$11034",
		Description =			"$11035"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_MissileDestroyer",
		RequiredResearch =		"GuidedMissiles",
		RequiredShipSubSystems =	"",
		DisplayPriority =		71,
		DisplayedName =			"$11036",
		Description =			"$11037"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Carrier",
		RequiredResearch =		"SuperCapitalShipDrive",
		RequiredShipSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"$11040",
		Description =			"$11041"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_HeavyCruiser",
		RequiredResearch =		"HeavyGuns",
		RequiredShipSubSystems =	"",
		DisplayPriority =		73,
		DisplayedName =			"$11038",
		Description =			"$11039"
	},	
--Utility----------------
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResourceCollector",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,
		DisplayedName =			"$11044",
		Description =			"$11045"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResourceController",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		101,
		DisplayedName =			"$11046",
		Description =			"$11047"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResearchShip",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		110,
		DisplayedName =			"$11042",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResearchShip_1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		111,
		DisplayedName =			"$11058",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResearchShip_2",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		112,
		DisplayedName =			"$11059",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResearchShip_3",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		113,
		DisplayedName =			"$11060",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResearchShip_4",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		114,
		DisplayedName =			"$11061",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ResearchShip_5",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		115,
		DisplayedName =			"$11062",
		Description =			"$11043"
	},		
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Probe",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		140,
		DisplayedName =			"$11052",
		Description =			"$11053"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_ProximitySensor",
		RequiredResearch =		"ProximitySensor",
		RequiredShipSubSystems =	"",
		DisplayPriority =		141,
		DisplayedName =			"$11054",
		Description =			"$11055"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_SensorArray",
		RequiredResearch =		"SensorArray",
		RequiredShipSubSystems =	"",
		DisplayPriority =		142,
		DisplayedName =			"$11056",
		Description =			"$11057"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_GravWellGenerator",
		RequiredResearch =		"GravityGenerator",
		RequiredShipSubSystems =	"",
		DisplayPriority =		143,
		DisplayedName =			"$11048",
		Description =			"$11049"
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_CloakGenerator",
		RequiredResearch =		"CloakGenerator",
		RequiredShipSubSystems =	"",
		DisplayPriority =		144,
		DisplayedName =			"$11050",
		Description =			"$11051"
	},
--Drones
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone0",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone2",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone3",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone4",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone5",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone6",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone7",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone8",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone9",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone10",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone11",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone12",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},
	{
		Type =					Ship,
		ThingToBuild =			"Kus_Drone13",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,		
	},	
}

