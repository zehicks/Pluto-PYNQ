Development Narrative
=====================

Kernel Configuration
--------------------

The PYNQ build flow supports the use of an existing PetaLinux BSP, so the necessary Linux kernel features for the AD9364 transceiver can be configured in the BSP, and then the sdbuild flow can add the PYNQ requirements for the full image.

Required Kernel Modules
^^^^^^^^^^^^^^^^^^^^^^^

The AD9364 uses both SPI and I2C interfaces for communication with a processor, so these features were enabled in the PetaLinux kernel. Kernel support for the RTL8153 network adapter was also enabled, because the TP-Link USB hub/network adapter that was used contains this chip.

AD9364 Support
^^^^^^^^^^^^^^

Using the AD9364 tranceiver from Linux requires both kernel IIO drivers and a device-specific kernel driver. The IIO drivers are in mainline Linux and are already present in the PetaLinux kernel, but the AD9364 drivers are not. Support for the AD9364 kernel modules and drivers is enabled using the Analog Devices ``meta-adi`` yocto layer. PYNQ relies on the FPGA manager framework, so no FPGA bitstream is loaded upon boot. Without the base bitstream loaded, the AXI interfaces for communication with the AD9364 are not present, and the kernel boot will hang. To avoid this, the AD9364 must be loaded as a device tree overlay with the base bitstream.

Booting
-------

The first step to enabling PYNQ support on the Pluto was solving the boot problem. The PlutoSDR only has 32 MB of on-board flash memory, which is much too small for the full PYNQ Ubuntu root filesystem. The PlutoSDR also does not have an SD card slot, so the only remaining boot options were USB or netboot. USB was selected because it seemed simpler than trying to enable netboot over a USB ethernet adapter, since the PlutoSDR also does not have an ethernet port. 

The U-Boot configuration in the ADI PlutoSDR firmware has Flattened Image Tree (FIT) USB support enabled, so changes to the stock U-Boot firmware were not required. The PYNQ build process results in an SD card image, but the required FIT artifacts are available in the ``./PYNQ/sdbuild/build/`` directory:

+---------------------------------------+-------------------------------+
| Boot Component                        | Description                   |
+=======================================+===============================+
| ./PYNQ/sdbuild/build/Pluto/zImage     | Compressed Linux kernel image |
+---------------------------------------+-------------------------------+
| ./PYNQ/sdbuild/build/Pluto/system.dtb | Base device tree binary       |
+---------------------------------------+-------------------------------+
| ./PYNQ/sdbuild/build/Pluto.tar.gz     | Ubuntu root filesystem        |
+---------------------------------------+-------------------------------+

These files can be loaded onto a USB drive and connected to the Pluto via a USB hub and OTG adapter. From the U-Boot console, the USB interface is enabled and the kernel image and device tree are loaded into RAM. The kernel boot arguments are modified to ensure that the USB root filesystem is selected (``/dev/sda``).

Root Filesystem Applications
----------------------------

Communication with the AD9364 is done using the Analog Devices IIO framework. Support for IIO from the PYNQ root filesystem was added through an additional package. A problem was found when trying to use ``apt`` to install libiio, so the armhf ``.deb`` files for libiio and its dependencies were downloaded directly and installed instead. The Python bindings for libiio were also installed using the ``pylibiio`` and ``pyadi-iio`` packages from ``pip``.