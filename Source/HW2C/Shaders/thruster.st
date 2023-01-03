static Texture $diffuseOn
static Texture $diffuseOff
static Texture $glowOn
static Texture $glowOff

simple base(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap false
	setCap lightingCap true
	setCap blendCap false

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuseOn
    textureBind 0 $glowOn
    textureBind 0 $diffuseOff
    textureBind 0 $glowOff
    textureBind 0 $diffuse0
    textureMode	replaceMode
}

simple light(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
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


compound thruster()
{
    addPass base
//    addPass light
//    addPass fog
}


