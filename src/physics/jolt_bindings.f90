module jolt_bindings
  use, intrinsic :: iso_c_binding
  implicit none

  ! Copyright (c) Amer Koleci and Contributors.
  ! Licensed under the MIT License (MIT). See LICENSE in the repository root for more information.

  !? Implementation note: I'm not going to be transferring my snakecasing as I want this to be a direct translation.

  real(c_float), parameter :: JPH_DEFAULT_COLLISION_TOLERANCE = real(1.0e0 - 4.0) ! float cDefaultCollisionTolerance = 1.0e-4f
  real(c_float), parameter :: JPH_DEFAULT_PENETRATION_TOLERANCE = (1.0e0 - 4.0) ! float cDefaultPenetrationTolerance = 1.0e-4f
  real(c_float), parameter :: JPH_DEFAULT_CONVEX_RADIUS = (0.05) ! float cDefaultConvexRadius = 0.05f
  real(c_float), parameter :: JPH_CAPSULE_PROJECTION_SLOP = (0.02) ! float cCapsuleProjectionSlop = 0.02f
  integer(c_int32_t), parameter :: JPH_MAX_PHYSICS_JOBS = (2048) ! int cMaxPhysicsJobs = 2048
  integer(c_int32_t), parameter :: JPH_MAX_PHYSICS_BARRIERS = (2048) ! int cMaxPhysicsBarriers = 8


  type, bind(c) :: JPH_BodyID
    integer(c_int32_t) :: data = 0
  end type JPH_BodyID


  type, bind(c) :: JPH_SubShapeID
    integer(c_int32_t) :: data = 0
  end type JPH_SubShapeID


  type, bind(c) :: JPH_ObjectLayer
    integer(c_int16_t) :: data = 0
  end type JPH_ObjectLayer


  type, bind(c) :: JPH_BroadPhaseLayer
    integer(c_int8_t) :: data = 0
  end type JPH_BroadPhaseLayer


  integer(c_int32_t), parameter :: JPH_PhysicsUpdateError_None = 0
  integer(c_int32_t), parameter :: JPH_PhysicsUpdateError_ManifoldCacheFull = shiftl(1, 0)
  integer(c_int32_t), parameter :: JPH_PhysicsUpdateError_BodyPairCacheFull = shiftl(1, 1)
  integer(c_int32_t), parameter :: JPH_PhysicsUpdateError_ContactConstraintsFull = shiftl(1, 2)
  integer(c_int32_t), parameter :: JPH_PhysicsUpdateError_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_PhysicsUpdateError_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_BodyType_Rigid = 0
  integer(c_int32_t), parameter :: JPH_BodyType_Soft = 1
  integer(c_int32_t), parameter :: JPH_BodyType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_BodyType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_MotionType_Static = 0
  integer(c_int32_t), parameter :: JPH_MotionType_Kinematic = 1
  integer(c_int32_t), parameter :: JPH_MotionType_Dynamic = 2
  integer(c_int32_t), parameter :: JPH_MotionType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_MotionType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_Activation_Activate = 0
  integer(c_int32_t), parameter :: JPH_Activation_DontActivate = 1
  integer(c_int32_t), parameter :: JPH_Activation_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_Activation_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ValidateResult_AcceptAllContactsForThisBodyPair = 0
  integer(c_int32_t), parameter :: JPH_ValidateResult_AcceptContact = 1
  integer(c_int32_t), parameter :: JPH_ValidateResult_RejectContact = 2
  integer(c_int32_t), parameter :: JPH_ValidateResult_RejectAllContactsForThisBodyPair = 3
  integer(c_int32_t), parameter :: JPH_ValidateResult_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ValidateResult_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ShapeType_Convex = 0
  integer(c_int32_t), parameter :: JPH_ShapeType_Compound = 1
  integer(c_int32_t), parameter :: JPH_ShapeType_Decorated = 2
  integer(c_int32_t), parameter :: JPH_ShapeType_Mesh = 3
  integer(c_int32_t), parameter :: JPH_ShapeType_HeightField = 4
  integer(c_int32_t), parameter :: JPH_ShapeType_SoftBody = 5
  integer(c_int32_t), parameter :: JPH_ShapeType_User1 = 6
  integer(c_int32_t), parameter :: JPH_ShapeType_User2 = 7
  integer(c_int32_t), parameter :: JPH_ShapeType_User3 = 8
  integer(c_int32_t), parameter :: JPH_ShapeType_User4 = 9
  integer(c_int32_t), parameter :: JPH_ShapeType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ShapeType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ShapeSubType_Sphere = 0
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Box = 1
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Triangle = 2
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Capsule = 3
  integer(c_int32_t), parameter :: JPH_ShapeSubType_TaperedCapsule = 4
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Cylinder = 5
  integer(c_int32_t), parameter :: JPH_ShapeSubType_ConvexHull = 6
  integer(c_int32_t), parameter :: JPH_ShapeSubType_StaticCompound = 7
  integer(c_int32_t), parameter :: JPH_ShapeSubType_MutableCompound = 8
  integer(c_int32_t), parameter :: JPH_ShapeSubType_RotatedTranslated = 9
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Scaled = 10
  integer(c_int32_t), parameter :: JPH_ShapeSubType_OffsetCenterOfMass = 11
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Mesh = 12
  integer(c_int32_t), parameter :: JPH_ShapeSubType_HeightField = 13
  integer(c_int32_t), parameter :: JPH_ShapeSubType_SoftBody = 14
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ShapeSubType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ConstraintType_Constraint = 0
  integer(c_int32_t), parameter :: JPH_ConstraintType_TwoBodyConstraint = 1
  integer(c_int32_t), parameter :: JPH_ConstraintType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ConstraintType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Fixed = 0
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Point = 1
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Hinge = 2
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Slider = 3
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Distance = 4
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Cone = 5
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_SwingTwist = 6
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_SixDOF = 7
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Path = 8
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Vehicle = 9
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_RackAndPinion = 10
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Gear = 11
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Pulley = 12
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_User1 = 13
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_User2 = 14
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_User3 = 15
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_User4 = 16
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ConstraintSubType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ConstraintSpace_LocalToBodyCOM = 0
  integer(c_int32_t), parameter :: JPH_ConstraintSpace_WorldSpace = 1
  integer(c_int32_t), parameter :: JPH_ConstraintSpace_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ConstraintSpace_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_MotionQuality_Discrete = 0
  integer(c_int32_t), parameter :: JPH_MotionQuality_LinearCast = 1
  integer(c_int32_t), parameter :: JPH_MotionQuality_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_MotionQuality_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_AllowedDOFs_All = int(z"0b111111")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_TranslationX = int(z"0b000001")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_TranslationY = int(z"0b000010")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_TranslationZ = int(z"0b000100")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_RotationX = int(z"0b001000")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_RotationY = int(z"0b010000")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_RotationZ = int(z"0b100000")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_Plane2D = ior(JPH_AllowedDOFs_TranslationX, ior(JPH_AllowedDOFs_TranslationY, JPH_AllowedDOFs_RotationZ))
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_AllowedDOFs_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_GroundState_OnGround = 0
  integer(c_int32_t), parameter :: JPH_GroundState_OnSteepGround = 1
  integer(c_int32_t), parameter :: JPH_GroundState_NotSupported = 2
  integer(c_int32_t), parameter :: JPH_GroundState_InAir = 3
  integer(c_int32_t), parameter :: JPH_GroundState_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_GroundState_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_BackFaceMode_IgnoreBackFaces = 0
  integer(c_int32_t), parameter :: JPH_BackFaceMode_CollideWithBackFaces = 1
  integer(c_int32_t), parameter :: JPH_BackFaceMode_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_BackFaceMode_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_ActiveEdgeMode_CollideOnlyWithActive = 0
  integer(c_int32_t), parameter :: JPH_ActiveEdgeMode_CollideWithAll = 1
  integer(c_int32_t), parameter :: JPH_ActiveEdgeMode_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_ActiveEdgeMode_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_CollectFacesMode_CollectFaces = 0
  integer(c_int32_t), parameter :: JPH_CollectFacesMode_NoFaces = 1
  integer(c_int32_t), parameter :: JPH_CollectFacesMode_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_CollectFacesMode_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_MotorState_Off = 0
  integer(c_int32_t), parameter :: JPH_MotorState_Velocity = 1
  integer(c_int32_t), parameter :: JPH_MotorState_Position = 2
  integer(c_int32_t), parameter :: JPH_MotorState_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_MotorState_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_CollisionCollectorType_AllHit = 0
  integer(c_int32_t), parameter :: JPH_CollisionCollectorType_AllHitSorted = 1
  integer(c_int32_t), parameter :: JPH_CollisionCollectorType_ClosestHit = 2
  integer(c_int32_t), parameter :: JPH_CollisionCollectorType_AnyHit = 3
  integer(c_int32_t), parameter :: JPH_CollisionCollectorType_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_CollisionCollectorType_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_TranslationX = 0
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_TranslationY = 1
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_TranslationZ = 2
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_RotationX = 3
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_RotationY = 4
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_RotationZ = 5
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_SixDOFConstraintAxis_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_SpringMode_FrequencyAndDamping = 0
  integer(c_int32_t), parameter :: JPH_SpringMode_StiffnessAndDamping = 1
  integer(c_int32_t), parameter :: JPH_SpringMode_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_SpringMode_Force32 = int(z"7fffffff")


  !* Defines how to color soft body constraints
  integer(c_int32_t), parameter :: JPH_SoftBodyConstraintColor_ConstraintType = 0        !* Draw different types of constraints in different colors
  integer(c_int32_t), parameter :: JPH_SoftBodyConstraintColor_ConstraintGroup = 1       !* Draw constraints in the same group in the same color, non-parallel group will be red
  integer(c_int32_t), parameter :: JPH_SoftBodyConstraintColor_ConstraintOrder = 2       !* Draw constraints in the same group in the same color, non-parallel group will be red, and order within each group will be indicated with gradient
  integer(c_int32_t), parameter :: JPH_SoftBodyConstraintColor_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_SoftBodyConstraintColor_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_InstanceColor = 0        !*< Random color per instance
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_ShapeTypeColor = 1        !*< Convex = green, scaled = yellow, compound = orange, mesh = red
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_MotionTypeColor = 2      !*< Static = grey, keyframed = green, dynamic = random color per instance
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_SleepColor = 3          !*< Static = grey, keyframed = green, dynamic = yellow, sleeping = red
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_IslandColor = 4        !*< Static = grey, active = random color per island, sleeping = light grey
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_MaterialColor = 5        !*< Color as defined by the PhysicsMaterial of the shape
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_BodyManager_ShapeColor_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_DebugRenderer_CastShadow_On = 0    !*< This shape should cast a shadow
  integer(c_int32_t), parameter :: JPH_DebugRenderer_CastShadow_Off = 1   !*< This shape should not cast a shadow
  integer(c_int32_t), parameter :: JPH_DebugRenderer_CastShadow_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_DebugRenderer_CastShadow_Force32 = int(z"7fffffff")


  integer(c_int32_t), parameter :: JPH_DebugRenderer_DrawMode_Solid = 0       !*< Draw as a solid shape
  integer(c_int32_t), parameter :: JPH_DebugRenderer_DrawMode_Wireframe = 1   !*< Draw as wireframe
  integer(c_int32_t), parameter :: JPH_DebugRendererJPH_DebugRenderer_DrawMode_Count = int(z"7fffffff")
  integer(c_int32_t), parameter :: JPH_DebugRendererJPH_DebugRenderer_DrawMode_Force32 = int(z"7fffffff")


  type, bind(c) :: JPH_Vec3
    real(c_float) :: x = 0.0
    real(c_float) :: y = 0.0
    real(c_float) :: z = 0.0
  end type JPH_Vec3


  type, bind(c) :: JPH_Vec4
    real(c_float) :: x = 0.0
    real(c_float) :: y = 0.0
    real(c_float) :: z = 0.0
    real(c_float) :: w = 0.0
  end type JPH_Vec4


  type, bind(c) :: JPH_Quat
    real(c_float) :: x = 0.0
    real(c_float) :: y = 0.0
    real(c_float) :: z = 0.0
    real(c_float) :: w = 0.0
  end type JPH_Quat


  type, bind(c) :: JPH_Plane
    type(JPH_Vec3) :: normal
    real(c_float) :: distance = 0.0
  end type JPH_Plane


  type, bind(c) :: JPH_Matrix4x4
    real(c_float) :: m11 = 0.0
    real(c_float) :: m12 = 0.0
    real(c_float) :: m13 = 0.0
    real(c_float) :: m14 = 0.0
    real(c_float) :: m21 = 0.0
    real(c_float) :: m22 = 0.0
    real(c_float) :: m23 = 0.0
    real(c_float) :: m24 = 0.0
    real(c_float) :: m31 = 0.0
    real(c_float) :: m32 = 0.0
    real(c_float) :: m33 = 0.0
    real(c_float) :: m34 = 0.0
    real(c_float) :: m41 = 0.0
    real(c_float) :: m42 = 0.0
    real(c_float) :: m43 = 0.0
    real(c_float) :: m44 = 0.0
  end type JPH_Matrix4x4


  type, bind(c) :: JPH_RVec3
    real(c_double) :: x = 0.0
    real(c_double) :: y = 0.0
    real(c_double) :: z = 0.0
  end type JPH_RVec3


  type, bind(c) :: JPH_RMatrix4x4
    real(c_float) :: m11 = 0.0
    real(c_float) :: m12 = 0.0
    real(c_float) :: m13 = 0.0
    real(c_float) :: m14 = 0.0
    real(c_float) :: m21 = 0.0
    real(c_float) :: m22 = 0.0
    real(c_float) :: m23 = 0.0
    real(c_float) :: m24 = 0.0
    real(c_float) :: m31 = 0.0
    real(c_float) :: m32 = 0.0
    real(c_float) :: m33 = 0.0
    real(c_float) :: m34 = 0.0
    real(c_float) :: m41 = 0.0
    real(c_float) :: m42 = 0.0
    real(c_float) :: m43 = 0.0
    real(c_float) :: m44 = 0.0
  end type JPH_RMatrix4x4


  type, bind(c) :: JPH_Color
    integer(c_int32_t) :: JPH_Color = 0
  end type JPH_Color


  type, bind(c) :: JPH_AABox
    type(JPH_Vec3) :: min
    type(JPH_Vec3) :: max
  end type JPH_AABox


  type, bind(c) :: JPH_Triangle
    type(JPH_Vec3) :: v1
    type(JPH_Vec3) :: v2
    type(JPH_Vec3) :: v3
    integer(c_int32_t) :: materialIndex = 0
  end type JPH_Triangle


  type, bind(c) :: JPH_IndexedTriangleNoMaterial
    integer(c_int32_t) :: i1 = 0
    integer(c_int32_t) :: i2 = 0
    integer(c_int32_t) :: i3 = 0
  end type JPH_IndexedTriangleNoMaterial


  type, bind(c) :: JPH_IndexedTriangle
    integer(c_int32_t) :: i1 = 0
    integer(c_int32_t) :: i2 = 0
    integer(c_int32_t) :: i3 = 0
    integer(c_int32_t) :: materialIndex = 0
    integer(c_int32_t) :: userData = 0
  end type JPH_IndexedTriangle


  type, bind(c) :: JPH_MassProperties
    real(c_float) :: mass = 0.0
    type(JPH_Matrix4x4) :: inertia
  end type JPH_MassProperties


  type, bind(c) :: JPH_CollideSettingsBase
    !* How active edges (edges that a moving object should bump into) are handled
    integer(c_int32_t) ::      activeEdgeMode = JPH_ActiveEdgeMode_CollideOnlyWithActive !* = JPH_ActiveEdgeMode_CollideOnlyWithActive*/

    !* If colliding faces should be collected or only the collision point
    integer(c_int32_t) ::    collectFacesMode = JPH_CollectFacesMode_NoFaces !* = JPH_CollectFacesMode_NoFaces*/

    !* If objects are closer than this distance, they are considered to be colliding (used for GJK) (unit: meter)
    real(c_float) :: collisionTolerance = JPH_DEFAULT_COLLISION_TOLERANCE !* = JPH_DEFAULT_COLLISION_TOLERANCE*/

    !* A factor that determines the accuracy of the penetration depth calculation. If the change of the squared distance is less than tolerance * current_penetration_depth^2 the algorithm will terminate. (unit: dimensionless)
    real(c_float) :: penetrationTolerance = JPH_DEFAULT_PENETRATION_TOLERANCE !* = JPH_DEFAULT_PENETRATION_TOLERANCE*/

    !* When mActiveEdgeMode is CollideOnlyWithActive a movement direction can be provided. When hitting an inactive edge, the system will select the triangle normal as penetration depth only if it impedes the movement less than with the calculated penetration depth.
    type(JPH_Vec3) ::          activeEdgeMovementDirection !* = Vec3::sZero()*/
  end type JPH_CollideSettingsBase


  !* CollideShapeSettings.
  type, bind(c) :: JPH_CollideShapeSettings
    type(JPH_CollideSettingsBase) ::     base     !* Inherics JPH_CollideSettingsBase */
    !* When > 0 contacts in the vicinity of the query shape can be found. All nearest contacts that are not further away than this distance will be found (unit: meter)
    real(c_float) :: maxSeparationDistance = 0.0 !* = 0.0f*/

    !* How backfacing triangles should be treated
    integer(c_int32_t) ::      backFaceMode = JPH_BackFaceMode_IgnoreBackFaces !* = JPH_BackFaceMode_IgnoreBackFaces*/
  end type JPH_CollideShapeSettings


  !* ShapeCastSettings */
  type, bind(c) :: JPH_ShapeCastSettings
    type(JPH_CollideSettingsBase) ::     base    !* Inherics JPH_CollideSettingsBase */

    !* How backfacing triangles should be treated (should we report moving from back to front for triangle based shapes, e.g. for MeshShape/HeightFieldShape?)
    integer(c_int32_t) ::      backFaceModeTriangles = JPH_BackFaceMode_IgnoreBackFaces !* = JPH_BackFaceMode_IgnoreBackFaces*/

    !* How backfacing convex objects should be treated (should we report starting inside an object and moving out?)
    integer(c_int32_t) ::      backFaceModeConvex = JPH_BackFaceMode_IgnoreBackFaces !* = JPH_BackFaceMode_IgnoreBackFaces*/

    !* Indicates if we want to shrink the shape by the convex radius and then expand it again. This speeds up collision detection and gives a more accurate normal at the cost of a more 'rounded' shape.
    logical(c_bool) ::            useShrunkenShapeAndConvexRadius = .false. !* = false*/

    !* When true, and the shape is intersecting at the beginning of the cast (fraction = 0) then this will calculate the deepest penetration point (costing additional CPU time)
    logical(c_bool) ::            returnDeepestPoint = .false. !* = false*/
  end type JPH_ShapeCastSettings


  type, bind(c) :: JPH_RayCastSettings
    !* How backfacing triangles should be treated (should we report back facing hits for triangle based shapes, e.g. MeshShape/HeightFieldShape?)
    integer(c_int32_t) :: backFaceModeTriangles = JPH_BackFaceMode_IgnoreBackFaces !* = JPH_BackFaceMode_IgnoreBackFaces*/

    !* How backfacing convex objects should be treated (should we report back facing hits for convex shapes?)
    integer(c_int32_t) :: backFaceModeConvex = JPH_BackFaceMode_IgnoreBackFaces !* = JPH_BackFaceMode_IgnoreBackFaces*/

    !* If convex shapes should be treated as solid. When true, a ray starting inside a convex shape will generate a hit at fraction 0.
    logical(c_bool) :: treatConvexAsSolid  = .true. !* = true*/
  end type JPH_RayCastSettings


  type, bind(c) :: JPH_SpringSettings
    integer(c_int32_t) :: mode = 0
    real(c_float) :: frequencyOrStiffness = 0.0
    real(c_float) :: damping = 0.0
  end type JPH_SpringSettings


  type, bind(c) :: JPH_MotorSettings
    TYPE(JPH_SpringSettings) :: springSettings
    real(c_float) :: minForceLimit = 0.0
    real(c_float) :: maxForceLimit = 0.0
    real(c_float) :: minTorqueLimit = 0.0
    real(c_float) :: maxTorqueLimit = 0.0
  end type JPH_MotorSettings


  type, bind(c) :: JPH_SubShapeIDPair
    type(JPH_BodyID) ::     Body1ID
    type(JPH_SubShapeID) :: subShapeID1
    type(JPH_BodyID) ::     Body2ID
    type(JPH_SubShapeID) :: subShapeID2
  end type JPH_SubShapeIDPair


  type, bind(c) :: JPH_BroadPhaseCastResult
    type(JPH_BodyID) ::     bodyID
    real(c_float) :: fraction = 0.0
  end type JPH_BroadPhaseCastResult


  type, bind(c) :: JPH_RayCastResult
    type(JPH_BodyID) ::     bodyID
    real(c_float) :: fraction = 0.0
    type(JPH_SubShapeID) :: subShapeID2
  end type JPH_RayCastResult


  type, bind(c) :: JPH_CollidePointResult
    type(JPH_BodyID) :: bodyID
    type(JPH_SubShapeID) :: subShapeID2
  end type JPH_CollidePointResult


  type, bind(c) :: JPH_CollideShapeResult
    type(JPH_Vec3) ::           contactPointOn1
    type(JPH_Vec3) ::           contactPointOn2
    type(JPH_Vec3) ::           penetrationAxis
    real(c_float) :: penetrationDepth = 0.0
    type(JPH_SubShapeID) ::     subShapeID1
    type(JPH_SubShapeID) ::     subShapeID2
    type(JPH_BodyID) ::         bodyID2
  end type JPH_CollideShapeResult


  type, bind(c) :: JPH_ShapeCastResult
    type(JPH_Vec3) ::           contactPointOn1
    type(JPH_Vec3) ::           contactPointOn2
    type(JPH_Vec3) ::           penetrationAxis
    real(c_float) :: penetrationDepth
    type(JPH_SubShapeID) ::     subShapeID1
    type(JPH_SubShapeID) ::     subShapeID2
    type(JPH_BodyID) ::         bodyID2
    real(c_float) :: fraction = 0.0
    logical(c_bool) ::         isBackFaceHit = .false.
  end type JPH_ShapeCastResult


  type, bind(c) :: JPH_DrawSettings
    logical(c_bool) ::          drawGetSupportFunction        !*< Draw the GetSupport() function, used for convex collision detection
    logical(c_bool) ::          drawSupportDirection        !*< When drawing the support function, also draw which direction mapped to a specific support point
    logical(c_bool) ::          drawGetSupportingFace        !*< Draw the faces that were found colliding during collision detection
    logical(c_bool) ::          drawShape              !*< Draw the shapes of all bodies
    logical(c_bool) ::          drawShapeWireframe          !*< When mDrawShape is true and this is true, the shapes will be drawn in wireframe instead of solid.
    integer(c_int32_t) ::  drawShapeColor = 0                     !*< Coloring scheme to use for shapes
    logical(c_bool) ::          drawBoundingBox          !*< Draw a bounding box per body
    logical(c_bool) ::          drawCenterOfMassTransform      !*< Draw the center of mass for each body
    logical(c_bool) ::          drawWorldTransform          !*< Draw the world transform (which can be different than the center of mass) for each body
    logical(c_bool) ::          drawVelocity            !*< Draw the velocity vector for each body
    logical(c_bool) ::          drawMassAndInertia          !*< Draw the mass and inertia (as the box equivalent) for each body
    logical(c_bool) ::          drawSleepStats            !*< Draw stats regarding the sleeping algorithm of each body
    logical(c_bool) ::          drawSoftBodyVertices        !*< Draw the vertices of soft bodies
    logical(c_bool) ::          drawSoftBodyVertexVelocities    !*< Draw the velocities of the vertices of soft bodies
    logical(c_bool) ::          drawSoftBodyEdgeConstraints    !*< Draw the edge constraints of soft bodies
    logical(c_bool) ::          drawSoftBodyBendConstraints    !*< Draw the bend constraints of soft bodies
    logical(c_bool) ::          drawSoftBodyVolumeConstraints    !*< Draw the volume constraints of soft bodies
    logical(c_bool) ::          drawSoftBodySkinConstraints    !*< Draw the skin constraints of soft bodies
    logical(c_bool) ::          drawSoftBodyLRAConstraints          !*< Draw the LRA constraints of soft bodies
    logical(c_bool) ::          drawSoftBodyPredictedBounds    !*< Draw the predicted bounds of soft bodies
    integer(c_int32_t )::  drawSoftBodyConstraintColor = 0        !*< Coloring scheme to use for soft body constraints
  end type JPH_DrawSettings


! typedef void JPH_CastRayResultCallback(void* context, const JPH_RayCastResult* result)
! typedef void JPH_RayCastBodyResultCallback(void* context, const JPH_BroadPhaseCastResult* result)
! typedef void JPH_CollideShapeBodyResultCallback(void* context, const JPH_BodyID result)
! typedef void JPH_CollidePointResultCallback(void* context, const JPH_CollidePointResult* result)
! typedef void JPH_CollideShapeResultCallback(void* context, const JPH_CollideShapeResult* result)
! typedef void JPH_CastShapeResultCallback(void* context, const JPH_ShapeCastResult* result)

! typedef float JPH_CastRayCollector(void* context, const JPH_RayCastResult* result)
! typedef float JPH_RayCastBodyCollector(void* context, const JPH_BroadPhaseCastResult* result)
! typedef float JPH_CollideShapeBodyCollector(void* context, const JPH_BodyID result)
! typedef float JPH_CollidePointCollector(void* context, const JPH_CollidePointResult* result)
! typedef float JPH_CollideShapeCollector(void* context, const JPH_CollideShapeResult* result)
! typedef float JPH_CastShapeCollector(void* context, const JPH_ShapeCastResult* result)

! typedef struct JPH_BroadPhaseLayerInterface      JPH_BroadPhaseLayerInterface
! typedef struct JPH_ObjectVsBroadPhaseLayerFilter  JPH_ObjectVsBroadPhaseLayerFilter
! typedef struct JPH_ObjectLayerPairFilter      JPH_ObjectLayerPairFilter

! typedef struct JPH_BroadPhaseLayerFilter            JPH_BroadPhaseLayerFilter
! typedef struct JPH_ObjectLayerFilter                JPH_ObjectLayerFilter
! typedef struct JPH_BodyFilter                       JPH_BodyFilter
! typedef struct JPH_ShapeFilter                      JPH_ShapeFilter

! typedef struct JPH_PhysicsSystem                    JPH_PhysicsSystem

! typedef struct JPH_PhysicsMaterial          JPH_PhysicsMaterial

! typedef struct JPH_ShapeSettings                    JPH_ShapeSettings
! typedef struct JPH_ConvexShapeSettings          JPH_ConvexShapeSettings
! typedef struct JPH_SphereShapeSettings              JPH_SphereShapeSettings
! typedef struct JPH_BoxShapeSettings                 JPH_BoxShapeSettings
! typedef struct JPH_PlaneShapeSettings               JPH_PlaneShapeSettings
! typedef struct JPH_TriangleShapeSettings            JPH_TriangleShapeSettings
! typedef struct JPH_CapsuleShapeSettings             JPH_CapsuleShapeSettings
! typedef struct JPH_TaperedCapsuleShapeSettings      JPH_TaperedCapsuleShapeSettings
! typedef struct JPH_CylinderShapeSettings            JPH_CylinderShapeSettings
! typedef struct JPH_TaperedCylinderShapeSettings     JPH_TaperedCylinderShapeSettings
! typedef struct JPH_ConvexHullShapeSettings          JPH_ConvexHullShapeSettings
! typedef struct JPH_CompoundShapeSettings            JPH_CompoundShapeSettings
! typedef struct JPH_StaticCompoundShapeSettings      JPH_StaticCompoundShapeSettings
! typedef struct JPH_MutableCompoundShapeSettings     JPH_MutableCompoundShapeSettings
! typedef struct JPH_MeshShapeSettings                JPH_MeshShapeSettings
! typedef struct JPH_HeightFieldShapeSettings         JPH_HeightFieldShapeSettings
! typedef struct JPH_RotatedTranslatedShapeSettings   JPH_RotatedTranslatedShapeSettings
! typedef struct JPH_ScaledShapeSettings              JPH_ScaledShapeSettings
! typedef struct JPH_OffsetCenterOfMassShapeSettings  JPH_OffsetCenterOfMassShapeSettings
! typedef struct JPH_EmptyShapeSettings               JPH_EmptyShapeSettings

! typedef struct JPH_Shape                            JPH_Shape
! typedef struct JPH_ConvexShape                      JPH_ConvexShape
! typedef struct JPH_SphereShape                      JPH_SphereShape
! typedef struct JPH_BoxShape                         JPH_BoxShape
! typedef struct JPH_PlaneShape                       JPH_PlaneShape
! typedef struct JPH_CapsuleShape                     JPH_CapsuleShape
! typedef struct JPH_CylinderShape                    JPH_CylinderShape
! typedef struct JPH_TaperedCylinderShape             JPH_TaperedCylinderShape
! typedef struct JPH_TriangleShape            JPH_TriangleShape
! typedef struct JPH_TaperedCapsuleShape          JPH_TaperedCapsuleShape
! typedef struct JPH_ConvexHullShape                  JPH_ConvexHullShape
! typedef struct JPH_CompoundShape                    JPH_CompoundShape
! typedef struct JPH_StaticCompoundShape              JPH_StaticCompoundShape
! typedef struct JPH_MutableCompoundShape             JPH_MutableCompoundShape
! typedef struct JPH_MeshShape                        JPH_MeshShape
! typedef struct JPH_HeightFieldShape                 JPH_HeightFieldShape
! typedef struct JPH_DecoratedShape                   JPH_DecoratedShape
! typedef struct JPH_RotatedTranslatedShape           JPH_RotatedTranslatedShape
! typedef struct JPH_ScaledShape                      JPH_ScaledShape
! typedef struct JPH_OffsetCenterOfMassShape          JPH_OffsetCenterOfMassShape
! typedef struct JPH_EmptyShape                       JPH_EmptyShape

! typedef struct JPH_BodyCreationSettings             JPH_BodyCreationSettings
! typedef struct JPH_SoftBodyCreationSettings         JPH_SoftBodyCreationSettings
! typedef struct JPH_BodyInterface                    JPH_BodyInterface
! typedef struct JPH_BodyLockInterface                JPH_BodyLockInterface
! typedef struct JPH_BroadPhaseQuery                  JPH_BroadPhaseQuery
! typedef struct JPH_NarrowPhaseQuery                 JPH_NarrowPhaseQuery
! typedef struct JPH_MotionProperties                 JPH_MotionProperties
! typedef struct JPH_MassProperties                   JPH_MassProperties
! typedef struct JPH_Body                             JPH_Body

! typedef struct JPH_ConstraintSettings        JPH_ConstraintSettings
! typedef struct JPH_FixedConstraintSettings      JPH_FixedConstraintSettings
! typedef struct JPH_TwoBodyConstraintSettings    JPH_TwoBodyConstraintSettings
! typedef struct JPH_FixedConstraintSettings      JPH_FixedConstraintSettings
! typedef struct JPH_DistanceConstraintSettings    JPH_DistanceConstraintSettings
! typedef struct JPH_HingeConstraintSettings      JPH_HingeConstraintSettings
! typedef struct JPH_SliderConstraintSettings      JPH_SliderConstraintSettings
! typedef struct JPH_PointConstraintSettings      JPH_PointConstraintSettings
! typedef struct JPH_ConeConstraintSettings      JPH_ConeConstraintSettings
! typedef struct JPH_SwingTwistConstraintSettings     JPH_SwingTwistConstraintSettings
! typedef struct JPH_SixDOFConstraintSettings      JPH_SixDOFConstraintSettings

! typedef struct JPH_Constraint                       JPH_Constraint
! typedef struct JPH_TwoBodyConstraint                JPH_TwoBodyConstraint
! typedef struct JPH_FixedConstraint                  JPH_FixedConstraint
! typedef struct JPH_DistanceConstraint               JPH_DistanceConstraint
! typedef struct JPH_PointConstraint                  JPH_PointConstraint
! typedef struct JPH_HingeConstraint                  JPH_HingeConstraint
! typedef struct JPH_SliderConstraint                 JPH_SliderConstraint
! typedef struct JPH_ConeConstraint                   JPH_ConeConstraint
! typedef struct JPH_SwingTwistConstraint             JPH_SwingTwistConstraint
! typedef struct JPH_SixDOFConstraint            JPH_SixDOFConstraint

! typedef struct JPH_CollideShapeResult               JPH_CollideShapeResult
! typedef struct JPH_ContactListener                  JPH_ContactListener
! typedef struct JPH_ContactManifold                  JPH_ContactManifold
! typedef struct JPH_ContactSettings                  JPH_ContactSettings

! typedef struct JPH_BodyActivationListener           JPH_BodyActivationListener
! typedef struct JPH_BodyDrawFilter                   JPH_BodyDrawFilter

! typedef struct JPH_SharedMutex                      JPH_SharedMutex

! typedef struct JPH_DebugRenderer                    JPH_DebugRenderer

  type, bind(c) :: JPH_BodyLockRead
    type(c_ptr) :: lockInterface = c_null_ptr
    type(c_ptr) :: mutex = c_null_ptr
    type(c_ptr) :: body = c_null_ptr
  end type JPH_BodyLockRead


  type, bind(c) :: JPH_BodyLockWrite
    type(c_ptr) :: lockInterface = c_null_ptr
    type(c_ptr) :: mutex = c_null_ptr
    type(c_ptr) :: body = c_null_ptr
  end type JPH_BodyLockWrite


  type, bind(c) :: JPH_ExtendedUpdateSettings
    type(JPH_Vec3) ::  stickToFloorStepDown
    type(JPH_Vec3) ::  walkStairsStepUp
    real(c_float) ::    walkStairsMinStepForward = 0.0
    real(c_float) ::    walkStairsStepForwardTest = 0.0
    real(c_float) ::    walkStairsCosAngleForwardContact = 0.0
    type(JPH_Vec3) ::  walkStairsStepDownExtra
  end type JPH_ExtendedUpdateSettings


  type, bind(c) :: JPH_CharacterBaseSettings
    type(JPH_Vec3) :: up
    type(JPH_Plane) :: supportingVolume
    real(c_float) :: maxSlopeAngle = 0.0
    logical(c_bool) :: enhancedInternalEdgeRemoval = .false.
    type(c_ptr) :: shape = c_null_ptr
  end type JPH_CharacterBaseSettings


  !* Character.
  type, bind(c) :: JPH_CharacterSettings
    type(JPH_CharacterBaseSettings) ::           base     !* Inherics JPH_CharacterBaseSettings */
    type(JPH_ObjectLayer) ::            layer
    real(c_float) ::                mass = 0.0
    real(c_float) ::                friction = 0.0
    real(c_float) ::                gravityFactor = 0.0
  end type JPH_CharacterSettings


  !* CharacterVirtual.
  type, bind(c) :: JPH_CharacterVirtualSettings
    type(JPH_CharacterBaseSettings) ::           base     !* Inherics JPH_CharacterBaseSettings */
    real(c_float) ::                mass = 0.0
    real(c_float) ::                maxStrength = 0.0
    type(JPH_Vec3) ::              shapeOffset
    integer(c_int32_t) ::          backFaceMode = 0
    real(c_float) ::                predictiveContactDistance = 0.0
    integer(c_int32_t) :: maxCollisionIterations = 0
    integer(c_int32_t) :: maxConstraintIterations = 0
    real(c_float) ::                minTimeRemaining = 0.0
    real(c_float) ::                collisionTolerance = 0.0
    real(c_float) ::                characterPadding = 0.0
    integer(c_int32_t) :: maxNumHits = 0
    real(c_float) ::                hitReductionCosMaxAngle = 0.0
    real(c_float) ::                penetrationRecoverySpeed = 0.0
    type(c_ptr) :: innerBodyShape = c_null_ptr
    type(JPH_ObjectLayer) ::            innerBodyLayer
  end type JPH_CharacterVirtualSettings


  type, bind(c) :: JPH_CharacterContactSettings
    logical(c_bool) :: canPushCharacter = .false.
    logical(c_bool) :: canReceiveImpulses = .false.
  end type JPH_CharacterContactSettings


  type, bind(c) :: JobSystemThreadPoolConfig
    integer(c_int32_t) :: maxJobs = 0
    integer(c_int32_t) :: maxBarriers = 0
    integer(c_int32_t) :: numThreads = 0
  end type JobSystemThreadPoolConfig

  type, bind(c) :: JPH_JobSystemConfig
    type(c_ptr) :: context
    type(c_ptr) :: queueJob
    type(c_ptr) :: queueJobs
    integer(c_int32_t) :: maxConcurrency = 0
    integer(c_int32_t) :: maxBarriers = 0
  end type JPH_JobSystemConfig


!* JPH_PhysicsSystem.
  type, bind(c) :: JPH_PhysicsSystemSettings
    integer(c_int32_t) :: maxBodies = 10240  !* 10240 */
    integer(c_int32_t) :: numBodyMutexes = 0  !* 0 */
    integer(c_int32_t) :: maxBodyPairs = 65536  !* 65536 */
    integer(c_int32_t) :: maxContactConstraints = 10240  !* 10240 */
    integer(c_int32_t) :: padding = 0
    type(c_ptr) :: broadPhaseLayerInterface = c_null_ptr
    type(c_ptr) :: objectLayerPairFilter = c_null_ptr
    type(c_ptr) :: objectVsBroadPhaseLayerFilter = c_null_ptr
  end type JPH_PhysicsSystemSettings


  type, bind(c) :: JPH_PhysicsSettings
    integer(c_int32_t) :: maxInFlightBodyPairs = 0
    integer(c_int32_t) :: stepListenersBatchSize = 0
    integer(c_int32_t) :: stepListenerBatchesPerJob = 0
    real(c_float) :: baumgarte = 0.0
    real(c_float) :: speculativeContactDistance = 0.0
    real(c_float) :: penetrationSlop = 0.0
    real(c_float) :: linearCastThreshold = 0.0
    real(c_float) :: linearCastMaxPenetration = 0.0
    real(c_float) :: manifoldToleranceSq = 0.0
    real(c_float) :: maxPenetrationDistance = 0.0
    real(c_float) :: bodyPairCacheMaxDeltaPositionSq = 0.0
    real(c_float) :: bodyPairCacheCosMaxDeltaRotationDiv2 = 0.0
    real(c_float) :: contactNormalCosMaxDeltaRotation = 0.0
    real(c_float) :: contactPointPreserveLambdaMaxDistSq = 0.0
    integer(c_int32_t) :: numVelocitySteps = 0
    integer(c_int32_t) :: numPositionSteps = 0
    real(c_float) :: minVelocityForRestitution = 0.0
    real(c_float) :: timeBeforeSleep = 0.0
    real(c_float) :: pointVelocitySleepThreshold = 0.0
    logical(c_bool) :: deterministicSimulation = .false.
    logical(c_bool) :: constraintWarmStart = .false.
    logical(c_bool) :: useBodyPairContactCache = .false.
    logical(c_bool) :: useManifoldReduction = .false.
    logical(c_bool) :: useLargeIslandSplitter = .false.
    logical(c_bool) :: allowSleeping = .false.
    logical(c_bool) :: checkActiveEdges = .false.
  end type JPH_PhysicsSettings


!! todo: these are bind(c) prototypes
! typedef void(JPH_API_CALL* JPH_TraceFunc)(const char* mssage)
! typedef bool(JPH_API_CALL* JPH_AssertFailureFunc)(const char* expression, const char* mssage, const char* file, uint32_t line)
! typedef void JPH_JobFunction(void* arg)
! typedef void JPH_QueueJobCallback(void* context, JPH_JobFunction* job, void* arg)
! typedef void JPH_QueueJobsCallback(void* context, JPH_JobFunction* job, void** args, uint32_t count)

  interface


    function JPH_JobSystemThreadPool_Create(JobSystemThreadPoolConf) result(JPH_JobSystem) bind(c, name = "JPH_JobSystemThreadPool_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: JobSystemThreadPoolConf
      type(c_ptr) :: JPH_JobSystem
    end function JPH_JobSystemThreadPool_Create


    function JPH_JobSystemCallback_Create(JPH_JobSystemConf) result(JPH_JobSystem) bind(c, name = "JPH_JobSystemCallback_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: JPH_JobSystemConf
      type(c_ptr) :: JPH_JobSystem
    end function JPH_JobSystemCallback_Create

    subroutine JPH_JobSystem_Destroy(jobSystem) bind(c, name = "JPH_JobSystem_Destroy")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: jobSystem
    end subroutine JPH_JobSystem_Destroy


    function JPH_Init() result(success) bind(c, name = "JPH_Init")
      use, intrinsic :: iso_c_binding
      implicit none

      logical(c_bool) :: success
    end function JPH_Init


    subroutine JPH_Shutdown() bind(c, name = "JPH_Shutdown")
      use, intrinsic :: iso_c_binding
      implicit none

    end subroutine JPH_Shutdown


    subroutine JPH_SetTraceHandler(handler) bind(c, name = "JPH_SetTraceHandler")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_funptr), intent(in), value :: handler
    end subroutine


    subroutine JPH_SetAssertFailureHandler(handler) bind(c, name = "JPH_SetAssertFailureHandler")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_funptr), intent(in), value :: handler
    end subroutine

