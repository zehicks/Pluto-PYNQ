Loading the PYNQ Image
======================

Ensure that you have followed the :ref:`Installing PYNQ Dependencies` and :ref:`Building the Base Image` steps before trying to load the image.

USB Drive Setup
---------------

Format a 32 GB USB drive as ``ext4`` with no partition table using the following command. You may choose any name you'd like for ``<VOLUME_NAME>``.

.. code-block:: console
    
    sudo mkfs.ext4 -L <VOLUME_NAME> /dev/<YOUR_DEVICE>

Then, remount the drive and run the following commands to copy the root filesystem and boot components to the drive. Extracting the root filesystem will take time, so be patient while it runs.

.. code-block:: console

    make usb USB_PATH=<PATH/TO/YOUR/MOUNT>

Booting from USB in U-Boot
--------------------------

To access the u-boot console on the Pluto, use the following steps:

1. Connect to the Pluto using a USB-JTAG adapter and your serial terminal of choice (Minicom, screen, tio, etc.).  For example, ``sudo screen /dev/ttyUSB0 115200``
2. Log into the Pluto's Linux console using the username "root" and default password "analog"
3. Run ``device_reboot break`` to reboot the device and halt at the u-boot console

From the u-boot console, paste in the following command and press enter to start the boot process.

.. code-block:: console

    usb start && load usb 0 ${fit_load_address} zImage_aa && load usb 0 0x23d67e0 zImage_ab && load usb 0 ${devicetree_load_address} system.dtb && setenv bootargs "console=ttyPS0,115200n8 root=/dev/sda rw rootfstype=ext4 mem=512M rootwait" && bootz ${fit_load_address} - ${devicetree_load_address}

This command executes the following steps:

1. Start the USB subsystem
2. Load both parts of the compressed kernel image into RAM at contiguous memory addresses
3. Load the device tree blob into RAM
4. Configure the boot arguments for booting from USB
5. Boot using the loaded kernel image and device tree
