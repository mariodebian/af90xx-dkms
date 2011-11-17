
dvb-usb-objs = dvb-usb-firmware.o dvb-usb-init.o dvb-usb-urb.o dvb-usb-i2c.o dvb-usb-dvb.o dvb-usb-remote.o usb-urb.o

obj-$(CONFIG_DVB_USB) += dvb-usb.o

dvb-core-objs := dvbdev.o dmxdev.o dvb_demux.o dvb_filter.o     \
                 dvb_ca_en50221.o dvb_frontend.o                \
                 dvb_net.o dvb_ringbuffer.o dvb_math.o

dvb-usb-af9035-objs = af9035.o

obj-$(CONFIG_DVB_CORE) += dvb-core.o

obj-m += af9033.o
obj-m += tua9001.o
obj-m += mxl5007t.o
obj-m += dvb-usb-af9035.o




