-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Kpr_Sajuuk",
        Number = 1,
    },
    {
        Type = "Hgn_Shipyard",
        Number = 1,
    },
    {
        Type = "Hgn_Dreadnaught",
        Number = 1,
    },
    {
        Type = "Hgn_ResourceCollector",
        Number = 12,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 25,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 25,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 33,
    },
    {
        Type = "Hgn_PulsarCorvette",
        Number = 12,
    },
    {
        Type = "Hgn_AssaultFrigate",
        Number = 5,
    },
    {
        Type = "Hgn_TorpedoFrigate",
        Number = 4,
    },
    {
        Type = "Hgn_IonCannonFrigate",
        Number = 10,
    },
    {
        Type = "Hgn_Carrier",
        Number = 4,
    },
    {
        Type = "Hgn_DefenseFieldFrigate",
        Number = 2,
    },
    {
        Type = "Hgn_Destroyer",
        Number = 4,
    },
    {
        Type = "Hgn_ResourceController",
        Number = 3,
    },
    {
        Type = "Hgn_Battlecruiser",
        Number = 3,
    },
    {
        Type = "Kpr_Mover",
        Number = 12,
    },
}

-- and we think they should have this much money:
RUs = 25000

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale