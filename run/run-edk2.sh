qemu-system-aarch64 \
-M virt \
-cpu cortex-a72 \
-m 128M \
-smp 2  \
--drive file=rootfs/noble-base-arm64.img,if=none,format=raw,id=hd0 \
--device virtio-blk-device,drive=hd0 \
--kernel linux/arch/arm64/boot/Image \
-bios edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd \
--nographic \
--serial mon:stdio \
--append "rootwait nokaslr root=/dev/vda rw init=/bin/bash console=ttyAMA0"

