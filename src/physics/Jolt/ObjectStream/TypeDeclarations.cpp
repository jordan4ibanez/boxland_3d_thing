// Jolt Physics Library (https://github.com/jrouwe/JoltPhysics)
// SPDX-FileCopyrightText: 2021 Jorrit Rouwe
// SPDX-License-Identifier: MIT

#include "../Jolt.h"

#include "../ObjectStream/TypeDeclarations.h"

JPH_NAMESPACE_BEGIN

JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(uint8) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(uint16) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(int) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(uint32) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(uint64) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(float) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(double) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(bool) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(String) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(Float3) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(Double3) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(Vec3) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(DVec3) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(Vec4) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(Quat) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(Mat44) {}
JPH_IMPLEMENT_RTTI_OUTSIDE_CLASS(DMat44) {}

JPH_IMPLEMENT_SERIALIZABLE_OUTSIDE_CLASS(Color){
		JPH_ADD_ATTRIBUTE(Color, r)
				JPH_ADD_ATTRIBUTE(Color, g)
						JPH_ADD_ATTRIBUTE(Color, b)
								JPH_ADD_ATTRIBUTE(Color, a)}

JPH_IMPLEMENT_SERIALIZABLE_OUTSIDE_CLASS(AABox){
		JPH_ADD_ATTRIBUTE(AABox, mMin)
				JPH_ADD_ATTRIBUTE(AABox, mMax)}

JPH_IMPLEMENT_SERIALIZABLE_OUTSIDE_CLASS(Triangle){
		JPH_ADD_ATTRIBUTE(Triangle, mV)
				JPH_ADD_ATTRIBUTE(Triangle, mMaterialIndex)
						JPH_ADD_ATTRIBUTE(Triangle, mUserData)}

JPH_IMPLEMENT_SERIALIZABLE_OUTSIDE_CLASS(IndexedTriangle){
		JPH_ADD_ATTRIBUTE(IndexedTriangle, mIdx)
				JPH_ADD_ATTRIBUTE(IndexedTriangle, mMaterialIndex)
						JPH_ADD_ATTRIBUTE(IndexedTriangle, mUserData)}

JPH_IMPLEMENT_SERIALIZABLE_OUTSIDE_CLASS(Plane){
		JPH_ADD_ATTRIBUTE(Plane, mNormalAndConstant)}

JPH_NAMESPACE_END
