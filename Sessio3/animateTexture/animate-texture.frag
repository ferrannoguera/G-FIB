#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform float time;
uniform float speed = .1;
uniform sampler2D colorMap;
in vec2 vtexCoord;

void main()
{
    fragColor= frontColor * texture(colorMap, vtexCoord+speed*time);
}
