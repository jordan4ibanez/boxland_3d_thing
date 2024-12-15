#version 420

// Something something snoop dog

in vec3 pixel_color;
in vec2 output_texture_coordinate;

uniform sampler2D texture_sampler;

out vec4 frag_color;

void main() {
   // texture(texture_sampler, output_texture_coordinate) *
   frag_color = vec4(pixel_color, 1.0);
}