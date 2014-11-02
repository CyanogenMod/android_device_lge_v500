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

# Overlay
DEVICE_PACKAGE_OVERLAYS := device/lge/v500/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Dalvik
PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Kernel-headers
$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcomvoiceprocessing
    
PRODUCT_COPY_FILES += \
    device/lge/v500/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/lge/v500/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/lge/v500/configs/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic=digital \
    persist.audio.fluence.mode=endfire \
    persist.audio.lowlatency.rec=false \
    af.resampler.quality=255 \
    media.aac_51_output_enabled=true

# Bluetooth
PRODUCT_COPY_FILES += \
    device/lge/v500/configs/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/misc/bdaddr \
    ro.qualcomm.bt.hci_transport=smd

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs

# GPS
PRODUCT_COPY_FILES += \
    device/lge/v500/configs/gps.conf:system/etc/gps.conf \
    device/lge/v500/configs/sap.conf:system/etc/sap.conf

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960 \
    liboverlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=320 \
    persist.hwc.mdpcomp.enable=true \
    debug.egl.recordable.rgba8888=1

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# IDC
PRODUCT_COPY_FILES += \
    device/lge/v500/configs/touch_mxt1188S.idc:system/usr/idc/touch_mxt1188S.idc

# Keychars
PRODUCT_COPY_FILES += \
    device/lge/v500/keychars/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
    device/lge/v500/keychars/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
    device/lge/v500/keychars/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
    device/lge/v500/keychars/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Keylayout
PRODUCT_COPY_FILES += \
    device/lge/v500/keylayout/awifi-keypad-8064.kl:system/usr/keylayout/awifi-keypad-8064.kl \
    device/lge/v500/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
    device/lge/v500/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/lge/v500/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    device/lge/v500/keylayout/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8960

# Loki
PRODUCT_PACKAGES += \
    loki.sh \
    loki_tool_static_gpad \
    recovery-transform.sh

# Media
PRODUCT_COPY_FILES += \
    device/lge/v500/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/lge/v500/configs/media_profiles.xml:system/etc/media_profiles.xml

# OMX
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert

# OMX CAF
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libdashplayer

# Rootdir
PRODUCT_COPY_FILES += \
    device/lge/v500/rootdir/fstab.awifi:root/fstab.awifi \
    device/lge/v500/rootdir/init.awifi.rc:root/init.awifi.rc \
    device/lge/v500/rootdir/init.awifi.usb.rc:root/init.awifi.usb.rc \
    device/lge/v500/rootdir/ueventd.awifi.rc:root/ueventd.awifi.rc

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sensors.wl_dis=true \
    ro.qualcomm.sensors.smd=true

# Thermal
PRODUCT_COPY_FILES += \
    device/lge/v500/configs/thermald-8064.conf:system/etc/thermald-8064.conf

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/v500/wlan/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/lge/v500/wlan/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    device/lge/v500/wlan/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/lge/v500/wlan/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/lge/v500/wlan/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/lge/v500/wlan/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    conn_init \
    hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15
