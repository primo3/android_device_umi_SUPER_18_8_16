#!/bin/bash

VENDOR=umi
DEVICE=SUPER

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp /home/user/system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
