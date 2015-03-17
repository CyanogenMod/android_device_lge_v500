# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/lge/awifi/full_awifi.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := awifi
PRODUCT_NAME := cm_awifi
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-V500
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=awifi_open_eu BUILD_FINGERPRINT=lge/awifi_open_eu/awifi:4.4.2/KOT49I.V50020d/.1401936573:user/release-keys PRIVATE_BUILD_DESC="awifi_open_eu-user 4.4.2 KOT49I.V50020d .1401936573 release-keys"
