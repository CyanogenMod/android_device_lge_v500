# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/lge/v500/v500.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v500
PRODUCT_NAME := cm_v500
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-V500
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=awifi_open_eu BUILD_FINGERPRINT=lge/awifi_open_eu/awifi:4.2.2/JDQ39B/V50010a.1380629540:user/release-keys PRIVATE_BUILD_DESC="awifi_open_eu-user 4.2.2 JDQ39B V50010a.1380629540 release-keys"
