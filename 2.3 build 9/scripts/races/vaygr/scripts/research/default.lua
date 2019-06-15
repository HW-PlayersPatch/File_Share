base_research = nil 
base_research = {


	--======================================================================
	-- Tech
	--======================================================================
	
	
	-- ** NOTE: TargetName is req'd even for upgrades for all ships because it
	--          needs to be placed in the UI under a certain ship type.
	
	

	-- This tech is used to make the CapShip / Adv. Cap Ship facilities into the equivalent of TIERs
	-- When a Cap Ship Facility is built, this tech is unlocked, and is then researched instantly
	-- The build items which depend on having built a Cap Ship facility are thus made dependent on this technology instead
	
	-- Same as above - special tech used to get Vaygr tech tree working right
	{ 
		Name =			"CorvetteTech",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research",                             
		Cost = 			500,
		Time = 			40,
		DisplayedName =		"$7176",
		DisplayPriority =	20,                                                    
		Description =		"$7177",
		TargetType =			Family,
		TargetName =			"Corvette",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7180",
	},

	-- Same as above - special tech used to get Vaygr tech tree working right
	{ 
		Name =			"FrigateTech",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research",                             
		Cost = 			1800,
		Time = 			120,
		DisplayedName =		"$7178",
		DisplayPriority =	20,                                                    
		Description =		"$7179",
		TargetType =			Family,
		TargetName = "Frigate",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7181",
	},

--
-- Probe Research Items
-- 


	{ 
		Name =			"ProbeSensorDisruption",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research",                      
		Cost = 			800,
		Time = 			60,
		DisplayedName =		"$7700",
		DisplayPriority =	210,                                                    
		Description =		"$7701",
		TargetName = "Vgr_Probe_ECM",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7182",
	},

	{ 
		Name =			"ProbeProxSensor",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research",                      
		Cost = 			500,
		Time = 			40,
		DisplayedName =		"$7183",
		DisplayPriority =	220,                                                    
		Description =		"$7184",
		TargetName = "Vgr_Probe_Prox",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7185",
	},

--
-- Fighter Research Items
--
	
	{ 
		Name =			"LanceBeams",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research & FighterProduction",                      
		Cost = 			250,
		Time = 			25,
		DisplayedName =		"$7704",
		DisplayPriority =	220,                                                    
		Description =		"$7705",
		TargetName = "Vgr_LanceFighter",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7301",
	},

	{ 
		Name =			"PlasmaBombs",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research & FighterProduction",                      
		Cost = 			250,
		Time = 			25,
		DisplayedName =		"$7702",
		DisplayPriority =	221,                                                    
		Description =		"$7703",
		TargetName = "Vgr_Bomber",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7300",
	},
--
-- Corvette Research Items
--

	{ 
		Name =			"CorvetteGraviticAttraction",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research & CorvetteProduction",                      
		Cost = 			1500,
		Time = 			100,
		DisplayedName =		"$7706",
		DisplayPriority =	230,                                                    
		Description =		"$7707",
		TargetName = "Vgr_MinelayerCorvette",
				Icon = Icon_Tech,
		ShortDisplayedName = "$7302",
	},

	{ 
		Name =			"CorvetteLaser",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research & CorvetteProduction",                      
		Cost = 			500,
		Time = 			60,
		DisplayedName =		"$7708",
		DisplayPriority =	231,                                                    
		Description =		"$7709",
		TargetName = "Vgr_LaserCorvette",
				Icon = Icon_Tech,
		ShortDisplayedName = "$7303",
	},

	{ 
		Name =			"CorvetteCommand",
		RequiredResearch =	"",                                                    
		RequiredSubSystems =	"Research & CorvetteProduction",                      
		Cost = 			500,
		Time = 			60,
		DisplayedName =		"$7710",
		DisplayPriority =	232,                                                    
		Description =		"$7711",
		TargetName = "Vgr_CommandCorvette",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7304",
	},



--
-- Platform Research Items
--
	{ 
		Name =			"PlatformHeavyMissiles",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research & PlatformProduction",                             
		Cost = 			1200,
		Time = 			105,
		DisplayedName =		"$7712",
		DisplayPriority =	240,                                                    
		Description =		"$7713",
		TargetName = "Vgr_WeaponPlatform_missile",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7305",
	},

	
--
-- Frigate Research Items
--
	
	{ 
		Name =			"FrigateAssault",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research & FrigateProduction",                             
		Cost = 			650,
		Time = 			45,
		DisplayedName =		"$7714",
		DisplayPriority =	250,                                                    
		Description =		"$7715",
		TargetName = "Vgr_AssaultFrigate",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7306",
	},
	
	{ 
		Name =			"FrigateInfiltrationTech",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research & FrigateProduction",                             
		Cost = 			1000,
		Time = 			60,
		DisplayedName =		"$7716",
		DisplayPriority =	252,                                                    
		Description =		"$7717",
		TargetName = "Vgr_InfiltratorFrigate",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7307",
	},
	
--
-- Capital Ship Items
--

	{ 
		Name =			"BattlecruiserIonWeapons",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research & CapShipProduction",               
		Cost = 			2500,
		Time = 			200,
		DisplayedName =		"$7718",
		DisplayPriority =	1,                                                    
		Description =		"$7719",
		TargetName = "Vgr_BattleCruiser",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7308",
	},
	
	{ 
		Name =			"DestroyerGuns",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research & CapShipProduction",               
		Cost = 			2000,
		Time = 			140,
		DisplayedName =		"$7720",
		DisplayPriority =	261,                                                    
		Description =		"$7721",
		TargetName = "Vgr_Destroyer",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7309",
	},
	
	{ 
		Name =			"HyperspaceGateTech",
		RequiredResearch =	"",                                               
		RequiredSubSystems =	"Research",                             
		Cost = 			750,
		Time = 			50,
		DisplayedName =		"$7722",
		DisplayPriority =	262,                                                    
		Description =		"$7723",
		TargetName = "Vgr_HyperSpace_Platform",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7310",
	},
	
	{
		Name = "HyperspaceDamageReductionUpgrade", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 0, 
		Time = 0, 
		DisplayedName = "Hyperspace Damage Reduction", 
		DisplayPriority = 950, 
		Description = "Enhances the fleet's hyperspace drive systems, reducing the hyperspace damage caused by gravity wells. Ships Only Take 10% damage when forced out of hyperspace.", 
		UpgradeType = Modifier, 
		TargetType = AllShips, 
		UpgradeName = "HyperSpaceAbortDamage", 
		UpgradeValue = 0.4, 
		TargetName = "Vgr_fleet", 
		Icon = Icon_Hyperspace, 
		ShortDisplayedName = "10% Hyperspace Exit Damage", 
		DoNotGrant = 1,
	},
	
}
-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
