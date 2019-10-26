simple defaultPass(Texture $diffuse, Colour $fogColour, Colour $addColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap false
    setCap separateSpecularCap true
    setCap colourMaterialCap true
    setCap blendCap true
    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    setCap alphaTestCap true
    alphaRef 0.5

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse
}

simple fog(Texture $diffuse, Colour $fogColour, Colour $addColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap blendCap true
    setCap fogCap true

// needed?
//    srcBlend srcAlphaBlend
//    destBlend invSrcAlphaBlend
//    setCap alphaTestCap true
//    alphaRef 0.5


    fillMode solidFill
    cullMode backCull
}

compound matteAlphaFullbright()
{
    addPass defaultPass
    addPass fog
}
