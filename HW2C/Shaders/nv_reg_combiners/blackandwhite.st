simple default(Texture $diffuse)
{
    setCap gouraudCap          true
    setCap lightingCap         false
    setCap registerCombinerCap true
    setCap texture0Cap         true

    // Assume that the blend mode is set outside of this script.
    // We don't want to explicitly set that here since the inverse block would
    //  "unset" the blend mode ... something that we don't want.

    fillMode solidFill

    textureBind 0 $diffuse

    combinerParam numCombiners 1
    combinerParam constColour0 0.3 0.59 0.11 1

    // multiply weight with texture
    combinerInput combiner0 rgb		A texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B const0	unsignedIdentity	rgb

    combinerOutput combiner0 rgb	spare0 discard discard scaleNone biasNone true false false

    combinerInput combiner0 alpha	A primary	unsignedIdentity	alpha
    combinerInput combiner0 alpha	B texture0	unsignedIdentity	alpha

    combinerOutput combiner0 alpha	spare0 discard discard scaleNone biasNone false false false
    
    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B primary	unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb

    finalCombinerInput G spare0		unsignedIdentity	alpha
}

compound blackAndWhite()
{
    addPass default
}
