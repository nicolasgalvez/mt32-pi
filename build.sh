#!/bin/bash

# Define environment variables
toolchain_version='11.3.rel1'
version='dev'
boot_home="external/circle-stdlib/libs/circle/boot"
wlan_home="external/circle-stdlib/libs/circle/addon/wlan"

# Fetch submodules
make submodules

# # Download boot files and build ARM stub
# make -C $boot_home firmware armstub64
# cp  $boot_home/armstub8-rpi4.bin \
#     $boot_home/bcm2711-rpi-4-b.dtb \
#     $boot_home/bcm2711-rpi-400.dtb \
#     $boot_home/bcm2711-rpi-cm4.dtb \
#     $boot_home/bootcode.bin \
#     $boot_home/COPYING.linux \
#     $boot_home/fixup_cd.dat \
#     $boot_home/fixup4cd.dat \
#     $boot_home/LICENCE.broadcom \
#     $boot_home/start_cd.elf \
#     $boot_home/start4cd.elf \
#     sdcard

# # Download WLAN firmware
# mkdir -p sdcard/firmware
# make -C $wlan_home/firmware
# cp  $wlan_home/firmware/LICENCE.broadcom_bcm43xx \
#     $wlan_home/firmware/brcmfmac43430-sdio.bin \
#     $wlan_home/firmware/brcmfmac43430-sdio.txt \
#     $wlan_home/firmware/brcmfmac43436-sdio.bin \
#     $wlan_home/firmware/brcmfmac43436-sdio.txt \
#     $wlan_home/firmware/brcmfmac43436-sdio.clm_blob \
#     $wlan_home/firmware/brcmfmac43455-sdio.bin \
#     $wlan_home/firmware/brcmfmac43455-sdio.txt \
#     $wlan_home/firmware/brcmfmac43455-sdio.clm_blob \
#     $wlan_home/firmware/brcmfmac43456-sdio.bin \
#     $wlan_home/firmware/brcmfmac43456-sdio.txt \
#     $wlan_home/firmware/brcmfmac43456-sdio.clm_blob \
#     sdcard/firmware

# Download GeneralUser GS SoundFont

gdown -q https://drive.google.com/uc?id=1ypgJwuHqqXx-jeCXLRFqgBAEemJZnDrj
unzip "GeneralUser GS v1.511.zip"
rm "GeneralUser GS v1.511.zip"

# Add extra files to SD card directory
mkdir -p sdcard/docs
cp "GeneralUser GS v1.511/GeneralUser GS v1.511.sf2" sdcard/soundfonts
cp "GeneralUser GS v1.511/CHANGELOG.md" sdcard/docs/CHANGELOG.GeneralUserGS
cp "GeneralUser GS v1.511/LICENSE.txt" sdcard/docs/LICENSE.GeneralUserGS
cp LICENSE sdcard/docs
cp README.md sdcard/docs

rm "GeneralUser GS v1.511"

# Create release package
cd sdcard; zip -r ../mt32-pi-$version.zip *