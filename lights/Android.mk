LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lights.c
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils

LOCAL_MODULE := lights.msm8916
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
