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



void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
	vec4 trans = modelViewProjectionMatrix*vec4(vertex, 1);
	float x = (trans.x/trans.w)*0.5*abs(sin(time));
	float y = (trans.y/trans.w)*0.5*abs(sin(time));
	gl_Position = vec4(x*trans.w,y*trans.w,trans.z,trans.w); //No caldria tornar a passar-ho a Clip Space com vaig fer, millor deixar-ho en el SCO que està.
}
