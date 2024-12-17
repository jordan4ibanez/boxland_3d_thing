module world
  use :: jolt_bindings
  use :: string_f90
  use, intrinsic :: iso_c_binding
  implicit none


  ! Please keep in mind, I am learning how to use jolt physics.
  ! So I literally have no idea what I'm doing.


  integer(c_int16_t), parameter :: LAYERS_NON_MOVING = 0
  integer(c_int16_t), parameter :: LAYERS_MOVING = 1
  integer(c_int32_t), parameter :: NUM_LAYERS = 2

  integer(c_int8_t), parameter :: BROAD_PHASE_LAYERS_NON_MOVING = 0
  integer(c_int8_t), parameter :: BROAD_PHASE_LAYERS_MOVING = 1


  type(c_ptr) :: job_system_threadpool
  type(c_ptr) :: object_layer_pair_filter_table
  type(c_ptr) :: broad_phase_layer_interface_table
  type(c_ptr) :: object_vs_broad_phase_layer_filter


contains


  subroutine world_create()
    implicit none

    if (.not. jph_init()) then
      error stop "Failed to initialize Jolt Physics."
    else
      print"(A)", "Initialized Jolt Physics."
    end if

    call jph_set_trace_handler(c_funloc(trace_output_handler))

    job_system_threadpool = jph_job_system_threadpool_create(c_null_ptr)

    ! We're only using 2 layers.
    ! One for non-moving, one for moving.
    object_layer_pair_filter_table = jph_object_layer_pair_filter_table_create(2)
    call jph_object_layer_pair_filter_table_enable_collision(object_layer_pair_filter_table, LAYERS_NON_MOVING, LAYERS_MOVING)
    call jph_object_layer_pair_filter_table_enable_collision(object_layer_pair_filter_table, LAYERS_MOVING, LAYERS_NON_MOVING)

    ! We use a 1 to 1 mapping between object layers and broadphase layers.
    broad_phase_layer_interface_table = jph_broad_phase_layer_interface_table_create(2, 2)
    call jph_broadphaselayer_interfacetable_map_object_tobroadphaselayer(broad_phase_layer_interface_table, LAYERS_NON_MOVING, BROAD_PHASE_LAYERS_NON_MOVING)
    call jph_broadphaselayer_interfacetable_map_object_tobroadphaselayer(broad_phase_layer_interface_table, LAYERS_MOVING, BROAD_PHASE_LAYERS_MOVING)

    ! 	JPH_ObjectVsBroadPhaseLayerFilter* objectVsBroadPhaseLayerFilter = JPH_ObjectVsBroadPhaseLayerFilterTable_Create(broadPhaseLayerInterfaceTable, 2, objectLayerPairFilterTable, 2);
    object_vs_broad_phase_layer_filter = jph_object_vs_broad_phase_layer_filter_table_create(broad_phase_layer_interface_table, 2, object_layer_pair_filter_table, 2)

    print"(A)","World created."
  end subroutine world_create


  subroutine trace_output_handler(raw_c_message) bind(c)
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
