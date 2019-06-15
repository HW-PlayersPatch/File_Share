base_research = nil 
base_research = {

	{ 
		Name =				"FrigateHealthUpgrade1",
		RequiredResearch =		"",                                         
		RequiredSubSystems =		"FrigateProduction & Research", 
		RequireTag = 			"VaygrFrigate",                     
		Cost = 					2000,
		Time = 					100,
		DisplayedName =			"$7767",
		DisplayPriority =			306,                                                    
		Description =			"$7768",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Frigate",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7371",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
