-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Kus_Mothership",
        Number = 1,
    },
    {
        Type = "Kus_ResearchShip",
        Number = 1,
    },
    {
        Type = "Kus_ResourceCollector",
        Number = 2,
    },
    {
        Type = "Kus_SalvageCorvette",
        Number = 3,
    },    
    {
        Type = "Kus_Interceptor",
        Number =12,
    },
    {
        Type = "Kus_LightCorvette",
        Number = 5,
    },
}

-- and we think they should have this much money:
RUs = 600

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale