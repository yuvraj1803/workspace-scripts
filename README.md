This is the expected workspace structure. Ofcourse, this is just an example.
You can add more components like: TF-A, TF-RMM, etc. but keep this structure intact.

workspace-scripts should be run from the workspace.
Like this:
	$ pwd
	~/workspace
	
	$ ./workspace-scripts/run/run-linux.sh
	$ ./workspace-scripts/build/build-linux.sh

	workspace
	├── awesome_tools
	├── deltaV
	├── gitToken
	├── hpc
	├── kvmtool
	├── linux
	├── omega
	├── rootfs
	└── workspace-scripts


Some scripts like ./workspace-scripts/misc/mount-shared.sh expect rootfs/
folder to be structure like this:

	workspace/rootfs/
	├── noble-base-arm64.img
	└── shared
	    ├── Image
	    ├── initrd.img
	    ├── lkvm
	    ├── noble-base-arm64-small.img
	    └── run-lkvm.sh

The shared/ folder goes into the rootfs image (noble-base-arm64.img).

This is to simplify how we share files into the QEMU machine.

---
