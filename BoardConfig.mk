# Copyright (C) 2007 The Android Open Source Project
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

# inherit from the proprietary version

LOCAL_PATH := device/samsung/i927

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include


# CPU
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := tegra2
# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true
# DO NOT change the following line to vfpv3 as it is not really supported on our device!
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true
ARCH_ARM_HAVE_NEON := false

#TARGET_HAVE_TEGRA_ERRATA_657451 := true
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := ap20
TARGET_BOARD_PLATFORM_GPU := tegra
TARGET_BOOTLOADER_BOARD_NAME := n1
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128

#######
# Kernel options. If you want to build a TWRP kernel disable
# the "Normal" part and enable the "TWRP" part.
# Do not forget to disable TARGET_PREBUILT_RECOVERY_KERNEL, too

BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := mem=511M@0M secmem=1M@511M mem=512M@512M vmalloc=256M fota_boot=false tegra_fbmem=800K@0x18012000 video=tegrafb console=ttyUSB0,115200 console=ram usbcore.old_scheme_first=1 lp0_vec=8192@0x1819E000 emmc_checksum_done=true emmc_checksum_pass=true tegraboot=sdmmc gpt androidboot.selinux=permissive

KERNEL_TOOLCHAIN_PREFIX:= ../../arm-eabi-4.7/bin/arm-eabi-

KERNEL_MODULES_DIR := /system/lib/modules
TARGET_KERNEL_SOURCE := kernel/samsung/i927

#Normal kernel:
#TARGET_KERNEL_CONFIG := cyanogenmod_i927_defconfig
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/recovery/kernel

# TWRP kernel:
#TARGET_KERNEL_CONFIG := twrp_i927_defconfig

#
######

BOARD_HAL_STATIC_LIBRARIES := libhealthd.n1

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5136896 # 5242880 bytes exactly
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 4096

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Required to build a recovery image of 5MB max
ifeq ($(TARGET_NO_RECOVERY),false)
    TARGET_KERNEL_CONFIG := twrp_i927_defconfig
    #TARGET_KERNEL_CONFIG := $(LOCAL_PATH)/recovery/kernel-config
    BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/recovery/bootimg.mk
    TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/recovery/kernel
endif


# RIL
# 3G
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6260
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"

# Audio
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := false

# Camera
BOARD_USES_PROPRIETARY_LIBCAMERA := true
BOARD_SECOND_CAMERA_DEVICE := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DDICS_CAMERA_BLOB -DHAVE_ISO -DDISABLE_HW_ID_MATCH_CHECK
BOARD_CAMERA_HAVE_ISO := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
SKIP_SET_METADATA := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_USES_HWCOMPOSER := true
#BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_EGL_NEEDS_FNW := true
MAX_EGL_CACHE_KEY_SIZE := 4096
MAX_EGL_CACHE_SIZE := 2146304
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# HWComposer
BOARD_USES_HWCOMPOSER := true
SENSORS_NEED_SETRATE_ON_ENABLE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/vnd_n1.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Wifi-related defines
WPA_BUILD_SUPPLICANT        	:= true
WPA_SUPPLICANT_VERSION      	:= VER_0_8_X
BOARD_WLAN_DEVICE           	:= bcmdhd
BOARD_WLAN_DEVICE_REV 		:= bcm4330_b1
BOARD_WPA_SUPPLICANT_DRIVER     := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER            := NL80211
BOARD_HOSTAPD_PRIVATE_LIB       := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH     	:= "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM 	:= "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     	:= "/system/etc/wifi/bcm4330_sta.bin"
WIFI_DRIVER_FW_PATH_AP      	:= "/system/etc/wifi/bcm4330_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     	:= "/system/etc/wifi/bcm4330_p2p.bin"
WIFI_DRIVER_MODULE_NAME     	:= "dhd"
WIFI_DRIVER_MODULE_ARG      	:= "firmware_path=/system/etc/wifi/bcm4330_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG       := "firmware_path=/system/etc/wifi/bcm4330_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                       := 802_11_ABG
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_HAVE_SAMSUNG_WIFI         := true

# Assert
TARGET_OTA_ASSERT_DEVICE := i927,SGH-I927,SGH-I927R,SGHI927,SGHI927R,n1

# Vold
BOARD_VOLD_MAX_PARTITIONS := 12
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/fsl-tegra-udc/gadget/lun%d/file"

BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2

# EMMC brickbug is removed in the kernel, but be better safe than sorry.
BOARD_SUPPRESS_EMMC_WIPE := true

# Recovery
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/init.recovery.n1.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../$(LOCAL_PATH)/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../$(LOCAL_PATH)/recovery/graphics.c
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/fstab.n1
#TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/twrp.fstab

BOARD_UMS_LUNFILE := "/sys/devices/platform/fsl-tegra-udc/gadget/lun%d/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_SELECT_BUTTON := true

#######################################################################
# TWRP
#
DEVICE_RESOLUTION := 480x800
TARGET_USERIMAGES_USE_F2FS := false
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_SCREEN_BLANK := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/pwm-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true

# Support for (device/file) de-/encryption in TWRP (ICS only - not JB or higher)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_SAMSUNG := true
TW_CRYPTO_KEY_LOC := "/efs/metadata"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/sdhci-tegra.3/by-num/p6"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_FS_OPTIONS := "journal_async_commit,noauto_da_alloc,errors=panic"
TW_CRYPTO_FS_FLAGS := "0x00000406"

# decrypting internal storage /sdcard
TW_CRYPTO_SD_REAL_BLKDEV := "/dev/block/mmcblk0p4"
TW_CRYPTO_SD_FS_TYPE := "vfat"

###
#defaults to external storage instead of internal on dual storage devices
TW_DEFAULT_EXTERNAL_STORAGE := true
###

TW_HAVE_SELINUX := true
TW_DISABLE_TTF := true
HAVE_SELINUX := true
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw
#
# END
#######################################################################

# SElinux
ifeq ($(HAVE_SELINUX),true)
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/selinux

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te \
    init.te \
    rild.te \
    system.te \
    device.te \
    domain.te \
    zygote.te \
    app.te \
    surfaceflinger.te \
    sensors_config.te \
    compatibility.te

endif
MINI_GAPPS := true
-include vendor/google/tiny_gapps_nonneon_tonyp.mk
-include vendor/samsung/i927/BoardConfigVendor.mk
