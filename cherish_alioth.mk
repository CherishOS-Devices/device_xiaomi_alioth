#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from alioth device
$(call inherit-product, device/xiaomi/alioth/device.mk)

# Inherit some common Syberia stuff.
$(call inherit-product, vendor/cherish/config/common.mk)

$(call inherit-product, vendor/gapps/config.mk)

PRODUCT_CHARACTERISTICS := nosdcard

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := cherish_alioth
PRODUCT_DEVICE := alioth
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F3
TARGET_SCREEN_DENSITY:=440

TARGET_INCLUDE_LIVE_WALLPAPERS := true
PRODUCT_GENERIC_PROPERTIES += \
    ro.cherish.maintainer=MrHokage

TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

CHERISH_WITHGAPPS=true
CHERISH_BUILD_TYPE := OFFICIAL
