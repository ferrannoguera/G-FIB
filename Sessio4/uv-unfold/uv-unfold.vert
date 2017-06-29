#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform vec2 Min = vec2(-1,-1);
uniform vec2 Max = vec2(1,1);

void main()
{
	frontColor = vec4(color,1.0);
	vtexCoord = texCoord;

	// les escalo en [0,1]
	float s = (texCoord.s-Min.s)/(Max.s - Min.s); //altura de la texCoord/altura te la texCoord
	float t = (texCoord.t-Min.t)/(Max.t - Min.t); //altura de la texCoord/altura te la texCoord

	gl_Position =  vec4(2*s-1,2*t-1, 0, 1); //*2 perque el viewport te tamany 2 i -1 per posarho al centre
}

