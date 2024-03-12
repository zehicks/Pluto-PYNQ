Building
========

The build process is tested on Ubuntu 20.04.

Installing Xilinx Tools
-----------------------

The PYNQ v3.0 release requires the use of Xilinx tools v2022.1. This includes Vivado, Vitis, and PetaLinux. After installing the Xilinx tools, add the following lines to your ``.bashrc`` file and run ``source .bashrc`` to apply the changes.

.. code-block:: console
    
    alias vivado="/tools/Xilinx/Vivado/2022.1/bin/vivado -log /tmp/vivado.log -journal /tmp/vivado.jou"
    alias vitis="/tools/Xilinx/Vitis/2022.1/bin/vitis"
    source /tools/Xilinx/Vivado/2022.1/settings64.sh
    source /tools/Xilinx/Vitis/2022.1/settings64.sh
    source /tools/Xilinx/PetaLinux/2022.1/settings.sh

Installing PYNQ Dependencies
----------------------------

 A script is provided to run the PYNQ host setup script ``./PYNQ/sdbuild/scripts/setup_host.sh`` and download the prebuilt root filesystem and source distribution from the `PYNQ Development Boards webpage <http://www.pynq.io/board.html/>`_.

.. code-block:: console
    
    chmod +x ./setup_pynq.sh
    ./setup_pynq.sh

Building the Base Image
-----------------------

The Pluto-PYNQ image can be built by running ``make`` from the project root directory.  First, the base Vivado project will be built in the board directory (``./Pluto/base``), and then the board directory will be copied into ``./PYNQ/sdbuild/boards`` to build the PYNQ image.

+-----------------------------------------------------------------+
|                             Make Targets                        |
+=============+====================+==============================+
|   ``all``   | Builds the base Vivado project and the PYNQ image |
+-------------+--------------------+------------------------------+
|   ``base``  | Builds the base Vivado project                    |
+-------------+--------------------+------------------------------+
|   ``pynq``  | Builds the PYNQ image in ``./PYNQ/sdbuild/output``|
+-------------+--------------------+------------------------------+
