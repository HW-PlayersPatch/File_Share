-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Hgn_MotherShip",
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
        Number = 9,
    },
    {
        Type = "Hgn_ResourceController",
        Number = 2,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 25,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 10,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 12,
    },
    {
        Type = "Hgn_MarineFrigate",
        Number = 1,
    },
    {
        Type = "Hgn_AssaultFrigate",
        Number = 3,
    },
    {
        Type = "Hgn_TorpedoFrigate",
        Number = 3,
    },
    {
        Type = "Hgn_Carrier",
        Number = 1,
    },
    {
        Type = "Hgn_DefenseFieldFrigate",
        Number = 1,
    },
    {
        Type = "Hgn_Destroyer",
        Number = 2,
    },
    {
        Type = "Hgn_BattleCruiser",
        Number = 1,
    },
}





-- and we think they should have this much money:
RUs = 7500

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale