// Jolt Physics Library (https://github.com/jrouwe/JoltPhysics)
// SPDX-FileCopyrightText: 2023 Jorrit Rouwe
// SPDX-License-Identifier: MIT

#include "../../Jolt.h"

#include "../Constraints/SpringSettings.h"
#include "../../ObjectStream/TypeDeclarations.h"
#include "../../Core/StreamIn.h"
#include "../../Core/StreamOut.h"

JPH_NAMESPACE_BEGIN

JPH_IMPLEMENT_SERIALIZABLE_NON_VIRTUAL(SpringSettings)
{
	JPH_ADD_ENUM_ATTRIBUTE(SpringSettings, mMode)
	JPH_ADD_ATTRIBUTE(SpringSettings, mFrequency)
	JPH_ADD_ATTRIBUTE(SpringSettings, mDamping)
}

void SpringSettings::SaveBinaryState(StreamOut &inStream) const
{
	inStream.Write(mMode);
	inStream.Write(mFrequency);
	inStream.Write(mDamping);
}

void SpringSettings::RestoreBinaryState(StreamIn &inStream)
{
	inStream.Read(mMode);
	inStream.Read(mFrequency);
	inStream.Read(mDamping);
}

JPH_NAMESPACE_END
