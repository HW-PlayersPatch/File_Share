base_research = nil 
base_research = {

	{
		Name =					"AssaultCorvetteMAXSPEEDUpgrade1",
		RequiredResearch =		"",
		RequiredSubSystems =	"Research | AdvancedResearch & CorvetteProduction",
		Cost = 					400,
		Time = 					20,
		DisplayedName =			"$7559",
		DisplayPriority =		203,
		Description =			"$7560",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_AssaultCorvette",
        	UpgradeName =			"MAXSPEED",
        	UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7237",
	},

	{
		Name =					"PulsarCorvetteMAXSPEEDUpgrade1",
		RequiredResearch =		"",                                         
		RequiredSubSystems =	"Research | AdvancedResearch & CorvetteProduction",     
 		Cost = 					600,
		Time = 					30,
		DisplayedName =			"$7567",
		DisplayPriority =		209,                                                    
		Description =			"$7568",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Hgn_PulsarCorvette",
        	UpgradeName =			"MAXSPEED",
       		UpgradeValue =			1.25,
		Icon = 				Icon_Speed,
		ShortDisplayedName = 		"$7241",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end


base_research = nil 