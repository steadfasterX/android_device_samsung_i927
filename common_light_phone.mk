# Inherit common CM stuff
$(call inherit-product, vendor/cm/config/common.mk)

# ace - exclude these for now, you can use common_full_phone.mk as it adds those.
# Bring in all audio files
# include frameworks/base/data/sounds/NewAudio.mk

# Extra Ringtones
# include frameworks/base/data/sounds/AudioPackageNewWave.mk

# Bring in all video files
# $(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# Include CM audio files
include vendor/cm/config/cm_audio.mk

# ace - add missing audio
$(call inherit-product, frameworks/base/data/sounds/AudioPackageStars.mk)
# ace - bare minimum audio
# Effects
# PRODUCT_COPY_FILES += \
#	frameworks/base/data/sounds/effects/ogg/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
#	frameworks/base/data/sounds/effects/ogg/camera_focus.ogg:system/media/audio/ui/camera_focus.ogg \
#	frameworks/base/data/sounds/effects/ogg/Dock.ogg:system/media/audio/ui/Dock.ogg \
#	frameworks/base/data/sounds/effects/ogg/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
#	frameworks/base/data/sounds/effects/ogg/KeypressDelete.ogg:system/media/audio/ui/KeypressDelete.ogg \
#	frameworks/base/data/sounds/effects/ogg/KeypressReturn.ogg:system/media/audio/ui/KeypressReturn.ogg \
#	frameworks/base/data/sounds/effects/ogg/KeypressSpacebar.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
#	frameworks/base/data/sounds/effects/ogg/KeypressStandard.ogg:system/media/audio/ui/KeypressStandard.ogg \
#	frameworks/base/data/sounds/effects/ogg/Lock.ogg:system/media/audio/ui/Lock.ogg \
#	frameworks/base/data/sounds/effects/ogg/LowBattery.ogg:system/media/audio/ui/LowBattery.ogg \
#	frameworks/base/data/sounds/effects/ogg/Media_Volume.ogg:system/media/audio/ui/Media_Volume.ogg \
#	frameworks/base/data/sounds/effects/ogg/Undock.ogg:system/media/audio/ui/Undock.ogg \
#	frameworks/base/data/sounds/effects/ogg/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
#	frameworks/base/data/sounds/effects/ogg/VideoStop.ogg:system/media/audio/ui/VideoStop.ogg \
#	frameworks/base/data/sounds/effects/ogg/VolumeIncremental.ogg:system/media/audio/ui/VolumeIncremental.ogg \

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=CyanTone.ogg \
    ro.config.notification_sound=CyanMessage.ogg \
    ro.config.alarm_alert=CyanAlarm.ogg

PRODUCT_PACKAGES += \
  Mms

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf


ifeq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/cm/prebuilt/common/bootanimation/vertical-480x800.zip:system/media/bootanimation.zip
endif
