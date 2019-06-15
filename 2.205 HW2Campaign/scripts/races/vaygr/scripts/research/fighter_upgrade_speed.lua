base_research = nil 
base_research = {

	{ 
		Name =				"FighterspeedUpgrade1",
		RequiredResearch =		"",                                                    
		RequiredSubSystems =		"FighterProduction & Research",   
		RequireTag = 			"VaygrFighter",                      
		Cost = 					1200,
		Time = 					45,
		DisplayedName =			"$7755",
		DisplayPriority =			81,                                                    
		Description =			"$7756",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Fighter",
        	UpgradeName =			"MAXSPEED",
      		UpgradeValue =			1.4,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7331",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
