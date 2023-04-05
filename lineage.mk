DEVICE_PATH=device/huawei/CRO_U00

# Inherit device configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_CRO_U00
PRODUCT_DEVICE := CRO_U00

PRODUCT_BRAND := HUAWEI
PRODUCT_MODEL := CRO-U00
PRODUCT_MANUFACTURER := HUAWEI

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.build.user=build \
#    ro.build.host=localhost

PRODUCT_BUILD_PROP_OVERRIDES += \
    CM_DEVICE="HWCRO-U6580M"

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="HWCRO-U6580M"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="CRO-U00"

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_ID="HUAWEICRO-U00" \
    BUILD_NUMBER="C10B122" \
    BUILD_DISPLAY_ID="Cairo-U00C10B122"

# SafetyNet
PRODUCT_BUILD_PROP_OVERRIDES += \
    PLATFORM_SECURITY_PATCH="2018-07-05"

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_BUILD_FLAVOR="CRO-U00-$(TARGET_BUILD_VARIANT)"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="CRO-U00-$(TARGET_BUILD_VARIANT) 6.0 HUAWEICRO-U00 1531390129 test-keys"

BUILD_FINGERPRINT := HUAWEI/CRO-U00/HWCRO-U6580M:6.0/HUAWEICRO-U00/C10B122:$(TARGET_BUILD_VARIANT)/test-keys 

TARGET_OTA_ASSERT_DEVICE := CRO_U00,CRO-U00,HWCRO-U6580M,HUAWEICRO-U00,HUAWEI-Y3-2017

PRODUCT_GMS_CLIENTID_BASE := android-huawei

