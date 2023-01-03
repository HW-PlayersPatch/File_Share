!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB tex = fragment.texcoord[0];      #first set of texture coordinates
PARAM miscValues  = { 0, 0.5, 1, 2 };

OUTPUT outColour = result.color;

TEMP glow, diffuse, badge, mask;
TEMP base, teamBaseColour, teamStripeColour, badgeColour;
TEMP teamBaseAmount, teamStripeAmount;

TEX diffuse, tex, texture[0], 2D;       #sample the texture
TEX glow, tex, texture[1], 2D;       	#sample the texture
TEX badge, tex, texture[2], 2D;			#sample the texture
TEX mask, tex, texture[3], 2D;       	#sample the texture

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

#invert the mask`s alpha and use it to discolour the badge texture
SUB mask.a, miscValues.z, mask.a;
MUL badgeColour.rgb, mask.a, badge;
#combine the mask and the badge`s alpha
MUL badgeColour.a, badge.a, mask.a;

LRP outColour, badgeColour.a, badgeColour, base;

END
