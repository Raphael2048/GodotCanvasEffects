shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform float effect_factor : hint_range(0, 1) = 1;

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec4 c2 = vec4(1.0 - c.r, 1.0 - c.g, 1.0 - c.b, c.a);
	COLOR = mix(c, c2, effect_factor);
}