shader_type canvas_item;
render_mode blend_mix,unshaded,skip_vertex_transform;

uniform float effect_factor : hint_range(0, 1) = 0.3; 

void vertex() {
	VERTEX =  (WORLD_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
}

void fragment() {
	vec2 pixelSize = (effect_factor * 20f - 1f) * TEXTURE_PIXEL_SIZE;
	vec2 uv2 = round(UV / pixelSize) * pixelSize;
	COLOR = texture(TEXTURE, uv2);
}