#!/usr/bin/env bash
function create_extra_disk {
  echo "Adding sdc"
  for host in /sys/class/scsi_host/*; do echo "- - -" > "$host/scan" ; done
  for device in /sys/class/scsi_disk/*; do echo "1" > "$device/device/rescan" ; done
  echo ',,8e;' | sfdisk /dev/sdc 2>&1
  pvcreate /dev/sdc1 2>&1
  vgextend vg_rhel /dev/sdc1 2>&1
}
echo "Finished setting facts"

# shellcheck disable=SC2154
${post_script}
