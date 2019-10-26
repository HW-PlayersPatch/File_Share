static Texture $diffuse

simple defaultPass(Texture $diffuse)
{
    setCap gouraudCap true
    setCap texture0Cap true
    depthWrite false
	
    activeTexture 0
    texture $diffuse
}

compound fx()
{
    addPass defaultPass
}
    