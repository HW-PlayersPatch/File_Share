base_research = nil 
base_research = {

	{
		Name =			"SuperCapitalShipDrive",
		RequiredResearch =	"CapitalShipChassis",
		RequiredSubSystems =	"Research",
		Cost = 			1700,
		Time = 			50,
		DisplayedName =		"$11542",
		ShortDisplayedName =	"$11542",
		DisplayPriority =		41,
		Description =		"$11543",
		Icon = 			Icon_Build,
		TargetName =		"Kus_Carrier",
	},
	{
		Name =			"GuidedMissiles",
		RequiredResearch =	"SuperCapitalShipDrive",
		RequiredSubSystems =	"Research",
		Cost = 			3500,
		Time = 			100,
		DisplayedName =		"$11546",
		ShortDisplayedName =	"$11546",
		DisplayPriority =		44,
		Description =		"$11547",
		Icon = 			Icon_Build,
		TargetName =		"Kus_MissileDestroyer",
	},
	{
		Name =			"SuperHeavyChassis",
		RequiredResearch =	"SuperCapitalShipDrive & IonCannons",
		RequiredSubSystems =	"Research",
		Cost = 			5000,
		Time = 			140,
		DisplayedName =		"$11560",
		ShortDisplayedName =	"$11560",
		DisplayPriority =		45,
		Description =		"$11561",
		Icon = 			Icon_Build,
		TargetName =		"Kus_Destroyer",
	},
	{
		Name =			"HeavyGuns",
		RequiredResearch =	"SuperHeavyChassis & SuperCapitalShipDrive & IonCannons",
		RequiredSubSystems =	"Research",
		Cost = 			9000,
		Time = 			360,
		DisplayedName =		"$11550",
		ShortDisplayedName =	"$11550",
		DisplayPriority =		46,
		Description =		"$11551",
		Icon = 			Icon_Build,
		TargetName =		"Kus_HeavyCruiser",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
