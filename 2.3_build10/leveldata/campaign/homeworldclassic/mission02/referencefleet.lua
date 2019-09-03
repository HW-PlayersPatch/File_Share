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
        Number = 1,
    },
    {
        Type = "Kus_SalvageCorvette",
        Number = 1,
    },
    {
        Type = "Kus_Scout",
        Number = 5,
    },
    {
        Type = "Kus_Interceptor",
        Number = 5,
    },
}

-- and we think they should have this much money:
RUs = 200

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale