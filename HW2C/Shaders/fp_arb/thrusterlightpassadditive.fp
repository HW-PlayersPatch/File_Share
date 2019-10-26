!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB tex = fragment.texcoord[0];      #first set of texture coordinates
ATTRIB col0 = fragment.color.primary;	#diffuse interpolated color
ATTRIB col1 = fragment.color.secondary;	#specular interpolated color
PARAM miscValues  = { 0, 0.5, 1, 2 };

OUTPUT outColour = result.color;

TEMP glow, spec;
TEMP glowOn, glowOff, weight;

#sample the textures
TEX glowOn, tex, texture[0], 2D;
TEX glowOff, tex, texture[1], 2D;

#average the textures
MOV weight, program.local[3];
MUL glow, glowOn, weight;
SUB weight, miscValues.z, weight;
MAD glow, glowOff, weight, glow;

## lighting
# compute specular
MUL spec, col1, glow.b;
# add specular
ADD outColour, col0, spec;

END
