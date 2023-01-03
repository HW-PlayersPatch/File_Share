simple additive(Colour $addColour)
{
    setCap depthBufferCap true
    setCap gouraudCap     true
    setCap blendCap       true
    setCap texture0Cap    true
    setCap cullCap 	  true

    srcBlend srcAlphaBlend
    destBlend oneBlend

    fillMode solidFill
    cullMode backCull

    combineColour $addColour
    textureMode	combineMode
    combineSource	rgb		arg0	constantSrc	srcColour
    combineFunction     rgb		replaceCombine		1
    combineSource	alpha		arg0	constantSrc	srcAlpha
//    combineFunction     alpha		replaceCombine		1
    combineSource	alpha		arg1	primarySrc	srcAlpha
    combineFunction	alpha		modulateCombine		1
}

compound innateSS()
{
    addPass additive 0
}
