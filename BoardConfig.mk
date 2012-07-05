# Copyright (C) 2012 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# no hardware camera
USE_CAMERA_STUB := true



BOARD_USES_LIBSECRIL_STUB := true

#HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true

#BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_QCOM_AUDIO_RESETALL := true
#BOARD_PREBUILT_LIBAUDIO := true

# inherit from the proprietary version
-include vendor/samsung/ancora/BoardConfigVendor.mk

# Include ariesve specific stuff
#-include device/samsung/ariesve-common/Android.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/ancora/include

TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_ROTATOR_KERNEL_FORMATS

#TARGET_BOARD_PLATFORM := 
TARGET_BOOTLOADER_BOARD_NAME := qcom
TARGET_OTA_ASSERT_DEVICE := ancora,GT-I8150

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_KERNEL := false
TARGET_PROVIDES_INIT_TARGET_RC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM_BTLA := true
BT_ALT_STACK := true
BRCM_BT_USE_BTL_IF := true
BRCM_BTL_INCLUDE_A2DP := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT

#For CM9 0_8
WPA_SUPPLICANT_VERSION           := VER_0_6_X
BOARD_WLAN_DEVICE                := bcm4329
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
#WIFI_BAND                        := 802_11_ABG
WIFI_DRIVER_MODULE_PATH          := "/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0 firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/vendor/firmware/nvram_net.txt"

BOARD_KERNEL_BASE := 0x00400000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyFIQ0 no_console_suspend

#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true
#TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true
#not neccessary in CM9
#BOARD_HAVE_BLUETOOTH_BCM_SEMC := true


BOARD_MOBILEDATA_INTERFACE_NAME = "eth0"

# Camera
USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
endif

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4709

BOARD_EGL_CFG := device/samsung/ancora/egl.cfg

USE_OPENGL_RENDERER := true

BOARD_USE_SKIA_LCDTEXT := true

TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_OVERLAY := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true
TARGET_FORCE_CPU_UPLOAD := true

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USE_QCOM_PMEM := true

BOARD_USE_LEGACY_TOUCHSCREEN := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := ancora
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200
#original 50000

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28

BOARD_MTP_DEVICE := "/dev/usb_mtp_gadget"

# Begin recovery stuff
#
# Partition sizes must match your phone, or all hell will break loose!
# For the Galaxy W, these are calculated from /proc/partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 5767168
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 560988160
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1163919360
BOARD_CACHEIMAGE_PARTITION_SIZE := 62914560
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#Maybe look into custom files and do some work for CM7
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/ancora/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/ancora/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/samsung/ancora/init.recovery.rc
#BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file
TARGET_RECOVERY_UI_LIB := librecovery_ui_ancora
# End recovery stuff

TARGET_PREBUILT_KERNEL := device/samsung/ancora/prebuilt/zImage

#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
