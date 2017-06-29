#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main()
{
   float thetaY = 0.4*vertex.y*sin(time);
   mat3 matRot = mat3(cos(thetaY),    0,    sin(thetaY),
                      0,              1,    0,
                      -sin(thetaY),    0,    cos(thetaY));

   vec3 vertex_ = vertex*matRot;
   gl_Position = modelViewProjectionMatrix * vec4(vertex_, 1.0);
   frontColor = vec4(color,1.0);
}

