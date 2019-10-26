simple default(Texture $diffuse)
{
    setCap depthBufferCap false
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap false
    setCap blendCap true
	
    fillMode solidFill
    cullMode backCull

    srcBlend	oneBlend
    destBlend	oneBlend

    activeTexture 0
    texture $diffuse
    textureMode	modulateMode
}

compound star()
{
    addPass default
}


