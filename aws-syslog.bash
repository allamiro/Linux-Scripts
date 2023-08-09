#!/bin/bash

detect_new_disk() {
  for disk in /sys/block/sd*; do
    if ! grep -q "${disk##*/}" /etc/mtab; then
      DISK="/dev/${disk##*/}"
      break
    fi
  done
}
create_lvm() {
  pvcreate "$DISK" || { echo "Failed to create physical volume."; exit 1; }
  vgcreate myvg "$DISK" || { echo "Failed to create volume group."; exit 1; }
  lvcreate -l 100%FREE -n mylv myvg || { echo "Failed to create logical volume."; exit 1; }
  mkfs.ext4 /dev/myvg/mylv || { echo "Failed to format logical volume."; exit 1; }
  mkdir -p /mnt/mylv
  mount /dev/myvg/mylv /mnt/mylv || { echo "Failed to mount logical volume."; exit 1; }
  echo '/dev/myvg/mylv /mnt/mylv ext4 defaults 0 0' >> /etc/fstab
}

detect_new_disk
if [ -z "$DISK" ]; then
  echo "No new disks detected."
  exit 0
fi

echo "New disk detected: $DISK"
read -p "Do you want to format this disk as LVM? [y/N]: " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  create_lvm
  echo "Disk $DISK has been formatted as LVM and mounted at /mnt/mylv"
else
  echo "Aborted."
fi
