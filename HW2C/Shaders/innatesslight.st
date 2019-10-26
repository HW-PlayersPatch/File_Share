simple base(Colour $addColour)
{
   setCap cullCap true
   cullMode frontAndBackCull
}

compound innateSSLight()
{
    addPass base
}
