simple base(Texture $diffuse, Colour $fade)
{
    setCap depthBufferCap false
    setCap gouraudCap false
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap false
    setCap blendCap true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill

    textureBind 0 $diffuse
}

compound starfield()
{
    addPass base
}


