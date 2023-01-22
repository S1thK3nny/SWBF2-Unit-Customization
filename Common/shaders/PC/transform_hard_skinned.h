#ifndef __TRANSFORM_SKINNED_H__
#define __TRANSFORM_SKINNED_H__

#include "pcRedVertexShaderMacros.h"
#include "pcRedVertexShaderConstants.h"

// Hard Skinned Transform Shader ///////////////////////////////////////////////////////////////////////////
// This shader calculates object space positions and optionally normals and binormals for a 1 bone skinned vertex.
// The material color is also setup and the ambient light is added to the diffuse color.
// To use this shader add defines for the options you want to include and then include this file.
// An include file was used instead of a macro to make the shader easier to write and debug since you
// don't have to worry about add a "\" at the end of every line.  The following options are valid:
// __OPTION_TRANSFORM_NORMALS__		-> transform the normals to object space
// __OPTION_TRANSFORM_BINORMALS__	-> transform the binormals to object space
// __OPTION_TRANSFORM_NORMALIZE__	-> normalizes normals and binormals
// __OPTION_DECLARE_COLOR__			-> adds a declaration for the color
// __OPTION_DECLARE_TEXCOORDS__		-> adds a declaration for the texcoords
////////////////////////////////////////////////////////////////////////////////////////////////////////////

dcl_position		V_POS
dcl_blendindices	V_INDICES

#ifdef __OPTION_TRANSFORM_NORMALS__
dcl_normal		V_NORMAL
#endif

#ifdef __OPTION_TRANSFORM_BINORMALS__
dcl_tangent		V_BINORMAL_S
dcl_binormal	V_BINORMAL_T
#endif

#ifdef __OPTION_DECLARE_COLOR__
dcl_color		V_COLOR
#endif

#ifdef __OPTION_DECLARE_TEXCOORDS__
dcl_texcoord	V_TEXCOORDS
#endif

// internal registers
#define R_INDICES r8

// decompress pos to temp
mul R_TEMP, c[C_POS_DECOMPRESS0], V_POS
add R_TEMP, c[C_POS_DECOMPRESS1], R_TEMP

// calculate 1 bone skinning matrix
mul R_INDICES.xyz, V_INDICES.xyz, c[C_CONST1].www
mov a0.x, R_INDICES.x

// transform pos to object space
dp4 R_POS.x, R_TEMP, c[a0.x + C_BONE0_M0]
dp4 R_POS.y, R_TEMP, c[a0.x + C_BONE0_M1]
dp4 R_POS.z, R_TEMP, c[a0.x + C_BONE0_M2]
mov R_POS.w, c[C_CONST0].z

// transform position to world space
dp4 R_WORLD_POS.x, R_POS, c[C_OBJ_WORLD_M0]
dp4 R_WORLD_POS.y, R_POS, c[C_OBJ_WORLD_M1]
dp4 R_WORLD_POS.z, R_POS, c[C_OBJ_WORLD_M2]
mov R_WORLD_POS.w, c[C_CONST0].z

#ifdef __OPTION_TRANSFORM_NORMALS__
// decompress and transform normal to object space
mad R_TEMP.xyz, V_NORMAL.xyz, c[C_NORMALTEX_DECOMPRESS].xxx, c[C_NORMALTEX_DECOMPRESS].yyy
dp3 R_NORMAL.x, c[a0.x + C_BONE0_M0], R_TEMP
dp3 R_NORMAL.y, c[a0.x + C_BONE0_M1], R_TEMP
dp3 R_NORMAL.z, c[a0.x + C_BONE0_M2], R_TEMP

	#ifdef __OPTION_TRANSFORM_NORMALIZE__
		// renormalize normal
		dp3 R_TEMP.w, R_NORMAL.xyz, R_NORMAL.xyz
		rsq R_ILU.x, R_TEMP.w
		mul R_NORMAL.xyz, R_NORMAL.xyz, R_ILU.x
	#endif
#endif

#ifdef __OPTION_TRANSFORM_BINORMALS__
// decompress and transform binormals to object space
mad R_TEMP.xyz, V_BINORMAL_S.xyz, c[C_NORMALTEX_DECOMPRESS].xxx, c[C_NORMALTEX_DECOMPRESS].yyy
dp3 R_BINORMAL_S.x, c[a0.x + C_BONE0_M0], R_TEMP
dp3 R_BINORMAL_S.y, c[a0.x + C_BONE0_M1], R_TEMP
dp3 R_BINORMAL_S.z, c[a0.x + C_BONE0_M2], R_TEMP
mad R_TEMP.xyz, V_BINORMAL_T.xyz, c[C_NORMALTEX_DECOMPRESS].xxx, c[C_NORMALTEX_DECOMPRESS].yyy
dp3 R_BINORMAL_T.x, c[a0.x + C_BONE0_M0], R_TEMP
dp3 R_BINORMAL_T.y, c[a0.x + C_BONE0_M1], R_TEMP
dp3 R_BINORMAL_T.z, c[a0.x + C_BONE0_M2], R_TEMP

	#ifdef __OPTION_TRANSFORM_NORMALIZE__
		// renormalize binormal s
		dp3 R_TEMP.w, R_BINORMAL_S.xyz, R_BINORMAL_S.xyz
		rsq R_ILU.x, R_TEMP.w
		mul R_BINORMAL_S.xyz, R_BINORMAL_S.xyz, R_ILU.x

		// renormalize binormal t
		dp3 R_TEMP.w, R_BINORMAL_T.xyz, R_BINORMAL_T.xyz
		rsq R_ILU.x, R_TEMP.w
		mul R_BINORMAL_T.xyz, R_BINORMAL_T.xyz, R_ILU.x
	#endif
#endif


#ifdef __OPTION_DECLARE_COLOR__
// c[C_COLOR_STATE] = ( LIGHTINGCOLOR ? 1 : 0, LIGHTINGCOLOR ? 0 : 1, 0, 1 )
mad R_MATERIAL_COLOR, V_COLOR, c[C_COLOR_STATE].yyyw, c[C_COLOR_STATE].xxxz
mul R_MATERIAL_COLOR, R_MATERIAL_COLOR, c[C_COLOR_DIFFUSE]
mad R_STATIC_DIFFUSE_LIGHTING, V_COLOR, c[C_COLOR_STATE].xxxz, c[C_COLOR_STATE].zzzz
#else
mov R_MATERIAL_COLOR, c[C_COLOR_DIFFUSE]
mov R_STATIC_DIFFUSE_LIGHTING, c[C_CONST0].xxxx
#endif

// initialize diffuse lighting color to HDR lighting scale which effectively turns off lighting
mov R_DIFFUSE_LIGHTING, c[C_HDR].zzzw

#endif
