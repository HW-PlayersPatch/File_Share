base_research = nil 
base_research = {

	{
		Name =				"MothershipBUILDSPEEDUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research",
		RequireTag = 			"VaygrBuilder",    
		Cost = 				1000,
		Time = 				60,
		DisplayedName =			"$7815",
		DisplayPriority =		90,
		Description =			"$7816",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Vgr_MotherShip",
	        UpgradeName =			"BUILDSPEED",
        	UpgradeValue =			1.3,
		Icon = Icon_Build,
		ShortDisplayedName = "$7240",
	},

	{
		Name =				"CarrierBUILDSPEEDUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research & CapShipProduction",
		RequireTag = 			"VaygrBuilder",  
		Cost = 				2500,
		Time = 				100,
		DisplayedName =			"$7820",
		DisplayPriority =			65,
		Description =			"$7821",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Vgr_Carrier",
	        UpgradeName =			"BUILDSPEED",
        	UpgradeValue =			1.3,
		Icon = Icon_Build,
		ShortDisplayedName = "$7240",
	},

	{
		Name =				"ShipyardBUILDSPEEDUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research & CapShipProduction & Hyperspace",
		RequireTag = 			"VaygrBuilder",  
		Cost = 				1000,
		Time = 				95,
		DisplayedName =			"$7825",
		DisplayPriority =		65,
		Description =			"$7826",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Vgr_ShipYard",
	        UpgradeName =			"BUILDSPEED",
        	UpgradeValue =			1.3,
		Icon = Icon_Build,
		ShortDisplayedName = "$7240",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
