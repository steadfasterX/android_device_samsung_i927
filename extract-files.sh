#!/bin/sh
# ===================================================================
# ace - based this off cyanogenmod (team?)skyrocket extract-files.sh
# with some tweaks for the i927.  Script follows $VENDOR, $DEVICE
# and $OUTDIR.  Also instead of device-proprietary-files.txt, the
# script is configured to look for $DEVICE-proprietary-files.txt
# ===================================================================
VENDOR=samsung
DEVICE=i927
OUTDIR=vendor/$VENDOR/$DEVICE

set -e

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 /PATH/TO/EXPANDED/ROM/"
    echo ""
    echo "If /PATH/TO/EXPANDED/ROM/ is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

#BASE=../../../vendor/samsung/skyrocket/proprietary
BASE=../../../$OUTDIR/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' $DEVICE-proprietary-files.txt`; do
  echo "Extracting /system/$FILE ..."
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  if [ "$SRC" = "adb" ]; then
    adb pull /system/$FILE $BASE/$FILE
  else
    cp $SRC/system/$FILE $BASE/$FILE
  fi
done

# ace - chmod 755 to $OUTDIR/proprietary/bin
echo "Setting permissions on $BASE/bin to 755"
chmod -R 755 $BASE/bin

./setup-makefiles.sh
