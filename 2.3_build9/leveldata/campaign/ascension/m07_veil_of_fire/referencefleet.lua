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
        Number = 19,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 30,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 6,
    },
    {
        Type = "Hgn_PulsarCorvette",
        Number = 6,
    },
    {
        Type = "Hgn_TorpedoFrigate",
        Number = 5,
    },
    {
        Type = "Hgn_IonCannonFrigate",
        Number = 5,
    },
    {
        Type = "Hgn_Carrier",
        Number = 1,
    },
    {
        Type = "Hgn_ResourceController",
        Number = 3,
    },
}

-- and we think they should have this much money:
RUs = 1250

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale