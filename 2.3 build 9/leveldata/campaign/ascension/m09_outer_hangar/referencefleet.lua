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
        Number = 17,
    },	
    {
        Type = "Hgn_Interceptor",
        Number = 20,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 30,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 21,
    },
    {
        Type = "Hgn_PulsarCorvette",
        Number = 21,
    },
    {
        Type = "Hgn_Carrier",
        Number = 1,
    },
    {
        Type = "Hgn_Destroyer",
        Number = 3,
    },
    {
        Type = "Hgn_ResourceController",
        Number = 3,
    },
    {
        Type = "Kpr_Mover",
        Number = 12,
    },
    {
        Type = "Hgn_Dreadnaught",
        Number = 1,
    },
}

-- and we think they should have this much money:
RUs = 2500

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale