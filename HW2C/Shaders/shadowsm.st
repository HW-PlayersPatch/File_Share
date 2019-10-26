simple fillStencil()
{
    setCap depthBufferCap	true
    setCap cullCap	true
    setCap stencilCap	true

    // write 1 to stencil whenever a fragment is draw
    stencilFunc alwaysFunc 0x1 0x1
    stencilOp keepOp replaceOp replaceOp

    // don`t write to the depth buffer or colour buffer
    depthWrite false
    colourWrite false false false false
}

simple shadowSM()
{
    setCap depthBufferCap	true
    setCap cullCap		true
    setCap colourMaterialCap	true
//    setCap stencilCap		true

    // enable blending
    setCap blendCap true
    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    // reenable colour buffer writes, but still not depth
//    colourWrite true true true true
    depthWrite false
//    depthFunc lessFunc

    // put polygon infront of SM plane
    polygonOffset 1.1 4

    // only draw if the stencil hasn`t already been drawn to
//    stencilFunc equalFunc 0x0 0x1
//    stencilOp keepOp keepOp keepOp

    setVertexColour 0 0 0 1
}

compound shadowSM()
{
//    addPass fillStencil
    addPass shadowSM
}
