
--Type => SubSystem
--ThingToBuild => name of subsystem to build
--RequiredResearch => global research dependencies
--RequiredShipSubSystems => subsystems dependencies for local to the ship
--RequiredFleetSubSystems => Fleet wide subsystem dependencies
--DisplayPriority => Order in UI lists
--DisplayedName => Localized name for UI
--Description => Description for UI


Ship = 0
SubSystem = 1

build = 
{

	-------------------------------------------------------------------------------
	-- PRODUCTION MODULE SUBSYSTEMS

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Production_Fighter",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7000",
		Description =			"$7001"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Production_Fighter",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7000",
		Description =			"$7001"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Production_Corvette",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		0,
		DisplayedName =			"$7002",
		Description =			"$7003"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Production_Corvette",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		0,
		DisplayedName =			"$7002",
		Description =			"$7003"
	},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Production_Frigate",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		0,
		DisplayedName =			"$7004",
		Description =			"$7005"
	},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Production_Frigate",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		0,
		DisplayedName =			"$7004",
		Description =			"$7005"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Production_CapShip",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7006",
		Description =			"$7007"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_SY_Production_CapShip",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7006",
		Description =			"$7007"
	},



	
	-------------------------------------------------------------------------------
	-- ABILITY MODULES

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Module_PlatformControl",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"$7008",
		Description =			"$7009"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Module_PlatformControl",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		20,
		DisplayedName =			"$7008",
		Description =			"$7009"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Module_Research",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7010",
		Description =			"$7011"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Module_Research",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7010",
		Description =			"$7011"
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Module_ResearchAdvanced",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		10,
		DisplayedName =			"$7012",
		Description =			"$7013"
	},	
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Module_ResearchAdvanced",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		10,
		DisplayedName =			"$7012",
		Description =			"$7013"
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Module_Hyperspace",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		30,
		DisplayedName =			"$7014",
		Description =			"$7015"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Module_Hyperspace",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		30,
		DisplayedName =			"$7014",
		Description =			"$7015"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_C_Module_HyperspaceInhibitor",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		40,
		DisplayedName =			"$7016",
		Description =			"$7017"
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Hgn_MS_Module_HyperspaceInhibitor",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		40,
		DisplayedName =			"$7016",
		Description =			"$7017"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_C_Module_CloakGenerator",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		50,
		DisplayedName =			"$7018",
		Description =			"$7019"
	},


	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_MS_Module_CloakGenerator",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		50,
		DisplayedName =			"$7018",
		Description =			"$7019"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_C_Module_FireControl",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"AdvancedResearch",
		DisplayPriority =		60,
		DisplayedName =			"$7020",
		Description =			"$7021"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_MS_Module_FireControl",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"AdvancedResearch",
		DisplayPriority =		60,
		DisplayedName =			"$7020",
		Description =			"$7021"
	},

--	{ 
--		Type =					SubSystem, 
--		ThingToBuild =			"Hgn_C_Module_BuildSpeed",
--		RequiredResearch =		"",
--		RequiredFleetSubSystems =	"AdvancedResearch",
--		DisplayPriority =		153,
--		DisplayedName =			"$7098",
--		Description =			"$7099"
--	},

