simple light(Texture $diffuse, Texture $glow, Texture $shadow, Texture $normals, Texture $normalizationCube, Texture $environmentCube, Texture $passThough3d, Colour $teambase, Colour $teamstripe, Colour $keyLight, Colour $fillLight, Colour $ambient, Colour $fogColour)
{
    setCap depthBufferCap	true
    setCap gouraudCap		true
    setCap cullCap		true
    setCap texture0Cap		true
    setCap texture3D1Cap	true
    setCap texture3D2Cap	true
    setCap texture3Cap		true
    setCap registerCombinerCap	true
    //setCap registerCombiner2Cap	true
    setCap lightingCap		true
    //setCap blendCap		true
    // turn on color-material cap so that the vertex colour is interpreted as material colour
    setCap colourMaterialCap	true
    setCap vertexProgramCap	true
    setCap separateSpecularCap  true

    // start shadow
    activeTexture 3
    setCap texgenSCap		true
    setCap texgenTCap		true
    setCap texgenRCap		true
    setCap texgenQCap		true

    textureBind 0 $diffuse
    textureBind 1 $passThough3d
    textureBind 2 $passThough3d
    //textureBind 3 $shadow // already bound as it isn`t a real texture

    setVertexProgram shipLightVertexProgram

    srcBlend	srcAlphaBlend
    destBlend	invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96

    combinerParam numCombiners 2

	// adjust key light by shadow and add all other lights
    combinerInput combiner0 rgb		A texture3	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B texture1	unsignedIdentity	rgb
    combinerInput combiner0 rgb		C primary	unsignedIdentity	rgb
    combinerInput combiner0 rgb		D zero 		unsignedInvert		rgb
	combinerOutput combiner0 rgb	discard discard primary scaleNone biasNone false false false

    // lighting = lighting+specular
    combinerInput combiner1 rgb		A texture0	unsignedIdentity	alpha
    combinerInput combiner1 rgb		B secondary	unsignedIdentity	rgb
    combinerInput combiner1 rgb		C primary	unsignedInvert		rgb
    combinerInput combiner1 rgb		D zero		unsignedInvert		rgb
	combinerOutput combiner1 rgb	discard discard primary scaleNone biasNone false false false

    finalCombinerInput A primary	unsignedIdentity	rgb
    finalCombinerInput B texture0	unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb
//    finalCombinerInput G primary	unsignedIdentity	alpha
}

compound matteWithShadowSpecular()
{
    addPass light
}
