!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB tex = fragment.texcoord[0];      #first set of texture coordinates
PARAM glowValue  = { 0.5, 0.5, 0.5, 0.5 };
PARAM miscValues  = { 0, 0.5, 1, 2 };

OUTPUT outColour = result.color;

TEMP glow;
TEMP glowOn, glowOff, weight;

#sample the textures
TEX glowOn, tex, texture[0], 2D;
TEX glowOff, tex, texture[1], 2D;

#average the textures
MOV weight, program.local[3];
MUL glow, glowOn, weight;
SUB weight, miscValues.z, weight;
MAD glow, glowOff, weight, glow;


MOV outColour.rgb, glowValue.g;
MOV outColour.a, glow.g;

END
