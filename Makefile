ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Label

Label_FILES = Tweak.xm
Label_CFLAGS = -fobjc-arc
Label_EXTRA_FRAMEWORKS = Cephei 

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += labelprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
