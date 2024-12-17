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


  end interface


end module jolt_bindings
