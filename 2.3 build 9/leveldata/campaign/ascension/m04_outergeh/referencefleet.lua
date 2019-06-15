-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Hgn_Mothership",
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
        Type = "Hgn_ResourceController",
        Number = 1,
    },
    {
        Type = "Hgn_Interceptor",
        Number = 30,
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
    {
        Type = "Hgn_PulsarCorvette",
        Number = 18,
    },
    {
        Type = "Hgn_MarineFrigate",
        Number = 2,
    },
    {
        Type = "Hgn_AssaultFrigate",
        Number = 6,
    },    
}

-- and we think they should have this much money:
RUs = 2500

--Load expanded options
dofilepath("data:scripts/playerspatch_util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale

--Original line: multiplierForExtraRU = 0.1
--Modification with respecting original value 0.1 above to keep the original intent
multiplierForExtraRU = (RefMissionDifficultyScale * 0.1)
