# Copyright (C) 2022 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# APEX's
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Attestation
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Audio
BOARD_SUPPORTS_OPENSOURCE_STHAL := true 

PRODUCT_PACKAGES += \
    android.hardware.audio.service

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.button_jack.profile=volume \
    persist.vendor.audio.button_jack.switch=0

PRODUCT_ODM_PROPERTIES += \
    vendor.audio.hw.aac.encoder=false \
    vendor.audio.offload.buffer.size.kb=256

PRODUCT_ODM_PROPERTIES += \
    aaudio.mmap_policy=1 \
    ro.vendor.audio.sdk.fluencetype=fluence

PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.vc_call_vol_default=10 \
    ro.config.vc_call_vol_steps=11

PRODUCT_VENDOR_PROPERTIES += \
    ro.audio.monitorRotation=true \
    ro.vendor.audio.misound.bluetooth.enable=true \
    ro.vendor.audio.scenario.support=true \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.us.proximity=true

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.soundtrigger.appdefine.cnn.level=31 \
    ro.vendor.audio.soundtrigger.appdefine.gmm.level=55 \
    ro.vendor.audio.soundtrigger.appdefine.gmm.user.level=50 \
    ro.vendor.audio.soundtrigger.appdefine.vop.level=10 \
    ro.vendor.audio.soundtrigger.lowpower=true \
    ro.vendor.audio.soundtrigger.training.level=50 \
    ro.vendor.audio.soundtrigger.xanzn.cnn.level=70 \
    ro.vendor.audio.soundtrigger.xanzn.gmm.level=45 \
    ro.vendor.audio.soundtrigger.xanzn.gmm.user.level=30 \
    ro.vendor.audio.soundtrigger.xanzn.vop.level=10 \
    ro.vendor.audio.soundtrigger.xatx.cnn.level=27 \
    ro.vendor.audio.soundtrigger.xatx.gmm.level=50 \
    ro.vendor.audio.soundtrigger.xatx.gmm.user.level=40 \
    ro.vendor.audio.soundtrigger.xatx.vop.level=10 \
    ro.vendor.audio.soundtrigger=sva

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0 \
    com.dsi.ant@1.0.vendor \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbluetooth_audio_session \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor

PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.hardware.power.idle_cur_ma=7 \
    bluetooth.hardware.power.operating_voltage_mv=3700 \
    bluetooth.hardware.power.rx_cur_ma=75 \
    bluetooth.hardware.power.tx_cur_ma=93

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=cherokee

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.btstack.enable.lpa=true \
    persist.vendor.btstack.enable.twsplus=true

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libpiex_shim \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor
    
PRODUCT_SYSTEM_PROPERTIES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera \
    vendor.camera.aux.packagelist.ext=org.codeaurora.snapcam,com.android.camera \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.android.camera

PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Charger
PRODUCT_PACKAGES += \
    libsuspend \
    charger_res_images

PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.quick.charge=1 \
    ro.charger.disable_init_blank=true

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Crypto
PRODUCT_PROPERTY_OVERRIDES += \
   ro.crypto.allow_encrypt_override=true \
   ro.crypto.dm_default_key.options_format.version=2 \
   ro.crypto.volume.filenames_mode=aes-256-cts \
   ro.crypto.volume.metadata.method=dm-default-key \
   ro.crypto.volume.options=::v2

# capabilityconfigstore
PRODUCT_PACKAGES += vendor.qti.hardware.capabilityconfigstore@1.0.vendor

# Display
PRODUCT_PACKAGES += \
    disable_configstore

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_gl_backpressure=1 \    
    debug.sf.layer_caching_active_layer_timeout_ms=1000 \
    vendor.display.enable_async_powermode=0 \
    debug.renderengine.backend=skiaglthreaded \
    ro.hwui.render_ahead=20

# DPM
PRODUCT_VENDOR_PROPERTIES += \
    persist.dpm.feature=1 \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Enable Dynamic partition
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.fp.sideCap=true

# FM
BOARD_HAVE_QCOM_FM := true

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# FUSE passthrough
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Graphics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_VENDOR_PROPERTIES += \
   ro.hardware.egl=adreno \
   ro.hardware.vulkan=adreno \
   ro.opengles.version=196610

# GFX
PRODUCT_VENDOR_PROPERTIES += \
    ro.config.avoid_gfx_accel=true

