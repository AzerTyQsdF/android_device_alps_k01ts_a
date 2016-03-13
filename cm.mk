# Release name
PRODUCT_RELEASE_NAME := k01ts_a

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/alps/k01ts_a/device_k01ts_a.mk)

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)

# Configure hwui memory
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := k01ts_a
PRODUCT_NAME := cm_k01ts_a
PRODUCT_BRAND := alps
PRODUCT_MODEL := k01ts_a
PRODUCT_MANUFACTURER := alps
