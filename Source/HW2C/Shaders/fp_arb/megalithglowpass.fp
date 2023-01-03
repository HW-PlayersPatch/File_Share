!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB tex = fragment.texcoord[0];      #first set of texture coordinates

OUTPUT outColour = result.color;

TEMP glow;

TEX glow, tex, texture[0], 2D;       #sample the texture

MOV outColour, glow.g;

END
