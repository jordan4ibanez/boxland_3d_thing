module world
  use :: jolt_bindings
  use :: string_f90
  use, intrinsic :: iso_c_binding
  implicit none


contains


  subroutine world_create()
    implicit none

    if (.not. jph_init()) then
      error stop "Failed to initialize Jolt Physics."
    else
      print"(A)", "Initialized Jolt Physics."
    end if
  end subroutine world_create


  subroutine trace_implementation(raw_c_message) bind(c)
    implicit none

    type(c_ptr), intent(in), value :: raw_c_message
    character(len = :, kind = c_char), pointer :: message

    ! This is for debugging lol.
    print*,"HI, I'm a message!!!"

    message => string_from_c(raw_c_message)

    print*,message
  end subroutine



  subroutine world_destroy()
    implicit none

    call jph_shutdown()
    print"(A)", "Shutdown Jolt Physics."
  end subroutine world_destroy


end module world
