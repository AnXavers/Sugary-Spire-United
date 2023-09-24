//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_MaskColour;
uniform vec4 u_SprRect;
uniform vec4 u_PatRect;
uniform vec4 u_TexelScl;
uniform vec2 u_SprOffset;

uniform sampler2D s_Pattern;

void main()
{
	vec2 pixPos = vec2((v_vTexcoord.x - u_SprRect[0]) / u_TexelScl[2], (v_vTexcoord.y - u_SprRect[1]) / u_TexelScl[3]);
	vec2 patSize = vec2((u_PatRect[2] - u_PatRect[0]) / u_TexelScl[0], (u_PatRect[3] - u_PatRect[1]) / u_TexelScl[1]);
	vec2 patcoord = vec2(mod(pixPos.x + u_SprOffset[0], patSize.x) * u_TexelScl[0] + u_PatRect[0], mod(pixPos.y + u_SprOffset[1], patSize.y) * u_TexelScl[1] + u_PatRect[1]);
	vec4 sprcol = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 patcol = texture2D(s_Pattern, patcoord);
	
	if(sprcol.rgb == u_MaskColour / 255.0) {
		sprcol = patcol;
	}
	
	gl_FragColor = v_vColour * sprcol;
}
