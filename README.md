# Samsung Captivate Glide (SGH-I927) CM9 / ICS

To build add the following to .repo/local_manifests/roomservice.xml:

~~~~
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote fetch="https://github.com/" name="simplegithub" />
  <project name="steadfasterX/android_device_samsung_i927" path="device/samsung/i927" remote="simplegithub" revision="sediROM_CM-ICS" />
  <project name="steadfasterX/kernel_samsung_i927" path="kernel/samsung/i927" remote="simplegithub" revision="sediKERNEL" />
  <project name="buborh/android_vendor_samsung_i927" path="vendor/samsung/i927" remote="simplegithub" revision="omni" />
</manifest>
~~~
