-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Hgn_Mothership",
        Number = 1,
    },
    {
        Type = "Hgn_ResourceCollector",
        Number = 4,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 50,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 30,
    },
    {
        Type = "Hgn_AttackBomberElite",
        Number = 10,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 21,
    },
}

-- and we think they should have this much money:
RUs = 350

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale
