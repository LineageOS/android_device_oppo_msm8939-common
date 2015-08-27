#
# System Properties for Oppo MSM8939
#

# Display
#
# OpenGLES:
# 196609 is decimal for 0x30001 to report major/minor versions as 3/1
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609 \
    persist.hwc.mdpcomp.enable=true \
    debug.composition.type=c2d \
    debug.sf.gpu_comp_tiling=1 \
    sys.hwc.gpu_perf_mode=1 \
    ro.sf.lcd_density=480

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=false \
    tunnel.audio.encode=false \
    audio.offload.buffer.size.kb=64 \
    audio.offload.min.duration.secs=30 \
    av.offload.enable=true \
    use.voice.path.for.pcm.voip=true \
    audio.offload.gapless.enabled=true \
    voice.playback.conc.disabled=true \
    voice.record.conc.disabled=true \
    voice.voip.conc.disabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    audio.deep_buffer.media=true

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    ro.telephony.default_network=9 \
    ro.telephony.ril.config=simactivation \
    persist.radio.force_on_dc=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.sib16_support=1 \
    persist.radio.multisim.config=dsds

# QC vendor extension
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config \
    drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.location \
    ro.gps.agps_provider=1 \
    ro.pip.gated=0

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq
