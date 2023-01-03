static Texture $diffuse

simple defaultPass(Texture $diffuse, Colour $diffuseColour, Colour $emissionColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap blendCap true
    setCap rescaleNormalCap true
-- setCap fogCap true
    depthWrite false
	
	srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    material specular  0 0 0 0
    material shininess 0 0 0 0
    material diffuse $diffuseColour
    material ambient $diffuseColour
    material emission $emissionColour
    
    activeTexture 0
    textureBind 0 $diffuse
    textureMode	modulateMode
}

compound dustCloud()
{
    addPass defaultPass
}
    