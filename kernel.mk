
DEVICE_PATH := device/huawei/CRO_U00

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
    PRODUCT_COPY_FILES += $(TARGET_PREBUILT_KERNEL):kernel                                                       
endif

