simple defaultPass(Texture $diffuse)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
	setCap registerCombinerCap true
	
    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    activeTexture 0
    texture $diffuse

    combinerParam numCombiners 1

    combinerInput combiner0 rgb		A primary	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		C secondary	unsignedIdentity	rgb
    combinerInput combiner0 rgb		D zero		unsignedInvert		rgb
	
    combinerOutput combiner0 rgb	discard discard spare0 scaleNone biasNone false false false
    
    finalCombinerInput A zero		unsignedIdentity	rgb
    finalCombinerInput B zero		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D spare0		unsignedIdentity	rgb
}

compound default()
{
    addPass defaultPass
}
    