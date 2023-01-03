simple base(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap lightingCap true

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 1 $diffuseB
    textureBind 0 $diffuseA

	//----------------stage 0----------
    activeTexture 0
    combineColourStage 0 $weight
    textureMode	combineMode
    combineSource	rgb		arg0	texture0Src	srcColour
    combineSource	rgb		arg1	texture1Src	srcColour
    combineSource	rgb		arg2	constantSrc	srcColour
    combineFunction	rgb		interpolateCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction	rgb		modulateCombine		1
}

compound resourceNM()
{
    addPass base
}
