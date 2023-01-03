simple over(Colour $col)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap lightingCap false
    setCap cullCap true
    setCap colourMaterialCap true
	setCap texture0Cap false
	setCap blendCap true
    srcBlend srcAlphaBlend
    destBlend invSrcAlphaBlend

    setVertexColour $col

    fillMode lineFill
    cullMode frontCull

    lineWidth 2
}

compound mouseover()
{
    addPass over
}