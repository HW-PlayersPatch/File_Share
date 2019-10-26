simple base(Texture $diffuse0, Texture $glow0, Texture $diffuseOn, Texture $glowOn, Texture $diffuseOff, Texture $glowOff, Colour $teambase, Colour $teamstripe, Colour $weight, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap lightingCap true
    setCap cullCap true
    setCap gouraudCap true
    setCap texture2Cap true
    setCap texture1Cap true
    setCap texture0Cap true
    setCap separateSpecularCap true
    setCap registerCombinerCap true

    setCap texgenSCap true
    setCap texgenTCap true
    setCap texgenRCap true
    setCap texgenQCap true

    setCap colourMaterialCap true
    setCap blendCap true

    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    material specular  1 1 1 1
    material shininess 96 96 96 96

    combinerParam numCombiners 3
    combinerParam constColour0 $shadowColour
    combinerParam constColour1 $weight
    
    textureBind 1 $glowOn
    textureBind 2 $glowOff

    // average glow texture
    combinerInput combiner0 alpha	A texture1	unsignedIdentity    blue
    combinerInput combiner0 alpha	B const1    unsignedIdentity    alpha
    combinerInput combiner0 alpha	C texture2  unsignedIdentity    blue
    combinerInput combiner0 alpha	D const1    unsignedInvert      alpha
    combinerOutput combiner0 alpha 	discard discard texture1 scaleNone biasNone false false false
    combinerOutput combiner0 rgb 	discard discard discard scaleNone biasNone false false false

    // spare0 = inverted shadow colour * inverted shadow colour
    // spare1 = specular map * specular colour
    combinerInput combiner1 rgb		A texture0	unsignedInvert	    rgb
    combinerInput combiner1 rgb		B const0    unsignedInvert      rgb
    combinerInput combiner1 rgb		C texture1  unsignedIdentity    alpha
    combinerInput combiner1 rgb		D secondary unsignedIdentity    rgb
    combinerOutput combiner1 rgb	spare0 spare1 discard scaleNone biasNone false false false

    // fade colour (spare0 will have white or shadow colour)
    combinerInput combiner2 rgb		A spare0	unsignedInvert	    rgb
    combinerInput combiner2 rgb		B const0    unsignedIdentity    alpha
    combinerInput combiner2 rgb		C zero      unsignedInvert      rgb
    combinerInput combiner2 rgb		D const0    unsignedInvert      alpha
    combinerOutput combiner2 rgb 	discard discard spare0 scaleNone biasNone false false false

    // modulate with level lighting
    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B primary	unsignedIdentity	rgb
    finalCombinerInput C zero   	unsignedIdentity	rgb
    finalCombinerInput D eTimesF    unsignedIdentity	rgb
    finalCombinerInput E spare1	    unsignedIdentity	rgb
    finalCombinerInput F texture0   unsignedIdentity	rgb
    finalCombinerInput G primary	unsignedIdentity	alpha
}

compound thrusterLight()
{
    addPass base
}
