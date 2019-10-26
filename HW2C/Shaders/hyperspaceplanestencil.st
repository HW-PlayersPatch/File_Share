simple defaultPass()
{
    setCap depthBufferCap true
    setCap texture0Cap true
    setCap colourMaterialCap true

    setVertexColour 1 1 1 1

    setCap offsetFillCap true
    polygonOffset 1.1 4
}

compound hyperspacePlaneStencil()
{
    addPass defaultPass
}
