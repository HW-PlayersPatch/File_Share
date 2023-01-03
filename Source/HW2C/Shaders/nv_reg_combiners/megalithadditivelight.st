simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap registerCombinerCap true
    // turn on color-material cap so that the vertex colour is interpreted as material colour
    setCap colourMaterialCap true
    setCap blendCap true

    srcBlend	destColourBlend
    destBlend	zeroBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96

    textureBind 0 $diffuse
    textureBind 1 $glow

    combinerParam numCombiners 2
    combinerParam constColour0 $teambase
    combinerParam constColour1 $teamstripe

	// Team colour (base and stripe) contribution.  (Result pre-multiplied by mask alpha)
    combinerInput combiner0 rgb		A const0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B texture0	unsignedInvert		alpha
    combinerInput combiner0 rgb		C const1	unsignedIdentity	rgb
    combinerInput combiner0 rgb		D texture1	unsignedInvert		alpha
    combinerOutput combiner0 rgb	discard discard primary scaleNone biasNone false false false
    // Pass through diffuse grey level (from blue) into spare0 alpha for use
    // in MUX operation in next combiner stage.
	combinerInput combiner0 alpha	A texture0	unsignedIdentity	blue
	combinerInput combiner0 alpha	B zero		unsignedInvert		alpha
    combinerOutput combiner0 alpha	spare0 discard discard scaleNone biasNone false false false

	// Use MUX operation to calculate overlay alpha from diffuse grey.  Also calculates amount
	// of white to add if any.
    combinerInput combiner1 rgb		A texture0	expandNegate		rgb
    combinerInput combiner1 rgb		B zero		unsignedInvert		rgb
    combinerInput combiner1 rgb		C texture0	expandNormal		rgb
    combinerInput combiner1 rgb		D zero		unsignedInvert		rgb
    combinerOutput combiner1 rgb	discard spare0 spare1 scaleNone biasNone false false true
    // Total team colour mask alpha.  Base mask plus stripe mask.
	combinerInput combiner1 alpha	A texture0	unsignedInvert		alpha
	combinerInput combiner1 alpha	B zero		unsignedInvert		alpha
	combinerInput combiner1 alpha	C texture1	unsignedInvert		alpha
	combinerInput combiner1 alpha	D zero		unsignedInvert		alpha
    combinerOutput combiner1 alpha	discard discard spare0 scaleNone biasNone false false false
    	// Add overlay white shift.  team alpha * white shift
	// Add texture diffuse.  (1 - team alpha) * diffuse
	// Add total team colour contribution after overlay
	// AB + (1-A)C + D
    finalCombinerInput A spare0		unsignedIdentity	alpha
    finalCombinerInput B spare0		unsignedIdentity	rgb
    finalCombinerInput C texture0	unsignedIdentity	rgb
    finalCombinerInput D eTimesF	unsignedIdentity	rgb
    // multiply team colour contribution by overlay alpha
    finalCombinerInput E primary	unsignedIdentity	rgb
    finalCombinerInput F spare1		unsignedInvert		rgb
    // ship alpha
    finalCombinerInput G primary	unsignedIdentity	alpha
}

simple light(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap registerCombinerCap true
    setCap separateSpecularCap true
    setCap blendCap true
    // turn on color-material cap so that the vertex colour is interpreted as material colour
    setCap colourMaterialCap true

    srcBlend oneBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96

    textureBind 0 $glow

    combinerParam numCombiners 1

	// do nothing
	combinerOutput combiner0 rgb	discard discard discard scaleNone biasNone false false false

    // specular + primary
    finalCombinerInput A zero		unsignedInvert		rgb
    finalCombinerInput B primary	unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb
}

simple darken(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap registerCombinerCap true
    setCap separateSpecularCap true
    setCap blendCap true
    // turn on color-material cap so that the vertex colour is interpreted as material colour
    setCap colourMaterialCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96

    textureBind 0 $glow

    combinerParam numCombiners 2
    combinerParam constColour0  0 1 0 0		// rgb . const0 will replicate green into rgb

	// put greyscale RGB of glow into spare0 and specular map into spare1
    combinerInput combiner0 rgb		A texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B const0	unsignedIdentity	rgb
	combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

	// switch range from 0-1 to 1 to -1
    combinerInput combiner1 rgb		A spare0	expandNegate		rgb
    combinerInput combiner1 rgb		B zero		unsignedInvert		rgb
	combinerOutput combiner1 rgb	spare0 discard discard scaleNone biasNone true false false

    finalCombinerInput A zero		unsignedIdentity	rgb
    finalCombinerInput B zero		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb
    finalCombinerInput G spare0		unsignedInvert		blue
}

simple glow(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap lightingCap true
    setCap registerCombinerCap true
    setCap separateSpecularCap true
    setCap blendCap true
    // turn on color-material cap so that the vertex colour is interpreted as material colour
    setCap colourMaterialCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96

    textureBind 0 $glow

    combinerParam numCombiners 1
    combinerParam constColour0  0 1 0 0		// rgb . const0 will replicate green into rgb

	// put greyscale RGB of glow into spare0 and specular map into spare1
    combinerInput combiner0 rgb		A texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B const0	unsignedIdentity	rgb
	combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

    finalCombinerInput A zero		unsignedIdentity	rgb
    finalCombinerInput B zero		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedInvert		rgb
    finalCombinerInput G spare0		unsignedIdentity	blue
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

compound megalithAdditiveLight()
{
    addPass light
    addPass darken
    addPass glow
    addPass base
    addPass fog
    addPass additive 0
}
