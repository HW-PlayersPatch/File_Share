simple light(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap lightingCap true
    setCap blendCap true

    srcBlend oneBlend
    destBlend oneBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

}

simple base(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap blendCap true

    srcBlend	destColourBlend
    destBlend	zeroBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse
}

simple fog(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
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
    textureBind 0 $diffuse
    combineColourStage 0 $fogColour
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha	arg0	primarySrc	srcAlpha
    combineSource	alpha	arg1	constantSrc	srcAlpha
    combineFunction	alpha	modulateCombine		1
}

compound matteAdditiveLight()
{
    addPass light
    addPass base
    addPass fog
}
