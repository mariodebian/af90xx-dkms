#
# Makefile for the kernel multimedia device drivers.
#

CONFIG_DVB_USB_AF9035=m
#CONFIG_DVB_USB_AF9015=m
#CONFIG_DVB_AF9013=m
CONFIG_MEDIA_TUNER_TUA9001=m
#CONFIG_DVB_AF9013=m
CONFIG_DVB_USB_DEBUG=y
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_DVB_AF9033=m

EXTRA_CFLAGS += -DCONFIG_DVB_USB_DEBUG=y -DCONFIG_MEDIA_TUNER_MXL5007T=m -DCONFIG_MEDIA_TUNER_TUA9001=n

obj-m += dvb/


#EXTRA_CFLAGS += -include include/linux/version.h

KVERS:=$(shell uname -r)
KDIR=/lib/modules/$(KVERS)/updates/af9035/

build:
	make -C /lib/modules/$(KVERS)/build SUBDIRS=`pwd` modules

clean:
	make -C /lib/modules/$(KVERS)/build SUBDIRS=`pwd` clean



install:
	mkdir -p $(DESTDIR)/$(KDIR)
	@for mod in `find -name "*ko"`; do \
		#/sbin/modinfo $$mod ;\
		#echo "------------------------------------------------------------------------" ;\
		echo install -m 644 $$mod $(DESTDIR)/$(KDIR) ;\
		install -m 644 $$mod $(DESTDIR)/$(KDIR) ;\
	done

test: clean build
	rm -rf tmp
	make install DESTDIR=`pwd`/tmp
