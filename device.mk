#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)
$(call inherit-product, vendor/xiaomi/alioth/alioth-vendor.mk)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_SHIPPING_API_LEVEL := 30

#Audio
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/xiaomi/alioth/audio,$(TARGET_COPY_OUT_VENDOR)/etc)

# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
     $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
     $(LOCAL_PATH)/keylayout/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc
	 
# NFC
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Smart Charge
PRODUCT_PACKAGES += \
    vendor.syberia.smartcharge@1.0-service
	
# Snap
PRODUCT_PACKAGES += \
    Snap

# Updater
PRODUCT_PACKAGES += \
    Updater
