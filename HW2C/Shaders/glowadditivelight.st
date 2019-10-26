simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
	setCap lightingCap true
	setCap blendCap false

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    fillMode solidFill
    cullMode backCull

    activeTexture 0
    textureBind 0 $glow
    textureMode	addMode
    
    activeTexture 1
    textureBind 0x1 $diffuse
    textureMode	modulateMode
}

compound glowAdditiveLight()
{
    addPass base
}


