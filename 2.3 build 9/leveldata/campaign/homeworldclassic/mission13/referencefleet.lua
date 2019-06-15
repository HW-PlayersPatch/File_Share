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
        Number = 5,
    },
    {
        Type = "Kus_SalvageCorvette",
        Number = 5,
    }, 
    {
        Type = "Kus_Interceptor",
        Number =12,
    },
    {
        Type = "Kus_LightCorvette",
        Number =5,
    },
    {
        Type = "Kus_HeavyCorvette",
        Number = 10,
    },
    {
        Type = "Kus_AttackBomber",
        Number = 10,
    },
    {
        Type = "Kus_AssaultFrigate",
        Number = 5,
    },
    {
        Type = "Kus_IonCannonFrigate",
        Number = 2,
    },
    {
        Type = "Kus_Destroyer",
        Number = 1,
    },
    {
        Type = "Kus_Carrier",
        Number = 1,
    },
}

-- and we think they should have this much money:
RUs = 3000

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale
