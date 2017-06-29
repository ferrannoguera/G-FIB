
#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D map;

uniform int textureSize=1024;
uniform int edgeSize=2;
uniform float threshold=0.1;

void main() {
  	vec2 left = vtexCoord+edgeSize*vec2(-1, 0)/textureSize;
  	vec2 right = vtexCoord+edgeSize*vec2(1, 0)/textureSize;
  	vec2 bottom = vtexCoord+edgeSize*vec2(0, -1)/textureSize;
  	vec2 top = vtexCoord+edgeSize*vec2(0, 1)/textureSize;

	float GX = distance(texture(map,right),texture(map,left));
	float GY = distance(texture(map,top),texture(map,bottom));

	float imbecil = length(vec2(GX,GY));

	if (imbecil > threshold) fragColor = vec4(0,0,0,1);
	else fragColor = texture(map,vtexCoord);
}
