Building the PYNQ Image
=======================

The build process is tested on Ubuntu 20.04. Unless otherwise specified, the build commands expect to be run from the repository root directory (``Pluto-PYNQ/``).

Installing Xilinx Tools
-----------------------

The PYNQ v3.0 release requires the use of Xilinx tools v2022.1. This includes Vivado, Vitis, PetaLinux, and Bootgen. After installing the Xilinx tools, add the following lines to your ``.bashrc`` file and run ``source .bashrc`` to apply the changes.  These paths assume that you have installed the Xilinx tools to the default locations. If you installed them to a different directory, update the paths as appropriate for your system.

.. code-block:: console
    
    alias vivado="/tools/Xilinx/Vivado/2022.1/bin/vivado -log /tmp/vivado.log -journal /tmp/vivado.jou"
    alias vitis="/tools/Xilinx/Vitis/2022.1/bin/vitis"
    source /tools/Xilinx/Vivado/2022.1/settings64.sh
    source /tools/Xilinx/Vitis/2022.1/settings64.sh
    source /tools/Xilinx/PetaLinux/2022.1/settings.sh
    export VIVADO_VERSION=v2022.1

Also install the necessary cable drivers for communicating with the Zynq SoC via JTAG, if desired. This step is not necessary for booting the PYNQ image, but is required if the boot process fails and the Pluto needs to be recovered via the `ADI device unbricking process <https://wiki.analog.com/university/tools/pluto/devs/fpga>`_.

.. code-block:: console

    cd /tools/Xilinx/Vivado/2022.1/data/xicom/cable_drivers/lin64/install_script/install_drivers
    sudo ./install_drivers

The ADI Pluto firmware build process expects that the Xilinx tools are installed in ``/opt``. The Xilinx tools install to ``/tools`` by default, so create a symlink in ``/opt`` to the installation directory.

.. code-block:: console

    sudo mkdir -p /opt/Xilinx/Vivado/v2022.1/
    sudo ln -s /tools/Xilinx/Vivado/2022.1/* /opt/Xilinx/Vivado/v2022.1/

Installing PYNQ Dependencies
----------------------------

A host setup script is provided to install the PYNQ dependencies, add the dependencies to ``$PATH``, and download the prebuilt root filesystem and source distribution from the `PYNQ Development Boards webpage <http://www.pynq.io/board.html/>`_.

.. code-block:: console
    
    ./setup_pynq.sh

Building the Base Image
-----------------------

The Pluto-PYNQ Linux image can be built by running the following command from the project root directory:

.. code-block:: console

    make image