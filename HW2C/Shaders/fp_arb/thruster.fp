!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB tex = fragment.texcoord[0];      #first set of texture coordinates
ATTRIB col0 = fragment.color.primary;	#diffuse interpolated color
ATTRIB col1 = fragment.color.secondary;	#specular interpolated color
PARAM miscValues  = { 0, 0.5, 1, 2 };

OUTPUT outColour = result.color;

TEMP diffuseOn, glowOn, diffuseOff, glowOff;
TEMP diffuse, glow, base, teamBaseColour, teamStripeColour;
TEMP teamBaseAmount, teamStripeAmount, light, spec;
TEMP unFoggedColour, fogColour, weight;

#sample the textures
TEX diffuseOn, tex, texture[0], 2D;
TEX diffuseOff, tex, texture[1], 2D;
TEX glowOn, tex, texture[2], 2D;
TEX glowOff, tex, texture[3], 2D;

#average the textures
MOV weight, program.local[3];
MUL diffuse, diffuseOn, weight;
MUL glow, glowOn, weight;
SUB weight, miscValues.z, weight;
MAD diffuse, diffuseOff, weight, diffuse;
MAD glow, glowOff, weight, glow;

##adjust colour underlying base
# make darker
ADD base, diffuse, miscValues.y;
MUL teamBaseColour, base, program.local[0];
MUL teamStripeColour, base, program.local[1];
# make lighter
SUB base, diffuse, miscValues.y;
ADD teamBaseColour, base, teamBaseColour;
ADD teamStripeColour, base, teamStripeColour;

## compute amount of team colour needed
SUB teamBaseAmount, miscValues.z, diffuse.a;
SUB teamStripeAmount, miscValues.z, glow.a;

##avaerge the team colour and base texture
LRP base.rgb, teamBaseAmount, teamBaseColour, diffuse;
LRP base.rgb, teamStripeAmount, teamStripeColour, base;

## lighting
# compute specular
MUL spec, col1, glow.b;
# compute amount of glow
MUL light, miscValues.y, glow.g;
# average glow/level lighting
LRP light, glow.g, light, col0;
# add specular
ADD light, light, spec;

## final colour
MUL unFoggedColour, base, light;

## fog
MOV fogColour, program.local[2];
MUL fogColour.a, fogColour, col0;
LRP outColour, fogColour.a, fogColour, unFoggedColour;

##fade away as needed
MOV outColour.a, col0;

END 
