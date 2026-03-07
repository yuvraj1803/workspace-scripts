set -e
mkdir -p root
mount rootfs/noble-base-arm64.img root
cd root/root
rm -rf *
cp -r ../../rootfs/shared/. .
cd ../../
umount root
rm -rf root
exit
