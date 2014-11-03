android_device_samsung_glide
============================

Experimental device tree for Samsung Captivate "Glide" (SGH-I927) for ICS (CM9)

This device tree is very EXPERIMENTAL with focus on getting CM9 built and functional with the device.
This revision is based off the AOSP-ZEUS/android_device_samsung_n1 (Galaxy-R i9103) tree by 
dman3285 (https://github.com/AOSP-ZEUS/android_device_samsung_n1) and used as a "skeleton".  Also uses 
tidbits from other device trees (namely: The-Covenant, TeamGalaxyR) as well as prebuilt kernel 
LiteKernel 4.0-ICS by thegreatergood (modified ramdisk).

What works:
-Sound, adapted libaudio from The-Covenant
-Phone calls, using ril_class Smdk4210RIL
-Bluetooth, tested with BT speaker and OBD2 scanner pairing.
-Wi-Fi (5 + 2.4GHz)
-ADB (Wired and Wi-Fi)
-SMS/MMS
-Data on H+/3G/EDGE
-Sdcard/Internal storage mounting (vold.conf)
-Screen on/off
-Screen touch input
-Screen auto-dimmer
-Proximity sensor
-Rotation sensor
-Front panel touchkey lighting
-Physical keyboard

What doesn't (yet):
-GPS (need to sort out lock issues)
-MTP/Mass Storage mounting
-Keyboard Backlight
-Probably more, could use more testing.

Notes/TODO:
-DO NOT RESET APNs, currently bugs out.  Duplicate or enter in new ones.
-Work on GPS (gps.conf and sirfgps.conf)
-Work on physical keyboard backlighting
-Look at MTP/UMS
-Work on other issues as time permits

Recent/Significant Changelog:
-Rewrote/Heavily modified most of the original device tree
	-tweaked all references of device to "glide"
	-slight organization tweaks to folders
	-included glide-specific prebuilts from ICS/UCLJ3
	-modified CM9/AOSP init.rc with some glide/UCLJ3-specific changes
	-reworked init.n1.rc with UCLJ3 settings
	-included UCLJ3/glide-specific init scripts
	-cleaned/simplified up ALL Makefiles
	-added language support to match UCLJ3 (en_US de_DE en_GB es_ES fr_FR it_IT)
-Proprietary script based off CyanogenMod Skyrocket (TeamChopsticks)
	-uses glide-proprietary-files.txt, which can be # commented for ease of reading/organization
	-uses that txt file to generate pull list and vendor blobs accordingly
	-also properly generates other vendor makefiles
	-favorite part: can be used on live phone via ADB, or can extract from a unpacked system (ROM) path.
	
Quick Build Notes (fairly standard for ICS/CM9):
-Once your build enviornment is configured, init and sync to CM9
	repo init -u git://github.com/CyanogenMod/android.git -b ics
	repo sync -j4 -c
-Copy (or clone) the device tree to device/samsung/glide
-Copy (or clone) the vendor tree to vendor/samsung/glide
-get CM's prebuilts (from vendor/cm)
-in the glide device tree, you can run extract-files.sh and specify an extracted update for the device (UCLJ3) for fresh proprietary files.
-do the following once your device/vendor tree is configured
	. build/envsetup.sh
	brunch cm_glide-userdebug -j4
