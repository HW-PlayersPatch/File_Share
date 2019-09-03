base_research = nil 
base_research = {

	{
		Name =					"TorpedoFrigateMAXSPEEDUpgrade1",
		RequiredResearch =		"",                                         
		RequiredSubSystems =	"Research | AdvancedResearch & FrigateProduction",   
		Cost = 					600,
		Time = 					50,
		DisplayedName =			"$7575",
		DisplayPriority =		303,                                                   
		Description =			"$7576",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_TorpedoFrigate",
        	UpgradeName =			"MAXSPEED",
       		UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7244",
	},

	{
		Name =					"IonCannonFrigateMAXSPEEDUpgrade1",
		RequiredResearch =		"InstaAdvancedFrigateTech",                                        
		RequiredSubSystems =	"Research | AdvancedResearch & FrigateProduction",  
  		Cost = 					600,
		Time = 					50,
		DisplayedName =			"$7583",
		DisplayPriority =		309,                                                   
		Description =			"$7584",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_IonCannonFrigate",
       		UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7247",
	},

	{
		Name =					"AssaultFrigateMAXSPEEDUpgrade1",
		RequiredResearch =		"InstaAdvancedFrigateTech",                                        
		RequiredSubSystems =	"Research | AdvancedResearch & FrigateProduction",                     
		Cost = 					400,
		Time = 					25,
		DisplayedName =			"$7591",
		DisplayPriority =		315,                                                   
		Description =			"$7592",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_AssaultFrigate",
      		UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7251",
	},
}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
