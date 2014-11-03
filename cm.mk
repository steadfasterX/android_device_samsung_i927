#
# Copyright (C) 2012 The CyanogenMod Project
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

# ace - added this here, probably redundant.
LOCAL_PATH := $(call my-dir)

# ace - define CM_BUILDTYPE, valid ones seem to be CM_NIGHTLY, CM_EXPERIMENTAL, CM_RELEASE
# also, CM_EXTRAVERSION
CM_BUILDTYPE := EXPERIMENTAL
#CM_EXTRAVERSION := ACEMOD
#CM_BUILDTYPE := NIGHTLY
PRODUCT_VERSION_MAINTENANCE = 1 
# ace - unique identifier :P disable if build is still screwed lol

# ace - this sets basic gsm apns/etc.. xml file
## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := glide

# ace - this should "init" everything "correctly", "hopefully"
# Inherit device configuration
$(call inherit-product, device/samsung/glide/full_glide.mk)

# ace - test "light-weight" custom setup (no extra media)
# $(call inherit-product, device/samsung/glide/common_light_phone.mk)
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# ace - TEST - limit translations WITH := also, set language first then density
# others to note: xhdpi (320dpi) mdpi (160dpi) ldpi (120dpi)
# PRODUCT_LOCALES := en_US hdpi xhdpi mdpi nodpi
# ace - added locales from UCLJ3
PRODUCT_LOCALES := en_US en_GB de_DE es_ES fr_FR it_IT hdpi xhdpi mdpi nodpi

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := glide
PRODUCT_NAME := cm_glide
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-I927
PRODUCT_MANUFACTURER := Samsung

# ace - set UCLJ3 config here
#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I927 TARGET_DEVICE=SGH-I927 BUILD_FINGERPRINT=samsung/SGH-I927/SGH-I927:4.0.4/IMM76D/UCLJ3:user/release-keys PRIVATE_BUILD_DESC="SGH-I927-user 4.0.4 IMM76D UCLJ3 release-keys"
