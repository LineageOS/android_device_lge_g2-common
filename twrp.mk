RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.177/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 175
TW_NO_USB_STORAGE := true
TW_INCLUDE_L_CRYPTO := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "/data"
TW_TARGET_USES_QCOM_BSP := true
TW_EXTRA_LANGUAGES := false
TW_INCLUDE_NTFS_3G := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_DEVICE_DIRS += device/lge/g2-common/twrp

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
