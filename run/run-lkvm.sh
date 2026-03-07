./lkvm run \
  -k Image \
  -d noble-base-arm64-small.img \
  -m 256 \
  -c 2 \
  --console serial \
  -i initrd.img \
  -p "root=/dev/vda rw console=ttyS0"
