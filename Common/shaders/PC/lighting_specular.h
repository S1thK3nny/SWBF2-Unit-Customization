#ifndef __LIGHTING_SPECULAR_H__
#define __LIGHTING_SPECULAR_H__

#include "pcRedVertexShaderMacros.h"
#include "pcRedVertexShaderConstants.h"

// Specular Lighting Shader /////////////////////////////////////////////////////////////////////////////////
// This shader calculates specular lighting for a specified number of point lights and directional lights.
// All lighting is performed in object space.
// To use this shader add defines for the options you want to include and then include this file.
// An include file was used instead of a macro to make the shader easier to write and debug since you
// don't have to worry about add a "\" at the end of every line.  The following options are valid:
// __OPTION_LIGHT_DIRECTIONAL__	-> include directional light computation
// __OPTION_LIGHT_POINT0__		-> include light computation for point light 0
// __OPTION_LIGHT_POINT1__		-> include light computation for point light 1
// __OPTION_LIGHT_POINT23__		-> include light computation for point lights 2 and 3
// __OPTION_LIGHT_SPOT0__		-> include light computation for spot light 0
//
// NOTE:
// None of the spot light options can be specified if option "__OPTION_LIGHT_POINT23__" is specified.
////////////////////////////////////////////////////////////////////////////////////////////////////////////


#define R_WORLD_NORMAL		r11
#define R_REFLECTION_VEC	R_STATIC_DIFFUSE_LIGHTING
#define R_SPEC_POWER		c[C_CUSTOM_MIN+0].w

dp3 R_WORLD_NORMAL.x, R_NORMAL, c[C_OBJ_WORLD_M0]
dp3 R_WORLD_NORMAL.y, R_NORMAL, c[C_OBJ_WORLD_M1]
dp3 R_WORLD_NORMAL.z, R_NORMAL, c[C_OBJ_WORLD_M2]

mov R_SPECULAR_LIGHTING, c[C_CONST0].x

// calculate the reflected vertex-to-eye vector in world space
add R_REFLECTION_VEC.xyz, c[C_WORLD_VIEWPOS].xyz,-R_WORLD_POS.xyz
dp3 R_REFLECTION_VEC.w, R_REFLECTION_VEC.xyz, R_REFLECTION_VEC.xyz
rsq R_REFLECTION_VEC.w, R_REFLECTION_VEC.w
mul R_REFLECTION_VEC.xyz, R_REFLECTION_VEC.xyz, R_REFLECTION_VEC.w

dp3 R_REFLECTION_VEC.w, R_REFLECTION_VEC.xyz, R_WORLD_NORMAL.xyz
add R_REFLECTION_VEC.w,R_REFLECTION_VEC.w, R_REFLECTION_VEC.w
mad R_REFLECTION_VEC.xyz,R_REFLECTION_VEC.w, R_WORLD_NORMAL.xyz, -R_REFLECTION_VEC.xyz

#ifdef __OPTION_LIGHT_DIRECTIONAL__
	// calculate directional lights
	LIGHT_INTENSITY_DIRECTIONAL_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, c[C_LIGHT_DIRECTIONAL0_DIR], R_TEMP1)
//	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_DIRECTIONAL0_COLOR], R_SPECULAR_LIGHTING
	add R_SPECULAR_LIGHTING, R_TEMP.z, R_SPECULAR_LIGHTING

	LIGHT_INTENSITY_DIRECTIONAL_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, c[C_LIGHT_DIRECTIONAL1_DIR], R_TEMP1)
//	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_DIRECTIONAL1_COLOR], R_SPECULAR_LIGHTING
#endif

#ifdef __OPTION_LIGHT_POINT0__
	LIGHT_INTENSITY_POINT_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT0_POS], c[C_LIGHT_POINT0_POS].w, R_TEMP1, R_TEMP2)
//	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_POINT0_COLOR], R_SPECULAR_LIGHTING
	add R_SPECULAR_LIGHTING, R_TEMP.z, R_SPECULAR_LIGHTING
#endif

#ifdef __OPTION_LIGHT_POINT1__
	LIGHT_INTENSITY_POINT_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT1_POS], c[C_LIGHT_POINT1_POS].w, R_TEMP1, R_TEMP2)
//	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_POINT1_COLOR], R_SPECULAR_LIGHTING
	add R_SPECULAR_LIGHTING, R_TEMP.z, R_SPECULAR_LIGHTING
#endif

#ifdef __OPTION_LIGHT_POINT23__
	LIGHT_INTENSITY_POINT_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT2_POS], c[C_LIGHT_POINT2_POS].w, R_TEMP1, R_TEMP2)
	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_POINT2_COLOR], R_SPECULAR_LIGHTING

	LIGHT_INTENSITY_POINT_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT3_POS], c[C_LIGHT_POINT3_POS].w, R_TEMP1, R_TEMP2)
	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_POINT3_COLOR], R_SPECULAR_LIGHTING

#elif defined(__OPTION_LIGHT_SPOT0__)	// spot lights are only allowed with up to 2 point lights
/*
	LIGHT_INTENSITY_SPOT_SPECULAR(R_TEMP, R_SPEC_POWER, R_REFLECTION_VEC, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_SPOT0_POS], c[C_LIGHT_SPOT0_POS].w, c[C_LIGHT_SPOT0_DIR], c[C_LIGHT_SPOT0_PARAMS], R_TEMP1, R_TEMP2)
	mad R_SPECULAR_LIGHTING, R_TEMP.z, c[C_LIGHT_SPOT0_COLOR], R_SPECULAR_LIGHTING
*/
#endif


#undef R_WORLD_NORMAL
#undef R_RELFECTION_VEC
#undef R_SPEC_POWER

#endif //__LIGHTING_SPECULAR_H__
