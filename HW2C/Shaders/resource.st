static Texture $diffuseA
static Texture $diffuseB

simple base1(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap fogCap true

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96

    activeTexture 0
    texture $diffuse0
}

simple base2(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap blendCap true
    setCap fogCap true
    setCap colourMaterialCap true

    srcBlend	srcAlphaBlend
    destBlend	invSrcAlphaBlend

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour $weight

    activeTexture 0
    texture $diffuse0
}

compound resource()
{
    addPass base1
    addPass base2
}
