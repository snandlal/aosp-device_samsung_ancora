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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/ancora/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/ancora/vold.fstab:system/etc/vold.fstab \
	device/samsung/ancora/egl.cfg:system/lib/egl/egl.cfg


## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
	device/samsung/ancora/init.qcom.rc:root/init.qcom.rc \
    	device/samsung/ancora/init.qcom.usb.rc:root/init.qcom.usb.rc \
    	device/samsung/ancora/ueventd.qcom.rc:root/ueventd.qcom.rc 
	#device/samsung/ancora/init.ancora.rc:root/init.ancora.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/ancora/ancora-vendor.mk)

# Boot screen
PRODUCT_COPY_FILES += \
    device/samsung/ancora/ARIESVE.rle:root/ARIESVE.rle \
    device/samsung/ancora/charging.rle:root/charging.rle

# Support files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
#Change for CM9
#    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Media configuration xml file
PRODUCT_COPY_FILES += \
    device/samsung/ancora/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    device/samsung/ancora/etc/adreno_config.txt:system/etc/adreno_config.txt \
    device/samsung/ancora/etc/vold.fstab:system/etc/vold.fstab \
    device/samsung/ancora/etc/wifi/nvram_net.txt:system/vendor/firmware/nvram_net.txt \
    device/samsung/ancora/recovery/fix_reboot.sh:recovery/root/sbin/fix_reboot.sh \
    device/samsung/ancora/prebuilt/FileManager.apk:system/app/FileManager.apk \
    device/samsung/ancora/prebuilt/get_macaddrs:system/bin/get_macaddrs

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/samsung/ancora/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Keychars and keylayout files
PRODUCT_COPY_FILES += \
    device/samsung/ancora/keyfiles/Broadcom_Bluetooth_HID.kcm.bin:system/usr/keychars/Broadcom_Bluetooth_HID.kcm.bin \
    device/samsung/ancora/keyfiles/ancora_keypad_numeric.kcm.bin:system/usr/keychars/ancora_keypad_numeric.kcm.bin \
    device/samsung/ancora/keyfiles/ancora_keypad_qwerty.kcm.bin:system/usr/keychars/ancora_keypad_qwerty.kcm.bin \
    device/samsung/ancora/keyfiles/ancora_handset.kl:system/usr/keylayout/ancora_handset.kl \
    device/samsung/ancora/keyfiles/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/ancora/keyfiles/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/ancora/keyfiles/sec_power_key.kl:system/usr/keylayout/sec_power_key.kl \
    device/samsung/ancora/keyfiles/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# Modules
PRODUCT_COPY_FILES += \
    device/samsung/ancora/prebuilt/bthid.ko:root/lib/modules/bthid.ko \
    device/samsung/ancora/prebuilt/bcm4329.ko:root/lib/modules/bcm4329.ko

# LPM
PRODUCT_COPY_FILES += \
    device/samsung/ancora/lpm/bin/charging_mode:system/bin/charging_mode \
    device/samsung/ancora/lpm/bin/playlpm:system/bin/playlpm \
    device/samsung/ancora/lpm/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so \
    device/samsung/ancora/lpm/media/Disconnected.qmg:system/media/Disconnected.qmg \
    device/samsung/ancora/lpm/media/battery_batteryerror.qmg:system/media/battery_batteryerror.qmg \
    device/samsung/ancora/lpm/media/battery_charging_5.qmg:system/media/battery_charging_5.qmg \
    device/samsung/ancora/lpm/media/battery_charging_10.qmg:system/media/battery_charging_10.qmg \
    device/samsung/ancora/lpm/media/battery_charging_15.qmg:system/media/battery_charging_15.qmg \
    device/samsung/ancora/lpm/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \
    device/samsung/ancora/lpm/media/battery_charging_25.qmg:system/media/battery_charging_25.qmg \
    device/samsung/ancora/lpm/media/battery_charging_30.qmg:system/media/battery_charging_30.qmg \
    device/samsung/ancora/lpm/media/battery_charging_35.qmg:system/media/battery_charging_35.qmg \
    device/samsung/ancora/lpm/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \
    device/samsung/ancora/lpm/media/battery_charging_45.qmg:system/media/battery_charging_45.qmg \
    device/samsung/ancora/lpm/media/battery_charging_50.qmg:system/media/battery_charging_50.qmg \
    device/samsung/ancora/lpm/media/battery_charging_55.qmg:system/media/battery_charging_55.qmg \
    device/samsung/ancora/lpm/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \
    device/samsung/ancora/lpm/media/battery_charging_65.qmg:system/media/battery_charging_65.qmg \
    device/samsung/ancora/lpm/media/battery_charging_70.qmg:system/media/battery_charging_70.qmg \
    device/samsung/ancora/lpm/media/battery_charging_75.qmg:system/media/battery_charging_75.qmg \
    device/samsung/ancora/lpm/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \
    device/samsung/ancora/lpm/media/battery_charging_85.qmg:system/media/battery_charging_85.qmg \
    device/samsung/ancora/lpm/media/battery_charging_90.qmg:system/media/battery_charging_90.qmg \
    device/samsung/ancora/lpm/media/battery_charging_95.qmg:system/media/battery_charging_95.qmg \
    device/samsung/ancora/lpm/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \
    device/samsung/ancora/lpm/media/battery_error.qmg:system/media/battery_error.qmg \
    device/samsung/ancora/lpm/media/chargingwarning.qmg:system/media/chargingwarning.qmg

PRODUCT_PACKAGES += \
    librs_jni \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    audio.primary.msm7x30 \
    audio_policy.msm7x30 \
    audio.a2dp.default \
    gps.ancora

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    libstagefrighthw \
    lights.msm7x30

PRODUCT_PACKAGES += \
    badblocks \
    e2fsck \
    e2label \
    mke2fs \
    mke2fs.conf \
    resize2fs \
    tune2fs \
    make_ext4fs \
    setup_fs

PRODUCT_PACKAGES += \
    hciconfig \
    hcitool \
    libaudioutils

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

	PRODUCT_LOCALES += hdpi

ifeq ($(TARGET_PREBUILT_WIFI_MODULE),)
LOCAL_WIFI_MODULE := device/samsung/ancora/prebuilt/bcm4329.ko
else
LOCAL_WIFI_MODULE := $(TARGET_PREBUILT_WIFI_MODULE)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_WIFI_MODULE):system/modules/bcm4329.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/ancora/prebuilt/zImage
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=15 \
       dalvik.vm.heapsize=32m
