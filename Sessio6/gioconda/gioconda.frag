#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

vec2 ojo = vec2 (.393,.652);
vec2 offset = vec2  (0.057, -0.172);

uniform float time;
uniform sampler2D sampler;



void main()
{
	fragColor = texture(sampler,vtexCoord);
	if (fract(time)>0.5) {
		float dist = distance(vtexCoord,ojo);
		if (dist <= 0.025) fragColor = texture(sampler,vtexCoord+offset);
	}
}
