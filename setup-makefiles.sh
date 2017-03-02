#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
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

set -e

export INITIAL_COPYRIGHT_YEAR=2015

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/cm/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

if [ -z "$BITS" ]; then
    echo "\$BITS must be set before running this script!"
    exit 1
fi

# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON-$BITS" "$VENDOR" "$CM_ROOT" true

# Copyright headers and common guards
if [ "$BITS" == "32" ]; then
    write_headers "r5 r7"
else
    write_headers "f1f r7plus r7sf"
fi

write_makefiles "$MY_DIR"/proprietary-files-$BITS.txt

write_footers

# Reinitialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$CM_ROOT"

# Copyright headers and guards
write_headers

write_makefiles "$MY_DIR"/device-proprietary-files-$BITS.txt
write_makefiles "$MY_DIR"/../$DEVICE/device-proprietary-files.txt

write_footers
