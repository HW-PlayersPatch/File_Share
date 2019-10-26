// shadow texture is already bound to TMU 0

simple base(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap lightingCap true
    setCap cullCap true
    setCap gouraudCap true
    setCap alphaTestCap true
    setCap blendCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap texture2Cap true

    activeTexture 0
    setCap texgenSCap true
    setCap texgenTCap true
    setCap texgenRCap true
    setCap texgenQCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend
    alphaFunc greaterEqualFunc
    alphaRef 0.5

	//----------------stage 0----------
	// change shadow colour to inverse of user defined colour
    activeTexture 0
    textureMode	combineMode
    combineColourStage 0 $shadowColour
    combineSource	rgb		arg0	constantSrc	invSrcColour
    combineSource	rgb		arg1	textureSrc	invSrcColour
    combineFunction	rgb		modulateCombine		1
    combineSource	alpha	arg0	constantSrc srcAlpha
    combineFunction	alpha	replaceCombine		1

	//----------------stage 1----------
	// fade shadow away
    activeTexture 1
    textureBind 1 $diffuse
    combineColour 1 1 1 1
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	invSrcColour
    combineSource	rgb		arg1    constantSrc	srcColour
    combineSource	rgb		arg2	previousSrc	srcAlpha
    combineFunction	rgb		interpolateCombine		1
    combineSource	alpha	arg0	textureSrc srcAlpha
    combineFunction	alpha	replaceCombine		1

	//----------------stage 2----------
	// multiply by incoming light
    activeTexture 2
    textureBind 2 $diffuse
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction	rgb		modulateCombine		1
    combineSource	alpha	arg0	primarySrc	srcAlpha
    combineSource	alpha	arg1	textureSrc	srcAlpha
    combineFunction	alpha	modulateCombine		1
}

compound matteAlphaLight()
{
    addPass base
}
