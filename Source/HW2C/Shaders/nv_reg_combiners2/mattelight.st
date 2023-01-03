simple base(Texture $diffuse, Colour $fogColour, Colour $addColour, Colour $shadowColour)
{
    setCap depthBufferCap true
    setCap lightingCap true
    setCap cullCap true
    setCap gouraudCap true
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

    combinerParam numCombiners 2
    combinerParam constColour0 $shadowColour
    
    // spare0 = inverted shadow colour * inverted shadow colour
    // spare1 = specular map
    combinerInput combiner0 rgb		A texture0	unsignedInvert	    rgb
    combinerInput combiner0 rgb		B const0    unsignedInvert      rgb
    combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone false false false

    // fade colour (spare0 will have white or shadow colour)
    combinerInput combiner1 rgb		A spare0	unsignedInvert	    rgb
    combinerInput combiner1 rgb		B const0    unsignedIdentity    alpha
    combinerInput combiner1 rgb		C zero      unsignedInvert      rgb
    combinerInput combiner1 rgb		D const0    unsignedInvert      alpha
    combinerOutput combiner1 rgb 	discard discard spare0 scaleNone biasNone false false false

    // modulate with level lighting
    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B primary	unsignedIdentity	rgb
    finalCombinerInput C zero   	unsignedIdentity	rgb
    finalCombinerInput D zero       unsignedIdentity	rgb
    finalCombinerInput G primary	unsignedIdentity	alpha
}

compound matteLight()
{
    addPass base
}
