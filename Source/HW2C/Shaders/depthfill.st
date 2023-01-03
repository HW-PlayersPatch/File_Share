simple defaultPass()
{
    setCap depthBufferCap true
    setCap cullCap true
    setCap clipPlane0Cap true
    
    colourWrite false false false false
}

compound depthFill()
{
    addPass defaultPass
}
