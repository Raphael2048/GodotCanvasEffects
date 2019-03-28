shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform sampler2D noise_texture;
uniform float effect_factor : hint_range(0, 1) = 0.5;
uniform vec4 color : hint_color = vec4(1, 0, 0, 1);
uniform float width : hint_range(0.01, 0.5) = 0.1;

void fragment() {
	vec4 c = texture(noise_texture, UV);
	vec4 cl = texture(TEXTURE, UV);
	if (cl.a < 0.001) {
		discard;
	}
	if (c.r < effect_factor - width) {
		discard;
	} else if (c.r < effect_factor) {
		float k = (effect_factor - c.r) / width;
		vec4 c2 = vec4(color.rgb, 1.0);
		COLOR = c2 * (1.0 - k);
	} else if (c.r < effect_factor + width) {
		float k = (c.r - effect_factor) / width;
		vec4 c2 = vec4(color.rgb, 1.0);
		COLOR = mix(cl, c2, 1.0 - k);
		//COLOR.a = cl.a;
	} else {
		COLOR = cl;
	}
}