#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE_COMMON=g2-common
VENDOR=lge

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR/../../.."

HELPER="$ANDROID_ROOT"/vendor/lineage/build/tools/extract_utils.sh
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

function blob_fixup() {
    case "${1}" in
        vendor/etc/permissions/qcnvitems.xml)
            ;&
        vendor/etc/permissions/qcrilhook.xml)
            sed -i 's|/system/framework|/vendor/framework|g' "${2}"
            ;;
        vendor/bin/thermal-engine)
            sed -i 's|/system/etc|/vendor/etc|g' "${2}"
            ;;
    esac
}

# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$ANDROID_ROOT" true $clean_vendor

extract "$MY_DIR"/proprietary-files.txt "$SRC" "$SECTION"

# Initialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" false $clean_vendor

extract "$MY_DIR"/../$DEVICE/proprietary-files.txt "$SRC" "$SECTION"

"$MY_DIR"/setup-makefiles.sh