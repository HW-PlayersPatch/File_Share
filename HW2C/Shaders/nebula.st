static Texture $diffuse

simple defaultPass(Texture $diffuse)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap false
    setCap texture0Cap true    
    setCap blendCap true
    setCap rescaleNormalCap true
-- setCap fogCap true    
    depthWrite false
    
	
	srcBlend oneBlend
    destBlend oneBlend

    material specular  1 1 0.4 1
    material shininess 97 97 97 97

    textureMode	modulateMode
    
    activeTexture 0
    texture $diffuse     
}

compound nebula()
{
    addPass defaultPass
}
    