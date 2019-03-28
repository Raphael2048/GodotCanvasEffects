shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform vec4 effect_color : hint_color = vec4(0, 0, 0, 1.0);
uniform float effect_factor : hint_range(0, 1) = 1;
uniform float radius : hint_range(0, 1.4) = 1;

void fragment() {
	float l = min(1.0 - length(UV - vec2(0.5)) * 2f / radius, 1);
	vec4 c = texture(TEXTURE, UV);
	vec4 c2 = l * c;
	COLOR = mix(c, c2, effect_factor);
	COLOR.a = c.a;
}