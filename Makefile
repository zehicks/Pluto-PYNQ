all: base pynq

base:
	$(MAKE) -C ./Pluto/base/system
	cp ./Pluto/base/system/pluto.runs/impl_1/system_top.bit ./Pluto/base/system_top.bit
	cp ./Pluto/base/system/pluto.gen/sources_1/bd/system/hw_handoff/system.hwh ./Pluto/base/system.hwh
	cp ./Pluto/base/system/pluto.sdk/system_top.xsa ./Pluto/petalinux_bsp/hardware_project/system_top.xsa

pynq:
	cp -r ./Pluto ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=Pluto

clean:
	rm -rf ./Pluto/base/system/.Xil ./Pluto/base/system/pluto.* ./Pluto/base/system/pluto.xpr ./Pluto/base/system/*.log ./Pluto/base/system/*.jou
	rm -rf ./PYNQ/boards/Pluto
	$(MAKE) -C ./PYNQ/sdbuild clean