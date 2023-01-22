#ifndef __PCREDVERTEXSHADERMACROS_H__
#define __PCREDVERTEXSHADERMACROS_H__

////////////////////////////////////////////////////////////////////////////////////////////
// NOTES ON D3D ASSEMBLER
// + If you want comments to appear in the macro code use the /*..*/ version of comments
//	 the other types of comments cancel the line continuation
// + There must be a newline character at the end of the file or the assembler gets confused
// + When you use the line continuation operator '\' make sure to have a new line immediately
//   after it
////////////////////////////////////////////////////////////////////////////////////////////


#define V_POS						v0
#define V_WEIGHTS					v1
#define V_INDICES					v2
#define V_NORMAL					v3
#define V_BINORMAL_S				v4
#define V_BINORMAL_T				v5
#define V_COLOR						v6
#define V_TEXCOORDS					v7
#define V_TEXCOORDS2				v8

// temp registers
#define R_TEMP						r0
#define R_TEMP1						r1
#define R_TEMP2						r2

// transform -> lighting -> custom fragment
#define R_POS						r3	// obj space position
#define R_NORMAL					r4	// obj space normal
#define R_BINORMAL_S				r5	// obj space binormal S
#define R_BINORMAL_T				r6	// obj space binormal T
#define R_MATERIAL_COLOR			r7	// material diffuse color
#define R_DIFFUSE_LIGHTING			r8	// diffuse vertex lighting (rgb light color, a shadow intensity)
#define R_SPECULAR_LIGHTING			r8	// specular vertex lighting
#define R_WORLD_POS					r10	// world space position

// transform -> lighting
#define R_STATIC_DIFFUSE_LIGHTING			r9  // lighting color from static lights, w projection atten

#define R_DIFFUSE_DIRECTIONAL_LIGHTING_COLOR r9


// transform a position from world to projection space
#define POS_PROJECT(OUTPUT_POS)						\
dp4 OUTPUT_POS.x, R_WORLD_POS, c[C_WORLD_PROJ_M0]	\
dp4 OUTPUT_POS.y, R_WORLD_POS, c[C_WORLD_PROJ_M1]	\
dp4 OUTPUT_POS.z, R_WORLD_POS, c[C_WORLD_PROJ_M2]	\
dp4 OUTPUT_POS.w, R_WORLD_POS, c[C_WORLD_PROJ_M3]

// transforms an object space normal to world space
#define OBJECT_TO_WORLD_NORMAL(output_normal, object_normal)	\
dp3 output_normal.x, object_normal, c[C_OBJ_WORLD_M0]				\
dp3 output_normal.y, object_normal, c[C_OBJ_WORLD_M1]				\
dp3 output_normal.z, object_normal, c[C_OBJ_WORLD_M2]

// CAMFOG = (cam_fog_end - view_z)/(cam_fog_end - cam_fog_start)  (1 @ fog_start ... 0 @ fog_end)
// WORLDFOG = (world_fog_end - world_y)/(world_fog_end - world_fog_start)  (1 @ fog_start ... 0 @ fog_end)
// FOG = MIN(CAMFOG,WORLDFOG)
#define FOG(camspace_z, world_pos, temp)			\
mad temp.x, camspace_z, c[C_FOG].x, c[C_FOG].y		\
mad temp.y, world_pos.y, c[C_FOG].z, c[C_FOG].w		\
min oFog, temp.x, temp.y

// FADE = (fade_end - view_z)/(fade_end - fade_start)  (1 @ fade_start to 0 @ fade_end)
// R_FADE.zw = (view_z, FADE)
#define NEARSCENEFADE(R_FADE)					\
dp4 R_FADE.z, R_WORLD_POS, c[C_WORLD_PROJ_M3]	\
mad R_FADE.w, R_FADE.z, c[C_NEARSCENEFADE].x, c[C_NEARSCENEFADE].y

#define CROSS_PRODUCT(OUTPUT, V1, V2)	\
mul OUTPUT.xyz, V1.zxy, V2.yzx			\
mad OUTPUT.xyz, V1.yzx, V2.zxy, -OUTPUT.xyz

/* do a lerp to choose a value xA+(1-x)B => x(A-B) + B */
#define LERP(output, alpha, A, B, temp)						\
add temp, A, -B												\
mad output, temp, alpha, B

