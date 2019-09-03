base_research = nil 
base_research = {

	{
		Name =				"ResourceCollectorHealthUpgrade1",
		RequiredResearch =		"",                                                    -- <list of prerequisite research items>
		RequiredSubSystems =		"Research | AdvancedResearch",                                                    -- <list of prerequisite sub systems>
		Cost = 					1000,
		Time = 					90,
		DisplayedName =			"$7611",
		DisplayPriority =			701,                                                   -- <display priority (used to sort on screen)>,
		Description =			"$7612",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_ResourceCollector",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.6,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7264",
	},

	{
		Name =				"ResourceControllerHealthUpgrade1",
		RequiredResearch =		"",                                                    -- <list of prerequisite research items>
		RequiredSubSystems =		"Research | AdvancedResearch",                                                    -- <list of prerequisite sub systems>
		Cost = 					400,
		Time = 					60,
		DisplayedName =			"$7615",
		DisplayPriority =			704,                                                   -- <display priority (used to sort on screen)>,
		Description =			"$7616",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_ResourceController",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.6,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7267",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
