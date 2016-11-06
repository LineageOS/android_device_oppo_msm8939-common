LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    android/sensor.cpp \
    gui/SensorManager.cpp \
    ui/GraphicBuffer.cpp

LOCAL_C_INCLUDES := gui
LOCAL_SHARED_LIBRARIES := libgui libutils liblog libbinder libandroid libui
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := wvm_shim.cpp
LOCAL_SHARED_LIBRARIES := libstagefright_foundation
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
