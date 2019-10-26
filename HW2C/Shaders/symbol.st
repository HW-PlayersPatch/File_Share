// boolean caps, must match r_defines.h
#define depthBufferCap        0x0001
#define ditherCap             0x0002
#define cullCap               0x0003
#define lightingCap           0x0004
#define gouraudCap            0x0005
#define blendCap              0x0006
#define alphaTestCap          0x0007
#define texture0Cap           0x0008
#define texture1Cap           0x0009
#define texture2Cap           0x000A
#define texture3Cap           0x000B
#define lineSmoothCap         0x0010
#define stencilCap            0x0011
#define normalizeCap          0x0012
#define rescaleNormalCap      0x0013
#define colourMaterialCap     0x0014
#define cullVertexCap         0x0015
#define destAlphaCap          0x0016
#define fogCap                0x0017
#define textureBiasCap        0x0018
#define texgenSCap            0x0019
#define texgenTCap            0x001A
#define texgenRCap            0x001B
#define texgenQCap            0x001C
#define offsetFillCap         0x001D
#define offsetLineCap         0x001E
#define offsetPointCap        0x001F
#define preferFewPrimsCap     0x0020
#define cubeMapCap            0x0021
#define cube0MapCap           0x0022
#define cube1MapCap           0x0023
#define cube2MapCap           0x0024
#define cube3MapCap           0x0025
#define pointSizeCap          0x0026
#define lineWidthCap          0x0027
#define pointSmoothCap        0x0028
#define polygonSmoothCap      0x0029
#define registerCombinerCap   0x002A
#define registerCombiner2Cap  0x0032
#define separateSpecularCap   0x002C
#define combineCap            0x002D
#define crossbarCap           0x002E
#define dot3Cap               0x002F
#define combine3Cap           0x0030
#define vertexProgramCap      0x0034
#define clipPlane0Cap         0x0035
#define clipPlane1Cap         0x0036
#define clipPlane2Cap         0x0037
#define clipPlane3Cap         0x0038
#define clipPlane4Cap         0x0039
#define clipPlane5Cap         0x003A
#define scissorCap            0x003B
#define pbufferCap            0x003C
#define textureShaderCap      0x003D
#define texture3DCap          0x003E
#define texture3D0Cap         0x003F
#define texture3D1Cap         0x0040
#define texture3D2Cap         0x0041
#define texture3D3Cap         0x0042
#define multisampleCap        0x0048
#define fragmentProgramCap    0x0049

// material properties
#define ambient               0x0001
#define diffuse               0x0002
#define specular              0x0003
#define shininess             0x0004
#define emission              0x0005

// blend types
#define zeroBlend             0x0300
#define oneBlend              0x0301
#define destColourBlend       0x0302
#define invDestColourBlend    0x0303
#define srcAlphaBlend         0x0304
#define invSrcAlphaBlend      0x0305
#define destAlphaBlend        0x0306
#define invDestAlphaBlend     0x0307
#define srcColourBlend        0x0308
#define invSrcColourBlend     0x0309
#define noneBlend             0x030A

// texture modes
#define replaceMode           0x0500
#define modulateMode          0x0501
#define blendMode             0x0502
#define decalMode             0x0503
#define addMode		      0x0504
#define combineMode           0x0505

// texture filters
#define pointFilter           0x0600
#define linearFilter          0x0601
#define pointPointFilter      0x0602
#define linearPointFilter     0x0603
#define pointLinearFilter     0x0604
#define linearLinearFilter    0x0605

// texture wrap modes
#define repeatTex             0x0700
#define clampTex              0x0701
#define clampEdgeTex          0x0702

// comparison functions
#define neverFunc             0x0200
#define lessFunc              0x0201
#define equalFunc             0x0202
#define lessEqualFunc         0x0203
#define greaterFunc           0x0204
#define notEqualFunc          0x0205
#define greaterEqualFunc      0x0206
#define alwaysFunc            0x0207

// polygon fill modes
#define lineFill              0x0900
#define solidFill             0x0901

// cull modes
#define frontCull             0x0A00
#define backCull              0x0A01
#define frontAndBackCull      0x0A02
#define noneCull              0x0A03

// material side
#define frontSide             0x0B00
#define backSide              0x0B02
#define frontAndBackSide      0x0B03

// texgen mode
#define noneGen               0x0C00
#define objectLinearGen       0x0C02
#define eyeLinearGen          0x0C03
#define sphereMapGen          0x0C04
#define reflectionMapGen      0x0C05
#define normalMapGen          0x0C06

// stencil operations
#define keepOp                0x0D00
#define zeroOp                0x0D01
#define replaceOp             0x0D02
#define incrementOp           0x0D03
#define decrementOp           0x0D04
#define invertOp              0x0D05

