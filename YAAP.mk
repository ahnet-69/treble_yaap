$(call inherit-product, vendor/yaap/config/common_full_phone.mk)
$(call inherit-product, vendor/yaap/config/BoardConfigSoong.mk)
$(call inherit-product, vendor/yaap/config/BoardConfigYAAP.mk)
$(call inherit-product, device/lineage/sepolicy/common/sepolicy.mk)
-include vendor/yaap/build/core/config.mk

TARGET_BOOTANIMATION_RES := 1080

PRODUCT_PACKAGES += \
  OpenEUICC \
