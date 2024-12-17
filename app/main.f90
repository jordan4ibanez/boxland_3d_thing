program main
  use :: glfw
  use :: opengl
  use :: delta_time
  use :: shader
  use :: texture
  use :: mesh
  use :: forterm
  use :: camera
  use :: mouse
  use :: keyboard
  use :: math_helpers
  use :: vector_3d
  use :: vector_2f
  use :: constants_f90
  ! use :: bullet_bindings
  ! use :: jolt_physics_bindings
  use, intrinsic :: iso_c_binding
  implicit none

  real :: blah = 0.0
  real, parameter :: gravity = 10.0
  type(vec3d) :: ground_pos, car_pos, car_velocity, car_rotation, point_pos
  type(vec2f) :: car_size
  real :: size = 0.05

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
  if (.not. glfw_create_window(800, 600, "boxland 3d")) then
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
  call shader_start("main")
  call keyboard_module_initialize()
  call mesh_module_initialize()
  call mouse_initialize()


  call createEmptyDynamicsWorld()








  car_size = [0.5, 1.0]

  ! Time to draw le square.
  call mesh_create_3d_named("car", &
    [ &
    -car_size%x, 0.0, -car_size%y, &
    -car_size%x, 0.0, car_size%y, &
    car_size%x, 0.0, car_size%y, &
    car_size%x, 0.0, -car_size%y  &
    ], &
    [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], &
    [0,1,2, 2,3,0] &
    )

  car_pos = [0.0, 1.0, 0.0]


  call mesh_create_3d_named("point", &
    [ &
    -size, size, -size, &
    -size, size, size, &
    size, size, size, &
    size, size, -size,  &

    -size, -size, -size, &
    -size, -size, size, &
    size, -size, size, &
    size, -size, -size  &
    ], &
    [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], &
    [0,1,2,2,3,0, 4,5,6,6,7,4] &
    )

  call mesh_create_3d_named("ground", &
    [ &
    -10.0, 0.0, -10.0, &
    -10.0, 0.0, 10.0, &
    10.0, 0.0, 10.0, &
    10.0, 0.0, -10.0 &
    ], &
    [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], &
    [0,1,2, 2,3,0] &
    )

  ground_pos = [0.0, 0.0, 0.0]

  call camera_set_position_f32(0.0, 2.0, -1.0)
  call camera_set_rotation_f32(3.14 / 4.0, 0.0, 0.0)


  do while (.not. glfw_window_should_close())
    call delta_tick()
    call gl_clear_color_scalar(0.0)
    call gl_clear_color_and_depth_buffer()
    call camera_freecam_hackjob()
    call mouse_update()
    call camera_update_3d()


    car_rotation%y = car_rotation%y + 0.01

    ! I'm trying to figure what fuck I'm doing lmao.
    ! quick q&a
    ! Q: use a matrix
    ! A: fuk u
    ! Q: use box2d
    ! A: fuk u

    ! Front of the car is blue.
    point_pos = car_pos
    point_pos%x = point_pos%x + (cos(car_rotation%y + PI_OVER_2_F32) * car_size%y)
    point_pos%z = point_pos%z + (sin(car_rotation%y + PI_OVER_2_F32) * car_size%y)
    call camera_set_object_color(0.0, 0.0, 1.0)
    call camera_set_object_matrix_f32(real(point_pos%x), real(point_pos%y), real(point_pos%z), 0.0, 0.0, 0.0, 1.0, 1.0, 1.0)
    call mesh_draw_by_name("point")


    ! Front left point is this pink THING.
    point_pos = car_pos
    point_pos%x = point_pos%x + (cos(car_rotation%y - PI_F64) * car_size%x)
    point_pos%z = point_pos%z + (sin(car_rotation%y - PI_F64) * car_size%x)
    point_pos%x = point_pos%x + (cos(car_rotation%y + PI_OVER_2_F32) * car_size%y)
    point_pos%z = point_pos%z + (sin(car_rotation%y + PI_OVER_2_F32) * car_size%y)
    call camera_set_object_color(1.0, 0.0, 0.5)
    call camera_set_object_matrix_f32(real(point_pos%x), real(point_pos%y), real(point_pos%z), 0.0, 0.0, 0.0, 1.0, 1.0, 1.0)
    call mesh_draw_by_name("point")


    ! Front right point is this blurple.
    point_pos = car_pos
    point_pos%x = point_pos%x + (cos(car_rotation%y) * car_size%x)
    point_pos%z = point_pos%z + (sin(car_rotation%y) * car_size%x)
    point_pos%x = point_pos%x + (cos(car_rotation%y + PI_OVER_2_F32) * car_size%y)
    point_pos%z = point_pos%z + (sin(car_rotation%y + PI_OVER_2_F32) * car_size%y)
    call camera_set_object_color(0.6, 0.0, 0.5)
    call camera_set_object_matrix_f32(real(point_pos%x), real(point_pos%y), real(point_pos%z), 0.0, 0.0, 0.0, 1.0, 1.0, 1.0)
    call mesh_draw_by_name("point")


    ! Rear right point is this shmorange.
    point_pos = car_pos
    point_pos%x = point_pos%x + (cos(car_rotation%y) * car_size%x)
    point_pos%z = point_pos%z + (sin(car_rotation%y) * car_size%x)
    point_pos%x = point_pos%x + (cos(car_rotation%y - PI_OVER_2_F32) * car_size%y)
    point_pos%z = point_pos%z + (sin(car_rotation%y - PI_OVER_2_F32) * car_size%y)
    call camera_set_object_color(0.7, 0.3, 0.2)
    call camera_set_object_matrix_f32(real(point_pos%x), real(point_pos%y), real(point_pos%z), 0.0, 0.0, 0.0, 1.0, 1.0, 1.0)
    call mesh_draw_by_name("point")


    ! Rear left point is this grayp.
    point_pos = car_pos
    point_pos%x = point_pos%x + (cos(car_rotation%y - PI_F64) * car_size%x)
    point_pos%z = point_pos%z + (sin(car_rotation%y - PI_F64) * car_size%x)
    point_pos%x = point_pos%x + (cos(car_rotation%y - PI_OVER_2_F32) * car_size%y)
    point_pos%z = point_pos%z + (sin(car_rotation%y - PI_OVER_2_F32) * car_size%y)
    call camera_set_object_color(0.5, 0.5, 0.8)
    call camera_set_object_matrix_f32(real(point_pos%x), real(point_pos%y), real(point_pos%z), 0.0, 0.0, 0.0, 1.0, 1.0, 1.0)
    call mesh_draw_by_name("point")


    blah = blah + delta_get_f32() * 2.0
    call camera_set_object_color(clamp_f32(cos(cos(mod(blah, 6.28))), 0.0, 1.0), clamp_f32(tan(mod(blah, 6.28)), 0.2, 1.0), clamp_f32(sin(mod(blah, 6.28)), 0.1, 1.0))

    call camera_set_object_matrix_f64(car_pos%x, car_pos%y, car_pos%z, car_rotation%x, car_rotation%y, car_rotation%z, 1.0_8, 1.0_8, 1.0_8)
    call mesh_draw_by_name("car")




    call camera_set_object_color(0.5, 0.5, 0.5)
    call camera_set_object_matrix_f32(real(ground_pos%x), real(ground_pos%y), real(ground_pos%z), 0.0, 0.0, 0.0, 1.0, 1.0, 1.0)

    call mesh_draw_by_name("ground")


    call glfw_swap_buffers()
    call glfw_poll_events()
  end do
  call texture_destroy_database()
  call mesh_destroy_database()
  call shader_destroy_database()
  call glfw_terminate()
  ! call print_color(NOTIFICATION, "[jordan4ibanez]: Why you running this piece of crap?")

  ! call print_hi()
end program main