#define HARD_SKIN_POSITION(R_OUTPOS, R_INDEX, R_INPOS)	\
mov a0.x, R_INDEX										\
dp4 R_OUTPOS.x, R_INPOS, c[a0.x + C_BONE0_M0]			\
dp4 R_OUTPOS.y, R_INPOS, c[a0.x + C_BONE0_M1]			\
dp4 R_OUTPOS.z, R_INPOS, c[a0.x + C_BONE0_M2]			\
mov R_OUTPOS.w, c[C_CONST0].z

#define HARD_SKIN_NORMAL(R_OUTNORMAL, R_INDEX, R_INNORMAL)	\
mov a0.x, R_INDEX											\
dp3 R_OUTNORMAL.x, c[a0.x + C_BONE0_M0], R_INNORMAL			\
dp3 R_OUTNORMAL.y, c[a0.x + C_BONE0_M1], R_INNORMAL			\
dp3 R_OUTNORMAL.z, c[a0.x + C_BONE0_M2], R_INNORMAL			\

#define GET_SOFT_SKIN_MATRIX(R_INDICES, R_WEIGHTS, R_SKIN_M0, R_SKIN_M1, R_SKIN_M2, R_TEMP)	\
mov a0.x, R_INDICES.x											\
mul R_SKIN_M0, R_WEIGHTS.x, c[a0.x + C_BONE0_M0]				\
mul R_SKIN_M1, R_WEIGHTS.x, c[a0.x + C_BONE0_M1]				\
mul R_SKIN_M2, R_WEIGHTS.x, c[a0.x + C_BONE0_M2]				\
																\
mov a0.x, R_INDICES.y											\
mad R_SKIN_M0, R_WEIGHTS.y, c[a0.x + C_BONE0_M0], R_SKIN_M0		\
mad R_SKIN_M1, R_WEIGHTS.y, c[a0.x + C_BONE0_M1], R_SKIN_M1		\
mad R_SKIN_M2, R_WEIGHTS.y, c[a0.x + C_BONE0_M2], R_SKIN_M2		\
																\
dp4 R_TEMP.z, R_WEIGHTS.xyzw, c[C_CONST0].wwxz					\
mov a0.x, R_INDICES.z											\
mad R_SKIN_M0, R_TEMP.z, c[a0.x + C_BONE0_M0], R_SKIN_M0		\
mad R_SKIN_M1, R_TEMP.z, c[a0.x + C_BONE0_M1], R_SKIN_M1		\
mad R_SKIN_M2, R_TEMP.z, c[a0.x + C_BONE0_M2], R_SKIN_M2

///////////////////// CREATE A DIRECTIONAL BASIS ////////////////////
// uses world y as reference up vector
// the direction is basis_z
#define CREATE_BASIS(basis_x, basis_y, direction, temp)\
/* take worldY x basisZ = (basisZ.z, 0, -basisZ.x) */			\
mul basis_x.xyz, direction.zzx, c[C_CONST0].zxw					\
																\
/* normalize light x */											\
dp3 temp.x, basis_x, basis_x									\
rsq temp.y, temp.x												\
mul basis_x, temp.y, basis_x									\
																\
/* determine if the ref up vector was suitable */				\
slt temp.x, c[C_CONST0].x, temp.x								\
																\
/* do a lerp to choose a value xA+(1-x)B => x(A-B) + B */		\
add basis_x.xyz, basis_x, -c[C_CONST0].zxx						\
mad basis_x.xyz, basis_x.xyz, temp.x, c[C_CONST0].zxx			\
																\
/* get the light y vector */									\
CROSS_PRODUCT(basis_y, direction, basis_x)


//////////////////// GETS LIGHTING COMPONENTS ///////////////////
// this macro gets the light direction and the light attenuation
// it handles point lights and directional lights.  For direction lights
// light_pos should be -lightDir and invRadiusSq should be 0
#define GET_LIGHT_COMPONENTS(out_lightDir, world_pos, light_pos, invRadiusSq, temp1, zero, one) \
/* find light direction temp1.xyz = light dir, temp1.w = d^2 */			\
slt temp1.w, zero, invRadiusSq											\
mad out_lightDir.xyz, world_pos, temp1.w, -light_pos					\
dp3 out_lightDir.w, out_lightDir.xyz, out_lightDir.xyz					\
																		\
/* calculate point attenuated intensity = max((1 - d^2/R^2),0) */		\
mad temp1.w,-out_lightDir.w, invRadiusSq, one							\
max out_lightDir.w, temp1.w, c[C_CONST0].xxxx



