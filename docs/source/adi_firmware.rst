ADI PlutoSDR Firmware
=====================

The PlutoSDR firmware supported by ADI is included as a git submodule in this repo. The stock firmware has been left as unmodified as possible, but certain changes were necessary in the u-boot environment to support booting PYNQ over USB. Support for updating the device firmware using ``dfu-util`` is unchanged, so the stock firmware can be reloaded at any time.

Before attempting to rebuild the firmware, ensure that you have followed the :ref:`Installing Xilinx Tools` instructions. Note that v0.38 of the ADI firmware expects that you are using Xilinx tools v2022.2, but no incompabilities have been found with v2022.1. Setting the ``$VIVADO_VERSION`` environment variable avoids errors in the ADI Makefiles.

On Ubuntu 20.04, the following dependencies need to be modified for the Pluto firmware build to complete.

.. code-block:: console

    sudo apt remove libfdt-dev
    sudo apt install libmpc-dev

The following instructions are referenced from the `ADI DFU Update webpage <https://wiki.analog.com/university/tools/pluto/users/firmware#dfu_update>`_.

Rebuilding Pluto Firmware
-------------------------

To rebuild the Pluto firmware, run the following commands:

.. code-block:: console
    
    cd ./plutosdr-fw
    make

Rebuilding U-Boot
-----------------

To rebuild the u-boot environment, run the following commands:

.. code-block:: console
    
    cd ./plutosdr-fw
    make build/boot.dfu

Installing Updates
------------------

Firmware updates are installed on the Pluto using ``dfu-util``. From the Pluto Linux console, run the following command to enter DFU mode:

.. code-block:: console

    device_reboot sf

DFU mode can also be enabled from the U-Boot console using ``run dfu_sf``.

Next, perform the firmware update from your host computer:

.. code-block:: console

    sudo dfu-util -a firmware.dfu -D ./plutosdr-fw/build/pluto.dfu

Or, perform a U-Boot update:

.. code-block:: console

    sudo dfu-util -a boot.dfu -D ./plutosdr-fw/build/boot.dfu