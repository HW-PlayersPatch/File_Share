static Texture $diffuse

simple defaultPass(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
}
compound matteLight()
{
    addPass defaultPass
}
