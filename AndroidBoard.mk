DEVICE_PATH := device/huawei/CRO_U00

include $(DEVICE_PATH)/kernel.mk

# -----------------------------------------
# libtinyalsa deps
ifneq ($(TARGET_PREBUILT_KERNEL),)
$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr:
	mkdir -p $@
endif
