static Texture $diffuse

simple defaultPass(Texture $diffuse)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap texture0Cap true
    setCap cullCap true
    setCap alphaTestCap true
    
    alphaFunc greaterEqualFunc
    alphaRef 0.1	
	
    activeTexture 0
    texture $diffuse
}

compound fxSolidAlphaTest()
{
    addPass defaultPass
}
    