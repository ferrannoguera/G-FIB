#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

#define NUM_COLORS 5

void main()
{
    vec3[NUM_COLORS] colors;
    //Init colors
    colors[0] = vec3(1.0,0.0,0.0); //Red
    colors[1] = vec3(1.0,1.0,0.0); //Yellow
    colors[2] = vec3(0.0,1.0,0.0); //Green
    colors[3] = vec3(0.0,1.0,1.0); //Cyan
    colors[4] = vec3(0.0,0.0,1.0); //Blue

    vec4 aux = modelViewProjectionMatrix * vec4(vertex, 1.0); //canvi de coordenades
    aux = aux/aux[3];
    vec3 ndc_vertex = aux.xyz; //coordenadas dispositivo

    float maxh = 1 - (-1); //agafa l'altura de la camara
    float slice_size = maxh/(NUM_COLORS-1); //repartes alturas en colores
    float ndc_vertexh = ndc_vertex.y - (-1); //altura de dispositivo
    float height_in_slices = ndc_vertexh/slice_size; //en que slice esta
    int slice = int(floor(height_in_slices)); //passarlo a int, lleig, molt lleig
    float gradient = fract(height_in_slices); //agafa la part fraccionaria pel gradient
    vec3 grad_color = mix(colors[slice],colors[slice+1],gradient); //calcul del gradient

    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(grad_color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
