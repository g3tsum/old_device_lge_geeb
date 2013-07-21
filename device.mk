#
# Copyright (C) 2013 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL geehrc devices, and
# are also specific to geehrc devices
#
# Everything in this directory will become public

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/gee/gee-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geeb/overlay

# Inherit from gee-common
$(call inherit-product, device/lge/gee-common/gee-common.mk)

# Telephony Properties
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9 \
    ro.ril.def.preferred.network=9

# Vold configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# GPS configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.geeb.rc:root/init.geeb.rc \
    $(LOCAL_PATH)/ramdisk/fstab.gee:root/fstab.gee

# NFC Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so

# CameraHAL
PRODUCT_PACKAGES += \
   camera.geeb
