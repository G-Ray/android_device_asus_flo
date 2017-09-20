#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL msm8960 devices, and
# are also specific to msm8960 devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/asus/flo/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200
TARGET_BOOTANIMATION_HALF_RES := true

PRODUCT_PACKAGES := \
    android.hardware.wifi@1.0-service \
    libwpa_client \
    hostapd \
    wificond \
    wifilogd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
	android.hardware.camera.provider@2.4-impl \
	camera.device@3.2-impl

PRODUCT_PACKAGES += \
	android.hardware.light@2.0-impl \
	lights.msm8960

PRODUCT_PACKAGES += \
    charger_res_images

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \
        librs_jni

PRODUCT_COPY_FILES += \
	device/asus/flo/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	device/asus/flo/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	device/asus/flo/WCNSS_qcom_wlan_nv_flo.bin:system/etc/wifi/WCNSS_qcom_wlan_nv_flo.bin \
	device/asus/flo/WCNSS_qcom_wlan_nv_deb.bin:system/etc/wifi/WCNSS_qcom_wlan_nv_deb.bin \
	device/asus/flo/init.flo.wifi.sh:system/bin/init.flo.wifi.sh \
	device/asus/flo/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb \
	ro.adb.secure=0

# TWRP lollipop decrypt proprietaries

$(shell mkdir -p out/target/product/flo/recovery/root/vendor/firmware/keymaster)
$(shell mkdir -p out/target/product/flo/recovery/root/vendor/lib/hw)

PRODUCT_COPY_FILES += \
    device/asus/flo/recovery/keymaster.b00:recovery/root/vendor/firmware/keymaster/keymaster.b00 \
    device/asus/flo/recovery/keymaster.b01:recovery/root/vendor/firmware/keymaster/keymaster.b01 \
    device/asus/flo/recovery/keymaster.b02:recovery/root/vendor/firmware/keymaster/keymaster.b02 \
    device/asus/flo/recovery/keymaster.b03:recovery/root/vendor/firmware/keymaster/keymaster.b03 \
    device/asus/flo/recovery/keymaster.mdt:recovery/root/vendor/firmware/keymaster/keymaster.mdt \
    device/asus/flo/recovery/keystore.msm8960.so:recovery/root/vendor/lib/hw/keystore.msm8960.so \
    device/asus/flo/recovery/libQSEEComAPI.so:recovery/root/sbin/libQSEEComAPI.so

PRODUCT_COPY_FILES += \
	device/asus/flo/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/asus/flo/mixer_paths.xml:system/etc/mixer_paths.xml \
	device/asus/flo/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
	device/asus/flo/thermald-flo.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/_hals.conf:system/vendor/etc/sensors/_hals.conf

# Sensors
PRODUCT_PACKAGES += \
	android.hardware.sensors@1.0-impl \
	sensors.msm8960

PRODUCT_COPY_FILES += \
	device/asus/flo/init.flo.usb.rc:root/init.flo.usb.rc \
	device/asus/flo/ueventd.flo.rc:root/ueventd.flo.rc \
	device/asus/flo/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	device/asus/flo/media_codecs.xml:system/etc/media_codecs.xml \
	device/asus/flo/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

PRODUCT_COPY_FILES += \
	device/asus/flo/kickstart_checker.sh:system/bin/kickstart_checker.sh

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/asus/flo/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	device/asus/flo/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	device/asus/flo/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	device/asus/flo/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	device/asus/flo/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	device/asus/flo/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
	device/asus/flo/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
	device/asus/flo/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	device/asus/flo/touch_dev.idc:system/usr/idc/touch_dev.idc

# TP idc file
PRODUCT_COPY_FILES += \
	device/asus/flo/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# These are the hardware-specific features
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
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Modem debugger
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    device/asus/flo/init.flo.diag.rc.userdebug:root/init.flo.diag.rc
else
PRODUCT_COPY_FILES += \
    device/asus/flo/init.flo.diag.rc.user:root/init.flo.diag.rc
endif

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_PROPERTY_OVERRIDES += \
       debug.hwui.use_buffer_age=false

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=dmic \
	persist.audio.fluence.mode=endfire \
	persist.audio.lowlatency.rec=false

# Camera Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Kickstart
PRODUCT_PACKAGES += \
	qcks \
	ks \
	efsks

#Enable MDP composition by default
PRODUCT_PROPERTY_OVERRIDES += \
	persist.hwc.mdpcomp.enable=true

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	setup_fs

PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.mapper@2.0-impl \
	android.hardware.memtrack@1.0-impl \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960 \
	keystore.msm8960 \
	memtrack.msm8960

PRODUCT_PACKAGES += \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	alsa.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors
PRODUCT_COPY_FILES += \
    device/asus/flo/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Monitor device rotation for speaker channel swap
PRODUCT_PROPERTY_OVERRIDES += \
	ro.audio.monitorRotation=true

PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_PACKAGES += \
	power.msm8960

PRODUCT_COPY_FILES += \
	device/asus/flo/init.flo.bt.sh:system/bin/init.flo.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd \
	qcom.bluetooth.soc=smd

PRODUCT_PACKAGES += \
	libmmcamera_interface2 \
	libmmcamera_interface \
	libqomx_core

PRODUCT_PACKAGES += \
	mm-vdec-omx-test \
	mm-venc-omx-test720p \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

# Default OMX service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# GPS
PRODUCT_PACKAGES += \
        libloc_adapter \
        libloc_eng \
        libloc_api_v02 \
        libloc_ds_api \
        libloc_core \
        libizat_core \
        libgeofence \
        libgps.utils \
        gps.conf \
        gps.msm8960 \
        flp.msm8960

# GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl

PRODUCT_PACKAGES += \
	bdAddrLoader \
	libwfcu \
	conn_init \
	charger_touch

# Bluetooth HAL
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl

PRODUCT_PACKAGES += \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_PROPERTY_OVERRIDES += \
        ro.qc.sensors.wl_dis=true \
        ro.qualcomm.sensors.smd=true

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

# Configure ro.recents.grid
PRODUCT_PROPERTY_OVERRIDES += \
    ro.recents.grid=false

PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.flo

# NFC packages
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    device/asus/flo/nfc/libnfc-brcm.conf:system/vendor/etc/libnfc-brcm.conf \
    device/asus/flo/nfc/libnfc-brcm-20791b05.conf:system/vendor/etc/libnfc-brcm-20791b05.conf

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
