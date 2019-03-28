shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform vec4 effect_color : hint_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform int border : hint_range(1, 10);

vec2 get_direction(int k) {
	if(k == 1) return vec2(1.0, 0);
	else if(k ==2) return vec2(-1.0, 0);
	else if(k == 3) return vec2(0, 1.0);
	else return vec2(0, -1.0);
}

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	if(c.a > 0.01) {
		COLOR = c;
	} else {
		int min_length = border + 1;
		for(int i = 1; i <= 4; i++) {
			for(int j = 1; j < min_length; j++) {
				vec4 c2 = texture(TEXTURE, UV + get_direction(i) * TEXTURE_PIXEL_SIZE * float(j));
				if(c2.a > 0.01) {
					min_length = j;
				}
			}
		}
		if (min_length > border) {
			discard;
		} else {
			COLOR = effect_color;
			COLOR.a = mix(1.0, 0.0, float(min_length - 1) / float(border));
		}
	}
}