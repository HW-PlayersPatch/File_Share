simple defaultPass()
{
    setCap depthBufferCap true
    setCap texture0Cap true
    setCap colourMaterialCap true

    setCap alphaTestCap true
    alphaRef 0
 //   alphaFunc greaterFunc

    setCap blendCap true
    srcBlend srcAlphaBlend
    destBlend oneBlend

    setCap offsetFillCap true

//    stencilFunc equalFunc 0x1 0x1
//    stencilOp keepOp keepOp keepOp
}

compound hyperspacePlaneTextured()
{
    addPass defaultPass
}
