module collider_mod
  use, intrinsic :: iso_c_binding
  use :: vector_3f
  implicit none


  type collider_contact
    type(vec3f) :: collision_point_1
    type(vec3f) :: collision_point_2
    type(vec3f) :: normal
  end type collider_contact


  integer(1) :: COLLIDER_TYPE_SPHERE = 0
  integer(1) :: COLLIDER_TYPE_CONVEX_HULL = 1


  type :: collider_convex_hull_face
    integer(c_int32_t), dimension(:), pointer :: elements => null()
    type(vec3f) :: normal
  end type collider_convex_hull_face


  ! Don't try to raw initialize this lol.
  type, abstract :: collider
  contains
    ! procedure ::
  end type collider


  type, extends(collider) :: collider_convex_hull
    type(vec3f), dimension(:), pointer :: vertices => null()
    type(vec3f), dimension(:), pointer :: transformed_vertices => null()
    type(collider_convex_hull_face), dimension(:), pointer :: faces => null()
    type(collider_convex_hull_face), dimension(:), pointer :: transformed_faces => null()

    integer(c_int32_t), dimension(:,:), pointer :: vertex_to_faces => null()
    integer(c_int32_t), dimension(:,:), pointer :: vertex_to_neighbors => null()
    integer(c_int32_t), dimension(:,:), pointer :: face_to_neighbors => null()
  end type collider_convex_hull


  type, extends(collider) :: collider_sphere
    real(c_float) :: radius = 0
    type(vec3f) :: center
  end type collider_sphere


contains


  function new_collider_sphere(radius) result(sph)
    implicit none

    real(c_float), intent(in), value :: radius
    type(collider_sphere) :: sph

    sph%radius = radius
  end function new_collider_sphere




end module collider_mod
