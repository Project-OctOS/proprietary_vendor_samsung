LOCAL_PATH:= $(call my-dir)

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= alsa_mixer.c alsa_pcm.c alsa_ucm.c
LOCAL_MODULE:= libalsa-intf
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES:= libc libcutils #libutils #libmedia libhardware_legacy
LOCAL_CFLAGS := -DCONFIG_DIR=\"/system/etc/snd_soc_msm/\"
ifeq ($(TARGET_SIMULATOR),true)
 LOCAL_LDLIBS += -ldl
else
 LOCAL_SHARED_LIBRARIES += libdl
endif
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
endif
