		#include "pcRedVertexShaderMacros.h"

		; project the position into screen space		
		POS_OBJECT_PROJECT
		
		; decompress texcoords
		mul R_TEMP, V_TEXCOORDS, c[C_NORMALTEX_DECOMPRESS].zzzw

		; transform texture coordinates
		dp4 oT0.x, R_TEMP, c[C_CUSTOM_MIN+0]
		dp4 oT0.y, R_TEMP, c[C_CUSTOM_MIN+1]
		mov oT0.zw, c[C_CONST0].xz

		; calculate near scene fade factor in R_TEMP.w
		dp4 R_TEMP.z, R_POS, c[C_OBJ_PROJ_M3]
		max R_TEMP.z, R_TEMP.z, c[C_CONST0].y
		rcp R_TEMP.x, R_TEMP.z
		mad R_TEMP.w, R_TEMP.x, c[C_FOG].z, c[C_FOG].w
		max R_TEMP.w, R_TEMP.w, c[C_CONST0].x
		min R_TEMP.w, R_TEMP.w, c[C_CONST0].z

		; output color (with lighting)
		mov oD0.xyz, R_DIFFUSE_COLOR.xyz
		mul oD0.w, R_DIFFUSE_COLOR.w, R_TEMP.w

