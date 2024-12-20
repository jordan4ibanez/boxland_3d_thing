#version 420
#extension GL_ARB_explicit_uniform_location : require

// Something something snoop dog

layout (location = 0) in vec3 position;
layout (location = 1) in vec2 texture_coordinate;
layout (location = 2) in vec2 ignore_color_for_now;

layout(location = 0) uniform mat4 camera_matrix;
layout(location = 1) uniform mat4 object_matrix;
layout(location = 2) uniform vec3 color;

out vec3 pixel_color;
out vec2 output_texture_coordinate;

void main() {
  gl_Position = camera_matrix * object_matrix * vec4(position, 1.0);

  pixel_color = color;

  output_texture_coordinate = texture_coordinate;
}