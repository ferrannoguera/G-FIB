#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform bool classic = false;

void main()
{ 
	vec3 color = vec3(1.0);
	vec2 center = vec2(0.5, 0.5);
	if (distance(center, vtexCoord) <= 0.2) //beneit distance joder de deu
	    color = vec3(1.0, 0.0, 0.0);
	if (! classic) {	
		float phi = 3.141592645/16;
		vec2 dist = center-vtexCoord;
		float xd = atan(dist.x,dist.y);
		if (mod(xd/phi+0.5,2) < 1) color = vec3(1.0, 0.0, 0.0);
	}
	fragColor = vec4(color, 1.0);
}
