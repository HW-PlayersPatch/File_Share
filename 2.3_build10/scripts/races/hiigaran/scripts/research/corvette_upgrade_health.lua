	base_research = nil 
base_research = {

{
		Name =					"AssaultCorvetteHealthUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =	"Research | AdvancedResearch & CorvetteProduction",
		Cost = 					600,
		Time = 					35,
		DisplayedName =			"$7555",
		DisplayPriority =		200,
		Description =			"$7556",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_AssaultCorvette",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.5,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7237",
	},

	{
		Name =					"PulsarCorvetteHealthUpgrade1",
		RequiredResearch =		"",                                        
		RequiredSubSystems =	"Research | AdvancedResearch & CorvetteProduction",  
		Cost = 					1000,
		Time = 					50,
		DisplayedName =			"$7563",
		DisplayPriority =		206,                                                    
		Description =			"$7564",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_PulsarCorvette",
        	UpgradeName =			"MAXHEALTH",
        	UpgradeValue =			1.5,
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7241",
	},
}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end



base_research = nil 
