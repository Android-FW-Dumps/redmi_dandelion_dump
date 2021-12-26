#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:73e1fa974d35769e51f9f6f1aa1a65a0045c5c4a; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:87796b642a6c84a8e81a7ea592d7b918cc94a388 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:73e1fa974d35769e51f9f6f1aa1a65a0045c5c4a && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
