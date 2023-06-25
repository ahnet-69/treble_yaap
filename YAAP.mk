$(call inherit-product, vendor/yaap/config/common_full_phone.mk)
$(call inherit-product, vendor/yaap/config/BoardConfigSoong.mk)
$(call inherit-product, vendor/yaap/config/BoardConfigYAAP.mk)
$(call inherit-product, device/lineage/sepolicy/common/sepolicy.mk)
-include vendor/yaap/build/core/config.mk

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL_IMAGE := true
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR := true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	persist.sys.binary_xml=false \
	dalvik.vm.dex2oat64.enabled=true \

PRODUCT_PACKAGES += \
  OpenEUICC \
