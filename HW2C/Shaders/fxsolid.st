static Texture $diffuse

simple defaultPass(Texture $diffuse)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap texture0Cap true
    setCap cullCap true
	
    activeTexture 0
    texture $diffuse
}

compound fxSolid()
{
    addPass defaultPass
}
    