USB_PATH ?=
USB_PATH_MSG := "Error: USB_PATH is required. Please provide the path to your mounted USB drive"

all: docs base pynq usb

.PHONY: docs

docs:
	$(MAKE) -C ./docs html

image: base pynq

base:
	$(MAKE) -C ./Pluto/base/system
	cp ./Pluto/base/system/pluto.runs/impl_1/system_top.bit ./Pluto/base/system_top.bit
	cp ./Pluto/base/system/pluto.gen/sources_1/bd/system/hw_handoff/system.hwh ./Pluto/base/system.hwh
	cp ./Pluto/base/system/pluto.sdk/system_top.xsa ./Pluto/petalinux_bsp/hardware_project/system_top.xsa

pynq:
	cp -r ./Pluto ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=Pluto

usb:
	ifndef USB_PATH
		@echo $(USB_PATH_MSG)
		@exit 1
	else
		cp ./PYNQ/sdbuild/prebuilt/pynq_rootfs.arm.tar.gz $(USB_PATH)
		tar -xzf $(USB_PATH)/pynq_rootfs.arm.tar.gz -C $(USB_PATH)
		rm $(USB_PATH)/pynq_rootfs.arm.tar.gz
		cp ./PYNQ/sdbuild/build/Pluto/system.dtb $(USB_PATH)
		cp ./PYNQ/sdbuild/build/Pluto/zImage $(USB_PATH)
		split -b 3500000 $(USB_PATH)/zImage $(USB_PATH)/zImage_
	endif

clean:
	rm -rf ./Pluto/base/system/.Xil ./Pluto/base/system/pluto.* ./Pluto/base/system/pluto.xpr ./Pluto/base/system/*.log ./Pluto/base/system/*.jou
	rm -rf ./PYNQ/boards/Pluto
	$(MAKE) -C ./PYNQ/sdbuild clean