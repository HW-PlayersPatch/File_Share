simple defaultPass()
{
    setCap depthBufferCap true
    setCap cullCap true
    setCap gouraudCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap texgenSCap true
    setCap texgenTCap true
    setCap texgenRCap true
    setCap texgenQCap true
    setCap blendCap true
    setCap separateSpecularCap true

    srcBlend oneBlend
    destBlend oneBlend
}

compound shadowLightAdditive()
{
    addPass defaultPass
}
