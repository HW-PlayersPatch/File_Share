!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB tex = fragment.texcoord[0];      #first set of texture coordinates
ATTRIB col0 = fragment.color.primary;	#diffuse interpolated color
ATTRIB col1 = fragment.color.secondary;	#specular interpolated color
PARAM miscValues  = { 0, 0.5, 1, 2 };

OUTPUT outColour = result.color;

TEMP glow, spec;

TEX glow, tex, texture[0], 2D;       #sample the texture

## lighting
# compute specular
MUL spec, col1, glow.b;
# add specular
ADD outColour, col0, spec;

END