# GPS
LOC_HIDL_VERSION := 4.0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/input/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/input/uinput-cdfinger.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-cdfinger.kl \
    $(LOCAL_PATH)/configs/input/uinput-focal.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-focal.kl \
    $(LOCAL_PATH)/configs/input/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/input/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# LMK
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lmk.filecache_min_kb=153600 \
    ro.lmk.kill_timeout_ms=50 \
    ro.lmk.stall_limit_critical=40
    
# Media
PRODUCT_VENDOR_PROPERTIES += \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml \
    vendor.mm.enable.qcom_parser=16777215

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    media.aac_51_output_enabled=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0.vendor

# Netflix
PRODUCT_SYSTEM_PROPERTIES += \
    ro.netflix.channel=497730f0-ad4b-11e7-95a4-c7ad113ce187 \
    ro.netflix.signup=1 \
    ro.netflix.bsp_rev=Q6115-31409-1

# Netmgr
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.data.netmgrd.qos.enable=true

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
TARGET_NFC_SKU := lemon

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.st \
    com.android.nfc_extras \
    libchrome.vendor \
    nfc_nci.st21nfc.default \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_lemon/com.android.nfc_extras.xml

PRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C

# Overlays
PRODUCT_PACKAGES += \
    AOSPAJuiceFrameworksOverlay \
    JuiceCarrierConfigOverlay \
    JuiceFrameworksOverlay \
    JuiceSystemUIOverlay \
    JuiceTetheringOverlay \
    JuiceWifiOverlay

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perf/perfboostsconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfboostsconfig.xml \
    $(LOCAL_PATH)/configs/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Rootdir / Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_PACKAGES += \
    init.qti.dcvs.sh \
    init.qti.early_init.sh

PRODUCT_PACKAGES += \
    init.juice.rc \
    init.juice.perf.rc \
    init.target.rc \
    init.xiaomi.rc \
    init.xiaomi.display.rc \
    init.xiaomi.fingerprint.rc \
    init.xiaomi.camera.rc \
    ueventd.juice.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# QC common
TARGET_BOARD_PLATFORM := bengal

TARGET_COMMON_QTI_COMPONENTS := \
    audio \
    av \
    bt \
    display \
    dsprpcd \
    gps \
    init \
    keymaster \
    media \
    overlay \
    perf \
    telephony \
    usb \
    vibrator \
    wfd \
    wlan

# QMI
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.qcomsysd.enabled=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.fetchqos=true

PRODUCT_PRODUCT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.enable_temp_dds=true \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.process_sups_ind=1 \
    persist.vendor.radio.report_codec=1 \
    persist.vendor.radio.snapshot_enabled=1 \
    persist.vendor.radio.snapshot_timer=5 \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ro.vendor.radio.features_common=3 \
    ro.vendor.se.type=HCE,UICC \
    sys.vendor.shutdown.waittime=500

# Recovery
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.flash.recovery=0

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    android.frameworks.sensorservice@1.0 \
    android.frameworks.sensorservice@1.0.vendor \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.hal_trigger_ssr=false \
    persist.vendor.sensors.odl.adsp=true \
    persist.vendor.sensors.enable.rt_task=false \
    persist.vendor.sensors.support_direct_channel=false \
    persist.vendor.sensors.enable.bypass_worker=true

# SoC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.manufacturer=Qualcomm \
    ro.soc.model=SM6115

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \

# Storage.xml moment
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.binary_xml=false

# Snapdragon Vision
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.display.svi=1 \
    ro.vendor.display.sensortype=2 \
    vendor.display.svi.config=1 \
    vendor.display.svi.config_path=/vendor/etc/SVIConfig.xml

# Subsystem silent restart
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# Thermal
PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/
    
# Time-services
PRODUCT_VENDOR_PROPERTIES += \
    persist.timed.enable=true

# USB
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.qcom.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.usb.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.mi.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mi.usb.sh \
    $(LOCAL_PATH)/init/init.qcom.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.usb.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.usb.config=mtp,adb
endif

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29 30

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# Vendor
$(call inherit-product, vendor/xiaomi/juice/juice-vendor.mk)

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor:32

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    config.disable_rtt=true

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    ro.hardware.wlan.dbs=0 \
    ro.telephony.iwlan_operation_mode=legacy

# Zygote
PRODUCT_SYSTEM_PROPERTIES += \
    zygote.critical_window.minute=10 \
    persist.device_config.runtime_native.usap_pool_enabled=true
