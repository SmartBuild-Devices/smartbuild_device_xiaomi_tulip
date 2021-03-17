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

# Include SmartBuild properties for current release.
include $(LOCAL_DIR)/smartbuild/$(SMARTBUILD_RELEASE)/smartbuild.mk

ifndef SMARTBUILD_LUNCH_OPT
    SMARTBUILD_LUNCH_OPT := $(SMARTBUILD_RELEASE)
endif

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/$(SMARTBUILD_LUNCH_OPT)_tulip.mk

COMMON_LUNCH_CHOICES := \
    $(SMARTBUILD_LUNCH_OPT)_tulip-user \
    $(SMARTBUILD_LUNCH_OPT)_tulip-userdebug \
    $(SMARTBUILD_LUNCH_OPT)_tulip-eng
