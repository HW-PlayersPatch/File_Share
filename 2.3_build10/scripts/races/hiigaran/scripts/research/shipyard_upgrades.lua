base_research = nil 
base_research = {

	{
		Name =				"ShipyardHealthUpgrade1",
		RequiredResearch =		"",                                                    -- <list of prerequisite research items>
		RequiredSubSystems =		"Research | AdvancedResearch & Hyperspace",                               -- <list of prerequisite sub systems>
		Cost = 					800,
		Time = 					30,
		DisplayedName =			"$7619",
		DisplayPriority =			1200,                                                    -- <display priority (used to sort on screen)>,
		Description =			"$7620",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_Shipyard",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7271",
	},

	{
		Name =				"ShipyardMAXSPEEDUpgrade1",
		RequiredResearch =		"",                                                    -- <list of prerequisite research items>
		RequiredSubSystems =		"Research | AdvancedResearch & Hyperspace",                               -- <list of prerequisite sub systems>
		Cost = 					400,
		Time = 					30,
		DisplayedName =			"$7623",
		DisplayPriority =			1203,                                                   -- <display priority (used to sort on screen)>,
		Description =			"$7624",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_Shipyard",
        	UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7271",
	},

	{
		Name =				"ShipyardBUILDSPEEDUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =		"AdvancedResearch & Hyperspace",
		Cost = 				1000,
		Time = 				40,
		DisplayedName =			"$7810",
		DisplayPriority =			1204,
		Description =			"$7811",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_Shipyard",
	        UpgradeName =			"BUILDSPEED",
        	UpgradeValue =			1.3,
		Icon = 				Icon_Build,
		ShortDisplayedName = 		"$7240",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
