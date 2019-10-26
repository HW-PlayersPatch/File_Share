simple base(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap registerCombinerCap true
	setCap lightingCap true
	setCap blendCap false

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
    
    // multiply team colour contribution by overlay alpha
    finalCombinerInput E primary	unsignedIdentity	rgb
    finalCombinerInput F spare1		unsignedInvert		rgb

	// Add overlay white shift.  team alpha * white shift
	// Add texture diffuse.  (1 - team alpha) * diffuse
	// Add total team colour contribution after overlay
	// AB + (1-A)C + D
    finalCombinerInput A spare0		unsignedIdentity	alpha
    finalCombinerInput B spare0		unsignedIdentity	rgb
    finalCombinerInput C texture0	unsignedIdentity	rgb
    finalCombinerInput D eTimesF	unsignedIdentity	rgb
}

simple light(Texture $diffuse, Texture $glow, Colour $teambase, Colour $teamstripe)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap registerCombinerCap true
	setCap lightingCap true
	setCap blendCap true

    srcBlend	destColourBlend
    destBlend	zeroBlend

    fillMode solidFill
    cullMode backCull

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  1 1 1 1
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    activeTexture 0
    texture $glow

    combinerParam numCombiners 1
	combinerParam constColour0 0.5 0.5 0.5 0.5
	
    combinerInput combiner0 rgb		A primary	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B zero		unsignedInvert		rgb
    combinerInput combiner0 rgb		C texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		D const0	unsignedIdentity	rgb
		
    combinerOutput combiner0 rgb	discard discard spare0 scaleNone biasNone false false false
    
    finalCombinerInput A zero		unsignedIdentity	rgb
    finalCombinerInput B zero		unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D spare0PlusSecondary		unsignedIdentity	rgb
}

compound glowAdditiveLight()
{
    addPass base
    addPass light
}


