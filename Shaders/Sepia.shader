shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform vec4 effect_color : hint_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float effect_factor : hint_range(0, 1) = 1;

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec4 c2 = c * effect_color;
	COLOR = c * (1.0 - effect_factor) + c2 * effect_factor;
}