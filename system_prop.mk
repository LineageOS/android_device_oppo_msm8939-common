#
# System Properties for OPPO MSM8939
#

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.bluetooth.hfp.ver=1.7 \
    ro.qualcomm.bt.hci_transport=smd

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.dun=true \
    ro.bluetooth.sap=true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610 \
    persist.hwc.mdpcomp.enable=true \
    debug.composition.type=c2d \
    debug.sf.gpu_comp_tiling=1 \
    sys.hwc.gpu_perf_mode=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=true \
    persist.audio.fluence.speaker=false \
    tunnel.audio.encode=false \
    audio.deep_buffer.media=true \
    audio.offload.buffer.size.kb=64 \
    audio.offload.min.duration.secs=30 \
    av.offload.enable=true \
    use.voice.path.for.pcm.voip=true \
    audio.offload.gapless.enabled=true \
    voice.playback.conc.disabled=true \
    voice.record.conc.disabled=true \
    voice.voip.conc.disabled=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    persist.camera.cpp.duplication=false

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=false \
    persist.radio.force_on_dc=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.sib16_support=1

# WIFI
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# QC vendor extension
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.core_ctl_min_cpu=0 \
    ro.core_ctl_max_cpu=4

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Disable QMI logspam
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true
