-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Hgn_MotherShip",
        Number = 1,
    },
    {
        Type = "Hgn_Carrier",
        Number = 1,
    },
    {
        Type = "Hgn_ResourceCollector",
        Number = 10,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 35,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 10,
    },
    {
        Type = "Hgn_AttackBomberElite",
        Number = 5,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 9,
    },
    {
        Type = "Hgn_PulsarCorvette",
        Number = 9,
    },
    {
        Type = "Hgn_ResourceController",
        Number = 1,
    },
    {
        Type = "Hgn_MarineFrigate",
        Number = 2,
    },
    {
        Type = "Hgn_MinelayerCorvette",
        Number = 2,
    },
    {
        Type = "Hgn_AssaultFrigate",
        Number = 4,
    },
    {
        Type = "Hgn_TorpedoFrigate",
        Number = 3,
    },    
}

-- and we think they should have this much money:
RUs = 2500

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale
