static Texture $diffuse

//does not work
simple defaultPass(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap fogCap true
    setCap colourMaterialCap true
    setCap blendCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    setCap alphaTestCap true
    alphaFunc greaterEqualFunc
    alphaRef 0.5

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse
}

compound matteAlphaLight()
{
    addPass defaultPass
}
