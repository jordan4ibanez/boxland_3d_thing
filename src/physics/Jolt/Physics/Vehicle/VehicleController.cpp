// Jolt Physics Library (https://github.com/jrouwe/JoltPhysics)
// SPDX-FileCopyrightText: 2021 Jorrit Rouwe
// SPDX-License-Identifier: MIT

#include "../../Jolt.h"

#include "../Vehicle/VehicleController.h"
#include "../../ObjectStream/TypeDeclarations.h"

JPH_NAMESPACE_BEGIN

JPH_IMPLEMENT_SERIALIZABLE_ABSTRACT(VehicleControllerSettings){
		JPH_ADD_BASE_CLASS(VehicleControllerSettings, SerializableObject)}

JPH_NAMESPACE_END
