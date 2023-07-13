
```
parted /dev/sdb
(parted) mklabel gpt
(parted) mkpart primary 0GB 100%
(parted) print
(parted) q

# pvcreate /dev/sdb1
  Writing physical volume data to disk "/dev/sdb1"
  Physical volume "/dev/sdb1" successfully created
# parted /dev/sdb set 1 lvm on

# vgcreate storage  /dev/sdb1
  Volume group "storage" successfully created
# lvcreate 100%FREE -n data storage

# mkfs.xfs /dev/mnapper/

```
