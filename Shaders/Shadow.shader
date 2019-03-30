shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform vec4 effect_color : hint_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform int x_offset : hint_range(-20, 20) = 5;
uniform int y_offset : hint_range(-20, 20) = 5;

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	if(c.a > 0.001) {
		COLOR = c;
	} else {
		vec2 offset = vec2(float(-x_offset), float(-y_offset)) * TEXTURE_PIXEL_SIZE;
		vec4 c2 =  texture(TEXTURE, UV + offset);
		if (c2.a > 0.001) {
			COLOR = effect_color * c2;
		} else {
			discard;
		}
	}
}