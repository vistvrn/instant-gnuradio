.PHONY: clean all base gnuradio

all: vms/gnuradio/instant-gnuradio.ova

gnuradio: vms/gnuradio/instant-gnuradio.ova

base: vms/base/instant-gnuradio-base.ova

vms/base/instant-gnuradio-base.ova: base.json scripts/setup-base.sh scripts/init-base.sh
	packer build --force base.json

<<<<<<< HEAD
vms/gnuradio/instant-gnuradio.ova: gnuradio.json assets/opencl_runtime_16.1.2_x64_rh_6.4.0.37.tgz vms/base/instant-gnuradio-base.ova scripts/setup-gnuradio.sh
	packer build --force gnuradio.json

assets/opencl_runtime_16.1.2_x64_rh_6.4.0.37.tgz:
	cd assets && wget http://registrationcenter-download.intel.com/akdlm/irc_nas/12556/opencl_runtime_16.1.2_x64_rh_6.4.0.37.tgz

clean:
	rm -fr vms
	rm -fr packer_cache
	rm -rf assets/opencl_runtime_16.1.2_x64_rh_6.4.0.37.tgz
=======
vms/gnuradio/instant-gnuradio.ova: gnuradio.json assets/l_opencl_p_18.1.0.015.tgz vms/base/instant-gnuradio-base.ova scripts/setup-gnuradio.sh
	packer build --force gnuradio.json

 assets/l_opencl_p_18.1.0.015.tgz:
	cd assets && wget https://www.fleark.de/l_opencl_p_18.1.0.015.tgz

clean:
	rm -rf vms
	rm -rf packer_cache
	rm -rf assets/l_opencl_p_18.1.0.015.tgz
>>>>>>> 4028291728e88cf99dc7aa84ce376c3d28be6e42
