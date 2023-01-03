static Texture $diffuseA
static Texture $diffuseB

simple base(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap texture2Cap true
    setCap lightingCap true
    setCap colourMaterialCap true

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $diffuseA
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineFunction	rgb		replaceCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $diffuseB
    combineColourStage 1 $weight
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineSource	rgb		arg1	textureSrc	srcColour
    combineSource	rgb		arg2	constantSrc	srcColour
    combineFunction	rgb		interpolateCombine		1

	//----------------stage 2----------
    activeTexture 2
    textureBind 2 $diffuseB
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction	rgb		modulateCombine		1
}

compound resource()
{
    addPass base
}
