#!/bin/bash

DEVICE=msm8939-common
VENDOR=oppo

OUTDIR=vendor/$VENDOR/$DEVICE
MAKEFILE=../../../$OUTDIR/$DEVICE-vendor-blobs.mk

YEAR=`date +"%Y"`

function write_bloblist() {
    local LINEEND=" \\"
    local COUNT=`cat $1 | uniq | egrep -c -v '(^-|^#|^$)'`
    for FILE in `egrep -v '(^-|^#|^$)' $1 | uniq`; do
      COUNT=`expr $COUNT - 1`
      if [ $COUNT = "0" ]; then
          LINEEND=""
      fi
      # Split the file from the destination (format is "file[:destination]")
      local OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
      local FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
      local DEST=${PARSING_ARRAY[1]}
      if [ -n "$DEST" ]; then
          FILE=$DEST
      fi
      echo "    $OUTDIR/proprietary-$2/$FILE:system/$FILE$LINEEND" >> $MAKEFILE
    done
}

(cat << EOF) > $MAKEFILE
# Copyright (C) $YEAR The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

ifeq (\$(FORCE_32_BIT),true)

PRODUCT_COPY_FILES += \\
EOF

write_bloblist ../../$VENDOR/$DEVICE/proprietary-files-32.txt 32

(cat << EOF) >> $MAKEFILE

else

PRODUCT_COPY_FILES += \\
EOF

write_bloblist ../../$VENDOR/$DEVICE/proprietary-files-64.txt 64

(cat << EOF) >> $MAKEFILE

endif
EOF

(cat << EOF) > ../../../$OUTDIR/$DEVICE-vendor.mk
# Copyright (C) $YEAR The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

PRODUCT_PACKAGES += \\
    libloc_api_v02 \\
    libloc_ds_api

\$(call inherit-product, vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk)
EOF

(cat << EOF) > ../../../$OUTDIR/BoardConfigVendor.mk
# Copyright (C) $YEAR The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh
EOF

(cat << EOF) > ../../../$OUTDIR/Android.mk
# Copyright (C) $YEAR The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

LOCAL_PATH := \$(call my-dir)

ifneq (\$(filter f1f r5 r7 r7plus r7sf,\$(TARGET_DEVICE)),)
ifeq (\$(FORCE_32_BIT),true)

include \$(CLEAR_VARS)
LOCAL_MODULE := libloc_api_v02
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary-32/lib/libloc_api_v02.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libloc_ds_api
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES := proprietary-32/lib/libloc_ds_api.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)
include \$(BUILD_PREBUILT)

else

include \$(CLEAR_VARS)
LOCAL_MODULE := libloc_api_v02
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary-64/lib64/libloc_api_v02.so
LOCAL_SRC_FILES_32 := proprietary-64/lib/libloc_api_v02.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libloc_ds_api
LOCAL_MODULE_OWNER := $VENDOR
LOCAL_SRC_FILES_64 := proprietary-64/lib64/libloc_ds_api.so
LOCAL_SRC_FILES_32 := proprietary-64/lib/libloc_ds_api.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_64 := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_32 := \$(2ND_TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MULTILIB := both
include \$(BUILD_PREBUILT)

\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
\$(shell mkdir -p \$(PRODUCT_OUT)/system/vendor/lib64/egl && pushd \$(PRODUCT_OUT)/system/vendor/lib64 > /dev/null && ln -s egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)

endif
endif
EOF
