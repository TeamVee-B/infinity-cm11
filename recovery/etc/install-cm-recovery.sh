#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10055680 8783a4d4f784d513affc18cf905f3ddd591e6201 11319296 9738d103fe488575b1ce0b3f477d3c10f4c26f41
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel:10055680:8783a4d4f784d513affc18cf905f3ddd591e6201; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:11319296:9738d103fe488575b1ce0b3f477d3c10f4c26f41 EMMC:/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel 8783a4d4f784d513affc18cf905f3ddd591e6201 10055680 9738d103fe488575b1ce0b3f477d3c10f4c26f41:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
