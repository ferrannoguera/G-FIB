#version 330 core

in vec2 vtexCoord;
in vec4 frontColor;
out vec4 fragColor;

uniform float time=0.55;
uniform float slice=0.1;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;


void main()
{
    float window = 4*slice;
    if (mod(time, window) < 1*slice)
        fragColor = texture(sampler0, vtexCoord);
    else if (mod(time, window) < 2*slice) 
        fragColor = texture(sampler1, vtexCoord);
    else if (mod(time, window) < 3*slice) 
        fragColor = texture(sampler2, vtexCoord);
    else
        fragColor = texture(sampler3, vtexCoord);
}

