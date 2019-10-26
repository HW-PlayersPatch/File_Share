static Texture $diffuseOn
static Texture $diffuseOff
static Texture $glowOn
static Texture $glowOff

simple base(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
}

compound thrusterLight()
{
    addPass base
}