//////////////////// COMPUTE DIRECTIONAL AMBIENT CONTRIBUTION ///////////////////
// lerp between the two ambient color (hemisphere lighting) using the world normal y component
#define LIGHT_AMBIENT(output,world_normal, top_ambient, bottom_ambient, scalar_temp)	\
mad scalar_temp, world_normal.y, -c[C_CONST0].yyyy, c[C_CONST0].yyyy					\
mad output.xyz, top_ambient, -scalar_temp, top_ambient									\
mad output.xyz, bottom_ambient, scalar_temp, output.xyz

///////////////////////// DIRECTIONAL LIGHT INTENSITY ///////////////////////////
#define LIGHT_INTENSITY_DIRECTIONAL_DIFFUSE(output,normal,dir)	\
dp3 output, normal.xyz,-dir.xyz			\
max output, output, c[C_CONST0].x		

#define LIGHT_INTENSITY_DIRECTIONAL_SPECULAR(output,power,reflection,normal,dir,temp)	\
dp3 temp.x, normal.xyz,-dir.xyz		\
dp3 temp.y, reflection.xyz,-dir.xyz	\
mov temp.w, power					\
lit output, temp


////////////////////////////// POINT LIGHT INTENSITY ////////////////////////////
#define LIGHT_INTENSITY_POINT_DIFFUSE(output, normal, vertex_pos, light_pos, invRangeSq, out_lightDir, temp2)	\
/* find light direction temp1.xyz = light dir, temp1.w = d^2*/	\
add out_lightDir.xyz, vertex_pos, -light_pos					\
dp3 temp2.w, out_lightDir.xyz, out_lightDir.xyz					\
rsq temp2.x, temp2.w											\
mul out_lightDir.xyz, out_lightDir.xyz, temp2.x					\
																					\
/* calculate point attenuated intensity = max((1 - d^2/R^2),0)*max(n dot -l), 0)*/	\
mov temp2.x, c[C_CONST0].z															\
mad temp2.z,-temp2.w, invRangeSq, temp2.x											\
dp3 temp2.y, normal.xyz,-out_lightDir.xyz											\
max temp2, temp2, c[C_CONST0].xxxx													\
mul output, temp2.y, temp2.z

#define LIGHT_INTENSITY_POINT_SPECULAR(output, power, reflection, normal, vertex_pos, light_pos, invRangeSq, temp1, temp2)	\
/* find light direction temp1.xyz = light dir, temp1.w = d^2*/						\
add temp1.xyz, vertex_pos, -light_pos												\
dp3 temp1.w, temp1.xyz, temp1.xyz													\
																					\
/* calculate point attenuated intensity = max((1 - d^2/R^2),0)*max(n dot -l), 0)*/	\
mov temp2.xyzw, c[C_CONST0].z															\
mad temp2.z,-temp1.w, invRangeSq, temp2.x											\
max temp2, temp2, c[C_CONST0].xxxx													\
																					\
/* calculate specular factor */														\
dp3 temp2.x, normal.xyz,-temp1.xyz													\
dp3 temp2.y, reflection,-temp1.xyz													\
mov temp2.w, power																	\
lit temp1, temp2																	\
mul output, temp1.z, temp2.z														\


////////////////////////////// SPOT LIGHT INTENSITY ////////////////////////////
// bidirectional flag = 2.0 if the spot light is bidirectional, 0.0 otherwise
#define LIGHT_INTENSITY_SPOT_DIFFUSE(output_intensity, normal, vertex_pos, light_pos, invRangeSq, light_dir, light_params, bidirectional, temp1, temp2)	\
/* find light direction temp1.xyz = light dir, temp1.w = d^2*/		\
add temp1.xyz, vertex_pos, -light_pos								\
dp3 temp1.w, temp1.xyz, temp1.xyz									\
rsq temp2.w, temp1.w												\
mul temp1.xyz, temp1.xyz, temp2.w									\
																	\
/* calculate angular attenuation (use abs value if bidirectional)*/	\
dp3 temp2, temp1.xyz, light_dir.xyz									\
slt temp2.x, temp2.w, c[C_CONST0].x									\
mov temp2.y, c[C_CONST0].z											\
mad temp2.x, bidirectional, -temp2.x, temp2.y 						\
mul temp2.w, temp2.w, temp2.x										\
																	\
/* compute distance attenuation */									\
mad temp2.z,-temp1.w, invRangeSq, temp2.y							\
max temp2, temp2, c[C_CONST0].xxxx									\
																	\
/* set if inside the inner/outer cone */							\
sge temp2.y, temp2.w, light_params.x								\
slt temp2.x, temp2.w, light_params.y								\
mul temp2.z, temp2.z, temp2.y										\
																	\
