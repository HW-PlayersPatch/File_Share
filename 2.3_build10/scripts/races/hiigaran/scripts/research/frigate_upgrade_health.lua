base_research = nil 	
base_research = {

{
		Name =					"TorpedoFrigateHealthUpgrade1",
		RequiredResearch =		"",                                          
		RequiredSubSystems =	"Research | AdvancedResearch & FrigateProduction",    
		Cost = 					1000,
		Time = 					75,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_TorpedoFrigate",
       		UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7244",
	},

	{
		Name =					"IonCannonFrigateHealthUpgrade1",
		RequiredResearch =		"InstaAdvancedFrigateTech",                                         
		RequiredSubSystems =	"Research | AdvancedResearch & FrigateProduction", 
		Cost = 					1000,
		Time = 					75,
		DisplayedName =			"$7579",
		DisplayPriority =		306,                                                    
		Description =			"$7580",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_IonCannonFrigate",
       		UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7247",
	},

	{
		Name =					"AssaultFrigateHealthUpgrade1",
		RequiredResearch =		"InstaAdvancedFrigateTech",                                         
		RequiredSubSystems =	"Research | AdvancedResearch & FrigateProduction", 
 		Cost = 					600,
		Time = 					40,
		DisplayedName =			"$7587",
		DisplayPriority =		312,                                                    
		Description =			"$7588",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_AssaultFrigate",
        	UpgradeName =			"MAXHEALTH",
       		UpgradeValue =			1.4,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7251",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end


base_research = nil 
