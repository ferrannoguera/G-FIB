#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;
uniform float amplitude = .1;
uniform float freq = 1;
const float PI = 3.141592654;

float d(float t, float fase){
	return (amplitude*(sin(2*PI*t*freq+fase)));
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(N.z);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex+(d(time,texCoord*2*PI)*normal), 1.0);
}