--	{ 
--		Type =					SubSystem, 
--		ThingToBuild =			"Hgn_MS_Module_BuildSpeed",
--		RequiredResearch =		"",
--		RequiredFleetSubSystems =	"AdvancedResearch",
--		DisplayPriority =		154,
--		DisplayedName =			"$7098",
--		Description =			"$7099"
--	},

	-------------------------------------------------------------------------------
	-- SENSOR MODULES

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_C_Sensors_DetectHyperspace",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		150,
		DisplayedName =			"$7036",
		Description =			"$7037"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_MS_Sensors_DetectHyperspace",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		150,
		DisplayedName =			"$7036",
		Description =			"$7037"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_C_Sensors_AdvancedArray",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		151,
		DisplayedName =			"$7022",
		Description =			"$7023"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_MS_Sensors_AdvancedArray",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		151,
		DisplayedName =			"$7022",
		Description =			"$7023"
	},

	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_C_Sensors_DetectCloaked",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		152,
		DisplayedName =			"$7024",
		Description =			"$7025"
	},


	{ 
		Type =					SubSystem, 
		ThingToBuild =			"Hgn_MS_Sensors_DetectCloaked",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		152,
		DisplayedName =			"$7024",
		Description =			"$7025"
	},


	-------------------------------------------------------------------------------
	-- SINGLE PLAYER ONLY SHIPS
	-- KEEPER MOVER

	{ 
		Type =					Ship, 
		ThingToBuild =			"Kpr_Mover",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		53,
		DisplayedName =			"$7913",
		Description =			"$7914"
	},
	-------------------------------------------------------------------------------
	-- SINGLE PLAYER ONLY SHIPS
	-- KEEPER MOVER SUBSYSTEM
	
  	{ 
  		Type =					SubSystem, 
  		ThingToBuild =			"Hgn_MS_Production_CorvetteMover",
  		RequiredResearch =		"",
  		RequiredShipSubSystems =	"CorvetteProduction",
  		DisplayPriority =		10,
  		DisplayedName =			"$7910",
  		Description =			"$7911"
  	},

	-------------------------------------------------------------------------------
	-- SHIPS


	-- Fighters ---------------

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Scout",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"$7030",
		Description =			"$7031"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Interceptor",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		20,
		DisplayedName =			"$7032",
		Description =			"$7033"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_AttackBomber",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		30,
		DisplayedName =			"$7034",
		Description =			"$7035"
	},

	-- Corvettes --------------

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_AssaultCorvette",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		50,
		DisplayedName =			"$7038",
		Description =			"$7039"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_PulsarCorvette",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		51,
		DisplayedName =			"$7040",
		Description =			"$7041"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_MinelayerCorvette",
		RequiredResearch =		"GraviticAttractionMines",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		52,
		DisplayedName =			"$7042",
		Description =			"$7043"
	},

	-- Frigates ---------------

--	{ 
--		Type =					Ship, 
--		ThingToBuild =			"Hgn_SupportFrigate",
--		RequiredResearch =		"",
--		RequiredShipSubSystems =	"FrigateProduction",
--		DisplayPriority =		60,
--		DisplayedName =			"Support Frigate",
--		Description =			" (Repair) (400 RUs)"
--	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_AssaultFrigate",
		RequiredResearch =		"InstaAdvancedFrigateTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		60,
		DisplayedName =			"$7048",
		Description =			"$7049"
	},
	
	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_TorpedoFrigate",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		65,
		DisplayedName =			"$7046",
		Description =			"$7047"
	},
	
	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_IonCannonFrigate",
		RequiredResearch =		"InstaAdvancedFrigateTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		70,
		DisplayedName =			"$1520",
		Description =			"$7051"
	},
	
	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_MarineFrigate",
		RequiredResearch =		"InstaAdvancedFrigateTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		75,
		DisplayedName =			"$7052",
		Description =			"$7053"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_DefenseFieldFrigate",
		RequiredResearch =		"DefenseFieldFrigateShield",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		80,
		DisplayedName =			"$7044",
		Description =			"$7045"
	},

	-- Capital Ships ----------

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Carrier",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		110,
		DisplayedName =			"$7054",
		Description =			"$7055"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Destroyer",
		RequiredResearch =		"DestroyerTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		116,
		DisplayedName =			"$7056",
		Description =			"$7057"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Shipyard",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"Hyperspace",
		DisplayPriority =		117,
		DisplayedName =			"$7058",
		Description =			"$7059"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Battlecruiser",
		RequiredResearch =		"BattlecruiserIonWeapons",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		118,
		DisplayedName =			"$7060",
		Description =			"$7061"
	},


	-- Platforms --------------

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_GunTurret",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		141,
		DisplayedName =			"$7062",
		Description =			"$7063"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_IonTurret",
		RequiredResearch =		"PlatformIonWeapons",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		142,
		DisplayedName =			"$1514",
		Description =			"$7065"
	},


	-- Utility ----------------

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_ResourceCollector",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		120,
		DisplayedName =			"$7066",
		Description =			"$7067"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_ResourceController",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		130,
		DisplayedName =			"$7068",
		Description =			"$7069"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Probe",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		140,
		DisplayedName =			"$7070",
		Description =			"$7071"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_ProximitySensor",
		RequiredResearch =		"SensDisProbe",
		RequiredShipSubSystems =	"",
		DisplayPriority =		150,
		DisplayedName =			"$7072",
		Description =			"$7073"
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_ECMProbe",
		RequiredResearch =		"ECMProbe",
		RequiredShipSubSystems =	"",
		DisplayPriority =		160,
		DisplayedName =			"$7074",
		Description =			"$7075"
	},


-----------------------------------------------------------------------
-- TEMP - All other ships here, for single player game ----------------
	{ 
		Type =					Ship, 
		ThingToBuild =			"Hgn_Shipyard_SPG",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		117,
		DisplayedName =			"$7058",
		Description =			"$7059"
	},
}

