shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform int strength : hint_range(1, 3) = 1;

float get_weight(int pos) {
	if(strength == 1) {
		if(pos == 1 || pos == -1) {
			return 0.4566;
		}
	} else if (strength == 2) {
		if(pos == 1 || pos == -1) {
			return 0.7046;
		} else if (pos == 2 || pos == -2) {
			return 0.2486;
		}
	} else if (strength == 3) {
		if(pos == 1 || pos == -1) {
			return 0.8204;
		} else if (pos == 2 || pos == -2) {
			return 0.4566;
		} else if (pos == 3 || pos == -3) {
			return 0.1719;
		}
	}
	return 1.0;
}

void fragment() {
	float sum = 0.;
	vec4 c2  = vec4(0.);
	for(int i = strength * -1; i <= strength; i++) {
		for(int j = strength * -1; j <= strength; j++) {
			float weight = get_weight(i) * get_weight(j); 
			c2 += weight * texture(TEXTURE, UV + vec2(float(i) * TEXTURE_PIXEL_SIZE.x, float(j) * TEXTURE_PIXEL_SIZE.y));
			sum += weight;
		}
	}
	c2 /= sum;
	COLOR = c2;
}