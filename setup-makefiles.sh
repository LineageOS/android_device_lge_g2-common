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

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR/../../.."

HELPER="$ANDROID_ROOT/tools/extract-utils/extract_utils.sh"
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper for common device
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$ANDROID_ROOT" true

# Copyright headers and common guards
write_headers "g2 d800 d801 d802 d803 f320 l01f ls980 vs980"

# The common blobs
write_makefiles "$MY_DIR"/proprietary-files.txt true

# We are done with common
write_footers

# Initialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT"

# Copyright headers and guards
write_headers

# The device blobs
write_makefiles "$MY_DIR"/../$DEVICE/proprietary-files.txt true

# We are done with device
write_footers
