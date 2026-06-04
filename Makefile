TARGET := iphone:clang:7.0:5.0
INSTALL_TARGET_PROCESSES = AppStore


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Tetoris

Tetoris_FILES = Tweak.x logging.x validation.x
Tetoris_CFLAGS = -fno-objc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
