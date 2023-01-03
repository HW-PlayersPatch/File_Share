!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB coordShadow = fragment.texcoord[0];    #shadow texture coordinates
ATTRIB coordShip = fragment.texcoord[1];      #normal texture coordinates
ATTRIB col0 = fragment.color.primary;	#diffuse interpolated color
ATTRIB col1 = fragment.color.secondary;	#specular interpolated color
#ATTRIB pos = fragment.position;			#screen position
PARAM miscValues  = { 0, 0.5, 1, 2 };

OUTPUT outColour = result.color;

TEMP glow, shadowColour, shadowAmount;
TEMP spec, prim;
TEMP R;

#sample the textures
TXP shadowAmount, coordShadow, texture[0], 2D;
TEX glow, coordShip, texture[1], 2D;

RCP R, coordShadow.w;
MUL R, coordShadow.z, R;
SGE shadowAmount, shadowAmount, R;
MOV shadowAmount.a, col0.a;

## lighting
# compute specular
MUL spec, col1, glow.b;

##shadow fade
#invert
SUB shadowColour, miscValues.z, shadowAmount;
#use prim to hold the inverse of the shadow colour
SUB prim, miscValues.z, program.local[4];
# change to shadow colour
MUL shadowColour, shadowColour, prim;
#invert back to normal
SUB shadowColour, miscValues.z, shadowColour;
#fade to no shadow
LRP shadowColour, program.local[4].a, shadowColour, miscValues.z;

## put lighting in
MUL prim, col0, shadowColour;
MUL spec, spec, shadowColour;

ADD outColour, prim, spec;
MOV outColour.a, col0.a;

END 
