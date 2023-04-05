VENDOR_PATH := vendor/huawei/CRO_U00
DEVICE_PATH := device/huawei/CRO_U00

$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, $(VENDOR_PATH)/CRO_U00-vendor.mk)


PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi mdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi tvdpi mdpi ldpi

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml
  

# PerfService
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/etc/perfservapplist.txt:system/etc/perfservapplist.txt \
    $(DEVICE_PATH)/configs/etc/perfservscntbl.txt:system/etc/perfservscntbl.txt


# Telecom (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/ecc_list.xml:system/etc/ecc_list.xml \
#    $(DEVICE_PATH)/configs/etc/spn-conf.xml:system/etc/spn-conf.xml


# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    libwpa_client \
    wpa_supplicant

PRODUCT_PACKAGES += \
    wifi_hal \
    libwifi-hal-mt66xx

# (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
#    $(DEVICE_PATH)/configs/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
#    $(DEVICE_PATH)/configs/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf


# GPS
PRODUCT_PACKAGES += \
    YGPS \
    LocationEM2 \
    libcurl \
    gps.mt6580

# GPS { if need stock GPS apps (need enable in proprietary-files.txt)
#PRODUCT_PACKAGES += \
#    CIT \
#    DeviceInfo \
#    ontimpropsvr
# }

# (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml


# Codecs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
#    $(DEVICE_PATH)/configs/etc/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
#    $(DEVICE_PATH)/configs/etc/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml


# Audio
PRODUCT_PACKAGES += \
    audio_policy.stub \
    audio.a2dp.default \
    audio_policy.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix \
    libtinyxml \
    libtinyalsa \
    libalsautils \
    libtinycompress

# (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/audio_device.xml:system/etc/audio_device.xml \
#    $(DEVICE_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf


## Bluetooth (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
#    $(DEVICE_PATH)/configs/etc/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
#    $(DEVICE_PATH)/configs/etc/bluetooth/bt_stack.conf.debug:system/etc/bluetooth/bt_stack.conf.debug \
#    $(DEVICE_PATH)/configs/etc/bluetooth/bt_stack.conf.sqc:system/etc/bluetooth/bt_stack.conf.sqc


## Keylayout (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/usr/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
#    $(DEVICE_PATH)/configs/usr/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl \


## Thermal (proprietary-files.txt)
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/configs/etc/_.tp/.ht120.mtc:system/etc/.tp/.ht120.mtc \
#    $(DEVICE_PATH)/configs/etc/_.tp/thermal.conf:system/etc/.tp/thermal.conf \
#    $(DEVICE_PATH)/configs/etc/_.tp/thermal.off.conf:system/etc/.tp/thermal.off.conf


# Camera
PRODUCT_PACKAGES += Snap
# PRODUCT_PACKAGES += Camera2
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += camera.disable_zsl_mode=1


# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni


# Misc
PRODUCT_PACKAGES += \
    gzip \
    pppd \
    ping \
    ping6 \
    libjhead \
    libspeex

# Need shared lib (libnvram.so, etc ...)
PRODUCT_PACKAGES += libfs_mgr

# Display (mtk lib)
PRODUCT_PACKAGES += \
    libion \
    libGLES_android

PRODUCT_PACKAGES += \
    MTKLogger \
    MiraVision \
    EngineerMode


# DRM
PRODUCT_PACKAGES += \
    libdrmmtkwhitelist
PRODUCT_PACKAGES += \
    libdrmclearkeyplugin \
    libmockdrmcryptoplugin


# FS-tools
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs \
    badblocks \
    resize2fs \
    make_f2fs \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    make_ext4fs


# Charger
PRODUCT_PACKAGES += healthd
PRODUCT_PACKAGES += charger_res_images


# Kernel
-include $(DEVICE_PATH)/kernel.mk


# System
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.mount.fs=EXT4 \
    persist.sys.usb.config=mtp \
    debug.atrace.tags.enableflags=0

ifneq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.logd.logpersistd=logcatd
endif


# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Lowram
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_highendgfx=true


# Ramdisk
PRODUCT_PACKAGES += fstab.mt6580

PRODUCT_PACKAGES += \
    enableswap.sh \
    disableswap.sh

TARGET_PROVIDES_INIT_RC := true

PRODUCT_PACKAGES += \
    init.rc \
    init.modem.rc \
    init.mt6580.rc \
    init.mt6580.usb.rc \
    init.nvdata.rc \
    init.project.rc

PRODUCT_PACKAGES += multi_init
PRODUCT_PACKAGES += \
    meta_init.rc \
    meta_init.modem.rc \
    meta_init.project.rc
PRODUCT_PACKAGES += \
    factory_init.rc \
    factory_init.project.rc

PRODUCT_PACKAGES += ueventd.mt6580.rc

# Release
PRODUCT_PROPERTY_OVERRIDES += \
    cm.updater.uri=https://raw.githubusercontent.com/usernameComputer01/android_ota/CRO_U00

#PRODUCT_DEFAULT_DEV_CERTIFICATE := build/target/product/security/releasekey


#WITH_OPENGAPPS := true
ifeq ($(WITH_OPENGAPPS),true)
# OpenGAPPS
GAPPS_VARIANT := pico
GAPPS_FORCE_MATCHING_DPI := true
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif
