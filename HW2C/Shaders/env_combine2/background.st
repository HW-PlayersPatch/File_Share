simple default(Texture $diffuse, Colour $fade, Colour $light)
{
    setCap depthBufferCap false
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap false
    setCap blendCap false
	
    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $diffuse
    combineColourStage 0 $fade
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcAlpha
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction     rgb		modulateCombine         1
}

compound background()
{
    addPass default
}


