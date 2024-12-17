module jolt_bindings
  use, intrinsic :: iso_c_binding
  implicit none


  ! typedef uint32_t JPH_BodyID;
  ! typedef uint32_t JPH_SubShapeID;
  ! typedef uint16_t JPH_ObjectLayer;
  ! typedef uint8_t  JPH_BroadPhaseLayer;


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


    subroutine jph_set_trace_handler(handler) bind(c, name = "JPH_SetTraceHandler")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_funptr), intent(in), value :: handler
    end subroutine jph_set_trace_handler


    function jph_job_system_threadpool_create(config) result(job_system) bind(c, name = "JPH_JobSystemThreadPool_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: config
      type(c_ptr) :: job_system
    end function jph_job_system_threadpool_create


    function jph_object_layer_pair_filter_table_create(num_object_layers) result(object_layer_pair_filters) bind(c, name = "JPH_ObjectLayerPairFilterTable_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int32_t), intent(in), value :: num_object_layers
      type(c_ptr) :: object_layer_pair_filters
    end function jph_object_layer_pair_filter_table_create


    subroutine jph_object_layer_pair_filter_table_enable_collision(object_filter, layer_1, layer_2) bind(c, name = "JPH_ObjectLayerPairFilterTable_EnableCollision")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: object_filter
      integer(c_int16_t), intent(in), value :: layer_1, layer_2
    end subroutine jph_object_layer_pair_filter_table_enable_collision


    function jph_broad_phase_layer_interface_table_create(num_object_layers, num_broad_phase_layers) result(broad_phase_layer_interface) bind(c, name = "JPH_BroadPhaseLayerInterfaceTable_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int32_t), intent(in), value :: num_object_layers, num_broad_phase_layers
      type(c_ptr) :: broad_phase_layer_interface
    end function jph_broad_phase_layer_interface_table_create


    subroutine jph_broadphaselayer_interfacetable_map_object_tobroadphaselayer(bp_interface, object_layer, broad_phase_layer) bind(c, name = "JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: bp_interface
      integer(c_int16_t), intent(in), value :: object_layer
      integer(c_int8_t), intent(in), value :: broad_phase_layer
    end subroutine jph_broadphaselayer_interfacetable_map_object_tobroadphaselayer


  end interface


end module jolt_bindings
