#!/bin/bash

adiscon_repo() {
  # Remove the default rsyslog
  yum remove -y rsyslog

  # Add Adiscon repository
cat > /etc/yum.repos.d/adiscon.repo << EOF
[Adiscon]
name=Adiscon CentOS-\$releasever - local packages for \$basearch
baseurl=http://rpms.adiscon.com/v8-stable/epel-\$releasever/\$basearch
enabled=1
gpgcheck=0
EOF

 
  yum install -y rsyslog
}

adiscon_repo

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
  mkfs.xfs /dev/myvg/mylv || { echo "Failed to format logical volume with XFS."; exit 1; }
  mkdir -p /mnt/mylv
  mount /dev/myvg/mylv /mnt/mylv || { echo "Failed to mount logical volume."; exit 1; }
  echo '/dev/myvg/mylv /mnt/mylv xfs defaults 0 0' >> /etc/fstab
}

detect_new_disk
if [ -z "$DISK" ]; then
  echo "No new disks detected."
  exit 0
fi

echo "New disk detected: $DISK"
read -p "Do you want to format this disk with XFS and mount it? [y/N]: " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  create_lvm
  echo "Disk $DISK has been formatted with XFS and mounted at /mnt/mylv"
else
  echo "Aborted."
fi
