base_research = nil 
base_research = {

	{
		Name =			"CapitalShipDrive",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			1000,
		Time = 			75,
		DisplayedName =		"$11526",
		ShortDisplayedName =	"$11526",
		DisplayPriority =		31,
		Description =		"$11527",
		Icon = 			Icon_Build,
		TargetName =		"Kus_SupportFrigate",
	},
	{
		Name =			"CapitalShipChassis",
		RequiredResearch =	"CapitalShipDrive",
		RequiredSubSystems =	"Research",
		Cost = 			1200,
		Time = 			90,
		DisplayedName =		"$11540",
		ShortDisplayedName =	"$11540",
		DisplayPriority =		32,
		Description =		"$11541",
		Icon = 			Icon_Build,
		TargetName =		"Kus_AssaultFrigate",
	},
	{
		Name =			"IonCannons",
		RequiredResearch =	"CapitalShipChassis",
		RequiredSubSystems =	"Research",
		Cost = 			1700,
		Time = 			120,
		DisplayedName =		"$11534",
		ShortDisplayedName =	"$11534",
		DisplayPriority =		33,
		Description =		"$11535",
		Icon = 			Icon_Build,
		TargetName =		"Kus_IonCannonFrigate",
	},
	{
		Name =			"DroneTechnology",
		RequiredResearch =	"CapitalShipChassis",
		RequiredSubSystems =	"Research",
		Cost = 			1100,
		Time = 			80,
		DisplayedName =		"$11536",
		ShortDisplayedName =	"$11536",
		DisplayPriority =		34,
		Description =		"$11537",
		Icon = 			Icon_Build,
		TargetName =		"Kus_DroneFrigate",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
