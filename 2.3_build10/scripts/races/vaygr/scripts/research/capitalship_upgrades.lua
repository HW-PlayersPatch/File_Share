base_research = nil 
base_research = {

	{ 
		Name =				"SuperCapHealthUpgrade1",
		RequiredResearch =		"",                                                    
		RequiredSubSystems =		"CapShipProduction & Research",  
		RequireTag = 			"VaygrCapital",                            
		Cost = 					3500,
		Time = 					95,
		DisplayedName =			"$7743",
		DisplayPriority =			61,                                                    
		Description =			"$7744",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Capital",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7354",
	},


	{ 
		Name =				"SuperCapSpeedUpgrade1",
		RequiredResearch =		"",                                                    
		RequiredSubSystems =		"CapShipProduction & Research", 
		RequireTag = 			"VaygrCapital",                                 
		Cost = 					2000,
		Time = 					80,
		DisplayedName =			"$7747",
		DisplayPriority =			64,                                                   
		Description =			"$7748",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Capital",
        	UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7354",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
