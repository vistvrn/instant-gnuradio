#!/bin/bash

set -eux

export LANG=en_US.UTF-8
export PATH="$HOME/.local/bin:${PATH}"

cd
sudo mv 90-usrp.conf /etc/sysctl.d/
sudo apt update

<<<<<<< HEAD
sudo apt -y install ipython python-matplotlib python-ipython python-scipy python-numpy python-pip python-qwt5-qt4 python-wxgtk3.0 multimon sox

### PYBOMBS
pip install pybombs
=======
cd
echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib' >> .profile
echo 'export PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python3/dist-packages' >> .profile
echo 'export PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python3/site-packages' >> .profile
echo 'export PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python3.8/dist-packages' >> .profile
echo 'export PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python3.8/site-packages' >> .profile

cd /tmp
sudo mkdir /tmp/isomount
sudo mount -t iso9660 -o loop /home/gnuradio/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
yes | sudo /tmp/isomount/VBoxLinuxAdditions.run || echo
>>>>>>> 4028291728e88cf99dc7aa84ce376c3d28be6e42

# Cleanup
sudo umount isomount
sudo rm -rf isomount /home/gnuradio/VBoxGuestAdditions.iso

echo "gnuradio - rtprio 99" | sudo tee -a /etc/security/limits.conf
sudo apt-get update
sudo apt-get -y upgrade

<<<<<<< HEAD
### LIBIIO
pybombs config --package libiio gitrev master
echo -e "      vars:\n        config_opt: ' -DWITH_IIOD:BOOL=OFF -DINSTALL_UDEV_RULE:BOOL=OFF '" >> /home/gnuradio/.pybombs/config.yml
pybombs -v install libiio
sudo mv 53-adi-plutosdr-usb.rules /etc/udev/rules.d/

### LIBAD9361
pybombs -v install libad9361

### IIO OSCILLOSCOPE
sudo apt-get -y install libglib2.0-dev libgtk2.0-dev libgtkdatabox-dev libmatio-dev libfftw3-dev libxml2 libxml2-dev bison flex libavahi-common-dev libavahi-client-dev libcurl4-openssl-dev libjansson-dev cmake libaio-dev
cd /home/gnuradio/src
git clone https://github.com/bastibl/iio-oscilloscope
cd iio-oscilloscope
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/home/gnuradio/pybombs
make
make install

### SOAPY
pybombs -v install soapysdr
cd /home/gnuradio/src
git clone https://github.com/pothosware/SoapyPlutoSDR
cd SoapyPlutoSDR
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/home/gnuradio/pybombs
make
make install

### LimeSDR
cd
pybombs -v install limesuite
sudo cp /home/gnuradio/pybombs/src/limesuite/udev-rules/64-limesuite.rules /etc/udev/rules.d/
pybombs -v install gr-limesdr

### XTRX SDR
cd /home/gnuradio/src
git clone https://github.com/xtrx-sdr/images.git
cd images/binaries/Ubuntu_16.04_amd64
sudo dpkg -i *.deb || sudo apt-get -y install -f
cd ../helpers/udev
sudo cp *.rules /etc/udev/rules.d/

### RTL-SDR
cd
pybombs -v install rtl-sdr
sudo cp pybombs/src/rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/
pybombs -v install soapyrtlsdr

### HACKRF
sudo apt-get -y install pkg-config libfftw3-dev
pybombs -v install hackrf
sudo cp pybombs/src/hackrf/host/libhackrf/53-hackrf.rules /etc/udev/rules.d/
pybombs -v install soapyhackrf

### BLADERF
pybombs -v install bladeRF
sed 's/@BLADERF_GROUP@/plugdev/g' pybombs/src/bladeRF/host/misc/udev/88-nuand-bladerf1.rules.in   | sudo tee /etc/udev/rules.d/88-nuand-bladerf1.rules
sed 's/@BLADERF_GROUP@/plugdev/g' pybombs/src/bladeRF/host/misc/udev/88-nuand-bladerf2.rules.in   | sudo tee /etc/udev/rules.d/88-nuand-bladerf2.rules
sed 's/@BLADERF_GROUP@/plugdev/g' pybombs/src/bladeRF/host/misc/udev/88-nuand-bootloader.rules.in | sudo tee /etc/udev/rules.d/88-nuand-bootloader.rules
pybombs -v install soapybladerf

### UHD
pybombs -v install uhd
sudo cp pybombs/src/uhd/host/utils/uhd-usrp.rules /etc/udev/rules.d/
pybombs/lib/uhd/utils/uhd_images_downloader.py
pybombs -v install soapyuhd
=======
sudo apt-get -y install jupyter jupyter-qtconsole jupyter-notebook python3-matplotlib python3-ipython python3-scipy python3-numpy python3-pip multimon sox liborc-dev swig3.0

