static Texture $diffuse
static Texture $glow

simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
	setCap lightingCap true

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse
//    textureMode	replaceMode
}

simple light(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap false
    setCap texture1Cap false
	setCap lightingCap true
	setCap blendCap true

    srcBlend	destColourBlend
    destBlend	zeroBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1
}

simple additive(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap blendCap true
    setCap cullCap true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull
    
    setVertexColour $addColour
}

compound megalithAdditiveLight()
{
    addPass base
    //addPass light
    //addPass fog
    addPass additive 0
}


