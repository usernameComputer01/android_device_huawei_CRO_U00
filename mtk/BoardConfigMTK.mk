
DEVICE_PATH := device/huawei/CRO_U00

include $(DEVICE_PATH)/mtk/__gmel
include $(DEVICE_PATH)/mtk/__gmsl

include $(DEVICE_PATH)/ProjectConfig.mk

MTK_TARGET_PROJECT := ot6580_weg_a_m

MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_PROJECT_NAME := $(MTK_BASE_PROJECT)
MTK_PROJECT := $(MTK_PROJECT_NAME)

# lk
#MTK_TARGET_PROJECT_FOLDER := $(DEVICE_PATH)

MTK_ROOT := vendor/mediatek/proprietary
MTK_PATH_SOURCE := vendor/mediatek/proprietary
MTK_PATH_COMMON := vendor/mediatek/proprietary/custom/common
MTK_PATH_CUSTOM := vendor/mediatek/proprietary/custom/$(MTK_PROJECT)
MTK_PATH_CUSTOM_PLATFORM := vendor/mediatek/proprietary/custom/$(shell echo $(MTK_PLATFORM) | tr '[A-Z]' '[a-z]')

MTK_PLATFORM_DIR = $(shell echo $(MTK_PLATFORM) | tr '[A-Z]' '[a-z]')
MTK_PATH_PLATFORM := $(MTK_PATH_SOURCE)/platform/$(shell echo $(MTK_PLATFORM) | tr '[A-Z]' '[a-z]')

TARGET_BOARD_KERNEL_HEADERS := \
    device/mediatek/$(shell echo $(MTK_PLATFORM) | tr '[A-Z]' '[a-z]')/kernel-headers \
    device/mediatek/common/kernel-headers

# Import ProjectConfig.mk
MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))

COMMON_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
COMMON_GLOBAL_CPPFLAGS += $(MTK_INTERNAL_CDEFS)

MTK_HAL_CFLAGS += -I$(TOPDIR)vendor/mediatek/proprietary/hardware/audio/common/include

COMMON_GLOBAL_CFLAGS += $(MTK_HAL_CFLAGS)
COMMON_GLOBAL_CPPFLAGS += $(MTK_HAL_CFLAGS)

# Add MTK compile options to wrap MTK's modifications on AOSP.
#ifneq ($(MTK_BASIC_PACKAGE), yes)
COMMON_GLOBAL_CFLAGS += -DMTK_AOSP_ENHANCEMENT
COMMON_GLOBAL_CPPFLAGS += -DMTK_AOSP_ENHANCEMENT
#endif

# ProjectConfig.mk {

# Video {
ifeq ($(FPGA_EARLY_PORTING), no)
    MTK_HWC_SUPPORT := yes
else
    MTK_HWC_SUPPORT := No
endif

MTK_HWC_VERSION := 1.4.1
# }

# Connectivity {
ifeq ($(MTK_GPS_SUPPORT), yes)
    BOARD_GPS_LIBRARIES := true
else
    BOARD_GPS_LIBRARIES := false
endif
# }

# Audio
BOARD_USES_MTK_AUDIO := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), MediaTek)
    BOARD_MEDIATEK_USES_GPS := true
    BOARD_CONNECTIVITY_MODULE := conn_soc
endif
# }

# RIL {
ifeq ($(MTK_EAP_SIM_AKA), yes)
    CONFIG_RILD_MULTI_SIM := yes
endif
# }

# tmp {

#MTKCAM_C_INCLUDES := \
#    $(MTK_PATH_SOURCE)/hardware/mtkcam/common/include \
#    $(MTK_PATH_SOURCE)/hardware/mtkcam/legacy/include/mtkcam

#MTK_USE_ANDROID_MM_DEFAULT_CODE := yes
#BOARD_USES_ANDROID_DEFAULT_CODE := yes

#TARGET_CUSTOM_OUT := out/debug/target/product/CRO_U00/custom

# }

# Local Include {
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM)/cgen
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM)/cgen/inc
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM)/cgen/cfgfileinc
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM)/cgen/cfgdefault

TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM_PLATFORM)/cgen
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM_PLATFORM)/cgen/inc
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM_PLATFORM)/cgen/cfgfileinc
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_CUSTOM_PLATFORM)/cgen/cfgdefault

TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_COMMON)/cgen
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_COMMON)/cgen/inc
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_COMMON)/cgen/cfgfileinc
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_COMMON)/cgen/cfgdefault

TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_SOURCE)/libs/mt6580_gmo/libdpframework/include
TARGET_SPECIFIC_HEADER_PATH += $(MTK_PATH_SOURCE)/libs/mt6580_gmo/libJpgEncPipe/include

# libbt-vendor
#TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include/system/bt/include

# }
