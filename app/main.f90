program main
  use :: glfw
  use :: opengl
  use :: delta_time
  use :: shader
  use :: texture
  use :: mesh
  use :: forterm
  use, intrinsic :: iso_c_binding
  implicit none
  
  call glfw_set_error_callback()
  if (.not. glfw_init()) then
    error stop "Failed to init glfw."
  end if
  !! Need this flag to have OpenGL debugging available!
  call glfw_window_hint(GLFW_OPENGL_DEBUG_CONTEXT, GL_TRUE)
  call glfw_window_hint(GLFW_CONTEXT_VERSION_MAJOR, 4)
  call glfw_window_hint(GLFW_CONTEXT_VERSION_MINOR, 2)
  call glfw_window_hint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE)
  call glfw_window_hint(GLFW_SCALE_FRAMEBUFFER, GLFW_TRUE)
  if (.not. glfw_create_window(1920, 1080, "boxland 3d")) then
    error stop "Failed to create window."
  end if
  call glfw_make_context_current()
  call forglad_load_gl(c_funloc(glfw_get_proc_address))
  call glfw_trigger_viewport_update()
  call delta_initialize()
  call glfw_set_window_size_callback()
  call glfw_set_content_scale_callback()
  if (forglad_gpu_supports_gl_debugging()) then
    call gl_enable(GL_DEBUG_OUTPUT_SYNCHRONOUS)
    call gl_set_debug_message_callback()
  end if
  call gl_depth_mask(.true.)
  call gl_enable(GL_DEPTH_TEST)
  call gl_depth_func(GL_LESS)
  call gl_enable(GL_BLEND)
  call gl_blend_equation(GL_FUNC_ADD)
  call gl_blend_func(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
  call gl_clear_error_data()
  call shader_module_initialize()
  call shader_create("main", "./shaders/vertex.vert", "./shaders/fragment.frag")




  call texture_destroy_database()
  call mesh_destroy_database()
  call shader_destroy_database()
  call glfw_terminate()
  call print_color(NOTIFICATION, "[jordan4ibanez]: Why you running this piece of crap?")
end program main
