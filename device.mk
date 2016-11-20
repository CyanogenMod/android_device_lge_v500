#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi 280dpi hdpi tvdpi mdpi ldpi

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.awifi.bt.sh:system/bin/init.awifi.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.qualcomm.bt.hci_transport=smd

# CABL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960 \
    libcamera_shim \
    Snap

# Configure libhwui
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=48 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.r_buffer_cache_size=4 \
    ro.hwui.path_cache_size=24 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=5 \
    ro.hwui.texture_cache_flushrate=0.5 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Gello
PRODUCT_PACKAGES += \
    Gello

# GPS
PRODUCT_PACKAGES += \
    gps.conf \
    gps.msm8960

# Graphics
PRODUCT_PACKAGES += \
    libgenlock \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=320 \
    persist.hwc.mdpcomp.enable=true \
    debug.egl.recordable.rgba8888=1

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Hwaddrs
PRODUCT_PACKAGES += \
    hwaddrs

# Lights
PRODUCT_PACKAGES += \
    lights.msm8960

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqti-perfd-client.so

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.awifi:root/fstab.awifi \
    $(LOCAL_PATH)/rootdir/init.awifi.rc:root/init.awifi.rc \
    $(LOCAL_PATH)/rootdir/init.awifi.usb.rc:root/init.awifi.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.awifi.rc:root/ueventd.awifi.rc

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sensors.wl_dis=true \
    ro.qualcomm.sensors.smd=true

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald.conf:system/etc/thermald.conf

# Wifi
PRODUCT_PACKAGES += \
    conn_init \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.awifi.wifi.sh:system/bin/init.awifi.wifi.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
