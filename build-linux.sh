cd linux
make defconfig
make -j$(nproc) Image
