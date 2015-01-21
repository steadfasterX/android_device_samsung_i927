#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/i927/i927-vendor.mk)

## Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Set true if you want .odex files
DISABLE_DEXPREOPT := false

# Overlay to set device specific parameters
DEVICE_PACKAGE_OVERLAYS := device/samsung/i927/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := i927
PRODUCT_DEVICE := i927
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-I927

# ace - using LiteKernel ICS (if available)
ifeq ($(TARGET_KERNEL_SOURCE),)
	LOCAL_KERNEL := kernel/samsung/i927
else
	LOCAL_KERNEL := $(TARGET_KERNEL_SOURCE)
endif

# Packages
PRODUCT_PACKAGES += \
    Camera \
    Torch \
    Gallery3d \
    Term \
	libtinyalsa \
    librs_jni \
    libv8 \
    dexpreopt \
    avinfo \
    hciattach \
    hciconfig \
    hcitool \
    sdptool \
    static_busybox \
    busybox \
    make_ext4fs \
    setup_fs \
    com.android.future.usb.accessory

# see what is alreaedy included in sources, these are present in OEM UCLJ3
# lib/libnvomx.so
# lib/libnvomxadaptor.so
# lib/libnvomxilclient.so
# lib/libsomxaacd.so
# lib/libsomxaace.so
# lib/libsomxac3d.so
# lib/libsomxamrd.so
# lib/libsomxcmn.so
# lib/libsomxcore.so
# lib/libsomxflacd.so
# lib/libsomxmp3d.so
# lib/libsomxmp43d.so
# lib/libsomxsr263d.so
# lib/libsomxwmad.so
# lib/libsomxwmv7d.so
# lib/libsomxwmv8d.so
# lib/omxplayer.so
# OMX Stuff
PRODUCT_PACKAGES += \
    SamsungServiceMode \

# Extra Packages
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    CMFileManager \
    libsecril-client-sap \
	DeviceSettings

# ace - try using opensource where available
#	sensors.n1 \
# HAL
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.n1 \
	audio_policy.n1 \
	lights.n1

# INIT-scripts
PRODUCT_COPY_FILES += \
    device/samsung/i927/scripts/lpm.rc:root/lpm.rc \
    device/samsung/i927/scripts/fota.rc:root/fota.rc \
    device/samsung/i927/scripts/init.rc:root/init.rc \
    device/samsung/i927/scripts/init.n1.rc:root/init.n1.rc \
    device/samsung/i927/scripts/init.n1.usb.rc:root/init.n1.usb.rc \
    device/samsung/i927/scripts/ueventd.n1.rc:root/ueventd.n1.rc \
    device/samsung/i927/scripts/lpm_boot_check.sh:system/bin/lpm_boot_check.sh

# debug purpose...
#ifeq ($(TARGET_PROVIDES_INIT_RC),true)
	#PRODUCT_COPY_FILES += device/samsung/i927/scripts/init.rc:root/init.rc
#endif

# Prebuilt modules
PRODUCT_COPY_FILES += \
    device/samsung/i927/prebuilt/cbd:root/sbin/cbd \
    device/samsung/i927/prebuilt/ua_loader:root/sbin/ua_loader \
    device/samsung/i927/prebuilt/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/i927/prebuilt/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/i927/prebuilt/modules.dep:root/lib/modules/modules.dep

# T9DB
PRODUCT_COPY_FILES += \
	device/samsung/i927/keypad/T9DB/phonepad_cs.kdb:system/T9DB/phonepad_cs.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_de.kdb:system/T9DB/phonepad_de.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_el.kdb:system/T9DB/phonepad_el.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_en.kdb:system/T9DB/phonepad_en.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_es.kdb:system/T9DB/phonepad_es.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_et.kdb:system/T9DB/phonepad_et.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_fr.kdb:system/T9DB/phonepad_fr.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_hu.kdb:system/T9DB/phonepad_hu.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_it.kdb:system/T9DB/phonepad_it.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_ko.kdb:system/T9DB/phonepad_ko.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_lt.kdb:system/T9DB/phonepad_lt.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_lv.kdb:system/T9DB/phonepad_lv.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_nl.kdb:system/T9DB/phonepad_nl.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_pl.kdb:system/T9DB/phonepad_pl.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_pt.kdb:system/T9DB/phonepad_pt.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_ru.kdb:system/T9DB/phonepad_ru.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_sk.kdb:system/T9DB/phonepad_sk.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_tr.kdb:system/T9DB/phonepad_tr.kdb \
	device/samsung/i927/keypad/T9DB/phonepad_uk.kdb:system/T9DB/phonepad_uk.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_cs.kdb:system/T9DB/qwerty_cs.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_de.kdb:system/T9DB/qwerty_de.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_el.kdb:system/T9DB/qwerty_el.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_en.kdb:system/T9DB/qwerty_en.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_es.kdb:system/T9DB/qwerty_es.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_et.kdb:system/T9DB/qwerty_et.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_fr.kdb:system/T9DB/qwerty_fr.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_hu.kdb:system/T9DB/qwerty_hu.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_it.kdb:system/T9DB/qwerty_it.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_ko.kdb:system/T9DB/qwerty_ko.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_lt.kdb:system/T9DB/qwerty_lt.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_lv.kdb:system/T9DB/qwerty_lv.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_nl.kdb:system/T9DB/qwerty_nl.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_pl.kdb:system/T9DB/qwerty_pl.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_pt.kdb:system/T9DB/qwerty_pt.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_ru.kdb:system/T9DB/qwerty_ru.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_sk.kdb:system/T9DB/qwerty_sk.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_tr.kdb:system/T9DB/qwerty_tr.kdb \
	device/samsung/i927/keypad/T9DB/qwerty_uk.kdb:system/T9DB/qwerty_uk.kdb \
	device/samsung/i927/keypad/T9DB/Samsung_400_CSlsUN_xt9.ldb:system/T9DB/Samsung_400_CSlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_DEusUN_xt9.ldb:system/T9DB/Samsung_400_DEusUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_ELlsUN_xt9.ldb:system/T9DB/Samsung_400_ELlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_ENubUN_xt9.ldb:system/T9DB/Samsung_400_ENubUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_ESlsUN_xt9.ldb:system/T9DB/Samsung_400_ESlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_ETlsUN_xt9.ldb:system/T9DB/Samsung_400_ETlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_FRlsUN_xt9s.ldb:system/T9DB/Samsung_400_FRlsUN_xt9s.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_HUlsUN_xt9.ldb:system/T9DB/Samsung_400_HUlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_ITlsUN_xt9.ldb:system/T9DB/Samsung_400_ITlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_LTlsUN_xt9.ldb:system/T9DB/Samsung_400_LTlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_LVlsUN_xt9.ldb:system/T9DB/Samsung_400_LVlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_NLlsUN_xt9.ldb:system/T9DB/Samsung_400_NLlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_PLlsUN_xt9.ldb:system/T9DB/Samsung_400_PLlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_PTlsUN_xt9.ldb:system/T9DB/Samsung_400_PTlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_RUlsUN_xt9.ldb:system/T9DB/Samsung_400_RUlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_SKlsUN_xt9.ldb:system/T9DB/Samsung_400_SKlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_TRlsUN_xt9.ldb:system/T9DB/Samsung_400_TRlsUN_xt9.ldb \
	device/samsung/i927/keypad/T9DB/Samsung_400_UKlsUN_xt9.ldb:system/T9DB/Samsung_400_UKlsUN_xt9.ldb

