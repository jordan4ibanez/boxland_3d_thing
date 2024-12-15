module collider_mod
  use, intrinsic :: iso_c_binding
  use :: vector_3d
  implicit none


  type collider_contact
    type(vec3d) :: collision_point_1
    type(vec3d) :: collision_point_2
    type(vec3d) :: normal
  end type collider_contact


  integer(1) :: COLLIDER_TYPE_SPHERE = 0
  integer(1) :: COLLIDER_TYPE_CONVEX_HULL = 1


  type :: collider_convex_hull_face
    integer(c_int32_t), dimension(:), pointer :: elements => null()
    type(vec3d) :: normal
  end type collider_convex_hull_face


  ! Don't try to raw initialize this lol.
  type, abstract :: collider
  end type collider


  type, extends(collider) :: collider_convex_hull
    type(vec3d), dimension(:), pointer :: vertices => null()
    type(vec3d), dimension(:), pointer :: transformed_vertices => null()
    type(collider_convex_hull_face), dimension(:), pointer :: faces => null()
    type(collider_convex_hull_face), dimension(:), pointer :: transformed_faces => null()
    integer(c_int32_t), dimension(:,:), pointer :: vertex_to_faces => null()
    integer(c_int32_t), dimension(:,:), pointer :: vertex_to_neighbors => null()
    integer(c_int32_t), dimension(:,:), pointer :: face_to_neighbors => null()
  end type collider_convex_hull


  type, extends(collider) :: collider_sphere
    real(c_float) :: radius = 0
    type(vec3d) :: center
  end type collider_sphere


contains


  function new_collider_sphere(radius) result(sph)
    implicit none

    real(c_float), intent(in), value :: radius
    type(collider_sphere) :: sph

    sph%radius = radius
  end function new_collider_sphere


  function do_triangles_share_same_vertex(t1, t2) result(truth)
    implicit none

    type(vec3d), intent(in) :: t1, t2
    logical :: truth

    truth = t1%x == t2%x .or. t1%x == t2%y .or. t1%x == t2%z .or. &
      t1%y == t2%x .or. t1%y == t2%y .or. t1%y == t2%z .or. &
      t1%z == t2%x .or. t1%z == t2%y .or. t1%z == t2%z
  end function do_triangles_share_same_vertex


  function do_faces_share_same_vertex(e1, e2) result(truth)
    implicit none

    integer(c_int32_t), intent(in), dimension(:) :: e1, e2
    logical :: truth
    integer(c_int32_t) :: i, j, i1, i2

    truth = .false.

    do i = 1, size(e1)
      i1 = e1(i)
      do j = 1, size(e2)
        i2 = e2(j)
        if (i1 == i2) then
          truth = .true.
          return
        end if
      end do
    end do
  end function do_faces_share_same_vertex


end module collider_mod
