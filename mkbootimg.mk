LOCAL_PATH := $(call my-dir)

BUMP := $(LOCAL_PATH)/bump.py

## Overload bootimg generation: Same as the original, + BUMP
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	$(hide) $(BUMP) $@ $@
	@echo "Made boot image: $@"

## Overload recoveryimg generation: Same as the original, + BUMP
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	$(call build-recoveryimage-target, $@)
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	$(hide) $(BUMP) $@ $@
	@echo "Made recovery image: $@"
