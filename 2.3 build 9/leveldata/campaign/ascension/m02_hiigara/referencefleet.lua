-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Sp_Tanker",
        Number = 6,
    },
    {
        Type = "Hgn_Mothership",
        Number = 1,
    },
    {
        Type = "Hgn_ResourceCollector",
        Number = 2,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 25,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 15,
    },
}

-- and we think they should have this much money:
RUs = 1600

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale