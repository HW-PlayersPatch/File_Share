static Texture $mask
static Texture $diffuse
static Texture $glow

simple base(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap colourMaterialCap true
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
    setCap lightingCap		false
    setCap colourMaterialCap true
    setCap blendCap         true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96

    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    combineColourStage 0 $teambase
    textureBind 0 $diffuse
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		modulateCombine		2
    combineSource	alpha		arg0	textureSrc	srcAlpha
    combineFunction	alpha		replaceCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $diffuse
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineSource	rgb		arg2	previousSrc	srcAlpha
    combineFunction	rgb		interpolateCombine		1
    combineSource	alpha	arg0	primarySrc	srcAlpha
    combineFunction	alpha	replaceCombine		1
}


simple stripe(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap colourMaterialCap true
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap blendCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
    setCap lightingCap		false
    setCap colourMaterialCap true
    setCap blendCap         true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96

    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $diffuse
    combineColourStage 0 $teamstripe
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		modulateCombine		2

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $glow
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha		arg0	textureSrc	invSrcAlpha
    combineSource	alpha		arg1	primarySrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}

simple brightenBase(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap colourMaterialCap true
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap blendCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
//    setCap texture2Cap		true
    setCap lightingCap		false

    srcBlend oneBlend
    destBlend oneBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
//    setVertexColour    $teamstripe

    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $diffuse
    combineColour 0 0 0 0
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		addSignedCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $diffuse
    combineColour 0 0 0 0
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	invSrcAlpha
    combineSource	rgb		arg1	previousSrc	srcColour
    combineFunction	rgb		modulateCombine		1
}


simple badge(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap blendCap true
    setCap colourMaterialCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend
    
    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $mask
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	invSrcAlpha
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha		arg0	textureSrc	invSrcAlpha
    combineSource	alpha		arg1	primarySrc	srcAlpha
    combineFunction	alpha		modulateCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $badge
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineFunction	rgb		modulateCombine		1
    combineSource	alpha		arg0	textureSrc	srcAlpha
    combineSource	alpha		arg1	previousSrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}


simple light(Texture $badge, Texture $mask, Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
    setCap texture2Cap		true
    setCap lightingCap		true
    setCap blendCap		true
    setCap colourMaterialCap true

    srcBlend zeroBlend
    destBlend srcColourBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

	//----------------stage 0----------
	// change range from 0-1 to .5-1
    activeTexture 0
    textureBind 0 $glow
    combineColour 0.5 0.5 0.5 0
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineSource	rgb		arg1	constantSrc	srcColour
    combineSource	rgb		arg2	constantSrc	srcColour
    combineFunction	rgb		modulateAddCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $glow
    combineColour 0.5 1 0.5 0
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineFunction	rgb		dot3rgbCombine		1

	//----------------stage 2----------
    activeTexture 2
    textureBind 2 $glow
    combineColour 0.5 0.5 0.5 0
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineSource	rgb		arg2	previousSrc	srcColour
    combineFunction	rgb		interpolateCombine		1
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
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap blendCap true
    setCap texture0Cap true
    setCap cullCap 	  true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    combineColour $addColour
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineFunction     rgb		replaceCombine		1
    combineSource	alpha		arg0	constantSrc	srcAlpha
    combineSource	alpha		arg1	primarySrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}

compound badge()
{
	addPass base
	addPass stripe
//	addPass brightenBase
	addPass badge
	addPass light
	addPass fog
	addPass additive 0
}

