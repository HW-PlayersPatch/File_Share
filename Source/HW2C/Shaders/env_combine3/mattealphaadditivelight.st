simple light(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap lightingCap true
    setCap colourMaterialCap true
    setCap texture0Cap true
    setCap blendCap true
    setCap alphaTestCap true

    srcBlend oneBlend
    destBlend oneBlend
    alphaFunc greaterEqualFunc
    alphaRef 0.5

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

	//----------------stage 0----------
	// change shadow colour to inverse of user defined colour
	textureBind 0 $diffuse
    activeTexture 0
    textureMode	combineMode
    combineSource	rgb		arg0	primarySrc	srcColour
    combineSource	rgb     arg1	textureSrc  srcAlpha
    combineFunction	rgb		modulateCombine		1
    combineSource	alpha	arg0	primarySrc  srcAlpha
    combineSource	alpha   arg1	textureSrc  srcAlpha
    combineFunction	alpha	modulateCombine		1
}

simple texturePass(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap lightingCap false
    setCap colourMaterialCap true
    setCap texture0Cap true
    setCap blendCap true
    setCap alphaTestCap true

    srcBlend destColourBlend
    destBlend zeroBlend
    alphaFunc greaterEqualFunc
    alphaRef 0.5

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

	textureBind 0 $diffuse
    activeTexture 0
    textureMode	replaceMode
}

simple fog(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap   true
    setCap blendCap         true
    setCap cullCap          true
    setCap texture0Cap      true
    setCap texture1Cap      true
    setCap alphaTestCap     true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    alphaFunc greaterEqualFunc
    alphaRef 0.5

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $diffuse
    combineColourStage 0 $fogColour
    textureMode	combineMode
    combineSource	rgb		arg0	primarySrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha		arg0	primarySrc	srcAlpha
    combineSource	alpha		arg1	constantSrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $diffuse
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha		arg0	previousSrc	srcAlpha
    combineSource	alpha		arg1	textureSrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}

simple additivePass(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap     true
    setCap blendCap       true
    setCap texture0Cap    true
    setCap texture1Cap    true
    setCap cullCap 	  true
    setCap alphaTestCap true

    srcBlend destColourBlend
    destBlend zeroBlend
    alphaFunc greaterEqualFunc
    alphaRef 0.5

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    combineColour $addColour
    textureBind 0 $diffuse
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineFunction     rgb		replaceCombine		1
    combineSource	alpha		arg0	constantSrc	srcAlpha
    combineSource	alpha		arg1	primarySrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
    combineColour $addColour

    textureBind 1 $diffuse
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineFunction     rgb		replaceCombine		1
    combineSource	alpha		arg0	previousSrc	srcAlpha
    combineSource	alpha		arg1	textureSrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}

compound matteAlphaAdditiveLight()
{
    addPass light
    addPass texturePass
    addPass fog
    addPass additivePass 0
}
