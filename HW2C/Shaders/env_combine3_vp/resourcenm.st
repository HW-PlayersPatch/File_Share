simple light0(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		    true
    setCap texture0Cap 		true
    setCap texture1Cap 		true
    setCap texture2Cap 		true
    setCap lightingCap		true
    setCap vertexProgramCap	true

    setVertexProgram asteroidVertexProgram0

    fillMode solidFill
    cullMode backCull

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $normals
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction	rgb		dot3rgbCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $normals
    combineColourStage 1 $keylight
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineFunction	rgb		modulateCombine		1

	//----------------stage 2----------
    activeTexture 2
    textureBind 2 $normals
    combineColourStage 2 $ambient
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineFunction	rgb		addCombine		1
}

simple light1(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		    true
    setCap texture0Cap 		true
    setCap texture1Cap 		true
    setCap lightingCap		true
    setCap vertexProgramCap	true
    setCap blendCap		    true

    srcBlend	oneBlend
    destBlend	oneBlend

    setVertexProgram asteroidVertexProgram1

	//----------------stage 0----------
    activeTexture 0
    textureBind 0 $normals
    textureMode	combineMode
    combineSource	rgb		arg0	textureSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction	rgb		dot3rgbCombine		1

	//----------------stage 1----------
    activeTexture 1
    textureBind 1 $normals
    combineColourStage 1 $filllight
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineSource	rgb		arg1	previousSrc	srcColour
    combineFunction	rgb		modulateCombine		1
}

simple base(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		    true
    setCap texture0Cap 		true
    setCap texture1Cap 		true
    setCap texture2Cap 		true
    setCap blendCap		    true

    srcBlend	zeroBlend
    destBlend	srcColourBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

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
    combineSource	rgb		arg1	textureSrc  srcColour
    combineSource	rgb		arg2	constantSrc	srcColour
    combineFunction	rgb		interpolateCombine		1

	//----------------stage 2----------
    activeTexture 2
    textureBind 2 $diffuse0
    textureMode	combineMode
    combineSource	rgb		arg0	previousSrc	srcColour
    combineSource	rgb		arg1	primarySrc	srcColour
    combineFunction	rgb		modulateCombine		1
}

compound resourceNM()
{
    addPass light0	// first light with ambient
    addPass light1	// 2nd light
    addPass base	// texture
}
