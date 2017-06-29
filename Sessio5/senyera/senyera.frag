#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

vec3 groc = vec3(1,1,0);
vec3 vermell = vec3(1,0,0);

void main()
{
	int a = 9;
	int x = int(floor(fract(vtexCoord.x)*a)); //agafa la part fraccionaria de vtex*9 i et dona on ha d'anar haha xd sino a if's loquete
	if (x%2 != 0) fragColor = vec4(vermell,1.0);
    else fragColor = vec4(groc,1.0);
}
