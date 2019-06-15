base_research = nil 
base_research = {

	{
		Name =			"CapitalShipDrive",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			1300,
		Time = 			75,
		DisplayedName =		"$11526",
		ShortDisplayedName =	"$11526",
		DisplayPriority =		31,
		Description =		"$11527",
		Icon = 			Icon_Build,
		TargetName =		"Tai_SupportFrigate",
	},
	{
		Name =			"CapitalShipChassis",
		RequiredResearch =	"CapitalShipDrive",
		RequiredSubSystems =	"Research",
		Cost = 			1500,
		Time = 			90,
		DisplayedName =		"$11540",
		ShortDisplayedName =	"$11540",
		DisplayPriority =		32,
		Description =		"$11541",
		Icon = 			Icon_Build,
		TargetName =		"Tai_AssaultFrigate",
	},
	{
		Name =			"IonCannons",
		RequiredResearch =	"CapitalShipChassis",
		RequiredSubSystems =	"Research",
		Cost = 			2000,
		Time = 			120,
		DisplayedName =		"$11534",
		ShortDisplayedName =	"$11534",
		DisplayPriority =		33,
		Description =		"$11535",
		Icon = 			Icon_Build,
		TargetName =		"Tai_IonCannonFrigate",
	},
	{
		Name =			"DefenseField",
		RequiredResearch =	"CapitalShipChassis",
		RequiredSubSystems =	"Research",
		Cost = 			1300,
		Time = 			80,
		DisplayedName =		"$11538",
		ShortDisplayedName =	"$11538",
		DisplayPriority =		34,
		Description =		"$11539",
		Icon = 			Icon_Build,
		TargetName =		"Tai_FieldFrigate",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 