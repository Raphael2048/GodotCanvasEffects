shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform vec4 effect_color : hint_color = vec4(0, 0, 0, 1.0);
uniform float radius : hint_range(0, 0.7) = 0.4;
uniform float width : hint_range(0.01, 0.2);

void fragment() {
	float l = length(UV - vec2(0.5));
	if (l < radius) {
		COLOR = texture(TEXTURE, UV);
	} else if (l > radius + width) {
		COLOR = effect_color;
	} else {
		float k = (l - radius) / width;
		COLOR = mix(texture(TEXTURE, UV),effect_color, k);
	}
}