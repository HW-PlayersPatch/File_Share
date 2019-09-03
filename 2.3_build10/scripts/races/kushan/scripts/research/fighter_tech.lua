base_research = nil 
base_research = {

	{
		Name =			"FighterDrive",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			200,
		Time = 			20,
		DisplayedName =		"$11502",
		ShortDisplayedName =	"$11502",
		DisplayPriority =		11,
		Description =		"$11503",
		Icon = 			Icon_Build,
		TargetName =		"Kus_Scout",
	},
	{
		Name =			"FighterChassis",
		RequiredResearch =	"FighterDrive",
		RequiredSubSystems =	"Research",
		Cost = 			300,
		Time = 			30,
		DisplayedName =		"$11514",
		ShortDisplayedName =	"$11514",
		DisplayPriority =		12,
		Description =		"$11515",
		Icon = 			Icon_Build,
		TargetName =		"Kus_Interceptor",
	},
	{
		Name =			"DefenderSubSystems",
		RequiredResearch =	"FighterDrive",
		RequiredSubSystems =	"Research",
		Cost = 			800,
		Time = 			75,
		DisplayedName =		"$11528",
		ShortDisplayedName =	"$11528",
		DisplayPriority =		13,
		Description =		"$11529",
		Icon = 			Icon_Build,
		TargetName =		"Kus_Defender",
	},
	{
		Name =			"CloakedFighter",
		RequiredResearch =	"FighterChassis",
		RequiredSubSystems =	"Research",
		Cost = 			1000,
		Time = 			100,
		DisplayedName =		"$11506",
		ShortDisplayedName =	"$11506",
		DisplayPriority =		15,
		Description =		"$11507",
		Icon = 			Icon_Build,
		TargetName =		"Kus_CloakedFighter",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 
