-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Hgn_Mothership",
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
        Type = "Hgn_Interceptor",
        Number = 30,
    },
    {
        Type = "Hgn_AttackBomber",
        Number = 25,
    },
    {
        Type = "Hgn_ResourceCollector",
        Number = 12,
    },
    {
        Type = "Hgn_AssaultCorvette",
        Number = 15,
    },
    {
        Type = "Hgn_AssaultFrigate",
        Number = 6,
    },
    {
        Type = "Hgn_TorpedoFrigate",
        Number = 6,
    },
    {
        Type = "Hgn_PulsarCorvette",
        Number = 15,
    },
    {
        Type = "Hgn_IonCannonFrigate",
        Number = 10,
    },
    {
        Type = "Hgn_Carrier",
        Number = 2,
    },
    {
        Type = "Hgn_DefenseFieldFrigate",
        Number = 2,
    },
    {
        Type = "Hgn_Destroyer",
        Number = 5,
    },
    {
        Type = "Hgn_Battlecruiser",
        Number = 3,
    },
    {
        Type = "Hgn_ResourceController",
        Number = 3,
    },
}

-- and we think they should have this much money:
RUs = 6000

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale

--Original line: multiplierForExtraRU = 0.1
--Modification with respecting original value 0.1 above to keep the original intent
multiplierForExtraRU = (RefMissionDifficultyScale * 0.1)
