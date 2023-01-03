simple defaultPass(Texture $diffuse)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true    
    	
    activeTexture 0
    texture $diffuse
}

compound defaultLight()
{
    addPass defaultPass
}
