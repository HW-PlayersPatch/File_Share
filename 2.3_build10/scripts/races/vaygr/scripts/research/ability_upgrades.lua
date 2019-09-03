base_research = nil 
base_research = {


	{ 
		Name =			"RepairAbility",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			200,
		Time = 			20,
		DisplayedName =		"$7724",
		DisplayPriority =	280,
		Description =		"$7725",
		UpgradeType =		Ability,
		TargetType =		Ship,
		TargetName =		"Vgr_ResourceCollector",
	        UpgradeName =		"Repair",
		Icon = 			Icon_Ability,
		ShortDisplayedName = 	"$7311",
	},

	{ 
		Name =			"ScoutEMPAbility",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research & FighterProduction",
		Cost = 			1500,
		Time = 			70,
		DisplayedName =		"$7732",
		DisplayPriority =	281,
		Description =		"$7734",
		UpgradeType =		Ability,
		TargetType =		Ship,
		TargetName =		"Vgr_Scout",
	        UpgradeName =		"SpecialAttack",
		Icon = 			Icon_Ability,
		ShortDisplayedName = 	"$7314",
	},
	
	{ 
		Name =			"BomberImprovedBombs",
		RequiredResearch =	"PlasmaBombs",
		RequiredSubSystems =	"Research",
		Cost = 			1500,
		Time = 			45,
		DisplayedName =		"$7730",
		DisplayPriority =	282,
		Description =		"$7731",
		UpgradeType =		Ability,
		TargetType =		Ship,
		TargetName =		"Vgr_Bomber",
	        UpgradeName =		"UseSpecialWeaponsInNormalAttack",
		Icon = 			Icon_Ability,
		ShortDisplayedName = 	"$7313",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
