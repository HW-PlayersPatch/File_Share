Ship = 0
SubSystem = 1
build =
{
--Production Subsystems---------------
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"hw1_production_fighter",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7000",
		Description =			"$7001"
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"hw1_production_corvette",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7002",
		Description =			"$7003"
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"hw1_production_frigate",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7004",
		Description =			"$7005"
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"hw1_production_capital",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7006",
		Description =			"$7007"
	},

--Fighters---------------
	{
		Type =					Ship,
		ThingToBuild =			"tai_scout",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"$11000",
		Description =			"$11001",
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_interceptor",
		RequiredResearch =		"FighterChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		11,
		DisplayedName =			"$11002",
		Description =			"$11003",
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_defender",
		RequiredResearch =		"DefenderSubSystems",
		RequiredShipSubSystems =	"",
		DisplayPriority =		12,
		DisplayedName =			"$11006",
		Description =			"$11007",
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_attackbomber",
		RequiredResearch =		"FighterChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		13,
		DisplayedName =			"$11004",
		Description =			"$11005",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_defensefighter",
		RequiredResearch =		"DefenseFighter",
		RequiredShipSubSystems =	"",
		DisplayPriority =		14,
		DisplayedName =			"$11010",
		Description =			"$11011",
	},
--Corvettes--------------
	{
		Type =					Ship,
		ThingToBuild =			"tai_repaircorvette",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		20,
		DisplayedName =			"$11022",
		Description =			"$11023",
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_salvagecorvette",
		RequiredResearch =		"CorvetteChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		21,
		DisplayedName =			"$11020",
		Description =			"$11021",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_lightcorvette",
		RequiredResearch =		"CorvetteDrive",
		RequiredShipSubSystems =	"",
		DisplayPriority =		22,
		DisplayedName =			"$11012",
		Description =			"$11013",
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_heavycorvette",
		RequiredResearch =		"HeavyCorvetteUpgrade",
		RequiredShipSubSystems =	"",
		DisplayPriority =		23,
		DisplayedName =			"$11014",
		Description =			"$11015",
	},		
	{
		Type =					Ship,
		ThingToBuild =			"tai_multiguncorvette",
		RequiredResearch =		"FastTrackingTurrets",
		RequiredShipSubSystems =	"",
		DisplayPriority =		24,
		DisplayedName =			"$11016",
		Description =			"$11017",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_minelayercorvette",
		RequiredResearch =		"MinelayingTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		25,
		DisplayedName =			"$11018",
		Description =			"$11019",
	},
--Frigates---------------
	{
		Type =					Ship,
		ThingToBuild =			"tai_assaultfrigate",
		RequiredResearch =		"CapitalShipChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		51,
		DisplayedName =			"$11024",
		Description =			"$11025",
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_ioncannonfrigate",
		RequiredResearch =		"IonCannons",
		RequiredShipSubSystems =	"",
		DisplayPriority =		52,
		DisplayedName =			"$11026",
		Description =			"$11027",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_supportfrigate",
		RequiredResearch =		"CapitalShipDrive",
		RequiredShipSubSystems =	"",
		DisplayPriority =		50,
		DisplayedName =			"$11028",
		Description =			"$11029",
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_fieldfrigate",
		RequiredResearch =		"DefenseField",
		RequiredShipSubSystems =	"",
		DisplayPriority =		53,
		DisplayedName =			"$11032",
		Description =			"$11033",
	},
--Capital Ships----------
	{
		Type =					Ship,
		ThingToBuild =			"tai_destroyer",
		RequiredResearch =		"SuperHeavyChassis",
		RequiredShipSubSystems =	"",
		DisplayPriority =		72,
		DisplayedName =			"$11034",
		Description =			"$11035"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_missiledestroyer",
		RequiredResearch =		"GuidedMissiles",
		RequiredShipSubSystems =	"",
		DisplayPriority =		71,
		DisplayedName =			"$11036",
		Description =			"$11037"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_carrier",
		RequiredResearch =		"SuperCapitalShipDrive",
		RequiredShipSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"$11040",
		Description =			"$11041"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_heavycruiser",
		RequiredResearch =		"HeavyGuns",
		RequiredShipSubSystems =	"",
		DisplayPriority =		73,
		DisplayedName =			"$11038",
		Description =			"$11039"
	},	
--Utility----------------
	{
		Type =					Ship,
		ThingToBuild =			"tai_resourcecollector",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		100,
		DisplayedName =			"$11044",
		Description =			"$11045"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_resourcecontroller",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		101,
		DisplayedName =			"$11046",
		Description =			"$11047"
	},		
	{
		Type =					Ship,
		ThingToBuild =			"tai_researchship",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		110,
		DisplayedName =			"$11042",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_researchship_1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		111,
		DisplayedName =			"$11058",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_researchship_2",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		112,
		DisplayedName =			"$11059",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_researchship_3",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		113,
		DisplayedName =			"$11060",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_researchship_4",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		114,
		DisplayedName =			"$11061",
		Description =			"$11043"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_researchship_5",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		115,
		DisplayedName =			"$11062",
		Description =			"$11043"
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_probe",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		140,
		DisplayedName =			"$7070",
		Description =			"$7071"
	},		
	{
		Type =					Ship,
		ThingToBuild =			"tai_proximitysensor",
		RequiredResearch =		"ProximitySensor",
		RequiredShipSubSystems =	"",
		DisplayPriority =		141,
		DisplayedName =			"$11054",
		Description =			"$11055"
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_sensorarray",
		RequiredResearch =		"SensorArray",
		RequiredShipSubSystems =	"",
		DisplayPriority =		142,
		DisplayedName =			"$11056",
		Description =			"$11057"
	},
	{
		Type =					Ship,
		ThingToBuild =			"tai_gravwellgenerator",
		RequiredResearch =		"GravityGenerator",
		RequiredShipSubSystems =	"",
		DisplayPriority =		143,
		DisplayedName =			"$11048",
		Description =			"$11049"
	},	
	{
		Type =					Ship,
		ThingToBuild =			"tai_cloakgenerator",
		RequiredResearch =		"CloakGenerator",
		RequiredShipSubSystems =	"",
		DisplayPriority =		144,
		DisplayedName =			"$11050",
		Description =			"$11051"
	},	
}

doscanpath("data:Scripts/Productiontimes", "applybuildtimes.lua")

