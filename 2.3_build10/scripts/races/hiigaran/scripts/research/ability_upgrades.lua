base_research = nil 
base_research = {
	 
	{
		Name =					"RepairAbility",
		RequiredResearch =		"",
		RequiredSubSystems =	"Research | AdvancedResearch",
		Cost = 					200,
		Time = 					20,
		DisplayedName =			"$7511",
		DisplayPriority =		26,
		Description =			"$7512",
		UpgradeType =			Ability,
		TargetType =			Ship,
		TargetName =			"Hgn_ResourceCollector",
        	UpgradeName =			"Repair",
		Icon = 				Icon_Ability,
		ShortDisplayedName = 		"$7205",
	},
	 
	{
		Name =					"ScoutPingAbility",
		RequiredResearch =		"",
		RequiredSubSystems =	"Research | AdvancedResearch",
		Cost = 					500,
		Time = 					40,
		DisplayedName =			"$7513",
		DisplayPriority =		27,
		Description =			"$7514",
		UpgradeType =			Ability,
		TargetType =			Ship,
		TargetName =			"Hgn_Scout",
        	UpgradeName =			"SensorPing",
		Icon = 				Icon_Ability,
		ShortDisplayedName = 		"$7206",
        },
	
	{
		Name =					"ImprovedTorpedo",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research | AdvancedResearch & FrigateProduction",
		Cost = 					1000,
		Time = 					60,
		DisplayedName =			"$7515",
		DisplayPriority =		29,
		Description =			"$7516",
		UpgradeType =			Ability,
		TargetType =			Ship,
		TargetName =			"Hgn_TorpedoFrigate",
		UpgradeName =			"UseSpecialWeaponsInNormalAttack",
		Icon = 				Icon_Ability,
		ShortDisplayedName = 		"$7207",
	},
	 
	{
		Name =					"AttackBomberImprovedBombs",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research | AdvancedResearch & FighterProduction",
		Cost = 					1500,
		Time = 					45,
		DisplayedName =			"$7517",
		DisplayPriority =		30,
		Description =			"$7518",
		UpgradeType =			Ability,
		TargetType =			Ship,
		TargetName =			"Hgn_AttackBomber",
        	UpgradeName =			"UseSpecialWeaponsInNormalAttack",
		Icon = 				Icon_Ability,
		ShortDisplayedName = 		"$7208",
	},
 
	{
		Name =					"ScoutEMPAbility",
		RequiredResearch =		"",
		RequiredSubSystems =		"Research | AdvancedResearch",
		Cost = 					1500,
		Time = 					70,
		DisplayedName =			"$7519",
		DisplayPriority =		31,
		Description =			"$7520",
		UpgradeType =			Ability,
		TargetType =			Ship,
		TargetName =			"Hgn_Scout",
		UpgradeName =			"SpecialAttack",
		Icon = 				Icon_Ability,
		ShortDisplayedName = 		"$7209",
	},

	{
		Name =					"DefenseFieldFrigateShield",
		RequiredResearch =		"",
		RequiredSubSystems =	"AdvancedResearch & FrigateProduction",
		Cost = 					1500,
		Time = 					60,
		DisplayedName =			"$7521",
		DisplayPriority =		32,
		Description =			"$7522",
		TargetName =			"Hgn_DefenseFieldFrigate",   	
		Icon = 				Icon_Ability,
		ShortDisplayedName = 		"$7210",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end


base_research = nil 