base_research = nil 
base_research = {

	{ 
		Name =				"CorvetteSpeedUpgrade1",
		RequiredResearch =		"",                                         
		RequiredSubSystems =		"CorvetteProduction & Research",   
		RequireTag = 			"VaygrCorvette",                    
		Cost = 					1000,
		Time = 					60,
		DisplayedName =			"$7763",
		DisplayPriority =			201,                                                    
		Description =			"$7764",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Corvette",
        	UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.3,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7341",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