# Vold and Storage
PRODUCT_COPY_FILES += \
    device/samsung/i927/configs/vold.fstab:system/etc/vold.fstab

# Wifi, BT, DHCPCD
PRODUCT_COPY_FILES += \
    device/samsung/i927/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/i927/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# GPS
PRODUCT_COPY_FILES += \
    device/samsung/i927/configs/gps.conf:system/etc/gps.conf \
    device/samsung/i927/configs/sirfgps.conf:system/etc/sirfgps.conf

# ace - testing extra/updated APNs
# APNs
PRODUCT_COPY_FILES += \
    device/samsung/i927/extras/apns-conf.xml:system/etc/apns-conf.xml

# ace - The-Covenant's libaudio - "backported" to ICS
# AUDIO 
PRODUCT_COPY_FILES += \
    device/samsung/i927/libaudio/audio_policy.conf:system/etc/audio_policy.conf

# Media
PRODUCT_COPY_FILES += \
    device/samsung/i927/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/i927/configs/nvcamera.conf:system/etc/nvcamera.conf \
    device/samsung/i927/configs/asound.conf:system/etc/asound.conf \
    device/samsung/i927/configs/enctune.conf:system/etc/enctune.conf \
    device/samsung/i927/configs/model_frontal.xml:system/etc/model_frontal.xml \
    device/samsung/i927/configs/somxreg.conf:system/etc/somxreg.conf \
    device/samsung/i927/extras/PowerOn.ogg:system/etc/PowerOn.ogg

# Shell and busybox
PRODUCT_COPY_FILES += \
    device/samsung/i927/configs/profile:system/etc/profile \
    device/samsung/i927/configs/busybox.fstab:system/etc/fstab

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/i927/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/i927/usr/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/samsung/i927/usr/keylayout/STMPE_keypad.kl:system/usr/keylayout/STMPE_keypad.kl \
    device/samsung/i927/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/i927/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/i927/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/i927/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/i927/usr/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    device/samsung/i927/usr/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    device/samsung/i927/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/samsung/i927/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/samsung/i927/usr/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/samsung/i927/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/samsung/i927/usr/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    device/samsung/i927/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    device/samsung/i927/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    device/samsung/i927/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/samsung/i927/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/samsung/i927/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/samsung/i927/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/samsung/i927/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/samsung/i927/usr/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/samsung/i927/usr/keylayout/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/i927/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/i927/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/i927/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/i927/usr/keychars/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
    device/samsung/i927/usr/keychars/sec_key.kcm:system/usr/keychars/sec_key.kcm \
    device/samsung/i927/usr/keychars/STMPE_keypad.kcm:system/usr/keychars/STMPE_keypad.kcm \
    device/samsung/i927/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/samsung/i927/usr/keychars/sec_touchkey.kcm:system/usr/keychars/sec_touchkey.kcm

# IDC files
PRODUCT_COPY_FILES += \
    device/samsung/i927/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
    device/samsung/i927/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/samsung/i927/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# ace - Install "additional" features
PRODUCT_COPY_FILES += \
    device/samsung/i927/configs/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    device/samsung/i927/configs/permissions/sec_mdm.xml:system/etc/permissions/sec_mdm.xml

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# ace - moved the build.prop overrides to system.prop and eliminated any duplicates

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available

$(call inherit-product-if-exists, vendor/samsung/i927/i927-vendor-blobs.mk)