/* compute the falloff if inbetween the inner and outer cone */		\
add temp2.y, temp2.w, -light_params.x								\
mul temp2.y, temp2.y, light_params.z								\
mul temp2.w, light_params.w, temp2.x								\
dp3 temp2.x, normal,-temp1.xyz										\
lit temp1, temp2													\
																	\
/* calculate spot0 attenuated intensity = max((1 - d^2/R^2), 0) * max((n dot -l), 0) * (0 if behind spot) * (spot atten factor) */	\
max temp2, temp2, c[C_CONST0].xxxx									\
mul temp2.z, temp2.z, temp1.z										\
mul output_intensity, temp2.z, temp2.x

/******************************** Bump Lighting Macros ****************************************/

#define BUMP_DIR_LIGHT(output_dir, world_normal, world_binormal_s, world_binormal_t, light_dir)	\
/* rotate light into tangent space */				\
dp3 output_dir.x, -light_dir, world_binormal_s		\
dp3 output_dir.y, -light_dir, world_binormal_t		\
dp3 output_dir.z, -light_dir, world_normal

#define BUMP_POINT_LIGHT(output_texcoord, world_pos, world_normal, world_binormal_s, world_binormal_t, light_pos, invRadius, temp1, temp2)	\
/* calculate light space coordinates = (world_pos - light_pos) / (radius) */	\
add temp1.xyz, world_pos, -light_pos											\
mul temp1.xyz, temp1.xyz, invRadius												\
																				\
/* rotate light into tangent space */											\
dp3 temp2.x, temp1, world_binormal_s											\
dp3 temp2.y, temp1, world_binormal_t											\
dp3 temp2.z, temp1, world_normal												\
																				\
/* calculate light volume texture coordinates by biasing with _bx2 */			\
mad output_texcoord.xyz, temp2.xyz, c[C_CONST0].y, c[C_CONST0].y


//#define BUMP_SPOT_LIGHT(output_texcoord, world_pos, world_normal, world_binormal_s, world_binormal_t, light_pos, light_dir, invRadius, temp1, temp2)	\

#define PIXEL_POINT_LIGHT(output_texcoord, world_pos, light_pos, invRadius, temp1)	\
/* calculate light space coordinates = (world_pos - light_pos) / (radius) */	\
add temp1.xyz, world_pos, -light_pos											\
mul temp1.xyz, temp1.xyz, invRadius												\
																				\
/* calculate light volume texture coordinates by biasing with _bx2 */			\
mad output_texcoord.xyz, temp1.xyz, c[C_CONST0].y, c[C_CONST0].y




/****************************** Shadow Extrusion Macros ***************************************/

// extends the position if the normal facing away from the 
// pos += (normal dot lightDir >= 0) ? extrusionLength+extrusionOffset : extrusionOffset
#define SHADOW_EXTRUDE_DIRECTIONAL(R_POS, R_NORMAL, R_LIGHT_DIR, R_EXTRUSION_LENGTH, R_EXTRUSION_OFFSET, R_TEMP) \
dp3 R_TEMP.w, R_NORMAL.xyz, -R_LIGHT_DIR.xyz						\
sge R_TEMP.w, R_TEMP.w, c[C_CONST0].x								\
mad R_TEMP.w, R_TEMP.w, R_EXTRUSION_LENGTH, R_EXTRUSION_OFFSET		\
mad R_POS.xyz, R_TEMP.w, R_LIGHT_DIR.xyz, R_POS.xyz					


// extends the position if the normal facing away from the light direction
// pos += (normal dot lightDir >= 0) ? light_radius+extrusionOffset : extrusionOffset
#define SHADOW_EXTRUDE_POINT(output_pos, normal, light_pos, light_radius, extrusion_offset, temp1, temp2) \
/* find light direction temp1.xyz = light dir, temp1.w = d*/	\
add temp1.xyz, output_pos, -light_pos							\
dp3 temp1.w, temp1.xyz, temp1.xyz								\
rsq temp2.x, temp1.w											\
mul temp1, temp1, temp2.x										\
																\
/* find the amount to extrude (temp2.x)*/						\
add temp2.x, light_radius, -temp1.w								\
max temp2.x, temp2.x, c[C_CONST0].x								\
																\
/* do the extrusion */											\
dp3 temp2.w, normal.xyz, -temp1.xyz								\
sge temp2.w, temp2.w, c[C_CONST0].x								\
mad temp2.w, temp2.w, temp2.x, extrusion_offset					\
mad output_pos.xyz, temp2.w, temp1.xyz, output_pos.xyz


#endif
