simple defaultPass()
{
    setCap depthBufferCap true
    setCap cullCap true
    setCap gouraudCap true
    setCap lightingCap true

    setVertexColour 1 1 1 1

}

compound shadowBase()
{
    addPass defaultPass
}
