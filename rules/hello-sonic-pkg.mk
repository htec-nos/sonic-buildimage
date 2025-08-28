# Debian package (no global inclusion here)
HELLO_PKG_NAME = hello-sonic-pkg
HELLO_PKG_VERSION = 0.1.0-1

HELLO_PKG = $(HELLO_PKG_NAME)_$(HELLO_PKG_VERSION)_$(CONFIGURED_ARCH).deb
$(HELLO_PKG)_SRC_PATH = $(SRC_PATH)/hello-sonic-pkg

SONIC_DPKG_DEBS += $(HELLO_PKG)