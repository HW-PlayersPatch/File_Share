simple default(Texture $diffuse, Colour $fade, Colour $light)
{
    setCap depthBufferCap false
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
	setCap lightingCap false
	setCap blendCap false
	
	setVertexColour 1 1 1 1
		
    fillMode solidFill
    cullMode backCull

    activeTexture 0
    texture $diffuse
    textureMode	modulateMode
}

compound background()
{
    addPass default
}


