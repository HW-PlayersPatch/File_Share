-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Hgn_Scout",
        Number = 3,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 15,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 15,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 12,
    },
    {
        Type = "Hgn_PulsarCorvette",
        Number = 12,
    },
    {
        Type = "Hgn_MarineFrigate",
        Number = 2,
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
}

-- and we think they should have this much money:
RUs = 7200

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale