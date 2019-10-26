simple defaultPass()
{
//    setCap depthBufferCap true

//    setCap blendCap true
//    srcBlend srcAlphaBlend
//    destBlend invSrcAlphaBlend

//    setCap offsetFillCap true
//    polygonOffset 1.1 4

	setCap stencilCap true
	stencilFunc equalFunc 0x1 0x1
	stencilOp keepOp keepOp keepOp

    setVertexColour 1 1 1 1
}

compound hyperspaceScreen()
{
    addPass defaultPass
}
