static Texture $diffuseA
static Texture $diffuseB

simple base(Texture $diffuse0, Texture $diffuseA, Texture $diffuseB, Colour $weight)
{
    setCap depthBufferCap true
    setCap gouraudCap true
    setCap cullCap true
    setCap texture0Cap true
    setCap texture1Cap true
    setCap lightingCap true
    setCap registerCombinerCap true

    material ambient   1 1 1 1
    material diffuse   1 1 1 1
    material specular  0 0 0 0
    material shininess 96 96 96 96
    setVertexColour    1 1 1 1

    textureBind 0 $diffuse0
    textureBind 0 $diffuseA
    textureBind 1 $diffuseB

    combinerParam constColour0  $weight

    combinerParam numCombiners 1

    combinerInput combiner0 rgb		A texture0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		B const0	unsignedIdentity	rgb
    combinerInput combiner0 rgb		C texture1	unsignedIdentity	rgb
    combinerInput combiner0 rgb		D const0	unsignedInvert		rgb
    combinerOutput combiner0 rgb	discard discard spare0 scaleNone biasNone false false false

    finalCombinerInput A spare0		unsignedIdentity	rgb
    finalCombinerInput B primary	unsignedIdentity	rgb
    finalCombinerInput C zero		unsignedIdentity	rgb
    finalCombinerInput D zero		unsignedIdentity	rgb
}

compound resource()
{
    addPass base
}
