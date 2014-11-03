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

# Define CM_BUILDTYPE, valid ones seem to be CM_NIGHTLY, CM_EXPERIMENTAL, CM_RELEASE
# also, CM_EXTRAVERSION
CM_BUILDTYPE := EXPERIMENTAL

## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := glide

# Inherit device configuration
$(call inherit-product, device/samsung/glide/full_glide.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Device Locales (default language first, screen resolutions last)
PRODUCT_LOCALES := en_US en_GB de_DE es_ES fr_FR it_IT hdpi xhdpi mdpi nodpi

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := glide
PRODUCT_NAME := cm_glide
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-I927
PRODUCT_MANUFACTURER := Samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I927 TARGET_DEVICE=SGH-I927 BUILD_FINGERPRINT=samsung/SGH-I927/SGH-I927:4.0.4/IMM76D/UCLJ3:user/release-keys PRIVATE_BUILD_DESC="SGH-I927-user 4.0.4 IMM76D UCLJ3 release-keys"
