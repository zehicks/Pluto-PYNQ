ADI PlutoSDR Firmware
=====================

The PlutoSDR firmware supported by ADI is included as a git submodule in this repo. The stock firmware has been left as unmodified as possible, but certain changes were necessary in the u-boot environment to support booting PYNQ over USB. Support for updating the device firmware using ``dfu-util`` is unchanged, so the stock firmware can be reloaded at any time.

Note that v0.38 of the ADI firmware expects that you are using Xilinx tools v2022.2, but no incompabilities have been found with v2022.1. Setting the ``$VIVADO_VERSION`` environment variable avoids errors in the ADI Makefiles.

Rebuilding U-Boot
-----------------

To rebuild the u-boot environment, first ensure that you have followed the :ref:`Installing Xilinx Tools` instructions. Then, run the following commands:

.. code-block:: console
    
    cd ./plutosdr-fw
    make build/boot.dfu

To install the u-boot updates on the Pluto, use ``dfu-util``:

.. code-block:: console

    cd ./plutosdr-fw/build
    sudo dfu-util -a boot.dfu -D ./boot.dfu
