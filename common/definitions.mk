# This file contains common variables and functions

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/target.mk # for BOARD_EXTENDED

MTK_MODEM_PREBUILT_DIR_TOP := $(TOPDIR)/../mtk/prebuilt/modem

# Get the path of prebuilt modem direcoty. If CONFIG_MTK_MODEM_BIN_DIR is not
# empty, it is used, otherwise search it with predefined policies.
define get-modem-bin-dir
$(strip \
  $(if $(call qstrip,$(CONFIG_MTK_MODEM_BIN_DIR)), \
    $(call qstrip,$(CONFIG_MTK_MODEM_BIN_DIR)), \
    $(firstword \
      $(wildcard \
        $(MTK_MODEM_PREBUILT_DIR_TOP)/$(BOARD_EXTENDED)_internal/$(SUBTARGET) \
        $(MTK_MODEM_PREBUILT_DIR_TOP)/$(BOARD_EXTENDED)/$(SUBTARGET) \
      ) \
    ) \
  ) \
)
endef