sudo add-apt-repository -y ppa:gnuradio/gnuradio-releases
sudo add-apt-repository -y ppa:mormj/gnuradio-oot3
sudo apt-get update

sudo apt-get -y install gr-fcdproplus gr-fosphor gr-iqbal gr-limesdr gr-osmosdr
>>>>>>> 4028291728e88cf99dc7aa84ce376c3d28be6e42

sudo apt-get -y install gqrx-sdr inspectrum

<<<<<<< HEAD
### GR IIO
pybombs -v install gr-iio
=======
sudo snap install urh
>>>>>>> 4028291728e88cf99dc7aa84ce376c3d28be6e42

sudo usermod -aG usrp gnuradio
sudo apt-get -y install clinfo mesa-utils
sudo usermod -aG video gnuradio
sudo usermod -aG dialout gnuradio
sudo usermod -aG lpadmin gnuradio

<<<<<<< HEAD
### GQRX
pybombs -v install gqrx
xdg-icon-resource install --context apps --novendor --size 96 Pictures/gqrx-icon.png

### FOSPHOR
sudo apt-get -y install libfreetype6-dev ocl-icd-opencl-dev python-opengl lsb-core
pybombs -v install gr-fosphor
xdg-icon-resource install --context apps --novendor --size 96 Pictures/fosphor-icon.png
=======
sudo apt-get -y install intel-opencl-icd lsb-core
>>>>>>> 4028291728e88cf99dc7aa84ce376c3d28be6e42

sudo /usr/lib/uhd/utils/uhd_images_downloader.py

cd ~/Downloads
tar xvf l_opencl_p_18.1.0.015.tgz
sudo l_opencl_p_18.1.0.015/install.sh -s opencl-silent.cfg

<<<<<<< HEAD
pybombs -v install gr-foo
pybombs -v install gr-ieee-80211
pybombs -v install gr-ieee-802154
pybombs -v install gr-rds
pybombs -v install inspectrum
pybombs -v install gr-adsb
pybombs -v install gr-air-modes
pybombs -v install gr-ais
pybombs -v install gr-bluetooth
pybombs -v install gr-nmea
xdg-icon-resource install --context apps --novendor --size 96 Pictures/inspectrum-icon.png

### Install srsLTE
#sudo apt-get -y install cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev
#git clone https://github.com/srsLTE/srsLTE.git
#cd srsLTE
#mkdir build
#cd build
#cmake ../
#make
#sudo make install
#chmod +x srslte_install_configs.sh
#sudo ./srslte_install_configs.sh
#cd ..
#rm -r srsLTE

### URH
cd ~/src
sudo apt-get -y install python3-numpy python3-psutil python3-zmq python3-pyqt5 g++ libpython3-dev python3-pip cython3
git clone https://github.com/jopohl/urh/
# needs to be after 'source /home/gnuradio/pybombs/setup_env.sh' for the LIBRARY path to point to .so's
cd urh && sudo python3 setup.py install
cd
xdg-icon-resource install --context apps --novendor --size 96 Pictures/urhpng.png

### CLEAN UP OUR STUFF
cd
rm -r Downloads/*
find ./pybombs -type d -name '.git' | xargs rm -rf
find ./pybombs -type d -name 'build' | xargs rm -rf

### FAVORITE APPLICATIONS
xvfb-run dconf write /org/gnome/shell/favorite-apps "['gnuradio-grc.desktop', 'gqrx.desktop', 'fosphor.desktop', 'inspectrum.desktop', 'urh.desktop', 'terminator.desktop', 'gnuradio-web.desktop', 'firefox.desktop', 'org.gnome.Nautilus.desktop']"
=======
cd
xdg-icon-resource install --context apps --novendor --size 96 Pictures/gqrx-icon.png
xdg-icon-resource install --context apps --novendor --size 96 Pictures/inspectrum-icon.png
xdg-icon-resource install --context apps --novendor --size 96 Pictures/fosphor-icon.png
xdg-icon-resource install --context apps --novendor --size 96 Pictures/urhpng.png

rm -rf Downloads/*

### FAVORITE APPLICATIONS
xvfb-run dconf write /org/gnome/shell/favorite-apps "['gnuradio-grc.desktop', 'gqrx.desktop', 'fosphor.desktop', 'inspectrum.desktop', 'urh.desktop', 'terminator.desktop', 'code_code.desktop', 'gnuradio-web.desktop', 'firefox.desktop', 'org.gnome.Nautilus.desktop']"
>>>>>>> 4028291728e88cf99dc7aa84ce376c3d28be6e42

### The German Code
# xvfb-run dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'de')]"
