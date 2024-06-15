#
# Copyright (C) 2020 The LineageOS Project
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
# Inherit from xiaomi sm6225-common
$(call inherit-product, device/xiaomi/sm6225-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/topaz/topaz-vendor.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/images/battery_fail.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/charger/images/battery_scale.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/battery_scale.png \
    $(LOCAL_PATH)/charger/images/main_font.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/main_font.png \
    $(LOCAL_PATH)/charger/values/animation.txt:$(TARGET_COPY_OUT_ROOT)/res/values/charger/animation.txt \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(LOCAL_PATH)/configs/audio/mixer_paths_bengal_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_bengal_idp_india.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service \
    android.hardware.power@1.2.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Charger
PRODUCT_PACKAGES += \
    libsuspend \
    charger_res_images

# Dex/ART optimization Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
USE_DEX2OAT_DEBUG := false

# Overlays
PRODUCT_PACKAGES += \
    ApertureResTopaz \
    FrameworksResTopaz \
    NotchBarKiller \
    SettingsProviderResTopaz \
    SettingsResTopaz \
    SettingsOverlayM7G \
    SettingsOverlayM7N \
    SettingsOverlayM7L \
    SettingsOverlayM7IN \
    SystemUIResTopaz \
    WifiResTopaz

# Signing Builds
-include vendor/lineage-priv/keys/keys.mk

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
