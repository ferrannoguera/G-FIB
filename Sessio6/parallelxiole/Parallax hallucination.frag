
#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D map;
uniform float time;
uniform float a=0.5;

const float PI=3.141592654;

void main() {
  vec4 TC=texture(map, vtexCoord);
  float m=max(TC.g, max(TC.b, TC.r));
  vec2 u=vec2(m, m);
  float b=2*PI*time;
  mat2 R2D=mat2(vec2(cos(b), -sin(b)), vec2(sin(b), cos(b)));
  u=u*R2D;
  vec2 off=(a/100.0)*u;
  fragColor=texture(map, vtexCoord+off);
}
