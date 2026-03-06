qemu-system-aarch64 \
-M virt,virtualization=on,gic-version=3 \
-cpu cortex-a72 \
-m 128M \
-smp 2  \
--drive file=rootfs/noble-base-arm64.img,if=none,format=raw,id=hd0 \
--device virtio-blk-device,drive=hd0 \
--kernel linux/arch/arm64/boot/Image \
--nographic \
--serial mon:stdio \
--append "kvm-arm.mode=protected rootwait nokaslr root=/dev/vda rw init=/bin/bash console=ttyAMA0"

