#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float scale=8;
uniform float time;
uniform vec3 T0 = vec3(-1.0,-1.0,0);
uniform vec3 V = vec3(2.0,2.0,0);

float triangleWave(float x) {
   return abs(mod(x,2) - 1.0);
}

void main()
{
   vec3 t = vec3(triangleWave(time/1.618), triangleWave(time), 0);
   vec3 T = scale*(T0 + V*t);
   vec3 vertex_ = (vertex + T)/scale;
   gl_Position = modelViewProjectionMatrix * vec4(vertex_, 1.0);
   
   vec3 Ne = normalize(normalMatrix * normal); //la normal esta en eyespace d'aquesta manera (?)
   frontColor = vec4(0.3,0.3,0.9,1.0) * Ne.z;
}



