simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe)
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

    activeTexture 0
    texture		$diffuse
    textureMode	replaceMode
}

simple light(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe)
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


compound alphateamglowAdditiveLight()
{
    addPass base
    //addPass light
}


