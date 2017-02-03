PRODUCT_COPY_FILES += device/lge/g2-common/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab

RECOVERY_VARIANT := twrp

BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_SCREEN_TIMEOUT := true
