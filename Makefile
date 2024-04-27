USB_PATH ?=
USB_PATH_MSG := "Error: USB_PATH is required. Please provide the path to your mounted USB drive"

all: docs base pynq usb

.PHONY: docs

docs:
	rm -rf ./docs/build
	$(MAKE) -C ./docs html

image: base pynq

base:
	$(MAKE) -C ./Pluto/base/system
	cp ./Pluto/base/system/pluto.runs/impl_1/system_top.bit ./Pluto/base/system_top.bit
	cp ./Pluto/base/system/pluto.gen/sources_1/bd/system/hw_handoff/system.hwh ./Pluto/base/system.hwh
	cp ./Pluto/base/system/pluto.sdk/system_top.xsa ./Pluto/petalinux_bsp/hardware_project/system_top.xsa
	python3 fpga-bit-to-bin.py ./Pluto/base/system_top.bit ./Pluto/base/system_top.bit.bin

pynq/kernel:
	rm -rf ./PYNQ/boards/Pluto
	cp -r ./Pluto ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=Pluto boot_files
 

pynq:
	rm -rf ./PYNQ/boards/Pluto
	cp -r ./Pluto ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=Pluto

usb:
	@[ "${USB_PATH}" ] || ( echo $(USB_PATH_MSG); exit 1 )
	sudo rm -rf $(USB_PATH)/*
	cp ./PYNQ/sdbuild/build/Pluto.tar.gz $(USB_PATH)
	sudo tar -xzvf $(USB_PATH)/Pluto.tar.gz -C $(USB_PATH)
	rm $(USB_PATH)/Pluto.tar.gz
	sudo cp ./Pluto/base/system_top.bit.bin $(USB_PATH)
	sudo cp ./PYNQ/sdbuild/build/Pluto/system.dtb $(USB_PATH)
	sudo cp ./PYNQ/sdbuild/build/Pluto/zImage $(USB_PATH)
	sudo split -b 3700000 $(USB_PATH)/zImage $(USB_PATH)/zImage_

clean:
	rm -rf ./Pluto/base/system/.Xil ./Pluto/base/system/pluto.* ./Pluto/base/system/pluto.xpr ./Pluto/base/system/*.log ./Pluto/base/system/*.jou
	rm -rf ./PYNQ/boards/Pluto
	$(MAKE) -C ./PYNQ/sdbuild clean

clean/base:
	rm -rf ./Pluto/base/system/.Xil ./Pluto/base/system/pluto.* ./Pluto/base/system/pluto.xpr ./Pluto/base/system/*.log ./Pluto/base/system/*.jou
	rm -rf ./PYNQ/boards/Pluto

clean/pynq:
	$(MAKE) -C ./PYNQ/sdbuild clean