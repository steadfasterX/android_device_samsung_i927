#
# Copyright (C) 2008 The Android Open Source Project
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

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

#add_lunch_combo cm_i927-eng
#add_lunch_combo full_i927-eng
add_lunch_combo cm_i927-userdebug

echo "Apply patch to build/core"
echo -n "0001-Don-t-use-Block-based-ota-if-defined-in-the-boardcon.patch"
(cd build/core; git am ../../device/samsung/i927/patches/0001-Don-t-use-Block-based-ota-if-defined-in-the-boardcon.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd build/core; git am --abort)
       echo "     [FAIL]"
fi

echo "Apply patch to frameworks/native"
echo -n "Apply patch 0002-DisplayDevice-Backwards-compatibility-with-old-EGL.patch"
(cd frameworks/native; git am ../../device/samsung/i927/patches/0002-DisplayDevice-Backwards-compatibility-with-old-EGL.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/native; git am --abort)
       echo "     [FAIL]"
fi

echo "Apply patch to frameworks/native"
echo -n "Apply patch 0001-Fix-layer-dump-for-tegra2.patch"
(cd frameworks/native; git am ../../device/samsung/i927/patches/0001-Fix-layer-dump-for-tegra2.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/native; git am --abort)
       echo "     [FAIL]"
fi

echo "Apply patch to external/ffmpeg"
echo -n "Apply patch 0001-FFMPEG-Backwards-compatibility-with-non-neon-devices.patch"
(cd external/ffmpeg; git checkout 8f08176c02b60accfcecf8fe1462bd2ccebd3844 ; git am ../../device/samsung/i927/patches/0001-FFMPEG-Backwards-compatibility-with-non-neon-devices.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
        echo "     [DONE]"
else
        (cd external/ffmpeg; git am --abort)
        echo "     [FAIL]"
fi

echo "Apply patch to system/core/init"
echo -n "Apply patch  0001-always-permissive.patch"
(cd system/core/init; git am ../../../device/samsung/i927/patches/0001-always-permissive.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
        echo "     [DONE]"
else
        (cd system/core/init; git am --abort)
        echo "     [FAIL]"
fi


echo "Apply patch to bionic"
echo -n "Apply patch  0001-bionic-for-tegra2.patch"
(cd bionic; git am ../device/samsung/i927/patches/0001-bionic-for-tegra2.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
        echo "     [DONE]"
else
        (cd bionic; git am --abort)
        echo "     [FAIL]"
fi

echo "Apply patch to build"
echo -n "Apply patch  0001-build-tegra.patch"
(cd build; git am ../device/samsung/i927/patches/0001-build-tegra.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
        echo "     [DONE]"
else
        (cd build; git am --abort)
        echo "     [FAIL]"
fi

