LOCAL_PATH:= $(call my-dir)

define add-rootdir-targets
$(foreach target,$(1), \
   $(eval include $(CLEAR_VARS)) \
   $(eval LOCAL_MODULE       := $(target)) \
   $(eval LOCAL_MODULE_CLASS := ETC) \
   $(eval LOCAL_SRC_FILES    := $(target)) \
   $(eval LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)) \
   $(eval include $(BUILD_PREBUILT)))
endef

$(call add-rootdir-targets, \
	enableswap.sh \
	disableswap.sh \
	fstab.mt6580 \
	init.rc \
	init.modem.rc \
	init.mt6580.rc \
	init.mt6580.usb.rc \
	init.nvdata.rc \
	init.project.rc \
	meta_init.rc \
	meta_init.modem.rc \
	meta_init.project.rc \
	factory_init.rc \
	factory_init.project.rc \
	ueventd.mt6580.rc \
)

