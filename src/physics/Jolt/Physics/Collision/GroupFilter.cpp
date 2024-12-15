// Jolt Physics Library (https://github.com/jrouwe/JoltPhysics)
// SPDX-FileCopyrightText: 2021 Jorrit Rouwe
// SPDX-License-Identifier: MIT

#include "../../Jolt.h"

#include "../Collision/GroupFilter.h"
#include "../../Core/StreamUtils.h"

JPH_NAMESPACE_BEGIN

JPH_IMPLEMENT_SERIALIZABLE_ABSTRACT_BASE(GroupFilter)
{
	JPH_ADD_BASE_CLASS(GroupFilter, SerializableObject)
}

void GroupFilter::SaveBinaryState(StreamOut &inStream) const
{
	inStream.Write(GetRTTI()->GetHash());
}

void GroupFilter::RestoreBinaryState(StreamIn &inStream)
{
	// RTTI hash is read in sRestoreFromBinaryState
}

GroupFilter::GroupFilterResult GroupFilter::sRestoreFromBinaryState(StreamIn &inStream)
{
	return StreamUtils::RestoreObject<GroupFilter>(inStream, &GroupFilter::RestoreBinaryState);
}

JPH_NAMESPACE_END
