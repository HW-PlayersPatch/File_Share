base_research = nil 
base_research = {

	{
		Name =					"BattlecruiserHealthUpgrade1",
		RequiredResearch =		"BattlecruiserIonWeapons",                             
		RequiredSubSystems =	"Research | AdvancedResearch & CapShipProduction",                         
		Cost = 					1500,
		Time = 					90,
		DisplayedName =			"$7595",
		DisplayPriority =		401,                                                  
		Description =			"$7596",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_BattleCruiser",
		UpgradeName =			"MAXHEALTH",
		UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7254",
	},

	{
		Name =					"BattlecruiserMAXSPEEDUpgrade1",
		RequiredResearch =		"BattlecruiserIonWeapons",                             
		RequiredSubSystems =	"Research | AdvancedResearch & CapShipProduction",                       
		Cost = 					600,
		Time = 					30,
		DisplayedName =			"$7599",
		DisplayPriority =		404,                                                   
		Description =			"$7600",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_BattleCruiser",
		UpgradeName =			"MAXSPEED",
		UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7254",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
