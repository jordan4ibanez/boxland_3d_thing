module world
  use :: jolt_bindings
  use :: string_f90
  use :: vector_3f
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
  type(JPH_PhysicsSystemSettings), target :: settings
  type(c_ptr) :: system
  type(c_ptr) :: body_interface
  integer(c_int32_t) :: body_id
  type(c_ptr) :: floor_shape
  type(c_ptr) :: floor_settings

contains


  subroutine world_create()
    implicit none

    type(vec3f), target :: box_half_extents, floor_position

    if (.not. jph_init()) then
      error stop "Failed to initialize Jolt Physics."
    else
      print"(A)", "Initialized Jolt Physics."
    end if

    call JPH_SetTraceHandler(c_funloc(trace_output_handler))

    job_system_threadpool = JPH_JobSystemThreadPool_Create(c_null_ptr)

    ! We're only using 2 layers.
    ! One for non-moving, one for moving.
    object_layer_pair_filter_table = JPH_ObjectLayerPairFilterTable_Create(2)
    call JPH_ObjectLayerPairFilterTable_EnableCollision(object_layer_pair_filter_table, LAYERS_NON_MOVING, LAYERS_MOVING)
    call JPH_ObjectLayerPairFilterTable_EnableCollision(object_layer_pair_filter_table, LAYERS_MOVING, LAYERS_NON_MOVING)

    ! We use a 1 to 1 mapping between object layers and broadphase layers.
    broad_phase_layer_interface_table = JPH_BroadPhaseLayerInterfaceTable_Create(2, 2)
    call JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer(broad_phase_layer_interface_table, LAYERS_NON_MOVING, BROAD_PHASE_LAYERS_NON_MOVING)
    call JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer(broad_phase_layer_interface_table, LAYERS_MOVING, BROAD_PHASE_LAYERS_MOVING)

    ! 	JPH_ObjectVsBroadPhaseLayerFilter* objectVsBroadPhaseLayerFilter = JPH_ObjectVsBroadPhaseLayerFilterTable_Create(broadPhaseLayerInterfaceTable, 2, objectLayerPairFilterTable, 2);
    object_vs_broad_phase_layer_filter = JPH_ObjectVsBroadPhaseLayerFilterTable_Create(broad_phase_layer_interface_table, 2, object_layer_pair_filter_table, 2)

    settings%maxBodies = 65536
    settings%numBodyMutexes = 0
    settings%maxBodyPairs = 65536
    settings%maxContactConstraints = 65536
    settings%broadPhaseLayerInterface = broad_phase_layer_interface_table
    settings%objectLayerPairFilter= object_layer_pair_filter_table
    settings%objectVsBroadPhaseLayerFilter = object_vs_broad_phase_layer_filter
    system = JPH_PhysicsSystem_Create(c_loc(settings))
    body_interface = JPH_PhysicsSystem_GetBodyInterface(system)

    box_half_extents = [100.0, 1.0, 100.0]
    floor_shape = JPH_BoxShape_Create(c_loc(box_half_extents), JPH_DEFAULT_CONVEX_RADIUS)

    floor_position = [0.0, -1.0, 0.0]

    floor_settings = JPH_BodyCreationSettings_Create3()



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
