#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform float time;

void main()
{
	if (fract(time) <= 0.5) {
		if (vtexCoord.s < 0.5) fragColor = texture(colorMap,vec2(-vtexCoord.s,vtexCoord.t));
		else fragColor = texture(colorMap,vec2(vtexCoord.s,vtexCoord.t));
	}
	else {
		if (vtexCoord.s < 0.5) fragColor = texture(colorMap,vec2(vtexCoord.s,vtexCoord.t));
		else fragColor = texture(colorMap,vec2(-vtexCoord.s,vtexCoord.t));
	}
}
