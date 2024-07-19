FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg \
                   file://0001-add-support-for-adi-linux-kernel.patch "
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2024-07-17-03-16-00.cfg \
            file://adi.cfg \
            "