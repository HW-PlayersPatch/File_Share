base_research = nil 
base_research = {

	{ 
		Name =				"FrigateSpeedUpgrade1",
		RequiredResearch =		"",                                         
		RequiredSubSystems =		"FrigateProduction & Research",  
		RequireTag = 			"VaygrFrigate",                     
		Cost = 					1200,
		Time = 					70,
		DisplayedName =			"$7771",
		DisplayPriority =			307,                                                    
		Description =			"$7772",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Frigate",
        	UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7371",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
