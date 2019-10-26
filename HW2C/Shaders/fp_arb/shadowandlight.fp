!!ARBfp1.0
OPTION ARB_precision_hint_fastest;

ATTRIB coordShadow = fragment.texcoord[0];    #shadow texture coordinates
ATTRIB coordShip = fragment.texcoord[1];      #normal texture coordinates
ATTRIB col0 = fragment.color.primary;	#diffuse interpolated color
ATTRIB col1 = fragment.color.secondary;	#specular interpolated color
#ATTRIB pos = fragment.position;			#screen position
PARAM miscValues  = { 0, 0.5, 1, 2 };

# original numbers, now set in code
#PARAM c0 = { -0.000692, -0.000868, -0.002347, 0.000450 };
#PARAM c1 = { 0.000773, -0.002042, -0.001592, 0.001880 };
#PARAM c2 = { -0.001208, -0.001198, -0.000425, -0.000915 };
#PARAM c3 = { -0.000050, 0.000105, -0.000753, 0.001719 };
#PARAM c4 = { -0.001855, -0.000004, 0.001140, -0.001212 };
#PARAM c5 = { 0.000684, 0.000273, 0.000177, 0.000647 };
#PARAM c6 = { -0.001448, 0.002095, 0.000811, 0.000421 };
#PARAM c7 = { 0.000542, 0.001491, 0.000537, 0.002367 };
# (0, 1, sample weight (1/16), z-bias)
PARAM c18 = { 0.0, 1.0, 0.0625, 0.15 };
# </new>

OUTPUT outColour = result.color;

TEMP glow, shadowColour;#, shadowAmount;
TEMP spec, prim;
TEMP R;
TEMP r0, r1, r2, r3, r4, r5, r6, r7, r9, r10;

#sample the textures
#TXP shadowAmount, coordShadow, texture[0], 2D;
TEX glow, coordShip, texture[1], 2D;

# do comparison
RCP R, coordShadow.w;
MUL R, coordShadow.z, R;
#SGE shadowAmount, shadowAmount, R;
#MOV shadowAmount.a, col0.a;

# coordinates for first two rows
ADD r0, coordShadow, program.local[7].xyzw;
ADD r1, coordShadow, program.local[7].wzyx;
ADD r2, coordShadow, program.local[8].xyzw;
ADD r3, coordShadow, program.local[8].wzyx;
ADD r4, coordShadow, program.local[9].xyzw;
ADD r5, coordShadow, program.local[9].wzyx;
ADD r6, coordShadow, program.local[10].xyzw;
ADD r7, coordShadow, program.local[10].wzyx;

# fetch two rows
TXP r0.x, r0, texture[0], 2D;
TXP r0.y, r1, texture[0], 2D;
TXP r0.z, r2, texture[0], 2D;
TXP r0.w, r3, texture[0], 2D;
TXP r4.x, r4, texture[0], 2D;
TXP r4.y, r5, texture[0], 2D;
TXP r4.z, r6, texture[0], 2D;
TXP r4.w, r7, texture[0], 2D;

# compare first row
SUB r0, R, r0;
CMP r9, -r0, c18.x, c18.y;

# sum of weighted first row
DP4 r10, r9, c18.z;

# compare second row
SUB r0, R, r4;
CMP r9, -r0, c18.x, c18.y;

# sum of weighted second row
DP4 r9, r9, c18.z;

# accumulate second row
ADD r10, r10, r9;

# coordinates for third and fourth rows
ADD r0, coordShadow, program.local[10].xyzw;
ADD r1, coordShadow, program.local[10].wzyx;
ADD r2, coordShadow, program.local[11].xyzw;
ADD r3, coordShadow, program.local[11].wzyx;
ADD r4, coordShadow, program.local[12].xyzw;
ADD r5, coordShadow, program.local[12].wzyx;
ADD r6, coordShadow, program.local[13].xyzw;
ADD r7, coordShadow, program.local[13].wzyx;

# fetch two rows
TXP r0.x, r0, texture[0], 2D;
TXP r0.y, r1, texture[0], 2D;
TXP r0.z, r2, texture[0], 2D;
TXP r0.w, r3, texture[0], 2D;
TXP r4.x, r4, texture[0], 2D;
TXP r4.y, r5, texture[0], 2D;
TXP r4.z, r6, texture[0], 2D;
TXP r4.w, r7, texture[0], 2D;

# compare third row
SUB r0, R, r0.x;
CMP r9, -r0, c18.x, c18.y;

# sum of weighted third row
DP4 r9, r9, c18.z;

# accumulate third row
ADD r10, r10, r9;

# compare fourth row
SUB r0, R, r4.x;
CMP r9, -r0, c18.x, c18.y;

# sum of weighted fourth row
DP4 r9, r9, c18.z;

# accumulate fourth row
#ADD r0, r10, r9;
ADD shadowColour, r10, r9;

#</new>

## lighting
# compute specular
MUL spec, col1, glow.b;

##shadow fade
#invert
#SUB shadowColour, miscValues.z, shadowAmount;
#use prim to hold the inverse of the shadow colour
#SUB prim, miscValues.z, program.local[4];
# change to shadow colour
#MUL shadowColour, shadowColour, prim;
#invert back to normal
#SUB shadowColour, miscValues.z, shadowColour;
#fade to no shadow
#LRP shadowColour, program.local[4].a, shadowAmount, miscValues.z;
LRP shadowColour, program.local[4].a, shadowColour, miscValues.z;

## put lighting in
MUL prim, col0, shadowColour;
MUL spec, spec, shadowColour;

ADD outColour, prim, spec;
MOV outColour.a, col0.a;

END 
