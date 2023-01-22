#ifndef __TRANSFORM_UNSKINNED_H__
#define __TRANSFORM_UNSKINNED_H__

#include "pcRedVertexShaderMacros.h"
#include "pcRedVertexShaderConstants.h"

// Unskinned Transform Shader /////////////////////////////////////////////////////////////////////////////////
// This shader calculates object space positions and optionally normals and binormals for an unskinned vertex.
// The material color is also setup and the ambient light is added to the diffuse color.
// To use this shader add defines for the options you want to include and then include this file.
// An include file was used instead of a macro to make the shader easier to write and debug since you
// don't have to worry about add a "\" at the end of every line.  The following options are valid:
// __OPTION_TRANSFORM_NORMALS__		-> transform the normals to object space
// __OPTION_TRANSFORM_BINORMALS__	-> transform the binormals to object space
// __OPTION_DECLARE_COLOR__			-> adds a declaration for the color
// __OPTION_DECLARE_TEXCOORDS__		-> adds a declaration for the texcoords
////////////////////////////////////////////////////////////////////////////////////////////////////////////

dcl_position	V_POS

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

// decompress position
mul R_POS, c[C_POS_DECOMPRESS0], V_POS
add R_POS, c[C_POS_DECOMPRESS1], R_POS

// transform position to world space
dp4 R_WORLD_POS.x, R_POS, c[C_OBJ_WORLD_M0]
dp4 R_WORLD_POS.y, R_POS, c[C_OBJ_WORLD_M1]
dp4 R_WORLD_POS.z, R_POS, c[C_OBJ_WORLD_M2]
mov R_WORLD_POS.w, c[C_CONST0].z

#ifdef __OPTION_TRANSFORM_NORMALS__
mad R_NORMAL.xyz, V_NORMAL.xyz, c[C_NORMALTEX_DECOMPRESS].xxx, c[C_NORMALTEX_DECOMPRESS].yyy
#endif

#ifdef __OPTION_TRANSFORM_BINORMALS__
mad R_BINORMAL_S.xyz, V_BINORMAL_S.xyz, c[C_NORMALTEX_DECOMPRESS].xxx, c[C_NORMALTEX_DECOMPRESS].yyy
mad R_BINORMAL_T.xyz, V_BINORMAL_T.xyz, c[C_NORMALTEX_DECOMPRESS].xxx, c[C_NORMALTEX_DECOMPRESS].yyy
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
