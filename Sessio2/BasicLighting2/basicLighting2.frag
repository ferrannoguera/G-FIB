#version 330 core

in vec3 N;
in vec3 color1;
out vec4 fragColor;
uniform mat3 normalMatrix;

void main()
{
    vec3 N2 = normalize(normalMatrix*N);
    fragColor = vec4(color1,1.0)*N2.z;
}
