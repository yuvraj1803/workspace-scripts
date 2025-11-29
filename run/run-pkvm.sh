qemu-system-aarch64 \
-M virt,virtualization=on,gic-version=3 \
-cpu cortex-a72 \
-m 4G \
-smp 2  \
--drive file=buildroot/output/images/rootfs.ext2,if=none,format=raw,id=hd0 \
--device virtio-blk-device,drive=hd0 \
--kernel linux/arch/arm64/boot/Image \
--nographic \
--serial mon:stdio \
--append "kvm-arm.mode=protected rootwait nokaslr root=/dev/vda rw init=/sbin/init console=ttyAMA0"

