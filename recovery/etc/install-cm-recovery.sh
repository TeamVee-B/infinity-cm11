#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8294400 4873b965d01a585d119df4adaf39bb01862f59f0 6045696 bf87d3ffb2df792ebea58fc8a834c7d4ba0fb743
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8294400:4873b965d01a585d119df4adaf39bb01862f59f0; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6045696:bf87d3ffb2df792ebea58fc8a834c7d4ba0fb743 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 4873b965d01a585d119df4adaf39bb01862f59f0 8294400 bf87d3ffb2df792ebea58fc8a834c7d4ba0fb743:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
