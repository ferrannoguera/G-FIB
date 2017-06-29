#version 330 core


in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform float time;

vec2 pilota = vec2 (.272,.09);

void main()
{
	vec2 d = vec2(time,0);
	vec2 C = fract(pilota+d);
	float dist = distance(vtexCoord,C);
	if (dist < 0.065) fragColor = texture(colorMap,vtexCoord-d);
	else {
		float dist2 = distance(vtexCoord,pilota);
		if (dist2 < 0.065) fragColor = texture(colorMap,vec2(vtexCoord.s+0.5,vtexCoord.t));
		else fragColor = texture(colorMap,vtexCoord);
	}
}
