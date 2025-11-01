cd linux-guest
make defconfig
make -j$(nproc) Image
cp arch/arm64/boot/Image ../shared
