export ARCHS = arm64 arm64e

DEBUG = O
#FINALPACKAGE = 1

TARGET := iphone:clang:latest:latest

INSTALL_TARGET_PROCESSES = SpringBoard


THEOS_DEVICE_IP = 192.168.0.7
#THEOS_DEVICE_IP = 192.168.0.12

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Arizona

Arizona_FILES = Tweak.x
Arizona_CFLAGS = -fobjc-arc
Arizona_FRAMEWORKS = UIKit

SUBPROJECTS += ArizonaPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

include $(THEOS_MAKE_PATH)/tweak.mk