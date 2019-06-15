base_research = nil 
base_research = {

--AI behaviour 	
	{ 
		Name = "cpuplayers_defensive", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
		AIOnly = 1,	
	},	
	{ 
		Name = "cpuplayers_aggressive", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
		AIOnly = 1,	
	},	
	{ 
		Name = "cpuplayers_dynamic", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
		AIOnly = 1,	
	},
--AI no-rush	
	{ 
		Name = "cpuplayers_norushtime5", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
		AIOnly = 1,	
	},		
	{ 
		Name = "cpuplayers_norushtime10", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
		AIOnly = 1,	
	},		
	{ 
		Name = "cpuplayers_norushtime15", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
		AIOnly = 1,	
	},



--AI build speed	
	{ 
		Name =			"AllShipBuildSpeed",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Capital",
		UpgradeName =		"BUILDSPEED",
		UpgradeValue =		1.025,
		AIOnly = 1,	
	},	
	{ 
		Name =			"AllShipBuildSpeedHard",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Capital",
		UpgradeName =		"BUILDSPEED",
		UpgradeValue =		1.05,
		AIOnly = 1,	

	},	
	{ 
		Name =			"AllShipBuildSpeedExpert",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Capital",
		UpgradeName =		"BUILDSPEED",
		UpgradeValue =		1.075,
		AIOnly = 1,	

	},
--AI resource rate
	{ 
		Name =			"ResourceCollectionRateHard",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName = "kus_resourcecollector",
		UpgradeName =		"ResourceCollectionRate",
		UpgradeValue =		1.04,
		AIOnly = 1,	

	},	
	{ 
		Name =			"ResourceCollectionRateExpert",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName = "kus_resourcecollector",
		UpgradeName =		"ResourceCollectionRate",
		UpgradeValue =		1.09,
		AIOnly = 1,	

	},
	--Special		
	{ 
		Name =			"MissileDestroyerVolley",
		RequiredResearch =	"",
		RequiredSubSystems =	"",
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,
		Description =		"",
		UpgradeType =		Ability,
		TargetType =		Ship,
		TargetName =		"Kus_MissileDestroyer",
		UpgradeName =		"UseSpecialWeaponsInNormalAttack",
		AIOnly = 1,	
		
	},
	{ 
		Name =			"HeavyCorvetteAttackBurst",
		RequiredResearch =	"",
		RequiredSubSystems =	"",
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,
		Description =		"",
		UpgradeType =		Ability,
		TargetType =		Ship,
		TargetName =		"Kus_HeavyCorvette",
		UpgradeName =		"UseSpecialWeaponsInNormalAttack",	
		AIOnly = 1,	
	
	},	

}

research = {}
res_index = 0
-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

	base_research = nil 