simple defaultPass()
{
    setCap depthBufferCap true
    setCap cullCap true
    setCap offsetFillCap true

    colourWrite false false false false

    cullMode frontCull
}

compound shadowDepth()
{
    addPass defaultPass
}
