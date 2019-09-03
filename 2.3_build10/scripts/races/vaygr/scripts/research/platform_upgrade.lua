base_research = nil 
base_research = {

	{ 
		Name =					"PlatformHealthUpgrade1",
		RequiredResearch =		"",                                                    
		RequiredSubSystems =	"PlatformProduction & Research",  
		RequireTag = 		"VaygrPlatform",                    
		Cost = 					1400,
		Time = 					135,
		DisplayedName =			"$7775",
		DisplayPriority =		600,                                                    
		Description =			"$7776",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Platform",
		UpgradeName =			"MAXHEALTH",
		UpgradeValue =			1.75,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7361",
	},
}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
