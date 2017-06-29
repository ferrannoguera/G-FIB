#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform sampler2D explosion;
uniform float time;
uniform float slice = 1/30;
in vec2 vtexCoord;
int total;

void main()
{
    int frame = int(mod(time*30,48));
    int fila = 5 - frame/8;
    int col = frame % 8;
    vec4 color = texture(explosion, vec2(col/8., fila/6.)+vec2(1./8,1./6)*vtexCoord);
    fragColor = color * color.a;
}
