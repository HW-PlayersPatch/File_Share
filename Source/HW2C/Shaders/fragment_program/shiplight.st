simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap lightingCap true
    setCap cullCap true
    setCap gouraudCap true
    setCap texture1Cap true
    setCap texture0Cap true
    setCap fragmentProgramCap	true
    setCap separateSpecularCap	true

    setCap texgenSCap true
    setCap texgenTCap true
    setCap texgenRCap true
    setCap texgenQCap true

    setCap colourMaterialCap true
    setCap blendCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    material specular  1 1 1 1
    material shininess 96 96 96 96

    textureBind 1 $glow

    setFragmentProgram shadowAndLightFragmentProgram

    setProgramVarLocal fragmentProgram 0x4 $shadowColour
    setProgramVarLocal fragmentProgram 0x5 $addColour
}

compound shipLight()
{
    addPass base
}
