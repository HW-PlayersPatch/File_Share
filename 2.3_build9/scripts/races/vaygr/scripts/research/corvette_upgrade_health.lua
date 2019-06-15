base_research = nil 
base_research = {

	{ 
		Name =				"CorvetteHealthUpgrade1",
		RequiredResearch =		"",                                         
		RequiredSubSystems =		"CorvetteProduction & Research", 
		RequireTag = 			"VaygrCorvette",                        
		Cost = 					1800,
		Time = 					75,
		DisplayedName =			"$7759",
		DisplayPriority =			200,                                                    
		Description =			"$7760",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Corvette",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.5,
		Icon =				Icon_Health,
		ShortDisplayedName = 		"$7341",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
