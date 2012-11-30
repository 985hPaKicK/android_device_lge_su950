#
# Copyright (C) 2009 The Android Open Source Project
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

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/su950/su950-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/su950/overlay

# Sensors
PRODUCT_COPY_FILES += \
    device/lge/su950/files/sensors.qcom.so:system/lib/hw/sensors.su950.so \
    device/lge/su950/files/opq_sensorgoza.ko:system/lib/modules/opq_sensorgoza.ko \
    device/lge/su950/files/install-recovery.sh:system/etc/install-recovery.sh

# Init
PRODUCT_COPY_FILES += \
    device/lge/su950/files/initlogo.rle:root/initlogo.rle \
    device/lge/su950/files/init.qcom.rc:root/init.qcom.rc \
    device/lge/su950/files/init.su950.rc:root/init.rc \
    device/lge/su950/files/ueventd.su950.rc:root/ueventd.rc
#    device/lge/su950/files/init.qcom.sh:root/init.qcom.sh \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Keylayout
#PRODUCT_COPY_FILES += \
#    device/lge/su950/files/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
#    device/lge/su950/files/8k_handset.kl:system/usr/keylayout/8k_handset.kl \
#    device/lge/su950/files/pp2106_qwerty.kl:system/usr/keylayout/pp2106_qwerty.kl \
#    device/lge/su950/files/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Apks
PRODUCT_COPY_FILES += \
    device/lge/su950/files/RootExplorer.apk:system/app/RootExplorer.apk \
    device/lge/su950/files/OpZetmizer.apk:system/app/OpZetmizer.apk \
    device/lge/su950/files/TstoreUtility.apk:system/app/TstoreUtility.apk \
    device/lge/su950/files/DioDict.apk:system/app/DioDict.apk

# SetCpu
PRODUCT_COPY_FILES += \
    device/lge/su950/files/libsetcpu-native.so:system/lib/libsetcpu-native.so \
    device/lge/su950/files/SetCpu.apk:system/app/SetCpu.apk

# KoreanIME
PRODUCT_COPY_FILES += \
    device/lge/su950/files/libjni_koreanime.so:system/lib/libjni_koreanime.so \
    device/lge/su950/files/KoreanIME.apk:system/app/LatinIME.apk

# Media Profile
PRODUCT_COPY_FILES += \
    device/lge/su950/media_profiles.xml:system/etc/media_profiles.xml

# APN
PRODUCT_COPY_FILES += \
    device/lge/su950/files/apns-conf.xml:system/etc/apns-conf.xml

# GPS
PRODUCT_COPY_FILES += \
    device/lge/su950/files/gps.conf:system/etc/gps.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/su950/files/wireless.ko:system/lib/modules/wireless.ko

# Recovery
PRODUCT_COPY_FILES += \
    device/lge/su950/files/boot.img:system/etc/recovery/boot.img \
    device/lge/su950/files/recovery.img:system/etc/recovery/recovery.img \
    device/lge/su950/files/flash_recovery.sh:system/bin/flash_recovery


PRODUCT_PACKAGES += \
    gps.su950 \
    libOmxCore \
    libOmxVidEnc \
    libcamera

PRODUCT_LOCALES += hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lge/su950/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := lge_su950
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := su950
PRODUCT_MODEL := SU950
PRODUCT_MANUFACTURER := LGE
