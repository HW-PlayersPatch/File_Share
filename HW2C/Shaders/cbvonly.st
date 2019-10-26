simple default(Texture $diffuse, Colour $fade)
{
    setCap depthBufferCap		true
    setCap gouraudCap			true
    setCap cullCap				true
    setCap texture0Cap			false
	setCap lightingCap			true
	setCap blendCap				false
	setCap colourMaterialCap	true
	
    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
		
    fillMode solidFill
    cullMode backCull
}

compound cbvonly()
{
    addPass default
}


