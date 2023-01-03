--convert pixels to normalized screen coordinates, assuming a 1024x768 screen
function AREA(width, height)
    return (width / 1024) * (height / 768)
end
--ATI areas for various LODs, assuming a 1024x768 screen
LOD0 = AREA(120,200)
LOD1 = AREA(64,128)
LOD2 = AREA(32,64)
LOD3 = AREA(16,32)
TINY = AREA(20,20)

icons =
{
    AGGRESSIVE =
    {
        LODs =
        {
            LOD0, "UI\\TacticsIcons\\Aggressive.mres"
        }
    },
    DEFENSIVE =
    {
        LODs =
        {
            LOD0, "UI\\TacticsIcons\\Defensive.mres"
        }
    },
    PASSIVE =
    {
        LODs =
        {
            LOD0, "UI\\TacticsIcons\\Passive.mres"
        }
    },
}

