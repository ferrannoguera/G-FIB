#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space
uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

void main()
{  
    vec3 N = normalize(normalMatrix * normal);
    vec3 L = normalize(lightPosition.xyz - (modelViewMatrix*vec4(vertex, 1.)).xyz);
    vec3 H = normalize((vec3(0,0,1)+L));
    vec3 V = -normalize((modelViewMatrix*vec4(vertex, 1.)).xyz);
    vec3 R = normalize(2*dot(N,L)*N-L);
    frontColor = (matAmbient*lightAmbient+matDiffuse*lightDiffuse*max(0.0,(dot(N,L))));
    if (dot(N,L) > 0) frontColor += (matSpecular*lightSpecular*pow((max(0.0,(dot(R,V)))), matShininess));
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}













