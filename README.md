# Samsung Captivate Glide (SGH-I927) CM9 / ICS

## To build 

1) `mkdir ~/cm_ics && cd ~/cm_ics`

2) `repo init -u git://github.com/CyanogenMod/android.git -b ics`

3) add the following to `.repo/local_manifests/roomservice.xml` (create dir and file):

~~~~
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote fetch="https://github.com/" name="simplegithub" />
  <project name="steadfasterX/android_device_samsung_i927" path="device/samsung/i927" remote="simplegithub" revision="sediROM_CM-ICS" />
  <project name="steadfasterX/kernel_samsung_i927" path="kernel/samsung/i927" remote="simplegithub" revision="sediKERNEL" />
  <project name="buborh/android_vendor_samsung_i927" path="vendor/samsung/i927" remote="simplegithub" revision="omni" />
</manifest>
~~~
4) `repo sync --current -j 8` (adjust -j if needed)

5) `source build/envsetup && lunch cm_i927-userdebug`

6) `make clean && mka recoveryimage` (or whatever you like to do)
