#
# Copyright (C) 2018-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),tulip)
  # Include all makefiles NOT in smartbuild/
  temp_find_leaves_excludes=$(FIND_LEAVES_EXCLUDES)
  FIND_LEAVES_EXCLUDES := $(addprefix --prune=, smartbuild)

  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

  FIND_LEAVES_EXCLUDES := $(temp_find_leaves_excludes)

  # Traverse SmartBuild inheritance tree to inherit the "active" makefiles
  $(foreach layer,$(SMARTBUILD_INHERIT_STACK), \
    $(if $(wildcard $(LOCAL_PATH)/smartbuild/$(layer)/Android.mk), \
      $(info including $(LOCAL_PATH)/smartbuild/$(layer)/Android.mk ...) \
      $(eval include $(LOCAL_PATH)/smartbuild/$(layer)/Android.mk) \
    ,) \
  )

  # Add the ROM specific Android.mk to the roster
  $(if $(wildcard $(LOCAL_PATH)/smartbuild/$(SMARTBUILD_RELEASE)/Android.mk), \
    $(info including $(LOCAL_PATH)/smartbuild/$(SMARTBUILD_RELEASE)/Android.mk ...) \
    $(eval include $(LOCAL_PATH)/smartbuild/$(SMARTBUILD_RELEASE)/Android.mk) \
  ,)
endif
