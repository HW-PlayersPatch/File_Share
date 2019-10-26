static Texture $diffuseOn
static Texture $glowOn
static Texture $diffuseOff
static Texture $glowOff

simple base(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap			true
    setCap texture0Cap		true
    setCap texture1Cap		true
    setCap texture2Cap		true
    setCap texture3Cap		true
    setCap lightingCap		true
    setCap fragmentProgramCap	true
    setCap separateSpecularCap	true
    setCap colourMaterialCap true
    setCap blendCap         true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuseOn
    textureBind 1 $diffuseOff
    textureBind 2 $glowOn
    textureBind 3 $glowOff

    setFragmentProgram thrusterFragmentProgram

    setProgramVarLocal fragmentProgram 0x0 $teambase
    setProgramVarLocal fragmentProgram 0x1 $teamstripe
    setProgramVarLocal fragmentProgram 0x2 $fogColour
    setProgramVarLocal fragmentProgram 0x3 $weight
}

simple additive(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap 	true
    setCap gouraudCap 		true
    setCap blendCap 		true
    setCap cullCap  		true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    $addColour

    setFragmentProgram additiveFragmentProgram

    setProgramVarLocal fragmentProgram 0x0 $addColour
}

compound thruster()
{
    addPass base
    addPass additive 0
}
