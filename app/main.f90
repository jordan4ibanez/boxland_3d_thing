program main
  use :: glfw
  use :: opengl
  implicit none


  if (.not. glfw_init()) then
    error stop "Failed to init glfw."
  end if




  call glfw_terminate()

end program main
