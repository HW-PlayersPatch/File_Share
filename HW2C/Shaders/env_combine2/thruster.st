static Texture $diffuseOn
static Texture $diffuseOff
static Texture $glowOn
static Texture $glowOff

simple base(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap colourMaterialCap true
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
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
    textureBind 0 $diffuse0
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		modulateCombine		2
    combineSource	alpha		arg0	textureSrc	srcAlpha
    combineFunction	alpha		replaceCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $diffuse0
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineSource	rgb		arg2	previousSrc	srcAlpha
    combineFunction	rgb		interpolateCombine		1
    combineSource	alpha		arg0	primarySrc	srcAlpha
    combineFunction	alpha		replaceCombine		1
}

simple stripe(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap colourMaterialCap 	true
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap blendCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true

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
    textureBind 0 $diffuse0
    combineColourStage 0 $teamstripe
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		modulateCombine		2

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $glow0
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha		arg0	textureSrc	invSrcAlpha
    combineSource	alpha		arg1	primarySrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}

simple light(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap texture1Cap		true
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
    activeTexture 0
    textureBind 0 $glow0
    combineColour 0.5 1 0.5 0
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		dot3rgbCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $glow0
    combineColour 0.5 0.5 0.5 0
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineSource	rgb		arg2	previousSrc	srcColour
    combineFunction	rgb		interpolateCombine		1
}

simple fog(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
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
    textureBind 0 $glowOn
    combineColourStage 0 $fogColour
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineFunction	rgb		replaceCombine		1
    combineSource	alpha	arg0	primarySrc	srcAlpha
    combineSource	alpha	arg1	constantSrc	srcAlpha
    combineFunction	alpha	modulateCombine		1
}

simple additive(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap     true
    setCap blendCap       true
    setCap texture0Cap    true
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

compound thruster()
{
    addPass base
    addPass stripe
    addPass light
    addPass fog
    addPass additive 0
}
