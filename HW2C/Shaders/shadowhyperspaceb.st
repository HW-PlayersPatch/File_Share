simple defaultPass()
{
//    setCap depthBufferCap true
    setCap colourMaterialCap true
    setCap stencilCap true

    setVertexColour 1 1 1 1

//    setCap cullCap true
//    cullMode frontCull

    stencilFunc equalFunc 0x1 0x1
    stencilOp keepOp keepOp keepOp

//    colourWrite true true true true
}

compound shadowHyperspaceB()
{
    addPass defaultPass
}
