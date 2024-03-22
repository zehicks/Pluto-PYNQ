Makefile Targets
================

This page is provided as a reference to describe the steps completed for each target in the Makefile.

+--------------+---------------------------------------------------------------------------------------+-------------------------------------+
| Make Targets |                                 Description                                           |          Output Directory           |
+==============+=======================================================================================+=====================================+
| ``all``      | Builds the base Vivado project and the PYNQ image and copies the image to a USB drive | ``<USB MOUNT LOCATION>``            |
+--------------+---------------------------------------------------------------------------------------+-------------------------------------+
| ``image``    | Builds the base Vivado project and the PYNQ image                                     | ``./PYNQ/sdbuild/output``           |
+--------------+---------------------------------------------------------------------------------------+-------------------------------------+
| ``base``     | Builds the base Vivado project                                                        | ``./PYNQ/boards/Pluto/base/system`` |
+--------------+---------------------------------------------------------------------------------------+-------------------------------------+
| ``pynq``     | Builds the PYNQ image                                                                 | ``./PYNQ/sdbuild/output``           |
+--------------+---------------------------------------------------------------------------------------+-------------------------------------+
| ``usb``      | Loads the boot image onto a USB drive                                                 | ``<USB MOUNT LOCATION>``            |
+--------------+---------------------------------------------------------------------------------------+-------------------------------------+

``make USB_PATH=</PATH/TO/USB/MOUNT>``
--------------------------------------

The default ``make`` target will generate the base Vivado project, the PYNQ image, and set up a USB drive as a boot medium.

``make image``
--------------

The ``image`` target will generate the base Vivado project and the PYNQ image.

``make base``
-------------

The ``base`` target first builds the original PlutoSDR FPGA design from ADI in the directory ``Pluto/base/system``.

.. code-block:: console

    $(MAKE) -C ./Pluto/base/system

Next, the output files are copied into the directory structure expected by the PYNQ build process.

.. code-block :: text

    Pluto/
    ├── base
    │   ├── __init__.py
    │   ├── system
    │   ├── system.hwh
    │   └── system_top.bit
    ├── petalinux_bsp
    │   └── hardware_project
    │       └── system_top.xsa
    └── Pluto.spec

.. code-block:: console

    cp ./Pluto/base/system/pluto.runs/impl_1/system_top.bit ./Pluto/base/system_top.bit
	cp ./Pluto/base/system/pluto.gen/sources_1/bd/system/hw_handoff/system.hwh ./Pluto/base/system.hwh
	cp ./Pluto/base/system/pluto.sdk/system_top.xsa ./Pluto/petalinux_bsp/hardware_project/system_top.xsa

``make pynq``
-------------

The ``pynq`` target first copies the ``./Pluto`` directory into ``./PYNQ/boards``, and then runs the PYNQ makefile for the Pluto board.

.. code-block:: console

    cp -r ./Pluto ./PYNQ/boards
	$(MAKE) -C ./PYNQ/sdbuild BOARDS=Pluto

The PYNQ build process appears to support pointing to a board directory that is not in the ``./PYNQ/boards`` directory, but attempting that build process resulted in errors. Copying the full directory in was selected as the simplest solution.

``make usb USB_PATH=</PATH/TO/USB/MOUNT>``
------------------------------------------

The ``usb`` target will set up a USB drive as a PYNQ bootstick. First, the prebuilt PYNQ root filesystem is copied to and extracted on the USB drive:

.. code-block:: console

    cp ./PYNQ/sdbuild/prebuilt/pynq_rootfs.arm.tar.gz $(USB_PATH)
	tar -xzf $(USB_PATH)/pynq_rootfs.arm.tar.gz -C $(USB_PATH)
	rm $(USB_PATH)/pynq_rootfs.arm.tar.gz

Next, the compressed kernel and devicetree blob are also copied to the root of the USB drive:

.. code-block:: console

    cp ./PYNQ/sdbuild/build/Pluto/zImage /media/<USER>/<USB_DRIVE>
    cp ./PYNQ/sdbuild/build/Pluto/system.dtb /media/<USER>/<USB_DRIVE>

The default u-boot on the Pluto times out when copying large files over USB, so the compressed kernel image must be split into two parts on the USB drive using the following command:

.. code-block:: console

    cd /media/<USER>/<USB_DRIVE>
    split -b 3500000 zImage zImage_

The two components of the compressed kernel are called ``zImage_aa`` and ``zImage_ab``.

``make clean``
--------------

The ``clean`` target will remove all build artifacts from the project.

