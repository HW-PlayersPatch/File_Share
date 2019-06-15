base_research = nil 
base_research = {

	{
		Name =			"ProximitySensor",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			250,
		Time = 			40,
		DisplayedName =		"$11552",
		ShortDisplayedName =	"$11552",
		DisplayPriority =		51,
		Description =		"$11553",
		Icon = 			Icon_Build,
		TargetName =		"Tai_ProximitySensor",
	},
	{
		Name =			"SensorArray",
		RequiredResearch =	"ProximitySensor",
		RequiredSubSystems =	"Research",
		Cost = 			350,
		Time = 			80,
		DisplayedName =		"$11554",
		ShortDisplayedName =	"$11554",
		DisplayPriority =		52,
		Description =		"$11555",
		Icon = 			Icon_Build,
		TargetName =		"Tai_SensorArray",
	},
	{
		Name =			"GravityGenerator",
		RequiredResearch =	"CapitalShipDrive",
		RequiredSubSystems =	"Research",
		Cost = 			500,
		Time = 			50,
		DisplayedName =		"$11556",
		ShortDisplayedName =	"$11556",
		DisplayPriority =		53,
		Description =		"$11557",
		Icon = 			Icon_Build,
		TargetName =		"Tai_GravWellGenerator",
	},
	{
		Name =			"CloakGenerator",
		RequiredResearch =	"CapitalShipDrive",
		RequiredSubSystems =	"Research",
		Cost = 			800,
		Time = 			100,
		DisplayedName =		"$11558",
		ShortDisplayedName =	"$11558",
		DisplayPriority =		54,
		Description =		"$11559",
		Icon = 			Icon_Build,
		TargetName =		"Tai_CloakGenerator",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end


base_research = nil 