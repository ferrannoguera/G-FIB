#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform bool eyespace;
uniform float time;
uniform float pi=3.14159265359;

void main()
{
    float y;
    if (eyespace) y = (modelViewMatrix*vec4(vertex,1.0)).y; //agafa la y en eyespace
    else y = vertex.y; //agafa la y en objectspace
    float r = distance(boundingBoxMin, boundingBoxMax)/2;
    float amplitude = (r/10)*y;

    vec3 N = normal;
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex+amplitude*sin(time)*N, 1.0);
}

