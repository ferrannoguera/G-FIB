#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n=3;

void main()
{
    vec2 pos = gl_FragCoord.xy;
    int y = int(pos.y); //como passar a int de forma subnormal
    if (y % n != 0) discard;
    fragColor = frontColor;
}
