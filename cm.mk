# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/lge/awifi/full_awifi.mk)

PRODUCT_NAME := cm_awifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=awifi_open_kr \
    BUILD_FINGERPRINT=lge/awifi_open_kr/awifi:5.0.2/LRX22G/150901527c301:user/release-keys \
    PRIVATE_BUILD_DESC="awifi_open_kr-user 5.0.2 LRX22G 150901527c301 release-keys"
