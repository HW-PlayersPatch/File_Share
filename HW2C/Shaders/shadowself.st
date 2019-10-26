simple defaultPass()
{
    setCap depthBufferCap true
    setCap cullCap true
    setCap colourMaterialCap true

//    colourWrite false

    setVertexColour 0 0 0 255
}

compound shadowSelf()
{
    addPass defaultPass
}
