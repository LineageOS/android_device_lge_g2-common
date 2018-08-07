LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := \
    bootable/recovery/updater/include \
    bootable/recovery/edify/include \
    bootable/recovery/otautil/include
LOCAL_SRC_FILES := recovery_updater.cpp
LOCAL_MODULE := librecovery_updater_g2
LOCAL_MODULE_TAGS := eng
include $(BUILD_STATIC_LIBRARY)
