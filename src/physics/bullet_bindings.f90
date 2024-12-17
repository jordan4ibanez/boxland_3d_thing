module bullet_bindings
  use, intrinsic :: iso_c_binding
  implicit none

  interface

    subroutine createEmptyDynamicsWorld() bind(c, name = "createEmptyDynamicsWorld")

    end subroutine createEmptyDynamicsWorld

  end interface

end module bullet_bindings
