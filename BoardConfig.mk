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
-include vendor/samsung/glide/BoardConfigVendor.mk

# ace - adjusting settings based on this thread from xda, for the GalaxyR which is *almost* identical to the Glide.
# ref: http://forum.xda-developers.com/showthread.php?t=1630849
# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
# DO NOT change the following line to vfpv3 as it is not really supported on our device!
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
# ace - DO NOT uncomment or use, this breaks build.
# TARGET_HAVE_TEGRA_ERRATA_657451 := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOARD_PLATFORM_GPU := tegra
TARGET_BOOTLOADER_BOARD_NAME := n1
TARGET_USERIMAGES_USE_EXT4 := true
# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

TARGET_TEGRA_VERSION := ap20

BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
# ace - stock kernels don't have a cmdline set, but litekernel does.
BOARD_KERNEL_CMDLINE := mem=511M@0M secmem=1M@511M mem=512M@512M vmalloc=256M fota_boot=false lpm_boot=0 tegra_fbmem=800K@0x18012000 video=tegrafb console=ram usbcore.old_scheme_first=1 lp0_vec=8192@0x1819E000 emmc_checksum_done=true emmc_checksum_pass=true tegraboot=sdmmc gpt

# ace - eventually convert this over
# kernel modules location
KERNEL_MODULES_DIR := /lib/modules

# required to remove kernel modules, recovery size is limited to 5MB
BOARD_RECOVERY_RAMDISK_EXTRA_SCRIPT := device/samsung/glide/releasetools/recovery_ramdisk.sh

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 8388608 # 0x00800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880 # 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600 # 0x25800000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648 # 0x80000000
BOARD_FLASH_BLOCK_SIZE := 2048

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM			:= true

# ace - test LiteKernel 4.0 prebuilt
# TARGET_KERNEL_CONFIG := tegra_bose_defconfig
# TARGET_KERNEL_SOURCE := kernel/samsung/glide
# ace - need to change the output from system/lib/modules to root/lib/modules
# KERNEL_MODULES_OUT := $(TARGET_OUT)/lib/modules
TARGET_PREBUILT_KERNEL := device/samsung/glide/prebuilt/kernel

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Headers
TARGET_SPECIFIC_HEADER_PATH := device/samsung/glide/include

# RIL
BOARD_USES_LIBSECRIL_STUB := true

# 3G
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
#BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0,rmnet1,rmnet2"

# Audio
# ace - check into this, from the Samsung ics update1. Also enables BOARD_USES_GENERIC_AUDIO := true
# BOARD_USES_AUDIO_LEGACY := true # p999 also uses this, similar hardware
BOARD_USES_GENERIC_AUDIO := false # testing Samsung's ICS values (default false)
# TARGET_PROVIDES_LIBAUDIO := false # We must re-build it.

# Camera
# USE_CAMERA_STUB := true
# ace - try CAF_LibCamera, GB was true but not in ICS.  Camera works without, but TEST as intended.
BOARD_USE_CAF_LIBCAMERA := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
# ace - as per kibuuka, not present in CM9/ICS
# BOARD_USE_CAF_LIBCAMERA_GB_REL := true
# ace - BOARD_CAMERA_DEVICE and BOARD_SECOND_CAMERA_DEVICE should point to the /dev/name and not boolean?
BOARD_SECOND_CAMERA_DEVICE := true

ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif

# Graphics
BOARD_EGL_CFG := device/samsung/glide/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_OVERLAY_ALWAYS_DETERMINES_FORMAT := true
TARGET_USES_GL_VENDOR_EXTENSIONS := true
BOARD_USES_HW_MEDIARECORDER := true
BOARD_USES_HW_MEDIASCANNER := true
BOARD_USES_HW_MEDIAPLUGINS := true
BOARD_USE_SKIA_LCDTEXT := true # ace - sharper fonts IIRC
BOARD_USE_SCREENCAP := true
TARGET_ELECTRONBEAM_FRAMES := 15
# ace - test - some of these are jb+
# HWComposer
BOARD_USES_HWCOMPOSER := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# OMX
BOARD_USES_PROPRIETARY_OMX		:= samsung
# ace - TEST - old sgs2-common OMX config (also a list of what can be removed just incase)
BOARD_USE_SAMSUNG_COLORFORMAT	:= true
BOARD_NONBLOCK_MODE_PROCESS		:= true
BOARD_USE_STOREMETADATA			:= false
BOARD_USE_METADATABUFFERTYPE	:= true
BOARD_USES_MFC_FPS				:= true

# Bluetooth
#BOARD_CUSTOM_BLUEDROID := ../../../device/samsung/glide/bluedroid/bluetooth.c
#BOARD_HAVE_BLUETOOTH_CSR := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_FORCE_STATIC_A2DP := true
BOARD_HAVE_BLUETOOTH_BCM_BTLA := true
BOARD_HAVE_BLUETOOTH_BCM_SEMC := true
BT_ALT_STACK := true
BRCM_BT_USE_BTL_IF := true
BRCM_BTL_INCLUDE_A2DP := true
BOARD_HAS_EXTRA_SYS_PROPS := true

# No NFC
BOARD_HAVE_NFC := false

# FM Radio
BOARD_HAVE_FM_RADIO := false

# ace - building liblights from source
# Lights
TARGET_PROVIDES_LIBLIGHTS := true # false

