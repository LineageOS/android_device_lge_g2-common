#!/bin/bash
#
# Copyright (C) 2013-2016 The CyanogenMod Project
# Copyright (C) $YEAR The LineageOS Project
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
#

set -e

DEVICE_COMMON=g2-common
VENDOR=lge

INITIAL_COPYRIGHT_YEAR=2013

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# default to not sanitizing the vendor folder before extraction
clean_vendor=false

while [ "$1" != "" ]; do
    case $1 in
        -p | --path )           shift
                                SRC=$1
                                ;;
        -s | --section )        shift
                                SECTION=$1
                                clean_vendor=false
                                ;;
        -c | --clean-vendor )   clean_vendor=true
                                ;;
    esac
    shift
done

if [ -z "$SRC" ]; then
    SRC=adb
fi

# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$CM_ROOT" true $clean_vendor

extract "$MY_DIR"/proprietary-files.txt "$SRC" "$SECTION"

# Initialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$CM_ROOT" false $clean_vendor

extract "$MY_DIR"/../$DEVICE/proprietary-files.txt "$SRC" "$SECTION"

QCNVITEMS="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE_COMMON"/proprietary/vendor/etc/permissions/qcnvitems.xml
sed -i 's|/system/framework|/vendor/framework|g' "$QCNVITEMS"

QCRILHOOK="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE_COMMON"/proprietary/vendor/etc/permissions/qcrilhook.xml
sed -i 's|/system/framework|/vendor/framework|g' "$QCRILHOOK"

"$MY_DIR"/setup-makefiles.sh