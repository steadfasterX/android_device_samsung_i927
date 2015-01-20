LOCAL_PATH := $(call my-dir)
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}
$(recovery_uncompressed_ramdisk): $(MINIGZIP) $(TARGET_RECOVERY_ROOT_TIMESTAMP)
	@echo -e ${CL_CYN}"----- Making uncompressed recovery ramdisk ------"${CL_RST}
	@rm -f $(TARGET_RECOVERY_ROOT_OUT)/sbin/cbd
	#@rm -f $(TARGET_RECOVERY_ROOT_OUT)/fstab.n1
	@rm -f $(TARGET_RECOVERY_ROOT_OUT)/*.goldfish.rc
	@rm -f $(TARGET_RECOVERY_ROOT_OUT)/lpm.rc
	@rm -f $(TARGET_RECOVERY_ROOT_OUT)/charger
	@rm -rf $(TARGET_RECOVERY_ROOT_OUT)/res/images/charger/
	@rm -f $(TARGET_RECOVERY_ROOT_OUT)/sbin/anicharger
	cp -f $(LOCAL_PATH)/images/*.png $(TARGET_RECOVERY_ROOT_OUT)/res/images/
	cp -f $(LOCAL_PATH)/twrp.fstab $(TARGET_RECOVERY_ROOT_OUT)/etc/
	# Touchwiz CRYPTO support:
	cp -f vendor/samsung/i927/proprietary/libsec_km.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/
	cp -f vendor/samsung/i927/proprietary/libsec_ecryptfs.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/
	cp -f vendor/samsung/i927/proprietary/libkeyutils.so $(TARGET_RECOVERY_ROOT_OUT)/sbin/
	$(MKBOOTFS) $(TARGET_RECOVERY_ROOT_OUT) > $@
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel) $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

