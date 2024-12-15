module jolt_physics_bindings
  use, intrinsic :: iso_c_binding
  implicit none


  interface


    subroutine print_hi() bind(c, name = "print_hi")
    end subroutine print_hi


  end interface


end module jolt_physics_bindings
