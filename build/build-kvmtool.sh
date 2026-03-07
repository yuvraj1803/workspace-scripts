cd kvmtool

make -j$(nproc) LIBFDT_DIR=/usr/lib/aarch64-linux-gnu/ LDFLAGS="-static"

cp lkvm ../rootfs/shared/
