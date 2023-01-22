#ifndef __LIGHTING_DIFFUSESPECULAR_H__
#define __LIGHTING_DIFFUSESPECULAR_H__

#include "pcRedVertexShaderMacros.h"
#include "pcRedVertexShaderConstants.h"

// Diffuse and Specular Lighting Shader /////////////////////////////////////////////////////////////////////
// This shader calculates diffuse and specular lighting for a specified number of point lights and 
// directional lights.  All lighting is performed in object space.
// To use this shader add defines for the options you want to include and then include this file.
// An include file was used instead of a macro to make the shader easier to write and debug since you
// don't have to worry about add a "\" at the end of every line.  The following options are valid:
// __OPTION_LIGHT_DIRECTIONAL__	-> include directional light computation
// __OPTION_LIGHT_POINT0__		-> include light computation for point light 0
// __OPTION_LIGHT_POINT1__		-> include light computation for point light 1
// __OPTION_LIGHT_POINT23__		-> include light computation for point lights 2 and 3
// __OPTION_LIGHT_SPOT0__		-> include light computation for spot light 0
// __OPTION_LIGHT_SPOT1__		-> include light computation for spot light 1
// __OPTION_LIGHT_BUMP__		-> include computation for average light direction used for bump mapping
//
// NOTE:
// None of the spot light options can be specified if option "__OPTION_LIGHT_POINT23__" is specified.
////////////////////////////////////////////////////////////////////////////////////////////////////////////

#endif
