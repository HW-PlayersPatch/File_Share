static Texture $diffuse
static Texture $glow

simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
}

compound shipLight()
{
    addPass base
}


