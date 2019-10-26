simple default(Texture $diffuse, Colour $fade)
{
    setCap depthBufferCap		true
    setCap gouraudCap			true
    setCap cullCap				true
    setCap texture0Cap			true
	setCap lightingCap			true
	setCap blendCap				false
	setCap colourMaterialCap	true
	
    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96

    fillMode solidFill
    cullMode backCull

    activeTexture 0
    texture		$diffuse
    textureMode	combineMode
    
    combineSource	rgb		arg0	primarySrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineFunction	rgb		modulateCombine		2
}

compound cbvoffset()
{
    addPass default
}


