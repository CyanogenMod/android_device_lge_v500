# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/lge/awifi/full_awifi.mk)

PRODUCT_NAME := cm_awifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=awifi_open_eu \
    BUILD_FINGERPRINT=lge/awifi_open_eu/awifi:4.4.2/KOT49I.V50020d/.1401936573:user/release-keys \
    PRIVATE_BUILD_DESC="awifi_open_eu-user 4.4.2 KOT49I.V50020d .1401936573 release-keys"
