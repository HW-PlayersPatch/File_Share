simple light(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap lightingCap		true
    setCap fragmentProgramCap	true
    setCap separateSpecularCap	true
    setCap blendCap 		true

    srcBlend oneBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $glow

    setFragmentProgram shipLightPassAdditiveFragmentProgram

    setProgramVarLocal fragmentProgram 0x0 $teambase
    setProgramVarLocal fragmentProgram 0x1 $teamstripe
}

simple glow(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap blendCap true
    // turn on color-material cap so that the vertex colour is interpreted as material colour
    setCap colourMaterialCap true
    setCap fragmentProgramCap	true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96

    textureBind 0 $glow

    setFragmentProgram shipGlowPassFragmentProgram
}

simple baseWithBadge(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
    setCap texture2Cap		true
    setCap texture3Cap		true
    setCap fragmentProgramCap	true
    setCap blendCap 		true

    srcBlend	destColourBlend
    destBlend	zeroBlend

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

    setFragmentProgram shipBaseWithBadgePassFragmentProgram

    setProgramVarLocal fragmentProgram 0x0 $teambase
    setProgramVarLocal fragmentProgram 0x1 $teamstripe
}

simple fog(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap   true
    setCap gouraudCap       true
    setCap blendCap         true
    setCap cullCap          true
    setCap texture0Cap      true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $glow
    combineColourStage 0 $fogColour
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha	arg0	primarySrc	srcAlpha
    combineSource	alpha	arg1	constantSrc	srcAlpha
    combineFunction	alpha	modulateCombine		1
}

simple additive(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap 	true
    setCap gouraudCap 		true
    setCap blendCap 		true
    setCap cullCap		true

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

compound badgeAdditiveLight()
{
    addPass light
    addPass glow
    addPass baseWithBadge
    addPass fog
    addPass additive 0
}
