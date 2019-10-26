simple defaultPass()
{
//    setCap depthBufferCap true

//    setCap cullCap true
//    cullMode frontCull

    setCap stencilCap true
    stencilFunc alwaysFunc 0x1 0x1
    stencilOp keepOp replaceOp replaceOp

    colourWrite false false false false
}

compound shadowHyperspaceA()
{
    addPass defaultPass
}
