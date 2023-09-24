varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fade;

void main() {
	vec4 _color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord); 
	_color.rgb *= _color.a; // Premultiply Alpha

	
	float gray = dot(_color.rgb, vec3(0.21, 0.71, 0.07));
	gl_FragColor = vec4(mix(_color.rgb,vec3(gray),fade), _color.a);
}
