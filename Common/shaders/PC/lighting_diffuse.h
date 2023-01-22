#ifndef __LIGHTING_DIFFUSE_H__
#define __LIGHTING_DIFFUSE_H__

#include "pcRedVertexShaderMacros.h"
#include "pcRedVertexShaderConstants.h"


// Diffuse Lighting Shader /////////////////////////////////////////////////////////////////////////////////
// This shader calculates diffuse lighting for a specified number of point lights and directional lights.
// All lighting is performed in object space.
// To use this shader add defines for the options you want to include and then include this file.
// An include file was used instead of a macro to make the shader easier to write and debug since you
// don't have to worry about add a "\" at the end of every line.  The following options are valid:
// __OPTION_LIGHT_DIRECTIONAL__	-> include directional light computation
// __OPTION_LIGHT_POINT0__		-> include light computation for point light 0
// __OPTION_LIGHT_POINT1__		-> include light computation for point light 1
// __OPTION_LIGHT_POINT23__		-> include light computation for point lights 2 and 3
// __OPTION_LIGHT_SPOT0__		-> include light computation for spot light 0
// __OPTION_LIGHT_SPOT1__		-> include light computation for spot light 1
//
// NOTE:
// None of the spot light options can be specified if option "__OPTION_LIGHT_POINT23__" is specified.
////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define R_WORLD_NORMAL  r11

dp3 R_WORLD_NORMAL.x, R_NORMAL, c[C_OBJ_WORLD_M0]
dp3 R_WORLD_NORMAL.y, R_NORMAL, c[C_OBJ_WORLD_M1]
dp3 R_WORLD_NORMAL.z, R_NORMAL, c[C_OBJ_WORLD_M2]

mov R_DIFFUSE_LIGHTING, c[C_CONST0].x

LIGHT_AMBIENT(R_TEMP, R_WORLD_NORMAL, c[C_LIGHT_AMBIENT_COLOR0], c[C_LIGHT_AMBIENT_COLOR1], R_TEMP1)
add R_DIFFUSE_LIGHTING.xyz, R_TEMP.xyz, R_STATIC_DIFFUSE_LIGHTING.xyz

#ifdef __OPTION_LIGHT_DIRECTIONAL__
	// calculate directional lights
	LIGHT_INTENSITY_DIRECTIONAL_DIFFUSE(R_TEMP.x, R_WORLD_NORMAL, c[C_LIGHT_DIRECTIONAL0_DIR])
	mad R_DIFFUSE_LIGHTING, R_TEMP.x, c[C_LIGHT_DIRECTIONAL0_COLOR], R_DIFFUSE_LIGHTING

	LIGHT_INTENSITY_DIRECTIONAL_DIFFUSE(R_TEMP.w, R_WORLD_NORMAL, c[C_LIGHT_DIRECTIONAL1_DIR]);
	mad R_DIFFUSE_LIGHTING, R_TEMP.w, c[C_LIGHT_DIRECTIONAL1_COLOR], R_DIFFUSE_LIGHTING
#endif

#ifdef __OPTION_LIGHT_POINT0__

	LIGHT_INTENSITY_POINT_DIFFUSE(R_TEMP.y, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT0_POS], c[C_LIGHT_POINT0_POS].w, R_TEMP1, R_TEMP2)
	mad R_DIFFUSE_LIGHTING, R_TEMP.y, c[C_LIGHT_POINT0_COLOR], R_DIFFUSE_LIGHTING

#endif

#ifdef __OPTION_LIGHT_POINT1__
	LIGHT_INTENSITY_POINT_DIFFUSE(R_TEMP.w, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT1_POS], c[C_LIGHT_POINT1_POS].w, R_TEMP1, R_TEMP2)
	mad R_DIFFUSE_LIGHTING, R_TEMP.w, c[C_LIGHT_POINT1_COLOR], R_DIFFUSE_LIGHTING
#endif


#ifdef __OPTION_LIGHT_POINT23__
	LIGHT_INTENSITY_POINT_DIFFUSE(R_TEMP.w, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT2_POS], c[C_LIGHT_POINT2_POS].w, R_TEMP1, R_TEMP2)
	mad R_DIFFUSE_LIGHTING, R_TEMP.w, c[C_LIGHT_POINT2_COLOR], R_DIFFUSE_LIGHTING

	LIGHT_INTENSITY_POINT_DIFFUSE(R_TEMP.w, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_POINT3_POS], c[C_LIGHT_POINT3_POS].w, R_TEMP1, R_TEMP2)
	mad R_DIFFUSE_LIGHTING, R_TEMP.w, c[C_LIGHT_POINT3_COLOR], R_DIFFUSE_LIGHTING

#elif defined(__OPTION_LIGHT_SPOT0__)	// spot lights are only allowed with up to 2 point lights

	LIGHT_INTENSITY_SPOT_DIFFUSE(R_TEMP.z, R_WORLD_NORMAL, R_WORLD_POS, c[C_LIGHT_SPOT0_POS], c[C_LIGHT_SPOT0_POS].w, c[C_LIGHT_SPOT0_DIR], c[C_LIGHT_SPOT0_PARAMS], c[C_LIGHT_SPOT0_DIR].w, R_TEMP1, R_TEMP2)
	mad R_DIFFUSE_LIGHTING, R_TEMP.z, c[C_LIGHT_SPOT0_COLOR], R_DIFFUSE_LIGHTING

#endif

//mul R_DIFFUSE_LIGHTING.w, R_DIFFUSE_LIGHTING.w, c[C_CONST0].y
//dp4 R_STATIC_DIFFUSE_LIGHTING.w, c[C_LIGHT_PROJ_SELECTOR], R_TEMP
//mad R_DIFFUSE_LIGHTING.xyz, -c[C_LIGHT_PROJ_COLOR].xyz, R_STATIC_DIFFUSE_LIGHTING.w, R_DIFFUSE_LIGHTING.xyz


dp4 R_STATIC_DIFFUSE_LIGHTING.w, c[C_LIGHT_PROJ_SELECTOR], R_TEMP
mad R_DIFFUSE_LIGHTING.xyz, -c[C_LIGHT_PROJ_COLOR].xyz, R_STATIC_DIFFUSE_LIGHTING.w, R_DIFFUSE_LIGHTING.xyz

max R_TEMP.x, R_DIFFUSE_LIGHTING.x, R_DIFFUSE_LIGHTING.y
max R_TEMP.x, R_TEMP.x, R_DIFFUSE_LIGHTING.z
max R_TEMP.x, R_TEMP.x, c[C_CONST0].z
rcp R_TEMP.x, R_TEMP.x
mul R_DIFFUSE_LIGHTING.xyz, R_DIFFUSE_LIGHTING.xyz, R_TEMP.x
mul R_DIFFUSE_LIGHTING.xyz, R_DIFFUSE_LIGHTING.xyz, c[C_HDR].zzz

#undef R_WORLD_NORMAL

#endif //__LIGHTING_DIFFUSE_H__
