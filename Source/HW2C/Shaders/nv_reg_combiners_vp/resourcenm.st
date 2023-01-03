static Texture $diffuseA
static Texture $diffuseB
static Texture $normals

simple light0(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap 		true
//    setCap texture3D1Cap 		true
//    setCap cube0MapCap		true
//    setCap cube1MapCap		true
    setCap lightingCap		true
    setCap registerCombinerCap	true
//    setCap registerCombiner2Cap	true
    setCap vertexProgramCap	true
    setCap separateSpecularCap 	true
//    setCap colourMaterialCap	true

    setVertexProgram asteroidVertexProgram0

    fillMode solidFill
    cullMode backCull

    textureBind 0 $normals

    combinerParam numCombiners 1
    combinerParam constColour0 $keyLight
    combinerParam constColour1 $ambient

	// normalize step 1/2
//    combinerInput combiner0 rgb		A primary	expandNormal	rgb
//    combinerInput combiner0 rgb		B primary	expandNormal	rgb
//	combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

	// normalize step 2/2
//    combinerInput combiner1 rgb		A primary	expandNormal	rgb
//    combinerInput combiner1 rgb		B zero		unsignedInvert	rgb
//    combinerInput combiner1 rgb		C primary	halfBiasNormal	rgb
//    combinerInput combiner1 rgb		D spare0	unsignedInvert	rgb
//	combinerOutput combiner1 rgb	discard discard primary scaleNone biasNone false false false

	// get amount of light
    combinerInput combiner0 rgb		A texture0	expandNormal	rgb
    combinerInput combiner0 rgb		B primary	expandNormal	rgb
	combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

    finalCombinerInput A spare0	unsignedIdentity	rgb
    finalCombinerInput B const0	unsignedIdentity	rgb
    finalCombinerInput C zero	unsignedIdentity	rgb
    finalCombinerInput D const1	unsignedIdentity	rgb
}

simple light1(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap 		true
    setCap lightingCap		true
    setCap registerCombinerCap	true
    setCap vertexProgramCap	true
    setCap blendCap		true

    srcBlend	oneBlend
    destBlend	oneBlend

    setVertexProgram asteroidVertexProgram1

    textureBind 0 $normals

    combinerParam numCombiners 1
    combinerParam constColour0 $fillLight

	// get amount of light
    combinerInput combiner0 rgb		A texture0	expandNormal	rgb
    combinerInput combiner0 rgb		B primary	expandNormal	rgb
	combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B const0		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb
}

simple base(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight, Texture $normals, Texture $cubeMap, Colour $keyLight, Colour $fillLight, Colour $ambient )
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap 		true
    setCap texture1Cap 		true
    setCap registerCombinerCap	true
    setCap blendCap		true

    srcBlend	zeroBlend
    destBlend	srcColourBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse0
    textureBind 0 $diffuseA
    textureBind 1 $diffuseB

    combinerParam constColour0  $weight

    combinerParam numCombiners 1

    combinerInput combiner0 rgb		A texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B const0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		C texture1	unsignedIdentity	rgb
    combinerInput combiner0 rgb		D const0	unsignedInvert		rgb
    combinerOutput combiner0 rgb	discard discard spare0 scaleNone biasNone false false false

    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B primary	unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb
}

compound resourceNM()
{
    addPass light0	// first light with ambient
    addPass light1	// 2nd light
    addPass base	// texture
}
