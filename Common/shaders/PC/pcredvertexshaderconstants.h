
#ifndef __PCREDVERTEXSHADERCONSTANTS_shader_included__
#define __PCREDVERTEXSHADERCONSTANTS_shader_included__

// constant map
// The PC vertex shader assembler unfortunatly cannot handle enum's.  All these constants must be
// left as defines because the shaders use this file.
#define	MIN_CONSTANT				 0
#define	MAX_CONSTANT				95
#define NUM_CONSTANTS				96
#define MIN_CONSTANTS_REQUIRED		96
#define	C_CONST0					 0	// (0.0, 0.5, 1.0, -1.0)
#define C_CONST1					 1	// (2.0, 0.25,0.5, index_decompress = 765.001)
#define C_WORLD_PROJ_M0				 2	// world -> proj matrix
#define C_WORLD_PROJ_M1				 3
#define C_WORLD_PROJ_M2				 4
#define C_WORLD_PROJ_M3				 5
#define C_WORLD_VIEWPOS				 6
#define C_FOG						 7	// (camfog scale, camfog offset, worldfog scale, worldfog offset)
#define C_NEARSCENEFADE				 8  // (nearfade scale, nearfade offset, lighting scale, 1.0)
#define C_HDR						C_NEARSCENEFADE
#define C_SHADOWMAP_TRANSFORM_U		 9  // shadow map transform
#define C_SHADOWMAP_TRANSFORM_V		10
#define C_SHADOWMAP_TRANSFORM_W		11
#define C_NORMALTEX_DECOMPRESS		12  // (normal_decompress = 2|1, -1|0, tex_decompress = 1/0x0800|1, 1)
#define C_POS_DECOMPRESS0			13	// (bbox (max - min)*0.5/0x7FFF)|(1,1,1), 0
#define C_POS_DECOMPRESS1			14	// (bbox (max + min)*0.5/0x7FFF)|(0,0,0), 1
#define C_COLOR_STATE				15	// whether vertex colors are lighting or material colors (1,?,?,?)
#define C_OBJ_WORLD_M0				16	// obj -> world matrix
#define C_OBJ_WORLD_M1				17
#define C_OBJ_WORLD_M2				18
#define C_LIGHT_AMBIENT_COLOR0		19	// ambient color interpolated with ambient color1 using world normal y component - applied in the transform fragment (i.e. lighting fragment not needed)
#define C_LIGHT_AMBIENT_COLOR1		20	// ambient color interpolated with ambient color0 using world normal y component - applied in the transform fragment (i.e. lighting fragment not needed)
#define C_LIGHT_DIRECTIONAL0_COLOR	21	// directional 0 light color
#define C_LIGHT_DIRECTIONAL0_DIR	22	// directional 0 light normalized world space direction
#define C_LIGHT_DIRECTIONAL1_COLOR	23	// directional 1 light color
#define C_LIGHT_DIRECTIONAL1_DIR	24	// directional 1 light normalized world space direction
#define C_LIGHT_POINT0_COLOR		25	// point light 0 color, intensity
#define C_LIGHT_POINT0_POS			26	// point light 0 world space position
#define C_LIGHT_POINT1_COLOR		27	// point light 1 color, w is the intensity
#define C_LIGHT_POINT1_POS			28	// point light 1 world space position
#define C_LIGHT_POINT2_COLOR		29	// point light 2 color, w is the intensity
#define C_LIGHT_POINT2_POS			30	// point light 2 world space position
#define C_LIGHT_POINT3_COLOR		31	// point light 3 color, w is the intensity
#define C_LIGHT_POINT3_POS			32	// point light 3 world space position

#define C_LIGHT_SPOT0_COLOR			C_LIGHT_POINT2_COLOR	// spot light 0 color, w = intensity
#define C_LIGHT_SPOT0_POS			C_LIGHT_POINT2_POS	// spot light 0 pos, w = 1/r^2
#define C_LIGHT_SPOT0_DIR			C_LIGHT_POINT3_COLOR	// spot light 0 direction
#define C_LIGHT_SPOT0_PARAMS		C_LIGHT_POINT3_POS	// spot light 0 params [x = half outer cone angle, y = half inner cone angle, z = 1/(cos(y) - cos(x)), w = falloff]

#define C_LIGHT_PROJ_COLOR			33
#define C_LIGHT_PROJ_SELECTOR		34	// selects which light use for the projection texture
#define C_LIGHT_PROJ_M0				35
#define C_LIGHT_PROJ_M1				36
#define C_LIGHT_PROJ_M2				37
#define C_LIGHT_PROJ_M3				38

#define C_COLOR_DIFFUSE				39	// material diffuse color (x tweak color)
#define C_CUSTOM_MIN				40	// first custom shader constant
#define C_CUSTOM_MAX				50	// last custom shader constant
#define C_BONE0_M0					51	// first bone matrix, remainder of space is 15 bones
#define C_BONE0_M1					52
#define C_BONE0_M2					53


#endif
