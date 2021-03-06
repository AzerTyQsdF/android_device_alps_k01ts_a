$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/alps/k01ts_a/k01ts_a-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/alps/k01ts_a/overlay

# Recovery allowed devices 
TARGET_OTA_ASSERT_DEVICE := p6000_pro,k01ts_a

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/alps/k01ts_a/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# init.rc's
PRODUCT_COPY_FILES += \
	device/alps/k01ts_a/rootdir/init.mt6735.rc:root/init.mt6735.rc \
	device/alps/k01ts_a/rootdir/init.ssd.rc:root/init.ssd.rc \
	device/alps/k01ts_a/rootdir/init.xlog.rc:root/init.xlog.rc \
	device/alps/k01ts_a/rootdir/init.rc:root/init.rc \
	device/alps/k01ts_a/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
	device/alps/k01ts_a/rootdir/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc \
	device/alps/k01ts_a/rootdir/init.aee.rc:root/init.aee.rc \
	device/alps/k01ts_a/rootdir/init.project.rc:root/init.project.rc \
	device/alps/k01ts_a/rootdir/init.modem.rc:root/init.modem.rc \
	device/alps/k01ts_a/recovery/root/fstab.mt6753:root/fstab.mt6735  \
	device/alps/k01ts_a/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc \
	device/alps/k01ts_a/rootdir/factory_init.rc:root/factory_init.rc \
	device/alps/k01ts_a/rootdir/factory_init.project.rc:root/factory_init.project.rc \
	device/alps/k01ts_a/rootdir/meta_init.project.rc:root/meta_init.project.rc \
	device/alps/k01ts_a/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
	device/alps/k01ts_a/rootdir/meta_init.rc:root/meta_init.rc 

# hardware specifics
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/permissions/media_codecs.xml \
    	$(LOCAL_PATH)/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    	$(LOCAL_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(LOCAL_PATH)/configs/platform.xml:system/etc/permissions/platform.xml 
    
# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor

# Wifi
PRODUCT_PACKAGES += \
    	libwpa_client \
    	hostapd \
    	dhcpcd.conf \
    	wpa_supplicant \
    	wpa_supplicant.conf

# Audio
PRODUCT_PACKAGES += \
    	audio.a2dp.default \
    	audio_policy.default \
    	audio_policy.stub \
    	audio.r_submix.default \
    	audio.usb.default \
    	libaudio-resampler \
    	tinymix \
    	libtinyalsa

# Audio profiles used to address the correct audio devices for headset, etc.
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    	$(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    	$(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf

# Charger
PRODUCT_PACKAGES += \
      	charger_res_images

# Telecom
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
    	$(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
    	$(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml 

# Torch
PRODUCT_PACKAGES += \
    	Torch

# Immvibe
PRODUCT_PACKAGES += \
	immvibe

# MTK's XLog
PRODUCT_PACKAGES += \
	libxlog

PRODUCT_PACKAGES += \
    	libifaddrs

PRODUCT_PACKAGES += \
    	com.android.future.usb.accessory

 PRODUCT_PACKAGES += \
    	libnl_2 \
    	libtinyxml

# STk
PRODUCT_PACKAGES += \
    	Stk

# GPS
PRODUCT_COPY_FILES += \
     	$(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml 

# FM Radio
PRODUCT_PACKAGES += \
     	FMRadio \
     	libfmjni

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml


PRODUCT_COPY_FILES += \
    	device/alps/k01ts_a/rootdir/etc/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \

# limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    	dalvik.vm.boot-dex2oat-threads=4 \
    	dalvik.vm.dex2oat-threads=2 \
    	dalvik.vm.image-dex2oat-threads=4

$(call inherit-product, build/target/product/full.mk)

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	ro.adb.secure=0 \
	persist.service.acm.enable=0 \
	persist.sys.usb.config=mtp \
	ro.oem_unlock_supported=1
