# inherit from the proprietary version
-include vendor/alps/k01ts_a/BoardConfigVendor.mk
 
TARGET_SPECIFIC_HEADER_PATH := device/alps/k01ts_a/include
 
# Link against libxlog
TARGET_LDPRELOAD += libxlog.so
 
# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6753
TARGET_NO_BOOTLOADER := true
 
# Architecture
TARGET_BOARD_PLATFORM := mt6753
TARGET_ARCH := arm64
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
 
#32 bit
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
 
#ARCH_ARM_HAVE_NEON := true
#ARCH_ARM_HAVE_VFP := true
 
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true
#TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
TARGET_CPU_CORTEX_A53 := true
 
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_FACTORYIMAGE := true
 
TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
 
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_USERIMAGES_USE_EXT4:=true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
 
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
#extracted from stock recovery
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x03f88000
 
#extracted from /proc/partinfo
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1107296256
BOARD_CACHEIMAGE_PARTITION_SIZE := 444596224
#pagesize * 64
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --tags_offset 0x0df88000
 
# Kernel from source, maybe later
# TARGET_KERNEL_SOURCE := kernel/alps/k01ts_a
# TARGET_KERNEL_ARCH := arm64
# TARGET_KERNEL_HEADER_ARCH := arm64
# TARGET_KERNEL_CONFIG := cyanogenmod_k01ts_a_defconfig
# TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
# MTK_APPENDED_DTB_SUPPORT := yes
# BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
 
# prebuild kernel as fallback
TARGET_PREBUILT_KERNEL := device/alps/k01ts_a/prebuilt/kernel
BOARD_HAS_NO_SELECT_BUTTON := true

# system.prop
TARGET_SYSTEM_PROP := device/alps/k01ts_a/system.prop

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# RIL
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_LEGACY_MTK_AV_BLOB := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/alps/k01ts_a/bluetooth

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := conn_soc
BOARD_MEDIATEK_USES_GPS := true

USE_CAMERA_STUB := true
BOARD_USES_MTK_AUDIO := true

# FM Radio
MTK_FM_SUPPORT :=true
MTK_FM_RX_SUPPORT :=true

#Mediatek flags
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

#EGL settings
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/alps/k01ts_a/egl.cfg

# recovery
TARGET_RECOVERY_FSTAB := device/alps/k01ts_a/recovery/root/fstab.mt6753
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness\"

#twrp ( WIP do not use!!! see comments )

#tw_theme is essential flag
TW_THEME := portrait_hdpi

#brightness settings (needs verification)
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness/
TW_MAX_BRIGHTNESS := 255

# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
