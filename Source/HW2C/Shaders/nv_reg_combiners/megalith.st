static Texture $diffuse
static Texture $glow

simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap registerCombinerCap true
    setCap lightingCap true
    setCap separateSpecularCap true
    setCap colourMaterialCap true
    setCap blendCap true
    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse
    textureBind 1 $glow
	
    combinerParam numCombiners 2
    combinerParam constColour0 0 1 0 0 // used to expand green (glow) into RGB

	// put glow into spare 0
    combinerInput combiner0 rgb		A texture1	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B const0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		C zero		unsignedIdentity	rgb
    combinerInput combiner0 rgb		D zero		unsignedIdentity	rgb
	combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

	// adjust light by glow (glow=0 light=1, glow=.5 light=0, glow=1 light=-1)
    combinerInput combiner1 rgb		A primary	unsignedIdentity	rgb
    combinerInput combiner1 rgb		B spare0	expandNegate		rgb
    combinerInput combiner1 rgb 	C zero		unsignedIdentity	rgb
    combinerInput combiner1 rgb 	D zero		unsignedIdentity	rgb
	combinerOutput combiner1 rgb	spare1 discard discard scaleNone biasNone false false false

	// final colour = (unsigned)light*tex+glow*tex
    finalCombinerInput A spare1		unsignedIdentity	rgb
    finalCombinerInput B texture0	unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D eTimesF	unsignedIdentity	rgb
    finalCombinerInput E spare0		unsignedIdentity	rgb
    finalCombinerInput F texture0	unsignedIdentity	rgb
    finalCombinerInput G primary	unsignedIdentity	alpha
}

simple fog(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap       true
    setCap gouraudCap           true
    setCap cullCap              true
    setCap registerCombinerCap  true
    setCap blendCap             true


    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    combinerParam numCombiners 1

    combinerParam constColour0 $fogColour

    combinerInput combiner0 alpha	A primary	unsignedIdentity	alpha
    combinerInput combiner0 alpha	B const0	unsignedIdentity	alpha
	combinerOutput combiner0 alpha	spare0 discard discard scaleNone biasNone false false false

    finalCombinerInput A zero		unsignedIdentity	rgb
    finalCombinerInput B zero		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D const0		unsignedIdentity	rgb
    finalCombinerInput G spare0		unsignedIdentity	alpha
}

simple additive(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap blendCap true
    setCap registerCombinerCap true
    setCap cullCap		true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    combinerParam numCombiners 1

    combinerParam constColour0 $addColour

    combinerInput combiner0 alpha	A primary	unsignedIdentity	alpha
    combinerInput combiner0 alpha	B const0	unsignedIdentity	alpha
	combinerOutput combiner0 alpha	spare0 discard discard scaleNone biasNone false false false

    finalCombinerInput A zero		unsignedIdentity	rgb
    finalCombinerInput B zero		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D const0		unsignedIdentity	rgb
    finalCombinerInput G spare0		unsignedIdentity	alpha
}

compound megalith()
{
    addPass base
    addPass fog
    addPass additive 0
}
