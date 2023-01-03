simple base(Texture $diffuse, Colour $fade)
{
    setCap depthBufferCap false
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap false
    setCap blendCap true
    setCap registerCombinerCap true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill

    textureBind 0 $diffuse

    combinerParam numCombiners 1
    combinerParam constColour0 $fade

    combinerInput combiner0 rgb A texture0 	unsignedIdentity	rgb
    combinerInput combiner0 rgb B primary	unsignedIdentity	rgb
    combinerOutput combiner0 rgb		spare0 discard discard scaleNone biasNone false false false

    combinerInput combiner0 alpha A texture0 	unsignedIdentity	alpha
    combinerInput combiner0 alpha B zero	unsignedInvert		alpha
    combinerOutput combiner0 alpha		spare0 discard discard scaleNone biasNone false false false

	// AB + (1-A)C + D
    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B const0		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb

    finalCombinerInput G spare0		unsignedIdentity	alpha
}

compound starfield()
{
    addPass base
}


