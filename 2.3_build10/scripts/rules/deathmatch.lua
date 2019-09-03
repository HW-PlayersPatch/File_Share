GUID = { 110,91,157,190,18,23,250,78,144,20,41,246,181,128,214,12 }
GameRulesName = "Homeworld RM 2.3 Players Patch" -- $4803 Homeworld Remastered
Description = "$4804"
SaveGameVersion = 1.0
SinglePlayer = 0

ExtFilter = "rules_dm"

Race_Paths = "Deathmatch,Extras"

Level_Pass_Tags = "dm"
Race_Pass_Tags = "race_dm,race_random,2x_race_dm"

GameSetupOptions =
{
    {
        name = "resources",
        locName = "$3240",
        tooltip = "$3239",
        default = 1,
        visible = 1,
        choices =
        {
            "$3241", "0.5",
            "$3242", "1.0",
            "$3243", "2.0",
        },
    },
    {
        name = "unitcaps",
        locName = "$3214",
        tooltip = "$3234",
        default = 1,
        visible = 1,
        choices =
        {
            "$3215", "Small",
            "$3216", "Normal",
            "$3217", "Large",
			"$4801", "Huge",	--to localize
			"Vast", "Vast",
        },
    },
    {
        name = "resstart",
        locName = "$3205",
        tooltip = "$3232",
        default = 1,
        visible = 1,
        choices =
        {
            "$3206", "1000",
            "$3207", "3000",
            "$3208", "10000",
            "$3209", "0",
        },
    },
    {
        name = "lockteams",
        locName = "$3220",
        tooltip = "$3235",
        default = 0,
        visible = 1,
        choices =
        {
            "$3221", "yes",
            "$3222", "no",
        },
    },
    {
        name = "startlocation",
        locName = "$3225",
        tooltip = "$3237",
        default = 1,
        visible = 1,
        choices =
        {
            "$3226", "random",
            "$3227", "fixed",
        },
    },
    {
        name = "cpuplayers",
        locName = "$2984",
        tooltip = "$2985",
        default = 1,
        visible = 1,
        choices =
        {
            "$3161",  "1",
            "$3201",  "2",
            "$3160",  "3",
            "$2986",  "4",
        },
    },
    {
        name = "PlayersPatch_AIAttackDamage",
        locName = "AI Attack Damage",
        tooltip = "SET AI PLAYER ATTACK DAMAGE",
        default = 0,
        visible = 1,
        choices =
        {
            "100%",  "1",
            "125%",  "2",
            "150%",  "3",
            "175%",  "4",
            "200%",  "5",
        },
    },
    {
        name = "bounties",
        locName = "$2987",
        tooltip = "$2988",
        default = 0,
        visible = 1,
        choices =
        {
            "$5455",  "0",
            "$3215",  "0.04",
            "$2989",  "0.07",
            "$3217",  "0.1",
        },
    },
    {
        name = "research",
        locName = "$2961",
        tooltip = "$2962",
        default = 1,
        visible = 1,
        choices =
        {
						"$3184",  "0",
						"$3183",  "1",
        },
    },
    {
        name = "ruinjections",
        locName = "$2990",
        tooltip = "$2991",
        default = 0,
        visible = 1,
        choices =
        {
            "$5455", "0",
            "1000", "1000",
            "2000", "2000",
            "3000", "3000",
        },
    },
    {
        name = "challenges",
        locName = "$2994",
        tooltip = "$2995",
        default = 0,
        visible = 1,
        choices =
        {
            "$3183", "0",
			"$3184", "1",            
        },
    },
		{
        name = "relics",
        locName = "$3003",
        tooltip = "$3004",
        default = 0,
        visible = 1,
        choices =
        {
            "$3183", "0",
			"$3184", "1",
        },
    },
    {
        name = "crates",
        locName = "$2996",
        tooltip = "$2997",
        default = 0,
        visible = 1,
        choices =
        {
			"$3183", "0",
            "$3184", "1",            
        },
    },
		{
        name = "carriersonly",
        locName = "$2998",
        tooltip = "$2999",
        default = 0,
        visible = 1,
        choices =
        {
            "$3183", "0",
			"$3184", "1",
			"$4802", "2",	
        },
    },
	    {
        name = "nocruisers",
        locName = "$3139",
        tooltip = "$3140",
        default = 0,
        visible = 1,
        choices =
        {
	"$3221",  "0",
	"$3222",  "1",
        },
    },
	    {
      name = "strikecraftgamemode",
        locName = "$3141",
        tooltip = "$3142",
        default = 0,
      visible = 1,
       choices =
        {
	"$3222",  "0",
	"$3221",  "1",
        },
    },
		{
        name = "norushtime",
        locName = "$3000",
        tooltip = "$3001",
        default = 0,
        visible = 1,
        choices =
        {
            "$5455", "0",
			"$2992", "5",
            "$2993", "10",
            "$3002", "15",
        },
    },
}

dofilepath("data:scripts/rules/deathmatch/deathmatch.lua")
