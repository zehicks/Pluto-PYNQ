base:
	$(MAKE) -C ./Pluto/base/system
	cp ./Pluto/base/system/pluto.runs/impl_1/system_top.bit ./Pluto/base/system_top.bit
	cp ./Pluto/base/system/pluto.gen/sources_1/bd/system/hw_handoff/system.hwh ./Pluto/base/system.hwh
	cp ./Pluto/base/system/pluto.sdk/system_top.xsa ./Pluto/petalinux_bsp/hardware_project/system_top.xsa