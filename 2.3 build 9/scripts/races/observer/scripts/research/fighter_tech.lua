base_research = nil 
base_research = {

	{
		Name =			"FighterDrive",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			100,
		Time = 			35,
		DisplayedName =		"$11502",
		ShortDisplayedName =	"$11502",
		DisplayPriority =		11,
		Description =		"$11503",
		Icon = 			Icon_Build,
		TargetName =		"Tai_Scout",
	},	
	{
		Name =			"FighterChassis",
		RequiredResearch =	"FighterDrive",
		RequiredSubSystems =	"Research",
		Cost = 			200,
		Time = 			50,
		DisplayedName =		"$11514",
		ShortDisplayedName =	"$11514",
		DisplayPriority =		12,
		Description =		"$11515",
		Icon = 			Icon_Build,
		TargetName =		"Tai_Interceptor",
	},	
	{
		Name =			"DefenderSubSystems",
		RequiredResearch =	"FighterDrive",
		RequiredSubSystems =	"Research",
		Cost = 			400,
		Time = 			90,
		DisplayedName =		"$11528",
		ShortDisplayedName =	"$11528",
		DisplayPriority =		13,
		Description =		"$11529",
		Icon = 			Icon_Build,
		TargetName =		"Tai_Defender",
	},	
	{
		Name =			"DefenseFighter",
		RequiredResearch =	"FighterChassis",
		RequiredSubSystems =	"Research",
		Cost = 			500,
		Time = 			100,
		DisplayedName =		"$11508",
		ShortDisplayedName =	"$11508",
		DisplayPriority =		15,
		Description =		"$11509",
		Icon = 			Icon_Build,
		TargetName =		"Tai_DefenseFighter",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 