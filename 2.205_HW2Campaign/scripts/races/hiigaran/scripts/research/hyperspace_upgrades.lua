base_research = nil 
base_research = {

	{
		Name =				"HyperspaceCostUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research | AdvancedResearch & Hyperspace",
		Cost = 					500,
		Time = 					45,
		DisplayedName =			"$7627",
		DisplayPriority =			1000,
		Description =			"$7628",
		UpgradeType =			Modifier,
		TargetType =			AllShips,
        	UpgradeName =			"HyperspaceCost",
        	UpgradeValue =			0.75,
		TargetName = 			"Hgn_Mothership", 
		Icon = 				Icon_Tech,
		ShortDisplayedName = 		"$7280",
	},

	{
		Name =				"HyperspaceCostUpgrade2",
		RequiredResearch =		"HyperspaceCostUpgrade1",
		RequiredSubSystems =		"AdvancedResearch | AdvancedResearch & Hyperspace",
		Cost = 					1000,
		Time = 					60,
		DisplayedName =			"$7629",
		DisplayPriority =			1000,
		Description =			"$7630",
		UpgradeType =			Modifier,
		TargetType =			AllShips,
        	UpgradeName =			"HyperspaceCost",
        	UpgradeValue =			0.6,
		TargetName = 			"Hgn_Mothership", 
		Icon = 				Icon_Tech,
		ShortDisplayedName = 		"$7281",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 