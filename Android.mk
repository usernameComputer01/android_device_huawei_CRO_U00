
ifneq ($(filter CRO_U00,$(TARGET_DEVICE)),)

DEVICE_PATH := device/huawei/CRO_U00

include $(call all-makefiles-under,$(DEVICE_PATH))

endif

