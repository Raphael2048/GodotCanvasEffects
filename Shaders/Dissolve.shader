shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform sampler2D noise_texture;
uniform float effect_factor : hint_range(0, 1) = 0.5;
uniform vec4 color : hint_color = vec4(1, 0, 0, 1);
uniform float width : hint_range(0.01, 0.5) = 0.1;

void fragment() {
	vec4 c = texture(noise_texture, UV);
	if (c.r < effect_factor - width) {
		discard;
	} else if (c.r < effect_factor) {
		float k = (effect_factor - c.r) / width;
		COLOR = color * (1.0 - k);
	} else if (c.r < effect_factor + width) {
		float k = (c.r - effect_factor) / width;
		COLOR = mix(texture(TEXTURE, UV), color, 1.0 - k);
	} else {
		COLOR = texture(TEXTURE, UV);
	}
}