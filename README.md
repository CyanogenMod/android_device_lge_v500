CyanogenMod device configuration for the LG GPad 8.3.

How to Build
---------------

Initialise from CyanogenMod:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0

Use the following local manifest:

    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
      <project name="fefifofum/android_device_lge_awifi" path="device/lge/awifi" revision="cm-11.0" />
      <project name="fefifofum/android_kernel_lge_awifi" path="kernel/lge/awifi" revision="cm-11.0" />
      <project name="fefifofum/proprietary_vendor_lge" path="vendor/lge" revision="cm-11.0" />
    </manifest>

Sync and build:

    repo sync -j4
    vendor/cm/get-prebuilts
    . build/envsetup.sh
    brunch awifi

