module jolt_bindings
  use, intrinsic :: iso_c_binding
  implicit none


  interface


    function jph_init() result(success) bind(c, name = "JPH_Init")
      use, intrinsic :: iso_c_binding
      implicit none

      logical(c_bool) :: success
    end function jph_init


    subroutine jph_shutdown() bind(c, name = "JPH_Shutdown")
      use, intrinsic :: iso_c_binding
      implicit none

    end subroutine jph_shutdown


  end interface


end module jolt_bindings
