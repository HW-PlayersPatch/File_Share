simple base(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		    true
    setCap texture0Cap		true
    setCap texture1Cap		true
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

    textureBind 0 $diffuse
    textureBind 1 $glow
    textureBind 2 $badge
    textureBind 3 $mask

    setFragmentProgram badgeFragmentProgram

    setProgramVarLocal fragmentProgram 0x0 $teambase
    setProgramVarLocal fragmentProgram 0x1 $teamstripe
    setProgramVarLocal fragmentProgram 0x2 $fogColour
}


simple additive(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
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

compound badge()
{
    addPass base
    addPass additive 0
}
