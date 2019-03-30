shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform int strength : hint_range(1, 4) = 1;

float get_weight(int pos) {
	if(strength == 1) {
		if(pos == 0) {
			return 0.4;
		} else {
			return 0.3;
		}
	} else if (strength == 2) {
		if(pos == 0) {
			return 0.29411764705;
		} else if (pos == 1 || pos == -1) {
			return 0.23529411764;
		} else {
			return 0.11764705882;
		}
	} else if (strength == 3) {
		if(pos == 0) {
			return 0.25149700598;
		} else if (pos == 1 || pos == -1) {
			return 0.20958083832;
		} else if (pos == 2 || pos == -2) {
			return 0.11976047904;
		} else {
			return 0.04491017964 ;
		}
	} else if(strength == 4) {
		if (pos == 0) {
			return 0.2270270270;
		} else if (pos == 1 || pos == -1) {
			return 0.1945945946;
		} else if (pos == 2 || pos == -2) {
			return 0.1216216216;
		} else if (pos == 3 || pos == -3){
			return 0.0540540541;
		} else {
			return 0.0162162162;
		}
	}
}

void fragment() {
	float sum = 0.;
	vec4 c2  = vec4(0.);
	for(int i = strength * -1; i <= strength; i++) {
		for(int j = strength * -1; j <= strength; j++) {
			float weight = get_weight(i) * get_weight(j); 
			c2 += weight * texture(TEXTURE, UV + vec2(float(i) * TEXTURE_PIXEL_SIZE.x, float(j) * TEXTURE_PIXEL_SIZE.y));
		}
	}
	COLOR = c2;
}