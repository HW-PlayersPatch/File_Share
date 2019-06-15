base_research = nil 
base_research = {

	{
		Name =			"SGMCapitalHealth",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"",
		DisplayPriority =	1208,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Vgr_Mothership",
	        UpgradeName =		"MAXHEALTH",
	        UpgradeValue =		0.5,
		DoNotGrant = 1,
	},
	{
		Name =			"SGMFrigateHealth",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"",
		DisplayPriority =	1208,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Frigate",
	        UpgradeName =		"MAXHEALTH",
	        UpgradeValue =		0.65,
		DoNotGrant = 1,
	},
	{
		Name =			"SGMCarrierHealth",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",    
                Cost = 			0,
		Time = 			0,
		DisplayedName =		"",
		DisplayPriority =	1208,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Vgr_Carrier",
	        UpgradeName =		"MAXHEALTH",
	        UpgradeValue =		0.80,
		DoNotGrant = 1,
	},
	{
		Name =			"SGMShipyardHealth",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"",
		DisplayPriority =	1208,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Vgr_Shipyard",
	        UpgradeName =		"MAXHEALTH",
	        UpgradeValue =		0.5,
		DoNotGrant = 1,
	},
}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

	base_research = nil 