// vertex array elements
#define vertexArray             0x8074
#define normalArray             0x8075
#define colourArray             0x8076
#define indexArray              0x8077
#define textureCoordArray       0x8078
#define edgeFlagArray           0x8079

// texture env combine
#define replaceCombine			0x1E01
#define modulateCombine			0x2100
#define addCombine			0x0104
#define addSignedCombine		0x8574
#define interpolateCombine		0x8575
#define subtractCombine			0x84E7
// ... env dot3
#define dot3rgbCombine			0x86AE
#define dot3rgbaCombine			0x86AF
// ... env combine3 ATI
#define modulateAddCombine		0x8744
#define modulateAddSignedCombine 	0x8745
#define modulateSubtractCombine 	0x8746

#define arg0					0x0000
#define arg1					0x0001
#define arg2					0x0002

#define textureSrc				0x1702
#define constantSrc				0x8576
#define primarySrc				0x8577
#define previousSrc				0x8578
// ... env crossbar
#define texture0Src				0x84C0
#define texture1Src				0x84C1
#define texture2Src				0x84C2
#define texture3Src				0x84C3
#define texture4Src				0x84C4
#define texture5Src				0x84C5
#define texture6Src				0x84C6
#define texture7Src				0x84C7

// ... env route atix
#define secondarySrc			0x8747
#define fogSrc					0x0B60

#define srcColour		0x0300
#define invSrcColour		0x0301
#define srcAlpha		0x0302
#define invSrcAlpha		0x0303

// register combiner
#define combiner0                0x8550
#define combiner1                0x8551
#define combiner2                0x8552
#define combiner3                0x8553
#define combiner4                0x8554
#define combiner5                0x8555
#define combiner6                0x8556
#define combiner7                0x8557

#define A                        0x8523
#define B                        0x8524
#define C                        0x8525
#define D                        0x8526
#define E                        0x8527
#define F                        0x8528
#define G                        0x8529

#define zero                     0x0000
#define const0                   0x852A
#define const1                   0x852B
#define fog                      0x0B60
#define primary                  0x852C
#define secondary                0x852D
#define spare0                   0x852E
#define spare1                   0x852F
#define texture0                 0x84C0
#define texture1                 0x84C1
#define texture2                 0x84C2
#define texture3                 0x84C3
//#define texture4                 0x84C4
//#define texture5                 0x84C5
//#define texture6                 0x84C6
//#define texture7                 0x84C7
#define eTimesF                  0x8531
#define spare0PlusSecondary      0x8532
#define discard                  0x8530

#define unsignedIdentity         0x8536
#define unsignedInvert           0x8537
#define expandNormal             0x8538
#define expandNegate             0x8539
#define halfBiasNormal           0x853A
#define halfBiasNegate           0x853B
#define signedIdentity           0x853C
#define signedNegate             0x853D

#define scaleNone                0x0000
#define scaleTwo                 0x853E
#define scaleFour                0x853F
#define scaleHalf                0x8540

#define biasNone                 0x0000
#define biasNegHalf              0x8541

#define paramInput               0x8542
#define paramMapping             0x8543
#define paramComponentUsage      0x8544

#define paramABDot              0x8545
#define paramCDDot              0x8546
#define paramMuxSum             0x8547
#define paramScale              0x8548
#define paramBias               0x8549
#define paramABOutput           0x854A
#define paramCDOutput           0x854B
#define paramSumOutput          0x854C

#define blue			0x1905
#define alpha                   0x1906
#define rgb                  	0x1907

// program types
#define vertexProgram		0x0000
#define fragmentProgram		0x0001

// vertex programs
#define asteroidVertexProgram0	0x0001
#define asteroidVertexProgram1	0x0002
#define shipLightVertexProgram	0x0003

// fragment programs
#define shipFragmentProgram				0x0001
#define shipLightPassAdditiveFragmentProgram 0x0002
#define shipBasePassFragmentProgram		0x0003
#define shipGlowPassFragmentProgram     0x0004
#define badgeFragmentProgram     		0x0005
#define additiveFragmentProgram			0x0006
#define shipBaseWithBadgePassFragmentProgram 0x0007
#define thrusterFragmentProgram			0x0008
#define thrusterLightPassAdditiveFragmentProgram 0x0009
#define thrusterBasePassFragmentProgram	0x000a
#define thrusterGlowPassFragmentProgram 0x000b
#define megalithFragmentProgram			0x000c
#define megalithGlowPassFragmentProgram	0x000d
#define shadowAndLightFragmentProgram	0x000e