!  !* JPH_BroadPhaseLayerInterface */
    function JPH_BroadPhaseLayerInterfaceMask_Create(numBroadPhaseLayers) result(BroadPhaseLayerInterface) bind(c, name = "JPH_BroadPhaseLayerInterfaceMask_Create")
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int32_t), intent(in), value :: numBroadPhaseLayers
      type(c_ptr) :: BroadPhaseLayerInterface
    end function


    subroutine JPH_BroadPhaseLayerInterfaceMask_ConfigureLayer(bpInterface, broadPhaseLayer, groupsToInclude, groupsToExclude) bind(c, name = "JPH_BroadPhaseLayerInterfaceMask_ConfigureLayer")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: bpInterface
      integer(c_int8_t), intent(in), value :: broadPhaseLayer
      integer(c_int32_t), intent(in), value :: groupsToInclude, groupsToExclude
    end subroutine


    function JPH_BroadPhaseLayerInterfaceTable_Create(numObjectLayers, numBroadPhaseLayers) result(BroadPhaseLayerInterface) bind(c, name = "JPH_BroadPhaseLayerInterfaceTable_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int32_t), intent(in), value :: numObjectLayers, numBroadPhaseLayers
      type(c_ptr) :: BroadPhaseLayerInterface
    end function


    subroutine JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer(bpInterface, objectLayer, broadPhaseLayer) bind(c, name = "JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: bpInterface
      integer(c_int16_t), intent(in), value :: objectLayer
      integer(c_int8_t), intent(in), value :: broadPhaseLayer
    end subroutine


    !* JPH_ObjectLayerPairFilter.


    function JPH_ObjectLayerPairFilterMask_Create() result(ObjectLayerPairFilter) bind(c, name = "JPH_ObjectLayerPairFilterMask_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr) :: ObjectLayerPairFilter
    end function


    function JPH_ObjectLayerPairFilterMask_GetObjectLayer(group, mask) result(ObjectLayer) bind(c, name = "JPH_ObjectLayerPairFilterMask_GetObjectLayer")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int32_t), intent(in), value :: group, mask
      integer(c_int16_t) :: ObjectLayer
    end function


    function JPH_ObjectLayerPairFilterMask_GetGroup(layer) result(group) bind(c, name = "JPH_ObjectLayerPairFilterMask_GetGroup")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int16_t), intent(in), value :: layer
      integer(c_int32_t) :: group
    end function


    function JPH_ObjectLayerPairFilterMask_GetMask(layer) result(mask) bind(c, name = "JPH_ObjectLayerPairFilterMask_GetMask")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int16_t), intent(in), value :: layer
      integer(c_int32_t) :: mask
    end function


    function JPH_ObjectLayerPairFilterTable_Create(numObjectLayers) result(ObjectLayerPairFilter) bind(c, name = "JPH_ObjectLayerPairFilterTable_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      integer(c_int32_t), intent(in), value :: numObjectLayers
      type(c_ptr) :: ObjectLayerPairFilter
    end function


    subroutine JPH_ObjectLayerPairFilterTable_DisableCollision(objectFilter, layer1, layer2) bind(c, name = "JPH_ObjectLayerPairFilterTable_DisableCollision")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: objectFilter
      integer(c_int16_t), intent(in), value :: layer1, layer2
    end subroutine


    subroutine JPH_ObjectLayerPairFilterTable_EnableCollision(objectFilter, layer1, layer2) bind(c, name = "JPH_ObjectLayerPairFilterTable_EnableCollision")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: objectFilter
      integer(c_int16_t), intent(in), value :: layer1, layer2
    end subroutine


    function JPH_ObjectLayerPairFilterTable_ShouldCollide(objectFilter, layer1, layer2) result(should) bind(c, name = "JPH_ObjectLayerPairFilterTable_ShouldCollide")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: objectFilter
      integer(c_int16_t), intent(in), value :: layer1, layer2
      logical(c_bool) :: should
    end function


    !* JPH_ObjectVsBroadPhaseLayerFilter

    function JPH_ObjectVsBroadPhaseLayerFilterMask_Create(broadPhaseLayerInterface) result(ObjectVsBroadPhaseLayerFilter) bind(c, name = "JPH_ObjectVsBroadPhaseLayerFilterMask_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value ::broadPhaseLayerInterface
      type(c_ptr) :: ObjectVsBroadPhaseLayerFilter
    end function


    function JPH_ObjectVsBroadPhaseLayerFilterTable_Create(broadPhaseLayerInterface, numBroadPhaseLayers, objectLayerPairFilter, numObjectLayers) result(ObjectVsBroadPhaseLayerFilter) bind(c, name = "JPH_ObjectVsBroadPhaseLayerFilterTable_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: broadPhaseLayerInterface
      integer(c_int32_t), intent(in), value :: numBroadPhaseLayers
      type(c_ptr), intent(in), value :: objectLayerPairFilter
      integer(c_int32_t), intent(in), value :: numObjectLayers
      type(c_ptr) :: ObjectVsBroadPhaseLayerFilter
    end function


    subroutine JPH_DrawSettings_InitDefault(settings) bind(c, name = "JPH_DrawSettings_InitDefault")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: settings
    end subroutine


    function JPH_PhysicsSystem_Create(settings) result(PhysicsSystem) bind(c, name = "JPH_PhysicsSystem_Create")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: settings
      type(c_ptr) :: PhysicsSystem
    end function


    subroutine JPH_PhysicsSystem_Destroy(system) bind(c, name = "JPH_PhysicsSystem_Destroy")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: system
    end subroutine


    subroutine JPH_PhysicsSystem_SetPhysicsSettings(system, settings) bind(c, name = "JPH_PhysicsSystem_SetPhysicsSettings")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: system, settings
    end subroutine


    subroutine JPH_PhysicsSystem_GetPhysicsSettings(system, result) bind(c, name = "JPH_PhysicsSystem_GetPhysicsSettings")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: system, result
    end subroutine


    subroutine JPH_PhysicsSystem_OptimizeBroadPhase(system) bind(c, name = "JPH_PhysicsSystem_OptimizeBroadPhase")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: system
    end subroutine


    function JPH_PhysicsSystem_Update(system, deltaTime, collisionSteps, jobSystem) result(errorres) bind(c, name = "JPH_PhysicsSystem_Update")
      use, intrinsic :: iso_c_binding
      implicit none

      type(c_ptr), intent(in), value :: system, jobSystem
      real(c_float), intent(in), value :: deltaTime
      integer(c_int32_t), intent(in), value :: collisionSteps

      integer(c_int32_t) :: errorres
    end function

! JPH_CAPI JPH_BodyInterface* JPH_PhysicsSystem_GetBodyInterface(JPH_PhysicsSystem* system)

! JPH_CAPI JPH_BodyInterface* JPH_PhysicsSystem_GetBodyInterfaceNoLock(JPH_PhysicsSystem* system)

! JPH_CAPI const JPH_BodyLockInterface* JPH_PhysicsSystem_GetBodyLockInterface(const JPH_PhysicsSystem* system)

! JPH_CAPI const JPH_BodyLockInterface* JPH_PhysicsSystem_GetBodyLockInterfaceNoLock(const JPH_PhysicsSystem* system)

! JPH_CAPI const JPH_BroadPhaseQuery* JPH_PhysicsSystem_GetBroadPhaseQuery(const JPH_PhysicsSystem* system)

! JPH_CAPI const JPH_NarrowPhaseQuery* JPH_PhysicsSystem_GetNarrowPhaseQuery(const JPH_PhysicsSystem* system)

! JPH_CAPI const JPH_NarrowPhaseQuery* JPH_PhysicsSystem_GetNarrowPhaseQueryNoLock(const JPH_PhysicsSystem* system)

! JPH_CAPI void JPH_PhysicsSystem_SetContactListener(JPH_PhysicsSystem* system, JPH_ContactListener* listener)

! JPH_CAPI void JPH_PhysicsSystem_SetBodyActivationListener(JPH_PhysicsSystem* system, JPH_BodyActivationListener* listener)

! JPH_CAPI bool JPH_PhysicsSystem_WereBodiesInContact(const JPH_PhysicsSystem* system, JPH_BodyID body1, JPH_BodyID body2)

! JPH_CAPI uint32_t JPH_PhysicsSystem_GetNumBodies(const JPH_PhysicsSystem* system)

! JPH_CAPI uint32_t JPH_PhysicsSystem_GetNumActiveBodies(const JPH_PhysicsSystem* system, JPH_BodyType type)

! JPH_CAPI uint32_t JPH_PhysicsSystem_GetMaxBodies(const JPH_PhysicsSystem* system)

! JPH_CAPI uint32_t JPH_PhysicsSystem_GetNumConstraints(const JPH_PhysicsSystem* system)

! JPH_CAPI void JPH_PhysicsSystem_SetGravity(JPH_PhysicsSystem* system, const JPH_Vec3* value)

! JPH_CAPI void JPH_PhysicsSystem_GetGravity(JPH_PhysicsSystem* system, JPH_Vec3* result)

! JPH_CAPI void JPH_PhysicsSystem_AddConstraint(JPH_PhysicsSystem* system, JPH_Constraint* constraint)

! JPH_CAPI void JPH_PhysicsSystem_RemoveConstraint(JPH_PhysicsSystem* system, JPH_Constraint* constraint)

! JPH_CAPI void JPH_PhysicsSystem_AddConstraints(JPH_PhysicsSystem* system, JPH_Constraint** constraints, uint32_t count)

! JPH_CAPI void JPH_PhysicsSystem_RemoveConstraints(JPH_PhysicsSystem* system, JPH_Constraint** constraints, uint32_t count)

! JPH_CAPI void JPH_PhysicsSystem_GetBodies(const JPH_PhysicsSystem* system, JPH_BodyID* ids, uint32_t count)

! JPH_CAPI void JPH_PhysicsSystem_GetConstraints(const JPH_PhysicsSystem* system, const JPH_Constraint** constraints, uint32_t count)

! JPH_CAPI void JPH_PhysicsSystem_DrawBodies(JPH_PhysicsSystem* system, const JPH_DrawSettings* settings, JPH_DebugRenderer* renderer, const JPH_BodyDrawFilter* bodyFilter  !* = nullptr */)

! JPH_CAPI void JPH_PhysicsSystem_DrawConstraints(JPH_PhysicsSystem* system, JPH_DebugRenderer* renderer)

! JPH_CAPI void JPH_PhysicsSystem_DrawConstraintLimits(JPH_PhysicsSystem* system, JPH_DebugRenderer* renderer)

! JPH_CAPI void JPH_PhysicsSystem_DrawConstraintReferenceFrame(JPH_PhysicsSystem* system, JPH_DebugRenderer* renderer)

!  !* Math */
! JPH_CAPI void JPH_Quaternion_FromTo(const JPH_Vec3* from, const JPH_Vec3* to, JPH_Quat* quat)

!  !* Material */
! JPH_CAPI JPH_PhysicsMaterial* JPH_PhysicsMaterial_Create(const char* name, uint32_t color)

! JPH_CAPI void JPH_PhysicsMaterial_Destroy(JPH_PhysicsMaterial* material)

! JPH_CAPI const char* JPH_PhysicsMaterial_GetDebugName(const JPH_PhysicsMaterial* material)

! JPH_CAPI uint32_t JPH_PhysicsMaterial_GetDebugColor(const JPH_PhysicsMaterial * material)

!  !* ShapeSettings */
! JPH_CAPI void JPH_ShapeSettings_Destroy(JPH_ShapeSettings* settings)

! JPH_CAPI uint64_t JPH_ShapeSettings_GetUserData(const JPH_ShapeSettings* settings)

! JPH_CAPI void JPH_ShapeSettings_SetUserData(JPH_ShapeSettings* settings, uint64_t userData)

!  !* Shape */
! JPH_CAPI void JPH_Shape_Destroy(JPH_Shape* shape)

! JPH_CAPI JPH_ShapeType JPH_Shape_GetType(const JPH_Shape* shape)

! JPH_CAPI JPH_ShapeSubType JPH_Shape_GetSubType(const JPH_Shape* shape)

! JPH_CAPI uint64_t JPH_Shape_GetUserData(const JPH_Shape* shape)

! JPH_CAPI void JPH_Shape_SetUserData(JPH_Shape* shape, uint64_t userData)

! JPH_CAPI bool JPH_Shape_MustBeStatic(const JPH_Shape* shape)

! JPH_CAPI void JPH_Shape_GetCenterOfMass(const JPH_Shape* shape, JPH_Vec3* result)

! JPH_CAPI void JPH_Shape_GetLocalBounds(const JPH_Shape* shape, JPH_AABox* result)

! JPH_CAPI uint32_t JPH_Shape_GetSubShapeIDBitsRecursive(const JPH_Shape* shape)

! JPH_CAPI void JPH_Shape_GetWorldSpaceBounds(const JPH_Shape* shape, JPH_RMatrix4x4* centerOfMassTransform, JPH_Vec3* scale, JPH_AABox* result)

! JPH_CAPI float JPH_Shape_GetInnerRadius(const JPH_Shape* shape)

! JPH_CAPI void JPH_Shape_GetMassProperties(const JPH_Shape* shape, JPH_MassProperties* result)

! JPH_CAPI const JPH_Shape* JPH_Shape_GetLeafShape(const JPH_Shape* shape, JPH_SubShapeID subShapeID, JPH_SubShapeID* remainder)

! JPH_CAPI const JPH_PhysicsMaterial* JPH_Shape_GetMaterial(const JPH_Shape* shape, JPH_SubShapeID subShapeID)

! JPH_CAPI void JPH_Shape_GetSurfaceNormal(const JPH_Shape* shape, JPH_SubShapeID subShapeID, JPH_Vec3* localPosition, JPH_Vec3* normal)

! JPH_CAPI float JPH_Shape_GetVolume(const JPH_Shape* shape)

! JPH_CAPI bool JPH_Shape_IsValidScale(const JPH_Shape* shape, const JPH_Vec3* scale)

! JPH_CAPI void JPH_Shape_MakeScaleValid(const JPH_Shape* shape, const JPH_Vec3* scale, JPH_Vec3* result)

! JPH_CAPI JPH_Shape* JPH_Shape_ScaleShape(const JPH_Shape* shape, const JPH_Vec3* scale)

! JPH_CAPI bool JPH_Shape_CastRay(const JPH_Shape* shape, const JPH_Vec3* origin, const JPH_Vec3* direction, JPH_RayCastResult* hit)

! JPH_CAPI bool JPH_Shape_CastRay2(const JPH_Shape* shape, const JPH_Vec3* origin, const JPH_Vec3* direction, const JPH_RayCastSettings* rayCastSettings, JPH_CollisionCollectorType collectorType, JPH_CastRayResultCallback* callback, void* userData, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_Shape_CollidePoint(const JPH_Shape* shape, const JPH_Vec3* point, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_Shape_CollidePoint2(const JPH_Shape* shape, const JPH_Vec3* point, JPH_CollisionCollectorType collectorType, JPH_CollidePointResultCallback* callback, void* userData, const JPH_ShapeFilter* shapeFilter)


!  !* JPH_ConvexShape */
! JPH_CAPI float JPH_ConvexShapeSettings_GetDensity(const JPH_ConvexShapeSettings* shape)

! JPH_CAPI void JPH_ConvexShapeSettings_SetDensity(JPH_ConvexShapeSettings* shape, float value)

! JPH_CAPI float JPH_ConvexShape_GetDensity(const JPH_ConvexShape* shape)

! JPH_CAPI void JPH_ConvexShape_SetDensity(JPH_ConvexShape* shape, float inDensity)


!  !* BoxShape */
! JPH_CAPI JPH_BoxShapeSettings* JPH_BoxShapeSettings_Create(const JPH_Vec3* halfExtent, float convexRadius)

! JPH_CAPI JPH_BoxShape* JPH_BoxShapeSettings_CreateShape(const JPH_BoxShapeSettings* settings)

! JPH_CAPI JPH_BoxShape* JPH_BoxShape_Create(const JPH_Vec3* halfExtent, float convexRadius)

! JPH_CAPI void JPH_BoxShape_GetHalfExtent(const JPH_BoxShape* shape, JPH_Vec3* halfExtent)

! JPH_CAPI float JPH_BoxShape_GetConvexRadius(const JPH_BoxShape* shape)

!  !* SphereShape */
! JPH_CAPI JPH_SphereShapeSettings* JPH_SphereShapeSettings_Create(float radius)

! JPH_CAPI JPH_SphereShape* JPH_SphereShapeSettings_CreateShape(const JPH_SphereShapeSettings* settings)

! JPH_CAPI float JPH_SphereShapeSettings_GetRadius(const JPH_SphereShapeSettings* settings)

! JPH_CAPI void JPH_SphereShapeSettings_SetRadius(JPH_SphereShapeSettings* settings, float radius)

! JPH_CAPI JPH_SphereShape* JPH_SphereShape_Create(float radius)

! JPH_CAPI float JPH_SphereShape_GetRadius(const JPH_SphereShape* shape)


!  !* PlaneShape */
! JPH_CAPI JPH_PlaneShapeSettings* JPH_PlaneShapeSettings_Create(const JPH_Plane* plane, const JPH_PhysicsMaterial* material, float halfExtent)

! JPH_CAPI JPH_PlaneShape* JPH_PlaneShapeSettings_CreateShape(const JPH_PlaneShapeSettings* settings)

! JPH_CAPI JPH_PlaneShape* JPH_PlaneShape_Create(const JPH_Plane* plane, const JPH_PhysicsMaterial* material, float halfExtent)

! JPH_CAPI void JPH_PlaneShape_GetPlane(const JPH_PlaneShape* shape, JPH_Plane* result)

! JPH_CAPI float JPH_PlaneShape_GetHalfExtent(const JPH_PlaneShape* shape)


!  !* TriangleShape */
! JPH_CAPI JPH_TriangleShapeSettings* JPH_TriangleShapeSettings_Create(const JPH_Vec3* v1, const JPH_Vec3* v2, const JPH_Vec3* v3, float convexRadius)

! JPH_CAPI JPH_TriangleShape* JPH_TriangleShapeSettings_CreateShape(const JPH_TriangleShapeSettings* settings)


! JPH_CAPI JPH_TriangleShape* JPH_TriangleShape_Create(const JPH_Vec3* v1, const JPH_Vec3* v2, const JPH_Vec3* v3, float convexRadius)

! JPH_CAPI float JPH_TriangleShape_GetConvexRadius(const JPH_TriangleShape* shape)

! JPH_CAPI void JPH_TriangleShape_GetVertex1(const JPH_TriangleShape* shape, JPH_Vec3* result)

! JPH_CAPI void JPH_TriangleShape_GetVertex2(const JPH_TriangleShape* shape, JPH_Vec3* result)

! JPH_CAPI void JPH_TriangleShape_GetVertex3(const JPH_TriangleShape* shape, JPH_Vec3* result)


!  !* CapsuleShape */
! JPH_CAPI JPH_CapsuleShapeSettings* JPH_CapsuleShapeSettings_Create(float halfHeightOfCylinder, float radius)

! JPH_CAPI JPH_CapsuleShape* JPH_CapsuleShapeSettings_CreateShape(const JPH_CapsuleShapeSettings* settings)

! JPH_CAPI JPH_CapsuleShape* JPH_CapsuleShape_Create(float halfHeightOfCylinder, float radius)

! JPH_CAPI float JPH_CapsuleShape_GetRadius(const JPH_CapsuleShape* shape)

! JPH_CAPI float JPH_CapsuleShape_GetHalfHeightOfCylinder(const JPH_CapsuleShape* shape)


!  !* CylinderShape */
! JPH_CAPI JPH_CylinderShapeSettings* JPH_CylinderShapeSettings_Create(float halfHeight, float radius, float convexRadius)

! JPH_CAPI JPH_CylinderShape* JPH_CylinderShapeSettings_CreateShape(const JPH_CylinderShapeSettings* settings)


! JPH_CAPI JPH_CylinderShape* JPH_CylinderShape_Create(float halfHeight, float radius)

! JPH_CAPI float JPH_CylinderShape_GetRadius(const JPH_CylinderShape* shape)

! JPH_CAPI float JPH_CylinderShape_GetHalfHeight(const JPH_CylinderShape* shape)


!  !* TaperedCylinderShape */
! JPH_CAPI JPH_TaperedCylinderShapeSettings* JPH_TaperedCylinderShapeSettings_Create(float halfHeightOfTaperedCylinder, float topRadius, float bottomRadius, float convexRadius !* = cDefaultConvexRadius*/, const JPH_PhysicsMaterial* material  !* = NULL*/)

! JPH_CAPI JPH_TaperedCylinderShape* JPH_TaperedCylinderShapeSettings_CreateShape(const JPH_TaperedCylinderShapeSettings* settings)

! JPH_CAPI float JPH_TaperedCylinderShape_GetTopRadius(const JPH_TaperedCylinderShape* shape)

! JPH_CAPI float JPH_TaperedCylinderShape_GetBottomRadius(const JPH_TaperedCylinderShape* shape)

! JPH_CAPI float JPH_TaperedCylinderShape_GetConvexRadius(const JPH_TaperedCylinderShape* shape)

! JPH_CAPI float JPH_TaperedCylinderShape_GetHalfHeight(const JPH_TaperedCylinderShape* shape)


!  !* ConvexHullShape */
! JPH_CAPI JPH_ConvexHullShapeSettings* JPH_ConvexHullShapeSettings_Create(const JPH_Vec3* points, uint32_t pointsCount, float maxConvexRadius)

! JPH_CAPI JPH_ConvexHullShape* JPH_ConvexHullShapeSettings_CreateShape(const JPH_ConvexHullShapeSettings* settings)

! JPH_CAPI uint32_t JPH_ConvexHullShape_GetNumPoints(const JPH_ConvexHullShape* shape)

! JPH_CAPI void JPH_ConvexHullShape_GetPoint(const JPH_ConvexHullShape* shape, uint32_t index, JPH_Vec3* result)

! JPH_CAPI uint32_t JPH_ConvexHullShape_GetNumFaces(const JPH_ConvexHullShape* shape)

! JPH_CAPI uint32_t JPH_ConvexHullShape_GetNumVerticesInFace(const JPH_ConvexHullShape* shape, uint32_t faceIndex)

! JPH_CAPI uint32_t JPH_ConvexHullShape_GetFaceVertices(const JPH_ConvexHullShape* shape, uint32_t faceIndex, uint32_t maxVertices, uint32_t* vertices)


!  !* MeshShape */
! JPH_CAPI JPH_MeshShapeSettings* JPH_MeshShapeSettings_Create(const JPH_Triangle* triangles, uint32_t triangleCount)

! JPH_CAPI JPH_MeshShapeSettings* JPH_MeshShapeSettings_Create2(const JPH_Vec3* vertices, uint32_t verticesCount, const JPH_IndexedTriangle* triangles, uint32_t triangleCount)

! JPH_CAPI bool JPH_MeshShapeSettings_GetPerTriangleUserData(const JPH_MeshShapeSettings* settings)

! JPH_CAPI void JPH_MeshShapeSettings_SetPerTriangleUserData(JPH_MeshShapeSettings* settings, bool perTriangleUserData)

! JPH_CAPI void JPH_MeshShapeSettings_Sanitize(JPH_MeshShapeSettings* settings)

! JPH_CAPI JPH_MeshShape* JPH_MeshShapeSettings_CreateShape(const JPH_MeshShapeSettings* settings)

! JPH_CAPI uint32_t JPH_MeshShape_GetTriangleUserData(const JPH_MeshShape* shape, JPH_SubShapeID id)

!  !* HeightFieldShape */
! JPH_CAPI JPH_HeightFieldShapeSettings* JPH_HeightFieldShapeSettings_Create(const float* samples, const JPH_Vec3* offset, const JPH_Vec3* scale, uint32_t sampleCount)

! JPH_CAPI JPH_HeightFieldShape* JPH_HeightFieldShapeSettings_CreateShape(JPH_HeightFieldShapeSettings* settings)

! JPH_CAPI void JPH_HeightFieldShapeSettings_DetermineMinAndMaxSample(const JPH_HeightFieldShapeSettings* settings, float* pOutMinValue, float* pOutMaxValue, float* pOutQuantizationScale)

! JPH_CAPI uint32_t JPH_HeightFieldShapeSettings_CalculateBitsPerSampleForError(const JPH_HeightFieldShapeSettings* settings, float maxError)


! JPH_CAPI uint32_t JPH_HeightFieldShape_GetSampleCount(const JPH_HeightFieldShape* shape)

! JPH_CAPI uint32_t JPH_HeightFieldShape_GetBlockSize(const JPH_HeightFieldShape* shape)

! JPH_CAPI const JPH_PhysicsMaterial* JPH_HeightFieldShape_GetMaterial(const JPH_HeightFieldShape* shape, uint32_t x, uint32_t y)

! JPH_CAPI void JPH_HeightFieldShape_GetPosition(const JPH_HeightFieldShape* shape, uint32_t x, uint32_t y, JPH_Vec3* result)

! JPH_CAPI bool JPH_HeightFieldShape_IsNoCollision(const JPH_HeightFieldShape* shape, uint32_t x, uint32_t y)

! JPH_CAPI bool JPH_HeightFieldShape_ProjectOntoSurface(const JPH_HeightFieldShape* shape, const JPH_Vec3* localPosition, JPH_Vec3* outSurfacePosition, JPH_SubShapeID* outSubShapeID)

! JPH_CAPI float JPH_HeightFieldShape_GetMinHeightValue(const JPH_HeightFieldShape* shape)

! JPH_CAPI float JPH_HeightFieldShape_GetMaxHeightValue(const JPH_HeightFieldShape* shape)


!  !* TaperedCapsuleShape */
! JPH_CAPI JPH_TaperedCapsuleShapeSettings* JPH_TaperedCapsuleShapeSettings_Create(float halfHeightOfTaperedCylinder, float topRadius, float bottomRadius)

! JPH_CAPI JPH_TaperedCapsuleShape* JPH_TaperedCapsuleShapeSettings_CreateShape(JPH_TaperedCapsuleShapeSettings* settings)


! JPH_CAPI float JPH_TaperedCapsuleShape_GetTopRadius(const JPH_TaperedCapsuleShape* shape)

! JPH_CAPI float JPH_TaperedCapsuleShape_GetBottomRadius(const JPH_TaperedCapsuleShape* shape)

! JPH_CAPI float JPH_TaperedCapsuleShape_GetHalfHeight(const JPH_TaperedCapsuleShape* shape)


!  !* CompoundShape */
! JPH_CAPI void JPH_CompoundShapeSettings_AddShape(JPH_CompoundShapeSettings* settings, const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_ShapeSettings* shape, uint32_t userData)

! JPH_CAPI void JPH_CompoundShapeSettings_AddShape2(JPH_CompoundShapeSettings* settings, const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_Shape* shape, uint32_t userData)

! JPH_CAPI uint32_t JPH_CompoundShape_GetNumSubShapes(const JPH_CompoundShape* shape)

! JPH_CAPI void JPH_CompoundShape_GetSubShape(const JPH_CompoundShape* shape, uint32_t index, const JPH_Shape** subShape, JPH_Vec3* positionCOM, JPH_Quat* rotation, uint32_t* userData)

! JPH_CAPI uint32_t JPH_CompoundShape_GetSubShapeIndexFromID(const JPH_CompoundShape* shape, JPH_SubShapeID id, JPH_SubShapeID* remainder)



!  !* StaticCompoundShape */
! JPH_CAPI JPH_StaticCompoundShapeSettings* JPH_StaticCompoundShapeSettings_Create(void)

! JPH_CAPI JPH_StaticCompoundShape* JPH_StaticCompoundShape_Create(const JPH_StaticCompoundShapeSettings* settings)



!  !* MutableCompoundShape */
! JPH_CAPI JPH_MutableCompoundShapeSettings* JPH_MutableCompoundShapeSettings_Create(void)

! JPH_CAPI JPH_MutableCompoundShape* JPH_MutableCompoundShape_Create(const JPH_MutableCompoundShapeSettings* settings)


! JPH_CAPI uint32_t JPH_MutableCompoundShape_AddShape(JPH_MutableCompoundShape* shape, const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_Shape* child, uint32_t userData)

! JPH_CAPI void JPH_MutableCompoundShape_RemoveShape(JPH_MutableCompoundShape* shape, uint32_t index)

! JPH_CAPI void JPH_MutableCompoundShape_ModifyShape(JPH_MutableCompoundShape* shape, uint32_t index, const JPH_Vec3* position, const JPH_Quat* rotation)

! JPH_CAPI void JPH_MutableCompoundShape_ModifyShape2(JPH_MutableCompoundShape* shape, uint32_t index, const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_Shape* newShape)

! JPH_CAPI void JPH_MutableCompoundShape_AdjustCenterOfMass(JPH_MutableCompoundShape* shape)


!  !* DecoratedShape */
! JPH_CAPI const JPH_Shape* JPH_DecoratedShape_GetInnerShape(const JPH_DecoratedShape* shape)



!  !* RotatedTranslatedShape */
! JPH_CAPI JPH_RotatedTranslatedShapeSettings* JPH_RotatedTranslatedShapeSettings_Create(const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_ShapeSettings* shapeSettings)

! JPH_CAPI JPH_RotatedTranslatedShapeSettings* JPH_RotatedTranslatedShapeSettings_Create2(const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_Shape* shape)

! JPH_CAPI JPH_RotatedTranslatedShape* JPH_RotatedTranslatedShapeSettings_CreateShape(const JPH_RotatedTranslatedShapeSettings* settings)

! JPH_CAPI JPH_RotatedTranslatedShape* JPH_RotatedTranslatedShape_Create(const JPH_Vec3* position, const JPH_Quat* rotation, const JPH_Shape* shape)

! JPH_CAPI void JPH_RotatedTranslatedShape_GetPosition(const JPH_RotatedTranslatedShape* shape, JPH_Vec3* position)

! JPH_CAPI void JPH_RotatedTranslatedShape_GetRotation(const JPH_RotatedTranslatedShape* shape, JPH_Quat* rotation)


!  !* ScaledShape */
! JPH_CAPI JPH_ScaledShapeSettings* JPH_ScaledShapeSettings_Create(const JPH_ShapeSettings* shapeSettings, const JPH_Vec3* scale)

! JPH_CAPI JPH_ScaledShapeSettings* JPH_ScaledShapeSettings_Create2(const JPH_Shape* shape, const JPH_Vec3* scale)

! JPH_CAPI JPH_ScaledShape* JPH_ScaledShapeSettings_CreateShape(const JPH_ScaledShapeSettings* settings)

! JPH_CAPI JPH_ScaledShape* JPH_ScaledShape_Create(const JPH_Shape* shape, const JPH_Vec3* scale)

! JPH_CAPI void JPH_ScaledShape_GetScale(const JPH_ScaledShape* shape, JPH_Vec3* result)


!  !* OffsetCenterOfMassShape */
! JPH_CAPI JPH_OffsetCenterOfMassShapeSettings* JPH_OffsetCenterOfMassShapeSettings_Create(const JPH_Vec3* offset, const JPH_ShapeSettings* shapeSettings)

! JPH_CAPI JPH_OffsetCenterOfMassShapeSettings* JPH_OffsetCenterOfMassShapeSettings_Create2(const JPH_Vec3* offset, const JPH_Shape* shape)

! JPH_CAPI JPH_OffsetCenterOfMassShape* JPH_OffsetCenterOfMassShapeSettings_CreateShape(const JPH_OffsetCenterOfMassShapeSettings* settings)


! JPH_CAPI JPH_OffsetCenterOfMassShape* JPH_OffsetCenterOfMassShape_Create(const JPH_Vec3* offset, const JPH_Shape* shape)

! JPH_CAPI void JPH_OffsetCenterOfMassShape_GetOffset(const JPH_OffsetCenterOfMassShape* shape, JPH_Vec3* result)


!  !* EmptyShape */
! JPH_CAPI JPH_EmptyShapeSettings* JPH_EmptyShapeSettings_Create(const JPH_Vec3* centerOfMass)

! JPH_CAPI JPH_EmptyShape* JPH_EmptyShapeSettings_CreateShape(const JPH_EmptyShapeSettings* settings)

!  !* JPH_BodyCreationSettings */
! JPH_CAPI JPH_BodyCreationSettings* JPH_BodyCreationSettings_Create(void)

! JPH_CAPI JPH_BodyCreationSettings* JPH_BodyCreationSettings_Create2(JPH_ShapeSettings* settings,
!   const JPH_RVec3* position,
!   const JPH_Quat* rotation,
!   JPH_MotionType motionType,
!   JPH_ObjectLayer objectLayer)

! JPH_CAPI JPH_BodyCreationSettings* JPH_BodyCreationSettings_Create3(const JPH_Shape* shape,
!   const JPH_RVec3* position,
!   const JPH_Quat* rotation,
!   JPH_MotionType motionType,
!   JPH_ObjectLayer objectLayer)

! JPH_CAPI void JPH_BodyCreationSettings_Destroy(JPH_BodyCreationSettings* settings)

! JPH_CAPI void JPH_BodyCreationSettings_GetPosition(JPH_BodyCreationSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_BodyCreationSettings_SetPosition(JPH_BodyCreationSettings* settings, const JPH_RVec3* value)


! JPH_CAPI void JPH_BodyCreationSettings_GetRotation(JPH_BodyCreationSettings* settings, JPH_Quat* result)

! JPH_CAPI void JPH_BodyCreationSettings_SetRotation(JPH_BodyCreationSettings* settings, const JPH_Quat* value)

! JPH_CAPI void JPH_BodyCreationSettings_GetLinearVelocity(JPH_BodyCreationSettings* settings, JPH_Vec3* velocity)

! JPH_CAPI void JPH_BodyCreationSettings_SetLinearVelocity(JPH_BodyCreationSettings* settings, const JPH_Vec3* velocity)

! JPH_CAPI void JPH_BodyCreationSettings_GetAngularVelocity(JPH_BodyCreationSettings* settings, JPH_Vec3* velocity)

! JPH_CAPI void JPH_BodyCreationSettings_SetAngularVelocity(JPH_BodyCreationSettings* settings, const JPH_Vec3* velocity)

! JPH_CAPI JPH_MotionType JPH_BodyCreationSettings_GetMotionType(JPH_BodyCreationSettings* settings)

! JPH_CAPI void JPH_BodyCreationSettings_SetMotionType(JPH_BodyCreationSettings* settings, JPH_MotionType value)

! JPH_CAPI JPH_MotionQuality JPH_BodyCreationSettings_GetMotionQuality(JPH_BodyCreationSettings* settings)

! JPH_CAPI void JPH_BodyCreationSettings_SetMotionQuality(JPH_BodyCreationSettings* settings, JPH_MotionQuality value)

! JPH_CAPI JPH_AllowedDOFs JPH_BodyCreationSettings_GetAllowedDOFs(JPH_BodyCreationSettings* settings)

! JPH_CAPI void JPH_BodyCreationSettings_SetAllowedDOFs(JPH_BodyCreationSettings* settings, JPH_AllowedDOFs value)


!  !* JPH_SoftBodyCreationSettings */
! JPH_CAPI JPH_SoftBodyCreationSettings* JPH_SoftBodyCreationSettings_Create(void)

! JPH_CAPI void JPH_SoftBodyCreationSettings_Destroy(JPH_SoftBodyCreationSettings* settings)


!  !* JPH_ConstraintSettings */
! JPH_CAPI void JPH_ConstraintSettings_Destroy(JPH_ConstraintSettings* settings)

! JPH_CAPI bool JPH_ConstraintSettings_GetEnabled(JPH_ConstraintSettings* settings)

! JPH_CAPI void JPH_FixedConstraintSettings_SetEnabled(JPH_ConstraintSettings* settings, bool value)

! JPH_CAPI uint32_t JPH_ConstraintSettings_GetConstraintPriority(JPH_ConstraintSettings* settings)

! JPH_CAPI void JPH_FixedConstraintSettings_SetConstraintPriority(JPH_ConstraintSettings* settings, uint32_t value)

! JPH_CAPI uint32_t JPH_ConstraintSettings_GetNumVelocityStepsOverride(JPH_ConstraintSettings* settings)

! JPH_CAPI void JPH_ConstraintSettings_SetNumVelocityStepsOverride(JPH_ConstraintSettings* settings, uint32_t value)

! JPH_CAPI uint32_t JPH_ConstraintSettings_GetNumPositionStepsOverride(JPH_ConstraintSettings* settings)

! JPH_CAPI void JPH_ConstraintSettings_SetNumPositionStepsOverride(JPH_ConstraintSettings* settings, uint32_t value)

! JPH_CAPI float JPH_ConstraintSettings_GetDrawConstraintSize(JPH_ConstraintSettings* settings)

! JPH_CAPI void JPH_ConstraintSettings_SetDrawConstraintSize(JPH_ConstraintSettings* settings, float value)

! JPH_CAPI uint64_t JPH_ConstraintSettings_GetUserData(JPH_ConstraintSettings* settings)

! JPH_CAPI void JPH_ConstraintSettings_SetUserData(JPH_ConstraintSettings* settings, uint64_t value)


!  !* JPH_Constraint */
! JP_CAPI JPH_ConstraintSettings* JPH_Constraint_GetConstraintSettings(JPH_Constraint* constraint)

! JPH_CAPI JPH_ConstraintType JPH_Constraint_GetType(const JPH_Constraint* constraint)

! JPH_CAPI JPH_ConstraintSubType JPH_Constraint_GetSubType(const JPH_Constraint* constraint)

! JPH_CAPI uint32_t JPH_Constraint_GetConstraintPriority(const JPH_Constraint* constraint)

! JPH_CAPI void JPH_Constraint_SetConstraintPriority(JPH_Constraint* constraint, uint32_t priority)

! JPH_CAPI bool JPH_Constraint_GetEnabled(JPH_Constraint* constraint)

! JPH_CAPI void JPH_Constraint_SetEnabled(JPH_Constraint* constraint, bool enabled)

! JPH_CAPI uint64_t JPH_Constraint_GetUserData(const JPH_Constraint* constraint)

! JPH_CAPI void JPH_Constraint_SetUserData(JPH_Constraint* constraint, uint64_t userData)

! JPH_CAPI void JPH_Constraint_NotifyShapeChanged(JPH_Constraint* constraint, JPH_BodyID bodyID, JPH_Vec3* deltaCOM)

! JPH_CAPI void JPH_Constraint_Destroy(JPH_Constraint* constraint)


!  !* JPH_FixedConstraintSettings */
! JPH_CAPI JPH_FixedConstraintSettings* JPH_FixedConstraintSettings_Create(void)

! JPH_CAPI JPH_ConstraintSpace JPH_FixedConstraintSettings_GetSpace(JPH_FixedConstraintSettings* settings)

! JPH_CAPI void JPH_FixedConstraintSettings_SetSpace(JPH_FixedConstraintSettings* settings, JPH_ConstraintSpace space)

! JPH_CAPI bool JPH_FixedConstraintSettings_GetAutoDetectPoint(JPH_FixedConstraintSettings* settings)

! JPH_CAPI void JPH_FixedConstraintSettings_SetAutoDetectPoint(JPH_FixedConstraintSettings* settings, bool value)

! JPH_CAPI void JPH_FixedConstraintSettings_GetPoint1(JPH_FixedConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_FixedConstraintSettings_SetPoint1(JPH_FixedConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_FixedConstraintSettings_GetAxisX1(JPH_FixedConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_FixedConstraintSettings_SetAxisX1(JPH_FixedConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_FixedConstraintSettings_GetAxisY1(JPH_FixedConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_FixedConstraintSettings_SetAxisY1(JPH_FixedConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_FixedConstraintSettings_GetPoint2(JPH_FixedConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_FixedConstraintSettings_SetPoint2(JPH_FixedConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_FixedConstraintSettings_GetAxisX2(JPH_FixedConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_FixedConstraintSettings_SetAxisX2(JPH_FixedConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_FixedConstraintSettings_GetAxisY2(JPH_FixedConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_FixedConstraintSettings_SetAxisY2(JPH_FixedConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI JPH_FixedConstraint* JPH_FixedConstraintSettings_CreateConstraint(JPH_FixedConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2)



!  !* JPH_FixedConstraint */
! JPH_CAPI void JPH_FixedConstraint_GetTotalLambdaPosition(const JPH_FixedConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI void JPH_FixedConstraint_GetTotalLambdaRotation(const JPH_FixedConstraint* constraint, JPH_Vec3* result)


!  !* JPH_DistanceConstraintSettings */
! JPH_CAPI JPH_DistanceConstraintSettings* JPH_DistanceConstraintSettings_Create(void)

! JPH_CAPI JPH_ConstraintSpace JPH_DistanceConstraintSettings_GetSpace(JPH_DistanceConstraintSettings* settings)

! JPH_CAPI void JPH_DistanceConstraintSettings_SetSpace(JPH_DistanceConstraintSettings* settings, JPH_ConstraintSpace space)

! JPH_CAPI void JPH_DistanceConstraintSettings_GetPoint1(JPH_DistanceConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_DistanceConstraintSettings_SetPoint1(JPH_DistanceConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_DistanceConstraintSettings_GetPoint2(JPH_DistanceConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_DistanceConstraintSettings_SetPoint2(JPH_DistanceConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI JPH_DistanceConstraint* JPH_DistanceConstraintSettings_CreateConstraint(JPH_DistanceConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2) ! binding for DistanceConstraintSettings::Create()


!  !* JPH_DistanceConstraint */
! JPH_CAPI void JPH_DistanceConstraint_SetDistance(JPH_DistanceConstraint* constraint, float minDistance, float maxDistance)

! JPH_CAPI float JPH_DistanceConstraint_GetMinDistance(JPH_DistanceConstraint* constraint)

! JPH_CAPI float JPH_DistanceConstraint_GetMaxDistance(JPH_DistanceConstraint* constraint)

! JPH_CAPI void JPH_DistanceConstraint_GetLimitsSpringSettings(JPH_DistanceConstraint* constraint, JPH_SpringSettings* result)

! JPH_CAPI void JPH_DistanceConstraint_SetLimitsSpringSettings(JPH_DistanceConstraint* constraint, JPH_SpringSettings* settings)

! JPH_CAPI float JPH_DistanceConstraint_GetTotalLambdaPosition(const JPH_DistanceConstraint* constraint)



!  !* JPH_PointConstraintSettings */
! JPH_CAPI JPH_PointConstraintSettings* JPH_PointConstraintSettings_Create(void)

! JPH_CAPI JPH_ConstraintSpace JPH_PointConstraintSettings_GetSpace(JPH_PointConstraintSettings* settings)

! JPH_CAPI void JPH_PointConstraintSettings_SetSpace(JPH_PointConstraintSettings* settings, JPH_ConstraintSpace space)

! JPH_CAPI void JPH_PointConstraintSettings_GetPoint1(JPH_PointConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_PointConstraintSettings_SetPoint1(JPH_PointConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_PointConstraintSettings_GetPoint2(JPH_PointConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_PointConstraintSettings_SetPoint2(JPH_PointConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI JPH_PointConstraint* JPH_PointConstraintSettings_CreateConstraint(JPH_PointConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2) ! binding for PointConstraintSettings::Create()


!  !* JPH_PointConstraint */
! JPH_CAPI void JPH_PointConstraint_SetPoint1(JPH_PointConstraint* constraint, JPH_ConstraintSpace space, JPH_RVec3* value)

! JPH_CAPI void JPH_PointConstraint_SetPoint2(JPH_PointConstraint* constraint, JPH_ConstraintSpace space, JPH_RVec3* value)

! JPH_CAPI void JPH_PointConstraint_GetTotalLambdaPosition(const JPH_PointConstraint* constraint, JPH_Vec3* result)


!  !* JPH_HingeConstraintSettings */
! JPH_CAPI JPH_HingeConstraintSettings* JPH_HingeConstraintSettings_Create(void)

! JPH_CAPI void JPH_HingeConstraintSettings_GetPoint1(JPH_HingeConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_HingeConstraintSettings_SetPoint1(JPH_HingeConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_HingeConstraintSettings_GetPoint2(JPH_HingeConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_HingeConstraintSettings_SetPoint2(JPH_HingeConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_HingeConstraintSettings_SetHingeAxis1(JPH_HingeConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_HingeConstraintSettings_GetHingeAxis1(JPH_HingeConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_HingeConstraintSettings_SetNormalAxis1(JPH_HingeConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_HingeConstraintSettings_GetNormalAxis1(JPH_HingeConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_HingeConstraintSettings_SetHingeAxis2(JPH_HingeConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_HingeConstraintSettings_GetHingeAxis2(JPH_HingeConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_HingeConstraintSettings_SetNormalAxis2(JPH_HingeConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_HingeConstraintSettings_GetNormalAxis2(JPH_HingeConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI JPH_HingeConstraint* JPH_HingeConstraintSettings_CreateConstraint(JPH_HingeConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2) ! binding for HingeConstraintSettings::Create()


!  !* JPH_HingeConstraint */
! JPH_CAPI JPH_HingeConstraintSettings* JPH_HingeConstraint_GetSettings(JPH_HingeConstraint* constraint)

! JPH_CAPI float JPH_HingeConstraint_GetCurrentAngle(JPH_HingeConstraint* constraint)

! JPH_CAPI void JPH_HingeConstraint_SetMaxFrictionTorque(JPH_HingeConstraint* constraint, float frictionTorque)

! JPH_CAPI float JPH_HingeConstraint_GetMaxFrictionTorque(JPH_HingeConstraint* constraint)

! JPH_CAPI void JPH_HingeConstraint_SetMotorSettings(JPH_HingeConstraint* constraint, JPH_MotorSettings* settings)

! JPH_CAPI void JPH_HingeConstraint_GetMotorSettings(JPH_HingeConstraint* constraint, JPH_MotorSettings* result)

! JPH_CAPI void JPH_HingeConstraint_SetMotorState(JPH_HingeConstraint* constraint, JPH_MotorState state)

! JPH_CAPI JPH_MotorState JPH_HingeConstraint_GetMotorState(JPH_HingeConstraint* constraint)

! JPH_CAPI void JPH_HingeConstraint_SetTargetAngularVelocity(JPH_HingeConstraint* constraint, float angularVelocity)

! JPH_CAPI float JPH_HingeConstraint_GetTargetAngularVelocity(JPH_HingeConstraint* constraint)

! JPH_CAPI void JPH_HingeConstraint_SetTargetAngle(JPH_HingeConstraint* constraint, float angle)

! JPH_CAPI float JPH_HingeConstraint_GetTargetAngle(JPH_HingeConstraint* constraint)

! JPH_CAPI void JPH_HingeConstraint_SetLimits(JPH_HingeConstraint* constraint, float inLimitsMin, float inLimitsMax)

! JPH_CAPI float JPH_HingeConstraint_GetLimitsMin(JPH_HingeConstraint* constraint)

! JPH_CAPI float JPH_HingeConstraint_GetLimitsMax(JPH_HingeConstraint* constraint)

! JPH_CAPI bool JPH_HingeConstraint_HasLimits(JPH_HingeConstraint* constraint)

! JPH_CAPI void JPH_HingeConstraint_GetLimitsSpringSettings(JPH_HingeConstraint* constraint, JPH_SpringSettings* result)

! JPH_CAPI void JPH_HingeConstraint_SetLimitsSpringSettings(JPH_HingeConstraint* constraint, JPH_SpringSettings* settings)

! JPH_CAPI void JPH_HingeConstraint_GetTotalLambdaPosition(const JPH_HingeConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI void JPH_HingeConstraint_GetTotalLambdaRotation(const JPH_HingeConstraint* constraint, float* x, float* y)

! JPH_CAPI float JPH_HingeConstraint_GetTotalLambdaRotationLimits(const JPH_HingeConstraint* constraint)

! JPH_CAPI float JPH_HingeConstraint_GetTotalLambdaMotor(const JPH_HingeConstraint* constraint)



!  !* JPH_SliderConstraintSettings */
! JPH_CAPI JPH_SliderConstraintSettings* JPH_SliderConstraintSettings_Create(void)

! JPH_CAPI void JPH_SliderConstraintSettings_SetSliderAxis(JPH_SliderConstraintSettings* settings, const JPH_Vec3* axis)

! JPH_CAPI bool JPH_SliderConstraintSettings_GetAutoDetectPoint(JPH_SliderConstraintSettings* settings)

! JPH_CAPI void JPH_SliderConstraintSettings_SetAutoDetectPoint(JPH_SliderConstraintSettings* settings, bool value)

! JPH_CAPI void JPH_SliderConstraintSettings_GetPoint1(JPH_SliderConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_SliderConstraintSettings_SetPoint1(JPH_SliderConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_SliderConstraintSettings_GetPoint2(JPH_SliderConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_SliderConstraintSettings_SetPoint2(JPH_SliderConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_SliderConstraintSettings_SetSliderAxis1(JPH_SliderConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_SliderConstraintSettings_GetSliderAxis1(JPH_SliderConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_SliderConstraintSettings_SetNormalAxis1(JPH_SliderConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_SliderConstraintSettings_GetNormalAxis1(JPH_SliderConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_SliderConstraintSettings_SetSliderAxis2(JPH_SliderConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_SliderConstraintSettings_GetSliderAxis2(JPH_SliderConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_SliderConstraintSettings_SetNormalAxis2(JPH_SliderConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_SliderConstraintSettings_GetNormalAxis2(JPH_SliderConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI JPH_SliderConstraint* JPH_SliderConstraintSettings_CreateConstraint(JPH_SliderConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2) ! binding for SliderConstraintSettings::Create()



!  !* JPH_SliderConstraint */
! JPH_CAPI JPH_SliderConstraintSettings* JPH_SliderConstraint_GetSettings(JPH_SliderConstraint* constraint)

! JPH_CAPI float JPH_SliderConstraint_GetCurrentPosition(JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_SetMaxFrictionForce(JPH_SliderConstraint* constraint, float frictionForce)

! JPH_CAPI float JPH_SliderConstraint_GetMaxFrictionForce(JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_SetMotorSettings(JPH_SliderConstraint* constraint, JPH_MotorSettings* settings)

! JPH_CAPI void JPH_SliderConstraint_GetMotorSettings(JPH_SliderConstraint* constraint, JPH_MotorSettings* result)

! JPH_CAPI void JPH_SliderConstraint_SetMotorState(JPH_SliderConstraint* constraint, JPH_MotorState state)

! JPH_CAPI JPH_MotorState JPH_SliderConstraint_GetMotorState(JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_SetTargetVelocity(JPH_SliderConstraint* constraint, float velocity)

! JPH_CAPI float JPH_SliderConstraint_GetTargetVelocity(JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_SetTargetPosition(JPH_SliderConstraint* constraint, float position)

! JPH_CAPI float JPH_SliderConstraint_GetTargetPosition(JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_SetLimits(JPH_SliderConstraint* constraint, float inLimitsMin, float inLimitsMax)

! JPH_CAPI float JPH_SliderConstraint_GetLimitsMin(JPH_SliderConstraint* constraint)

! JPH_CAPI float JPH_SliderConstraint_GetLimitsMax(JPH_SliderConstraint* constraint)

! JPH_CAPI bool JPH_SliderConstraint_HasLimits(JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_GetLimitsSpringSettings(JPH_SliderConstraint* constraint, JPH_SpringSettings* result)

! JPH_CAPI void JPH_SliderConstraint_SetLimitsSpringSettings(JPH_SliderConstraint* constraint, JPH_SpringSettings* settings)

! JPH_CAPI void JPH_SliderConstraint_GetTotalLambdaPosition(const JPH_SliderConstraint* constraint, float* x, float* y)

! JPH_CAPI float JPH_SliderConstraint_GetTotalLambdaPositionLimits(const JPH_SliderConstraint* constraint)

! JPH_CAPI void JPH_SliderConstraint_GetTotalLambdaRotation(const JPH_SliderConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI float JPH_SliderConstraint_GetTotalLambdaMotor(const JPH_SliderConstraint* constraint)


!  !* JPH_ConeConstraintSettings */
! JPH_CAPI JPH_ConeConstraintSettings* JPH_ConeConstraintSettings_Create(void)

! JPH_CAPI void JPH_ConeConstraintSettings_GetPoint1(JPH_ConeConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_ConeConstraintSettings_SetPoint1(JPH_ConeConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_ConeConstraintSettings_GetPoint2(JPH_ConeConstraintSettings* settings, JPH_RVec3* result)

! JPH_CAPI void JPH_ConeConstraintSettings_SetPoint2(JPH_ConeConstraintSettings* settings, const JPH_RVec3* value)

! JPH_CAPI void JPH_ConeConstraintSettings_SetTwistAxis1(JPH_ConeConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_ConeConstraintSettings_GetTwistAxis1(JPH_ConeConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_ConeConstraintSettings_SetTwistAxis2(JPH_ConeConstraintSettings* settings, const JPH_Vec3* value)

! JPH_CAPI void JPH_ConeConstraintSettings_GetTwistAxis2(JPH_ConeConstraintSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_ConeConstraintSettings_SetHalfConeAngle(JPH_ConeConstraintSettings* settings, float halfConeAngle)

! JPH_CAPI float JPH_ConeConstraintSettings_GetHalfConeAngle(JPH_ConeConstraintSettings* settings)

! JPH_CAPI JPH_ConeConstraint* JPH_ConeConstraintSettings_CreateConstraint(JPH_ConeConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2)



!  !* JPH_ConeConstraint */

! JPH_CAPI void JPH_ConeConstraint_SetHalfConeAngle(JPH_ConeConstraint* constraint, float halfConeAngle)

! JPH_CAPI float JPH_ConeConstraint_GetCosHalfConeAngle(const JPH_ConeConstraint* constraint)

! JPH_CAPI void JPH_ConeConstraint_GetTotalLambdaPosition(const JPH_ConeConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI float JPH_ConeConstraint_GetTotalLambdaRotation(const JPH_ConeConstraint* constraint)


!  !* JPH_SwingTwistConstraintSettings */
! JPH_CAPI JPH_SwingTwistConstraintSettings* JPH_SwingTwistConstraintSettings_Create(void)

! JPH_CAPI JPH_SwingTwistConstraint* JPH_SwingTwistConstraintSettings_CreateConstraint(JPH_SwingTwistConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2)


!  !* JPH_SwingTwistConstraint */
! JPH_CAPI float JPH_SwingTwistConstraint_GetNormalHalfConeAngle(JPH_SwingTwistConstraint* constraint)

! JPH_CAPI void JPH_SwingTwistConstraint_GetTotalLambdaPosition(const JPH_SwingTwistConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI float JPH_SwingTwistConstraint_GetTotalLambdaTwist(const JPH_SwingTwistConstraint* constraint)

! JPH_CAPI float JPH_SwingTwistConstraint_GetTotalLambdaSwingY(const JPH_SwingTwistConstraint* constraint)

! JPH_CAPI float JPH_SwingTwistConstraint_GetTotalLambdaSwingZ(const JPH_SwingTwistConstraint* constraint)

! JPH_CAPI void JPH_SwingTwistConstraint_GetTotalLambdaMotor(const JPH_SwingTwistConstraint* constraint, JPH_Vec3* result)


!  !* JPH_SixDOFConstraintSettings */
! JPH_CAPI JPH_SixDOFConstraintSettings* JPH_SixDOFConstraintSettings_Create(void)

! JPH_CAPI JPH_SixDOFConstraint* JPH_SixDOFConstraintSettings_CreateConstraint(JPH_SixDOFConstraintSettings* settings, JPH_Body* body1, JPH_Body* body2)


!  !* JPH_SixDOFConstraint */
! JPH_CAPI float JPH_SixDOFConstraint_GetLimitsMin(JPH_SixDOFConstraint* constraint, JPH_SixDOFConstraintAxis axis)

! JPH_CAPI float JPH_SixDOFConstraint_GetLimitsMax(JPH_SixDOFConstraint* constraint, JPH_SixDOFConstraintAxis axis)

! JPH_CAPI void JPH_SixDOFConstraint_GetTotalLambdaPosition(const JPH_SixDOFConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI void JPH_SixDOFConstraint_GetTotalLambdaRotation(const JPH_SixDOFConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI void JPH_SixDOFConstraint_GetTotalLambdaMotorTranslation(const JPH_SixDOFConstraint* constraint, JPH_Vec3* result)

! JPH_CAPI void JPH_SixDOFConstraint_GetTotalLambdaMotorRotation(const JPH_SixDOFConstraint* constraint, JPH_Vec3* result)

!  !* JPH_TwoBodyConstraint */
! JPH_CAPI JPH_Body* JPH_TwoBodyConstraint_GetBody1(JPH_TwoBodyConstraint* constraint)

! JPH_CAPI JPH_Body* JPH_TwoBodyConstraint_GetBody2(JPH_TwoBodyConstraint* constraint)

! JPH_CAPI void JPH_TwoBodyConstraint_GetConstraintToBody1Matrix(JPH_TwoBodyConstraint* constraint, JPH_Matrix4x4* result)

! JPH_CAPI void JPH_TwoBodyConstraint_GetConstraintToBody2Matrix(JPH_TwoBodyConstraint* constraint, JPH_Matrix4x4* result)


!  !* BodyInterface */
! JPH_CAPI void JPH_BodyInterface_DestroyBody(JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI JPH_BodyID JPH_BodyInterface_CreateAndAddBody(JPH_BodyInterface* interface, const JPH_BodyCreationSettings* settings, JPH_Activation activationMode)

! JPH_CAPI JPH_Body* JPH_BodyInterface_CreateBody(JPH_BodyInterface* interface, const JPH_BodyCreationSettings* settings)

! JPH_CAPI JPH_Body* JPH_BodyInterface_CreateBodyWithID(JPH_BodyInterface* interface, JPH_BodyID bodyID, const JPH_BodyCreationSettings* settings)

! JPH_CAPI JPH_Body* JPH_BodyInterface_CreateBodyWithoutID(JPH_BodyInterface* interface, const JPH_BodyCreationSettings* settings)

! JPH_CAPI void JPH_BodyInterface_DestroyBodyWithoutID(JPH_BodyInterface* interface, JPH_Body* body)

! JPH_CAPI bool JPH_BodyInterface_AssignBodyID(JPH_BodyInterface* interface, JPH_Body* body)

! JPH_CAPI bool JPH_BodyInterface_AssignBodyID2(JPH_BodyInterface* interface, JPH_Body* body, JPH_BodyID bodyID)

! JPH_CAPI JPH_Body* JPH_BodyInterface_UnassignBodyID(JPH_BodyInterface* interface, JPH_BodyID bodyID)


! JPH_CAPI JPH_Body* JPH_BodyInterface_CreateSoftBody(JPH_BodyInterface* interface, const JPH_SoftBodyCreationSettings* settings)

! JPH_CAPI JPH_Body* JPH_BodyInterface_CreateSoftBodyWithID(JPH_BodyInterface* interface, JPH_BodyID bodyID, const JPH_SoftBodyCreationSettings* settings)

! JPH_CAPI JPH_Body* JPH_BodyInterface_CreateSoftBodyWithoutID(JPH_BodyInterface* interface, const JPH_SoftBodyCreationSettings* settings)

! JPH_CAPI JPH_BodyID JPH_BodyInterface_CreateAndAddSoftBody(JPH_BodyInterface* interface, const JPH_SoftBodyCreationSettings* settings, JPH_Activation activationMode)


! JPH_CAPI void JPH_BodyInterface_AddBody(JPH_BodyInterface* interface, JPH_BodyID bodyID, JPH_Activation activationMode)

! JPH_CAPI void JPH_BodyInterface_RemoveBody(JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI void JPH_BodyInterface_RemoveAndDestroyBody(JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI bool JPH_BodyInterface_IsActive(JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI bool JPH_BodyInterface_IsAdded(JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI JPH_BodyType JPH_BodyInterface_GetBodyType(JPH_BodyInterface* interface, JPH_BodyID bodyID)


! JPH_CAPI void JPH_BodyInterface_SetLinearVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyID, const JPH_Vec3* velocity)

! JPH_CAPI void JPH_BodyInterface_GetLinearVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyID, JPH_Vec3* velocity)

! JPH_CAPI void JPH_BodyInterface_GetCenterOfMassPosition(JPH_BodyInterface* interface, JPH_BodyID bodyID, JPH_RVec3* position)


! JPH_CAPI JPH_MotionType JPH_BodyInterface_GetMotionType(JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI void JPH_BodyInterface_SetMotionType(JPH_BodyInterface* interface, JPH_BodyID bodyID, JPH_MotionType motionType, JPH_Activation activationMode)


! JPH_CAPI float JPH_BodyInterface_GetRestitution(const JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI void JPH_BodyInterface_SetRestitution(JPH_BodyInterface* interface, JPH_BodyID bodyID, float restitution)


! JPH_CAPI float JPH_BodyInterface_GetFriction(const JPH_BodyInterface* interface, JPH_BodyID bodyID)

! JPH_CAPI void JPH_BodyInterface_SetFriction(JPH_BodyInterface* interface, JPH_BodyID bodyID, float friction)


! JPH_CAPI void JPH_BodyInterface_SetPosition(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RVec3* position, JPH_Activation activationMode)

! JPH_CAPI void JPH_BodyInterface_GetPosition(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RVec3* result)

! JPH_CAPI void JPH_BodyInterface_SetRotation(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Quat* rotation, JPH_Activation activationMode)

! JPH_CAPI void JPH_BodyInterface_GetRotation(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Quat* result)

! JPH_CAPI void JPH_BodyInterface_SetPositionAndRotation(JPH_BodyInterface* interface, JPH_BodyID bodyId, const JPH_RVec3* position, const JPH_Quat* rotation, JPH_Activation activationMode)

! JPH_CAPI void JPH_BodyInterface_SetPositionAndRotationWhenChanged(JPH_BodyInterface* interface, JPH_BodyID bodyId, const JPH_RVec3* position, const JPH_Quat* rotation, JPH_Activation activationMode)

! JPH_CAPI void JPH_BodyInterface_GetPositionAndRotation(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RVec3* position, JPH_Quat* rotation)

! JPH_CAPI void JPH_BodyInterface_SetPositionRotationAndVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RVec3* position, JPH_Quat* rotation, JPH_Vec3* linearVelocity, JPH_Vec3* angularVelocity)


! JPH_CAPI const JPH_Shape* JPH_BodyInterface_GetShape(JPH_BodyInterface* interface, JPH_BodyID bodyId)

! JPH_CAPI void JPH_BodyInterface_SetShape(JPH_BodyInterface* interface, JPH_BodyID bodyId, const JPH_Shape* shape, bool updateMassProperties, JPH_Activation activationMode)

! JPH_CAPI void JPH_BodyInterface_NotifyShapeChanged(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* previousCenterOfMass, bool updateMassProperties, JPH_Activation activationMode)


! JPH_CAPI void JPH_BodyInterface_ActivateBody(JPH_BodyInterface* interface, JPH_BodyID bodyId)

! JPH_CAPI void JPH_BodyInterface_DeactivateBody(JPH_BodyInterface* interface, JPH_BodyID bodyId)


! JPH_CAPI JPH_ObjectLayer JPH_BodyInterface_GetObjectLayer(JPH_BodyInterface* interface, JPH_BodyID bodyId)

! JPH_CAPI void JPH_BodyInterface_SetObjectLayer(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_ObjectLayer layer)


! JPH_CAPI void JPH_BodyInterface_GetWorldTransform(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RMatrix4x4* result)

! JPH_CAPI void JPH_BodyInterface_GetCenterOfMassTransform(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RMatrix4x4* result)


! JPH_CAPI void JPH_BodyInterface_MoveKinematic(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RVec3* targetPosition, JPH_Quat* targetRotation, float deltaTime)

! JPH_CAPI bool JPH_BodyInterface_ApplyBuoyancyImpulse(JPH_BodyInterface* interface, JPH_BodyID bodyId, const JPH_RVec3* surfacePosition, const JPH_Vec3* surfaceNormal, float buoyancy, float linearDrag, float angularDrag, const JPH_Vec3* fluidVelocity, const JPH_Vec3* gravity, float deltaTime)


! JPH_CAPI void JPH_BodyInterface_SetLinearAndAngularVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* linearVelocity, JPH_Vec3* angularVelocity)

! JPH_CAPI void JPH_BodyInterface_GetLinearAndAngularVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* linearVelocity, JPH_Vec3* angularVelocity)


! JPH_CAPI void JPH_BodyInterface_AddLinearVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* linearVelocity)

! JPH_CAPI void JPH_BodyInterface_AddLinearAndAngularVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* linearVelocity, JPH_Vec3* angularVelocity)


! JPH_CAPI void JPH_BodyInterface_SetAngularVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* angularVelocity)

! JPH_CAPI void JPH_BodyInterface_GetAngularVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* angularVelocity)


! JPH_CAPI void JPH_BodyInterface_GetPointVelocity(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_RVec3* point, JPH_Vec3* velocity)



! JPH_CAPI void JPH_BodyInterface_AddForce(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* force)

! JPH_CAPI void JPH_BodyInterface_AddForce2(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* force, JPH_RVec3* point)

! JPH_CAPI void JPH_BodyInterface_AddTorque(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* torque)

! JPH_CAPI void JPH_BodyInterface_AddForceAndTorque(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* force, JPH_Vec3* torque)


! JPH_CAPI void JPH_BodyInterface_AddImpulse(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* impulse)

! JPH_CAPI void JPH_BodyInterface_AddImpulse2(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* impulse, JPH_RVec3* point)

! JPH_CAPI void JPH_BodyInterface_AddAngularImpulse(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Vec3* angularImpulse)


! JPH_CAPI void JPH_BodyInterface_SetMotionQuality(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_MotionQuality quality)

! JPH_CAPI JPH_MotionQuality JPH_BodyInterface_GetMotionQuality(JPH_BodyInterface* interface, JPH_BodyID bodyId)


! JPH_CAPI void JPH_BodyInterface_GetInverseInertia(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_Matrix4x4* result)


! JPH_CAPI void JPH_BodyInterface_SetGravityFactor(JPH_BodyInterface* interface, JPH_BodyID bodyId, float value)

! JPH_CAPI float JPH_BodyInterface_GetGravityFactor(JPH_BodyInterface* interface, JPH_BodyID bodyId)


! JPH_CAPI void JPH_BodyInterface_SetUseManifoldReduction(JPH_BodyInterface* interface, JPH_BodyID bodyId, bool value)

! JPH_CAPI bool JPH_BodyInterface_GetUseManifoldReduction(JPH_BodyInterface* interface, JPH_BodyID bodyId)


! JPH_CAPI void JPH_BodyInterface_SetUserData(JPH_BodyInterface* interface, JPH_BodyID bodyId, uint64_t inUserData)

! JPH_CAPI uint64_t JPH_BodyInterface_GetUserData(JPH_BodyInterface* interface, JPH_BodyID bodyId)


! JPH_CAPI const JPH_PhysicsMaterial* JPH_BodyInterface_GetMaterial(JPH_BodyInterface* interface, JPH_BodyID bodyId, JPH_SubShapeID subShapeID)


! JPH_CAPI void JPH_BodyInterface_InvalidateContactCache(JPH_BodyInterface* interface, JPH_BodyID bodyId)


! !--------------------------------------------------------------------------------------------------
! ! JPH_BodyLockInterface
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI void JPH_BodyLockInterface_LockRead(const JPH_BodyLockInterface* lockInterface, JPH_BodyID bodyID, JPH_BodyLockRead* outLock)

! JPH_CAPI void JPH_BodyLockInterface_UnlockRead(const JPH_BodyLockInterface* lockInterface, JPH_BodyLockRead* ioLock)

! JPH_CAPI void JPH_BodyLockInterface_LockWrite(const JPH_BodyLockInterface* lockInterface, JPH_BodyID bodyID, JPH_BodyLockWrite* outLock)

! JPH_CAPI void JPH_BodyLockInterface_UnlockWrite(const JPH_BodyLockInterface* lockInterface, JPH_BodyLockWrite* ioLock)


! !--------------------------------------------------------------------------------------------------
! ! JPH_MotionProperties
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI JPH_AllowedDOFs JPH_MotionProperties_GetAllowedDOFs(const JPH_MotionProperties* properties)

! JPH_CAPI void JPH_MotionProperties_SetLinearDamping(JPH_MotionProperties* properties, float damping)

! JPH_CAPI float JPH_MotionProperties_GetLinearDamping(const JPH_MotionProperties* properties)

! JPH_CAPI void JPH_MotionProperties_SetAngularDamping(JPH_MotionProperties* properties, float damping)

! JPH_CAPI float JPH_MotionProperties_GetAngularDamping(const JPH_MotionProperties* properties)

! JPH_CAPI void JPH_MotionProperties_SetMassProperties(JPH_MotionProperties* properties, JPH_AllowedDOFs allowedDOFs, const JPH_MassProperties* massProperties)

! JPH_CAPI float JPH_MotionProperties_GetInverseMassUnchecked(JPH_MotionProperties* properties)

! JPH_CAPI void JPH_MotionProperties_SetInverseMass(JPH_MotionProperties* properties, float inverseMass)

! JPH_CAPI void JPH_MotionProperties_GetInverseInertiaDiagonal(JPH_MotionProperties* properties, JPH_Vec3* result)

! JPH_CAPI void JPH_MotionProperties_GetInertiaRotation(JPH_MotionProperties* properties, JPH_Quat* result)

! JPH_CAPI void JPH_MotionProperties_SetInverseInertia(JPH_MotionProperties* properties, JPH_Vec3* diagonal, JPH_Quat* rot)

! JPH_CAPI void JPH_MotionProperties_ScaleToMass(JPH_MotionProperties* properties, float mass)


! !--------------------------------------------------------------------------------------------------
! ! JPH_MassProperties
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI void JPH_MassProperties_DecomposePrincipalMomentsOfInertia(JPH_MassProperties* properties, JPH_Matrix4x4* rotation, JPH_Vec3* diagonal)

! JPH_CAPI void JPH_MassProperties_ScaleToMass(JPH_MassProperties* properties, float mass)

! JPH_CAPI void JPH_MassProperties_GetEquivalentSolidBoxSize(float mass, const JPH_Vec3* inertiaDiagonal, JPH_Vec3* result)


! !--------------------------------------------------------------------------------------------------
! ! JPH_CollideShapeSettings
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI void JPH_CollideShapeSettings_Init(JPH_CollideShapeSettings* settings)

! !--------------------------------------------------------------------------------------------------
! ! JPH_ShapeCastSettings
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI void JPH_ShapeCastSettings_Init(JPH_ShapeCastSettings* settings)

! !--------------------------------------------------------------------------------------------------
! ! JPH_BroadPhaseQuery
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI bool JPH_BroadPhaseQuery_CastRay(const JPH_BroadPhaseQuery* query,
!   const JPH_Vec3* origin, const JPH_Vec3* direction,
!   JPH_RayCastBodyCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter)

! JPH_CAPI bool JPH_BroadPhaseQuery_CastRay2(const JPH_BroadPhaseQuery* query,
!   const JPH_Vec3* origin, const JPH_Vec3* direction,
!   JPH_CollisionCollectorType collectorType,
!   JPH_RayCastBodyResultCallback* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter)

! JPH_CAPI bool JPH_BroadPhaseQuery_CollideAABox(const JPH_BroadPhaseQuery* query,
!   const JPH_AABox* box, JPH_CollideShapeBodyCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter)

! JPH_CAPI bool JPH_BroadPhaseQuery_CollideSphere(const JPH_BroadPhaseQuery* query,
!   const JPH_Vec3* center, float radius, JPH_CollideShapeBodyCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter)

! JPH_CAPI bool JPH_BroadPhaseQuery_CollidePoint(const JPH_BroadPhaseQuery* query,
!   const JPH_Vec3* point, JPH_CollideShapeBodyCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter)

!--------------------------------------------------------------------------------------------------
! JPH_NarrowPhaseQuery
!--------------------------------------------------------------------------------------------------
! JPH_CAPI bool JPH_NarrowPhaseQuery_CastRay(const JPH_NarrowPhaseQuery* query,
!   const JPH_RVec3* origin, const JPH_Vec3* direction,
!   JPH_RayCastResult* hit,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CastRay2(const JPH_NarrowPhaseQuery* query,
!   const JPH_RVec3* origin, const JPH_Vec3* direction,
!   const JPH_RayCastSettings* rayCastSettings,
!   JPH_CastRayCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CastRay3(const JPH_NarrowPhaseQuery* query,
!   const JPH_RVec3* origin, const JPH_Vec3* direction,
!   const JPH_RayCastSettings* rayCastSettings,
!   JPH_CollisionCollectorType collectorType,
!   JPH_CastRayResultCallback* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CollidePoint(const JPH_NarrowPhaseQuery* query,
!   const JPH_RVec3* point,
!   JPH_CollidePointCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CollidePoint2(const JPH_NarrowPhaseQuery* query,
!   const JPH_RVec3* point,
!   JPH_CollisionCollectorType collectorType,
!   JPH_CollidePointResultCallback* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CollideShape(const JPH_NarrowPhaseQuery* query,
!   const JPH_Shape* shape, const JPH_Vec3* scale, const JPH_RMatrix4x4* centerOfMassTransform,
!   const JPH_CollideShapeSettings* settings,
!   JPH_RVec3* baseOffset,
!   JPH_CollideShapeCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CollideShape2(const JPH_NarrowPhaseQuery* query,
!   const JPH_Shape* shape, const JPH_Vec3* scale, const JPH_RMatrix4x4* centerOfMassTransform,
!   const JPH_CollideShapeSettings* settings,
!   JPH_RVec3* baseOffset,
!   JPH_CollisionCollectorType collectorType,
!   JPH_CollideShapeResultCallback* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CastShape(const JPH_NarrowPhaseQuery* query,
!   const JPH_Shape* shape,
!   const JPH_RMatrix4x4* worldTransform, const JPH_Vec3* direction,
!   const JPH_ShapeCastSettings* settings,
!   JPH_RVec3* baseOffset,
!   JPH_CastShapeCollector* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_NarrowPhaseQuery_CastShape2(const JPH_NarrowPhaseQuery* query,
!   const JPH_Shape* shape,
!   const JPH_RMatrix4x4* worldTransform, const JPH_Vec3* direction,
!   const JPH_ShapeCastSettings* settings,
!   JPH_RVec3* baseOffset,
!   JPH_CollisionCollectorType collectorType,
!   JPH_CastShapeResultCallback* callback, void* userData,
!   JPH_BroadPhaseLayerFilter* broadPhaseLayerFilter,
!   JPH_ObjectLayerFilter* objectLayerFilter,
!   const JPH_BodyFilter* bodyFilter,
!   const JPH_ShapeFilter* shapeFilter)

! !--------------------------------------------------------------------------------------------------
! ! JPH_Body
! !--------------------------------------------------------------------------------------------------
! JPH_CAPI JPH_BodyID JPH_Body_GetID(const JPH_Body* body)

! JPH_CAPI JPH_BodyType JPH_Body_GetBodyType(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsRigidBody(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsSoftBody(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsActive(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsStatic(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsKinematic(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsDynamic(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_CanBeKinematicOrDynamic(const JPH_Body* body)


! JPH_CAPI void JPH_Body_SetIsSensor(JPH_Body* body, bool value)

! JPH_CAPI bool JPH_Body_IsSensor(const JPH_Body* body)


! JPH_CAPI void JPH_Body_SetCollideKinematicVsNonDynamic(JPH_Body* body, bool value)

! JPH_CAPI bool JPH_Body_GetCollideKinematicVsNonDynamic(const JPH_Body* body)


! JPH_CAPI void JPH_Body_SetUseManifoldReduction(JPH_Body* body, bool value)

! JPH_CAPI bool JPH_Body_GetUseManifoldReduction(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_GetUseManifoldReductionWithBody(const JPH_Body* body, const JPH_Body* other)


! JPH_CAPI void JPH_Body_SetApplyGyroscopicForce(JPH_Body* body, bool value)

! JPH_CAPI bool JPH_Body_GetApplyGyroscopicForce(const JPH_Body* body)

! JPH_CAPI void JPH_Body_SetEnhancedInternalEdgeRemoval(JPH_Body* body, bool value)

! JPH_CAPI bool JPH_Body_GetEnhancedInternalEdgeRemoval(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_GetEnhancedInternalEdgeRemovalWithBody(const JPH_Body* body, const JPH_Body* other)

! JPH_CAPI JPH_MotionType JPH_Body_GetMotionType(const JPH_Body* body)

! JPH_CAPI void JPH_Body_SetMotionType(JPH_Body* body, JPH_MotionType motionType)

! JPH_CAPI JPH_BroadPhaseLayer JPH_Body_GetBroadPhaseLayer(const JPH_Body* body)

! JPH_CAPI JPH_ObjectLayer JPH_Body_GetObjectLayer(const JPH_Body* body)

! JPH_CAPI bool JPH_Body_GetAllowSleeping(JPH_Body* body)

! JPH_CAPI void JPH_Body_SetAllowSleeping(JPH_Body* body, bool allowSleeping)

! JPH_CAPI void JPH_Body_ResetSleepTimer(JPH_Body* body)

! JPH_CAPI float JPH_Body_GetFriction(const JPH_Body* body)

! JPH_CAPI void JPH_Body_SetFriction(JPH_Body* body, float friction)

! JPH_CAPI float JPH_Body_GetRestitution(const JPH_Body* body)

! JPH_CAPI void JPH_Body_SetRestitution(JPH_Body* body, float restitution)

! JPH_CAPI void JPH_Body_GetLinearVelocity(JPH_Body* body, JPH_Vec3* velocity)

! JPH_CAPI void JPH_Body_SetLinearVelocity(JPH_Body* body, const JPH_Vec3* velocity)

! JPH_CAPI void JPH_Body_SetLinearVelocityClamped(JPH_Body* body, const JPH_Vec3* velocity)

! JPH_CAPI void JPH_Body_GetAngularVelocity(JPH_Body* body, JPH_Vec3* velocity)

! JPH_CAPI void JPH_Body_SetAngularVelocity(JPH_Body* body, const JPH_Vec3* velocity)

! JPH_CAPI void JPH_Body_SetAngularVelocityClamped(JPH_Body* body, const JPH_Vec3* velocity)


! JPH_CAPI void JPH_Body_GetPointVelocityCOM(JPH_Body* body, const JPH_Vec3* pointRelativeToCOM, JPH_Vec3* velocity)

! JPH_CAPI void JPH_Body_GetPointVelocity(JPH_Body* body, const JPH_RVec3* point, JPH_Vec3* velocity)


! JPH_CAPI void JPH_Body_AddForce(JPH_Body* body, const JPH_Vec3* force)

! JPH_CAPI void JPH_Body_AddForceAtPosition(JPH_Body* body, const JPH_Vec3* force, const JPH_RVec3* position)

! JPH_CAPI void JPH_Body_AddTorque(JPH_Body* body, const JPH_Vec3* force)

! JPH_CAPI void JPH_Body_GetAccumulatedForce(JPH_Body* body, JPH_Vec3* force)

! JPH_CAPI void JPH_Body_GetAccumulatedTorque(JPH_Body* body, JPH_Vec3* force)

! JPH_CAPI void JPH_Body_ResetForce(JPH_Body* body)

! JPH_CAPI void JPH_Body_ResetTorque(JPH_Body* body)

! JPH_CAPI void JPH_Body_ResetMotion(JPH_Body* body)

! JPH_CAPI void JPH_Body_GetInverseInertia(JPH_Body* body, JPH_Matrix4x4* result)

! JPH_CAPI void JPH_Body_AddImpulse(JPH_Body* body, const JPH_Vec3* impulse)

! JPH_CAPI void JPH_Body_AddImpulseAtPosition(JPH_Body* body, const JPH_Vec3* impulse, const JPH_RVec3* position)

! JPH_CAPI void JPH_Body_AddAngularImpulse(JPH_Body* body, const JPH_Vec3* angularImpulse)

! JPH_CAPI void JPH_Body_MoveKinematic(JPH_Body* body, JPH_RVec3* targetPosition, JPH_Quat* targetRotation, float deltaTime)

! JPH_CAPI bool JPH_Body_ApplyBuoyancyImpulse(JPH_Body* body, const JPH_RVec3* surfacePosition, const JPH_Vec3* surfaceNormal, float buoyancy, float linearDrag, float angularDrag, const JPH_Vec3* fluidVelocity, const JPH_Vec3* gravity, float deltaTime)


! JPH_CAPI bool JPH_Body_IsInBroadPhase(JPH_Body* body)

! JPH_CAPI bool JPH_Body_IsCollisionCacheInvalid(JPH_Body* body)


! JPH_CAPI const JPH_Shape* JPH_Body_GetShape(JPH_Body* body)


! JPH_CAPI void JPH_Body_GetPosition(const JPH_Body* body, JPH_RVec3* result)

! JPH_CAPI void JPH_Body_GetRotation(const JPH_Body* body, JPH_Quat* result)

! JPH_CAPI void JPH_Body_GetWorldTransform(const JPH_Body* body, JPH_RMatrix4x4* result)

! JPH_CAPI void JPH_Body_GetCenterOfMassPosition(const JPH_Body* body, JPH_RVec3* result)

! JPH_CAPI void JPH_Body_GetCenterOfMassTransform(const JPH_Body* body, JPH_RMatrix4x4* result)

! JPH_CAPI void JPH_Body_GetInverseCenterOfMassTransform(const JPH_Body* body, JPH_RMatrix4x4* result)


! JPH_CAPI void JPH_Body_GetWorldSpaceBounds(const JPH_Body* body, JPH_AABox* result)

! JPH_CAPI void JPH_Body_GetWorldSpaceSurfaceNormal(const JPH_Body* body, JPH_SubShapeID subShapeID, const JPH_RVec3* position, JPH_Vec3* normal)


! JPH_CAPI JPH_MotionProperties* JPH_Body_GetMotionProperties(JPH_Body* body)

! JPH_CAPI JPH_MotionProperties* JPH_Body_GetMotionPropertiesUnchecked(JPH_Body* body)


! JPH_CAPI void JPH_Body_SetUserData(JPH_Body* body, uint64_t userData)

! JPH_CAPI uint64_t JPH_Body_GetUserData(JPH_Body* body)

! JPH_CAPI JPH_Body* JPH_Body_GetFixedToWorldBody(void)

!  !* JPH_BroadPhaseLayerFilter_Procs */
! type, bind(c) :: JPH_BroadPhaseLayerFilter_Procs {
!   bool(JPH_API_CALL* ShouldCollide)(void* userData, JPH_BroadPhaseLayer layer)
! } JPH_BroadPhaseLayerFilter_Procs

! JPH_CAPI JPH_BroadPhaseLayerFilter* JPH_BroadPhaseLayerFilter_Create(JPH_BroadPhaseLayerFilter_Procs procs, void* userData)

! JPH_CAPI void JPH_BroadPhaseLayerFilter_Destroy(JPH_BroadPhaseLayerFilter* filter)

!  !* JPH_ObjectLayerFilter */
! type, bind(c) :: JPH_ObjectLayerFilter_Procs {
!   bool(JPH_API_CALL* ShouldCollide)(void* userData, JPH_ObjectLayer layer)
! } JPH_ObjectLayerFilter_Procs

! JPH_CAPI JPH_ObjectLayerFilter* JPH_ObjectLayerFilter_Create(JPH_ObjectLayerFilter_Procs procs, void* userData)

! JPH_CAPI void JPH_ObjectLayerFilter_Destroy(JPH_ObjectLayerFilter* filter)

!  !* JPH_BodyFilter */
! type, bind(c) :: JPH_BodyFilter_Procs {
!   bool(JPH_API_CALL* ShouldCollide)(void* userData, JPH_BodyID bodyID)
!   bool(JPH_API_CALL* ShouldCollideLocked)(void* userData, const JPH_Body* bodyID)
! } JPH_BodyFilter_Procs

! JPH_CAPI JPH_BodyFilter* JPH_BodyFilter_Create(JPH_BodyFilter_Procs procs, void* userData)

! JPH_CAPI void JPH_BodyFilter_Destroy(JPH_BodyFilter* filter)

!  !* JPH_ShapeFilter */
! type, bind(c) :: JPH_ShapeFilter_Procs {
!   bool(JPH_API_CALL* ShouldCollide)(void* userData, const JPH_Shape* shape2, const JPH_SubShapeID* subShapeIDOfShape2)
!   bool(JPH_API_CALL* ShouldCollide2)(void* userData, const JPH_Shape* shape1, const JPH_SubShapeID* subShapeIDOfShape1, const JPH_Shape* shape2, const JPH_SubShapeID* subShapeIDOfShape2)
! } JPH_ShapeFilter_Procs

! JPH_CAPI JPH_ShapeFilter* JPH_ShapeFilter_Create(JPH_ShapeFilter_Procs procs, void* userData)

! JPH_CAPI void JPH_ShapeFilter_Destroy(JPH_ShapeFilter* filter)

! JPH_CAPI JPH_BodyID JPH_ShapeFilter_GetBodyID2(JPH_ShapeFilter* filter)

! JPH_CAPI void JPH_ShapeFilter_SetBodyID2(JPH_ShapeFilter* filter, JPH_BodyID id)

!  !* Contact listener */
! type, bind(c) :: JPH_ContactListener_Procs {
!   JPH_ValidateResult(JPH_API_CALL* OnContactValidate)(void* userData,
!     const JPH_Body* body1,
!     const JPH_Body* body2,
!     const JPH_RVec3* baseOffset,
!     const JPH_CollideShapeResult* collisionResult)

!   void(JPH_API_CALL* OnContactAdded)(void* userData,
!     const JPH_Body* body1,
!     const JPH_Body* body2,
!     const JPH_ContactManifold* manifold,
!     JPH_ContactSettings* settings)

!   void(JPH_API_CALL* OnContactPersisted)(void* userData,
!     const JPH_Body* body1,
!     const JPH_Body* body2,
!     const JPH_ContactManifold* manifold,
!     JPH_ContactSettings* settings)

!   void(JPH_API_CALL* OnContactRemoved)(void* userData,
!     const JPH_SubShapeIDPair* subShapePair
!     )
! } JPH_ContactListener_Procs

! JPH_CAPI JPH_ContactListener* JPH_ContactListener_Create(JPH_ContactListener_Procs procs, void* userData)

! JPH_CAPI void JPH_ContactListener_Destroy(JPH_ContactListener* listener)

!  !* BodyActivationListener */
! type, bind(c) :: JPH_BodyActivationListener_Procs {
!   void(JPH_API_CALL* OnBodyActivated)(void* userData, JPH_BodyID bodyID, uint64_t bodyUserData)
!   void(JPH_API_CALL* OnBodyDeactivated)(void* userData, JPH_BodyID bodyID, uint64_t bodyUserData)
! } JPH_BodyActivationListener_Procs

! JPH_CAPI JPH_BodyActivationListener* JPH_BodyActivationListener_Create(JPH_BodyActivationListener_Procs procs, void* userData)

! JPH_CAPI void JPH_BodyActivationListener_Destroy(JPH_BodyActivationListener* listener)

!  !* JPH_BodyDrawFilter */
! type, bind(c) :: JPH_BodyDrawFilter_Procs {
!   bool(JPH_API_CALL* ShouldDraw)(void* userData, const JPH_Body* body)
! } JPH_BodyDrawFilter_Procs

! JPH_CAPI JPH_BodyDrawFilter* JPH_BodyDrawFilter_Create(JPH_BodyDrawFilter_Procs procs, void* userData)

! JPH_CAPI void JPH_BodyDrawFilter_Destroy(JPH_BodyDrawFilter* filter)

!  !* ContactManifold */
! JPH_CAPI void JPH_ContactManifold_GetWorldSpaceNormal(const JPH_ContactManifold* manifold, JPH_Vec3* result)

! JPH_CAPI float JPH_ContactManifold_GetPenetrationDepth(const JPH_ContactManifold* manifold)

! JPH_CAPI JPH_SubShapeID JPH_ContactManifold_GetSubShapeID1(const JPH_ContactManifold* manifold)

! JPH_CAPI JPH_SubShapeID JPH_ContactManifold_GetSubShapeID2(const JPH_ContactManifold* manifold)

! JPH_CAPI uint32_t JPH_ContactManifold_GetPointCount(const JPH_ContactManifold* manifold)

! JPH_CAPI void JPH_ContactManifold_GetWorldSpaceContactPointOn1(const JPH_ContactManifold* manifold, uint32_t index, JPH_RVec3* result)

! JPH_CAPI void JPH_ContactManifold_GetWorldSpaceContactPointOn2(const JPH_ContactManifold* manifold, uint32_t index, JPH_RVec3* result)

!  !* ContactSettings */
! JPH_CAPI float JPH_ContactSettings_GetFriction(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetFriction(JPH_ContactSettings* settings, float friction)

! JPH_CAPI float JPH_ContactSettings_GetRestitution(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetRestitution(JPH_ContactSettings* settings, float restitution)

! JPH_CAPI float JPH_ContactSettings_GetInvMassScale1(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetInvMassScale1(JPH_ContactSettings* settings, float scale)

! JPH_CAPI float JPH_ContactSettings_GetInvInertiaScale1(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetInvInertiaScale1(JPH_ContactSettings* settings, float scale)

! JPH_CAPI float JPH_ContactSettings_GetInvMassScale2(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetInvMassScale2(JPH_ContactSettings* settings, float scale)

! JPH_CAPI float JPH_ContactSettings_GetInvInertiaScale2(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetInvInertiaScale2(JPH_ContactSettings* settings, float scale)

! JPH_CAPI bool JPH_ContactSettings_GetIsSensor(JPH_ContactSettings* settings)

! JPH_CAPI void JPH_ContactSettings_SetIsSensor(JPH_ContactSettings* settings, bool sensor)

! JPH_CAPI void JPH_ContactSettings_GetRelativeLinearSurfaceVelocity(JPH_ContactSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_ContactSettings_SetRelativeLinearSurfaceVelocity(JPH_ContactSettings* settings, JPH_Vec3* velocity)

! JPH_CAPI void JPH_ContactSettings_GetRelativeAngularSurfaceVelocity(JPH_ContactSettings* settings, JPH_Vec3* result)

! JPH_CAPI void JPH_ContactSettings_SetRelativeAngularSurfaceVelocity(JPH_ContactSettings* settings, JPH_Vec3* velocity)

!  !* CharacterBase */
! JPH_CAPI void JPH_CharacterBase_Destroy(JPH_CharacterBase* character)

! JPH_CAPI float JPH_CharacterBase_GetCosMaxSlopeAngle(JPH_CharacterBase* character)

! JPH_CAPI void JPH_CharacterBase_SetMaxSlopeAngle(JPH_CharacterBase* character, float maxSlopeAngle)

! JPH_CAPI void JPH_CharacterBase_GetUp(JPH_CharacterBase* character, JPH_Vec3* result)

! JPH_CAPI void JPH_CharacterBase_SetUp(JPH_CharacterBase* character, const JPH_Vec3* value)

! JPH_CAPI bool JPH_CharacterBase_IsSlopeTooSteep(JPH_CharacterBase* character, const JPH_Vec3* value)

! JPH_CAPI const JPH_Shape* JPH_CharacterBase_GetShape(JPH_CharacterBase* character)


! JPH_CAPI JPH_GroundState JPH_CharacterBase_GetGroundState(JPH_CharacterBase* character)

! JPH_CAPI bool JPH_CharacterBase_IsSupported(JPH_CharacterBase* character)

! JPH_CAPI void JPH_CharacterBase_GetGroundPosition(JPH_CharacterBase* character, JPH_RVec3* position)

! JPH_CAPI void JPH_CharacterBase_GetGroundNormal(JPH_CharacterBase* character, JPH_Vec3* normal)

! JPH_CAPI void JPH_CharacterBase_GetGroundVelocity(JPH_CharacterBase* character, JPH_Vec3* velocity)

! JPH_CAPI const JPH_PhysicsMaterial* JPH_CharacterBase_GetGroundMaterial(JPH_CharacterBase* character)

! JPH_CAPI JPH_BodyID JPH_CharacterBase_GetGroundBodyId(JPH_CharacterBase* character)

! JPH_CAPI JPH_SubShapeID JPH_CharacterBase_GetGroundSubShapeId(JPH_CharacterBase* character)

! JPH_CAPI uint64_t JPH_CharacterBase_GetGroundUserData(JPH_CharacterBase* character)


!  !* CharacterSettings */
! JPH_CAPI void JPH_CharacterSettings_Init(JPH_CharacterSettings* settings)

!  !* Character */
! JPH_CAPI JPH_Character* JPH_Character_Create(const JPH_CharacterSettings* settings,
!   const JPH_RVec3* position,
!   const JPH_Quat* rotation,
!   uint64_t userData,
!   JPH_PhysicsSystem* system)

! JPH_CAPI void JPH_Character_AddToPhysicsSystem(JPH_Character* character, JPH_Activation activationMode  !*= JPH_ActivationActivate */, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_RemoveFromPhysicsSystem(JPH_Character* character, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_Activate(JPH_Character* character, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_PostSimulation(JPH_Character* character, float maxSeparationDistance, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_SetLinearAndAngularVelocity(JPH_Character* character, JPH_Vec3* linearVelocity, JPH_Vec3* angularVelocity, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_GetLinearVelocity(JPH_Character* character, JPH_Vec3* result)

! JPH_CAPI void JPH_Character_SetLinearVelocity(JPH_Character* character, const JPH_Vec3* value, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_AddLinearVelocity(JPH_Character* character, const JPH_Vec3* value, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_AddImpulse(JPH_Character* character, const JPH_Vec3* value, bool lockBodies  !* = true */)

! JPH_CAPI JPH_BodyID JPH_Character_GetBodyID(const JPH_Character* character)

! JPH_CAPI void JPH_Character_GetPositionAndRotation(JPH_Character* character, JPH_RVec3* position, JPH_Quat* rotation, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_SetPositionAndRotation(JPH_Character* character, const JPH_RVec3* position, const JPH_Quat* rotation, JPH_Activation activationMode, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_GetPosition(JPH_Character* character, JPH_RVec3* position, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_SetPosition(JPH_Character* character, const JPH_RVec3* position, JPH_Activation activationMode, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_GetRotation(JPH_Character* character, JPH_Quat* rotation, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_SetRotation(JPH_Character* character, const JPH_Quat* rotation, JPH_Activation activationMode, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_GetCenterOfMassPosition(JPH_Character* character, JPH_RVec3* result, bool lockBodies  !* = true */)

! JPH_CAPI void JPH_Character_GetWorldTransform(JPH_Character* character, JPH_RMatrix4x4* result, bool lockBodies  !* = true */)

! JPH_CAPI JPH_ObjectLayer JPH_Character_GetLayer(const JPH_Character* character)

! JPH_CAPI void JPH_Character_SetLayer(JPH_Character* character, JPH_ObjectLayer value, bool lockBodies  !*= true*/)

! JPH_CAPI void JPH_Character_SetShape(JPH_Character* character, const JPH_Shape* shape, float maxPenetrationDepth, bool lockBodies  !*= true*/)


!  !* CharacterVirtualSettings */
! JPH_CAPI void JPH_CharacterVirtualSettings_Init(JPH_CharacterVirtualSettings* settings)


!  !* CharacterVirtual */
! JPH_CAPI JPH_CharacterVirtual* JPH_CharacterVirtual_Create(const JPH_CharacterVirtualSettings* settings,
!   const JPH_RVec3* position,
!   const JPH_Quat* rotation,
!   uint64_t userData,
!   JPH_PhysicsSystem* system)

! JPH_CAPI void JPH_CharacterVirtual_SetListener(JPH_CharacterVirtual* character, JPH_CharacterContactListener* listener)

! JPH_CAPI void JPH_CharacterVirtual_GetLinearVelocity(JPH_CharacterVirtual* character, JPH_Vec3* velocity)

! JPH_CAPI void JPH_CharacterVirtual_SetLinearVelocity(JPH_CharacterVirtual* character, const JPH_Vec3* velocity)

! JPH_CAPI void JPH_CharacterVirtual_GetPosition(JPH_CharacterVirtual* character, JPH_RVec3* position)

! JPH_CAPI void JPH_CharacterVirtual_SetPosition(JPH_CharacterVirtual* character, const JPH_RVec3* position)

! JPH_CAPI void JPH_CharacterVirtual_GetRotation(JPH_CharacterVirtual* character, JPH_Quat* rotation)

! JPH_CAPI void JPH_CharacterVirtual_SetRotation(JPH_CharacterVirtual* character, const JPH_Quat* rotation)

! JPH_CAPI void JPH_CharacterVirtual_GetWorldTransform(JPH_CharacterVirtual* character, JPH_RMatrix4x4* result)

! JPH_CAPI void JPH_CharacterVirtual_GetCenterOfMassTransform(JPH_CharacterVirtual* character, JPH_RMatrix4x4* result)

! JPH_CAPI float JPH_CharacterVirtual_GetMass(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetMass(JPH_CharacterVirtual* character, float value)

! JPH_CAPI float JPH_CharacterVirtual_GetMaxStrength(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetMaxStrength(JPH_CharacterVirtual* character, float value)


! JPH_CAPI float JPH_CharacterVirtual_GetPenetrationRecoverySpeed(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetPenetrationRecoverySpeed(JPH_CharacterVirtual* character, float value)

! JPH_CAPI bool  JPH_CharacterVirtual_GetEnhancedInternalEdgeRemoval(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetEnhancedInternalEdgeRemoval(JPH_CharacterVirtual* character, bool value)

! JPH_CAPI float JPH_CharacterVirtual_GetCharacterPadding(JPH_CharacterVirtual* character)

! JPH_CAPI uint32_t JPH_CharacterVirtual_GetMaxNumHits(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetMaxNumHits(JPH_CharacterVirtual* character, uint32_t value)

! JPH_CAPI float JPH_CharacterVirtual_GetHitReductionCosMaxAngle(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetHitReductionCosMaxAngle(JPH_CharacterVirtual* character, float value)

! JPH_CAPI bool JPH_CharacterVirtual_GetMaxHitsExceeded(JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_GetShapeOffset(JPH_CharacterVirtual* character, JPH_Vec3* result)

! JPH_CAPI void JPH_CharacterVirtual_SetShapeOffset(JPH_CharacterVirtual* character, const JPH_Vec3* value)

! JPH_CAPI uint64_t JPH_CharacterVirtual_GetUserData(const JPH_CharacterVirtual* character)

! JPH_CAPI void JPH_CharacterVirtual_SetUserData(JPH_CharacterVirtual* character, uint64_t value)

! JPH_CAPI JPH_BodyID JPH_CharacterVirtual_GetInnerBodyID(const JPH_CharacterVirtual* character)


! JPH_CAPI void JPH_CharacterVirtual_CancelVelocityTowardsSteepSlopes(JPH_CharacterVirtual* character, const JPH_Vec3* desiredVelocity, JPH_Vec3* velocity)

! JPH_CAPI void JPH_CharacterVirtual_Update(JPH_CharacterVirtual* character, float deltaTime, JPH_ObjectLayer layer, JPH_PhysicsSystem* system, const JPH_BodyFilter* bodyFilter, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI void JPH_CharacterVirtual_ExtendedUpdate(JPH_CharacterVirtual* character, float deltaTime,
!   const JPH_ExtendedUpdateSettings* settings, JPH_ObjectLayer layer, JPH_PhysicsSystem* system, const JPH_BodyFilter* bodyFilter, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI void JPH_CharacterVirtual_RefreshContacts(JPH_CharacterVirtual* character, JPH_ObjectLayer layer, JPH_PhysicsSystem* system, const JPH_BodyFilter* bodyFilter, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_CharacterVirtual_CanWalkStairs(JPH_CharacterVirtual* character, const JPH_Vec3* linearVelocity)

! JPH_CAPI bool JPH_CharacterVirtual_WalkStairs(JPH_CharacterVirtual* character, float deltaTime,
!   const JPH_Vec3* stepUp, const JPH_Vec3* stepForward, const JPH_Vec3* stepForwardTest, const JPH_Vec3* stepDownExtra,
!   JPH_ObjectLayer layer, JPH_PhysicsSystem* system,
!   const JPH_BodyFilter* bodyFilter, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI bool JPH_CharacterVirtual_StickToFloor(JPH_CharacterVirtual* character, const JPH_Vec3* stepDown,
!   JPH_ObjectLayer layer, JPH_PhysicsSystem* system,
!   const JPH_BodyFilter* bodyFilter, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI void JPH_CharacterVirtual_UpdateGroundVelocity(JPH_CharacterVirtual* character)

! JPH_CAPI bool JPH_CharacterVirtual_SetShape(JPH_CharacterVirtual* character, const JPH_Shape* shape, float maxPenetrationDepth, JPH_ObjectLayer layer, JPH_PhysicsSystem* system, const JPH_BodyFilter* bodyFilter, const JPH_ShapeFilter* shapeFilter)

! JPH_CAPI void JPH_CharacterVirtual_SetInnerBodyShape(JPH_CharacterVirtual* character, const JPH_Shape* shape)

!  !* CharacterContactListener */
! type, bind(c) :: JPH_CharacterContactListener_Procs {
!   void (JPH_API_CALL* OnAdjustBodyVelocity)(void* userData,
!     const JPH_CharacterVirtual* character,
!     const JPH_Body* body2,
!     const JPH_Vec3* linearVelocity,
!     const JPH_Vec3* angularVelocity)

!   bool(JPH_API_CALL* OnContactValidate)(void* userData,
!     const JPH_CharacterVirtual* character,
!     const JPH_BodyID bodyID2,
!     const JPH_SubShapeID subShapeID2)

!   void(JPH_API_CALL* OnContactAdded)(void* userData,
!     const JPH_CharacterVirtual* character,
!     const JPH_BodyID bodyID2,
!     const JPH_SubShapeID subShapeID2,
!     const JPH_RVec3* contactPosition,
!     const JPH_Vec3* contactNormal,
!     JPH_CharacterContactSettings* ioSettings)

!   void(JPH_API_CALL* OnContactSolve)(void* userData,
!     const JPH_CharacterVirtual* character,
!     const JPH_BodyID bodyID2,
!     const JPH_SubShapeID subShapeID2,
!     const JPH_RVec3* contactPosition,
!     const JPH_Vec3* contactNormal,
!     const JPH_Vec3* contactVelocity,
!     const JPH_PhysicsMaterial* contactMaterial,
!     const JPH_Vec3* characterVelocity,
!     JPH_Vec3* newCharacterVelocity
!     )
! } JPH_CharacterContactListener_Procs

! JPH_CAPI JPH_CharacterContactListener* JPH_CharacterContactListener_Create(JPH_CharacterContactListener_Procs procs, void* userData)

! JPH_CAPI void JPH_CharacterContactListener_Destroy(JPH_CharacterContactListener* listener)

!  !* DebugRenderer */
! type, bind(c) :: JPH_DebugRenderer_Procs {
!   void (JPH_API_CALL* DrawLine)(void* userData, const JPH_RVec3* from, const JPH_RVec3* to, JPH_Color color)
!   void (JPH_API_CALL* DrawTriangle)(void* userData, const JPH_RVec3* v1, const JPH_RVec3* v2, const JPH_RVec3* v3, JPH_Color color, JPH_DebugRenderer_CastShadow castShadow)
!   void (JPH_API_CALL* DrawText3D)(void* userData, const JPH_RVec3* position, const char* str, JPH_Color color, float height)
! } JPH_DebugRenderer_Procs

! JPH_CAPI JPH_DebugRenderer* JPH_DebugRenderer_Create(JPH_DebugRenderer_Procs procs, void* userData)

! JPH_CAPI void JPH_DebugRenderer_Destroy(JPH_DebugRenderer* renderer)

! JPH_CAPI void JPH_DebugRenderer_NextFrame(JPH_DebugRenderer* renderer)

! JPH_CAPI void JPH_DebugRenderer_DrawLine(JPH_DebugRenderer* renderer, const JPH_RVec3* from, const JPH_RVec3* to, JPH_Color color)

! JPH_CAPI void JPH_DebugRenderer_DrawWireBox(JPH_DebugRenderer* renderer, const JPH_AABox* box, JPH_Color color)

! JPH_CAPI void JPH_DebugRenderer_DrawWireBox2(JPH_DebugRenderer* renderer, const JPH_RMatrix4x4* matrix, const JPH_AABox* box, JPH_Color color)

! JPH_CAPI void JPH_DebugRenderer_DrawMarker(JPH_DebugRenderer* renderer, const JPH_RVec3* position, JPH_Color color, float size)

! JPH_CAPI void JPH_DebugRenderer_DrawArrow(JPH_DebugRenderer* renderer, const JPH_RVec3* from, const JPH_RVec3* to, JPH_Color color, float size)

! JPH_CAPI void JPH_DebugRenderer_DrawCoordinateSystem(JPH_DebugRenderer* renderer, const JPH_RMatrix4x4* matrix, float size)

! JPH_CAPI void JPH_DebugRenderer_DrawPlane(JPH_DebugRenderer* renderer, const JPH_RVec3* point, const JPH_Vec3* normal, JPH_Color color, float size)

! JPH_CAPI void JPH_DebugRenderer_DrawWireTriangle(JPH_DebugRenderer* renderer, const JPH_RVec3* v1, const JPH_RVec3* v2, const JPH_RVec3* v3, JPH_Color color)

! JPH_CAPI void JPH_DebugRenderer_DrawWireSphere(JPH_DebugRenderer* renderer, const JPH_RVec3* center, float radius, JPH_Color color, int level)

! JPH_CAPI void JPH_DebugRenderer_DrawWireUnitSphere(JPH_DebugRenderer* renderer, const JPH_RMatrix4x4* matrix, JPH_Color color, int level)


  end interface


end module jolt_bindings
