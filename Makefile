USB_PATH ?=
USB_PATH_MSG := "Error: USB_PATH is required. Please provide the path to your mounted USB drive"

all: docs base pynq usb

.PHONY: docs

docs:
	rm -rf ./docs/build
	$(MAKE) -C ./docs html

image: base pynq

base:
	$(MAKE) -C ./PlutoSDR/base/system
	cp ./PlutoSDR/base/system/pluto.runs/impl_1/system_top.bit ./PlutoSDR/base/system_top.bit
	cp ./PlutoSDR/base/system/pluto.gen/sources_1/bd/system/hw_handoff/system.hwh ./PlutoSDR/base/system.hwh
	cp ./PlutoSDR/base/system/pluto.sdk/system_top.xsa ./PlutoSDR/base/system_top.xsa
	python3 fpga-bit-to-bin.py ./PlutoSDR/base/system_top.bit ./PlutoSDR/base/system_top.bit.bin

pynq/kernel:
	rm -rf ./PYNQ/boards/PlutoSDR
	cp -r ./PlutoSDR ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=PlutoSDR boot_files
 
pynq:
	rm -rf ./PYNQ/boards/PlutoSDR
	cp -r ./PlutoSDR ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=PlutoSDR

usb:
	@[ "${USB_PATH}" ] || ( echo $(USB_PATH_MSG); exit 1 )
	sudo rm -rf $(USB_PATH)/*
	sudo cp ./PYNQ/sdbuild/build/PlutoSDR.tar.gz $(USB_PATH)
	sudo tar -xzvf $(USB_PATH)/PlutoSDR.tar.gz -C $(USB_PATH)
	sudo rm $(USB_PATH)/PlutoSDR.tar.gz
	sudo cp ./PlutoSDR/base/system_top.bit.bin $(USB_PATH)
	sudo cp ./PYNQ/sdbuild/output/boot/PlutoSDR/image.ub $(USB_PATH)
	sudo split -b 3850000 $(USB_PATH)/image.ub $(USB_PATH)/image.ub_

clean:
	rm -rf ./PlutoSDR/base/system/.Xil ./PlutoSDR/base/system/pluto.* ./PlutoSDR/base/system/pluto.xpr ./PlutoSDR/base/system/*.log ./PlutoSDR/base/system/*.jou
	rm -rf ./PYNQ/boards/PlutoSDR
	$(MAKE) -C ./PYNQ/sdbuild clean

clean/base:
	rm -rf ./PlutoSDR/base/system/.Xil ./PlutoSDR/base/system/pluto.* ./PlutoSDR/base/system/pluto.xpr ./PlutoSDR/base/system/*.log ./PlutoSDR/base/system/*.jou
	rm -rf ./PYNQ/boards/PlutoSDR

clean/pynq:
	$(MAKE) -C ./PYNQ/sdbuild clean