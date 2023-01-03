static Texture $diffuse

simple defaultPass(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap colourMaterialCap true
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap fogCap true
    setCap blendCap true

    srcBlend srcAlphaBlend
    destBlend oneBlend
	
    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

	textureBind 0 $diffuse
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

compound matte()
{
    addPass defaultPass
    addPass additive 0
}
