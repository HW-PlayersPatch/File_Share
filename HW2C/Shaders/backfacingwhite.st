simple defaultPass()
{
    setCap lightingCap false
    setCap cullCap true
//    setCap stencilCap true
    setCap depthBufferCap true
    setCap colourMaterialCap true
    setVertexColour 1 1 1 1
    
//    polygonOffset 1.1 8

    cullMode frontCull

    depthFunc lessFunc
}

compound backfacingWhite()
{
    addPass defaultPass
}
