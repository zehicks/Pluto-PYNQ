FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg"
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2024-04-26-22-56-00.cfg \
            file://user_2024-04-27-15-59-00.cfg \
            file://user_2024-04-28-01-26-00.cfg \
            file://user_2024-04-28-02-44-00.cfg \
            "