# Akmd
BOARD_VENDOR_USE_AKMD := akm8975
BUILD_AKMD := true

# GPS
# BOARD_USES_GPSWRAPPER := true

# Wifi related defines
WPA_BUILD_SUPPLICANT        		:= true
WPA_SUPPLICANT_VERSION      		:= VER_0_8_X
BOARD_WLAN_DEVICE           		:= bcmdhd
# ace - TEST - The-Covenant device tree, see if present in CM9 and if it breaks anything
BOARD_WLAN_DEVICE_REV				:= bcm4330_b1
BOARD_WPA_SUPPLICANT_DRIVER     	:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 	:= lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER            	:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB       	:= lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH     		:= "/lib/modules/dhd.ko"
# ace - TEST - The-Covenant device tree, verified in CM9.
WIFI_DRIVER_FW_PATH_PARAM			:= "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     		:= "/system/etc/wifi/bcm4330_sta.bin"
WIFI_DRIVER_FW_PATH_AP      		:= "/system/etc/wifi/bcm4330_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     		:= "/system/etc/wifi/bcm4330_p2p.bin"
# ace - i9103, exists here
WIFI_DRIVER_FW_PATH_MFG 	    	:= "/system/etc/wifi/bcm4330_mfg.bin"
# ace - i9103, not used for now
#WIFI_FIRMWARE_LOADER       		:= "wlandutservice"
WIFI_DRIVER_MODULE_NAME     		:= "dhd"
WIFI_DRIVER_MODULE_ARG      		:= "firmware_path=/system/etc/wifi/bcm4330_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
# ace - SGH-i927 Glide specs say B/G/N
WIFI_BAND                       	:= 802_11_BGN # ABG
# ace - noted in The-Covenant device tree, no ill effect so far
BOARD_LEGACY_NL80211_STA_EVENTS		:= True

# Releasetools
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/glide/releasetools/glide_ota_from_target_files
#TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/glide/releasetools/glide_img_from_target_files

# Custom squisher, final step script
TARGET_CUSTOM_RELEASETOOL	:= ./device/samsung/glide/releasetools/squisher

# ace - this was being ignored, so hard-wired this into glide.mk
# TARGET_PROVIDES_INIT_RC	:= true

# Assert
TARGET_OTA_ASSERT_DEVICE	:= i927,SGHI927,SGH-I927,n1

# Vold / MTP / UMS
BOARD_VOLD_MAX_PARTITIONS			:= 12
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR	:= true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS	:= true
BOARD_USE_USB_MASS_STORAGE_SWITCH	:= true
TARGET_USE_CUSTOM_LUN_FILE_PATH		:= "/sys/devices/platform/usb_mass_storage/lun%d/file"
# BOARD_UMS_LUNFILE					:= "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_UMS_LUNFILE					:= "/sys/devices/platform/fsl-tegra-udc/gadget/lun%d/file"
SAMSUNG_USB_MTP_DEVICE := true

BOARD_HAS_SDCARD_INTERNAL			:= true
# ace - The-Covenant has sdext @ second partition
# BOARD_SDEXT_DEVICE				:= /dev/block/mmcblk1p1
BOARD_SDEXT_DEVICE					:= /dev/block/mmcblk1p2

# ace - should have primary and secondary defined also, and if so how?
# BOARD_SDCARD_DEVICE_PRIMARY 		:=
# BOARD_SDCARD_DEVICE_SECONDARY 	:=

# ace - test - see if this adds battery monitoring
# LPM
BOARD_CHARGING_MODE_BOOTING_LPM := "/sys/class/power_supply/battery/batt_lp_charging"
BOARD_BATTERY_DEVICE_NAME := "battery"

# Recovery
TARGET_RECOVERY_INITRC := ./device/samsung/glide/recovery/recovery.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/glide/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/glide/recovery/graphics.c

BOARD_USES_MMCUTILS					:= true
BOARD_HAS_NO_SELECT_BUTTON			:= true

# ace - (hroark13) should allow the build to work with current and "legacy" recoveries (CWM/TWRP)
SKIP_SET_METADATA := true

# TWRP
# DEVICE_RESOLUTION := 480x800
# TW_INTERNAL_STORAGE_PATH := "/emmc"
# TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
# TW_EXTERNAL_STORAGE_PATH := "/sdcard"
# TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
# TW_DEFAULT_EXTERNAL_STORAGE := true
# ace - extra TWRP flags
# RECOVERY_SDCARD_ON_DATA := false
# BOARD_HAS_NO_REAL_SDCARD := false
# TW_INCLUDE_DUMLOCK := false
# ace - if any graphic errors, uncomment
# RECOVERY_GRAPHICS_USE_LINELENGTH := true 
#TW_NO_BATT_PERCENT := true
#TW_CUSTOM_POWER_BUTTON := 107
#TW_NO_REBOOT_BOOTLOADER := true
#TW_NO_REBOOT_RECOVERY := true
#TW_NO_USB_STORAGE := true
#RECOVERY_TOUCHSCREEN_SWAP_XY := true
#RECOVERY_TOUCHSCREEN_FLIP_Y := true
#RECOVERY_TOUCHSCREEN_FLIP_X := true
#TW_ALWAYS_RMRF := true
#TW_NEVER_UNMOUNT_SYSTEM := true
#TW_INCLUDE_INJECTTWRP := true
#TWRP_EVENT_LOGGING := true
