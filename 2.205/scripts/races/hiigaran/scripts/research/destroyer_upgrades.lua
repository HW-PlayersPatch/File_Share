base_research = nil 
base_research = {

	{
		Name =				"DestroyerHealthUpgrade1",
		RequiredResearch =		"DestroyerTech",                             -- <list of prerequisite research items>
		RequiredSubSystems =		"Research | AdvancedResearch & CapShipProduction",                         -- <list of prerequisite sub systems>
		Cost = 					1500,
		Time = 					90,
		DisplayedName =			"$7639",
		DisplayPriority =			405,                                                    -- <display priority (used to sort on screen)>,
		Description =			"$7640",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_Destroyer",
		UpgradeName =			"MAXHEALTH",
		UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7274",	
	},

	{
		Name =					"DestroyerMAXSPEEDUpgrade1",
		RequiredResearch =		"DestroyerTech",                             -- <list of prerequisite research items>
		RequiredSubSystems =	"Research | AdvancedResearch & CapShipProduction",                         -- <list of prerequisite sub systems>
		Cost = 					600,
		Time = 					40,
		DisplayedName =			"$7643",
		DisplayPriority =		406,                                                   -- <display priority (used to sort on screen)>,
		Description =			"$7644",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_Destroyer",
		UpgradeName =			"MAXSPEED",
		UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7274",

	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 