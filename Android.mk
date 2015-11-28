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

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),awifi)

include $(call all-makefiles-under,$(LOCAL_PATH))

# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
    ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
        $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

# Create a link for the WCNSS nv file ended with "init", which is
# required for initial wifi startup
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
    ln -sf /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
        $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_init.bin)

endif
