#!/usr/bin/env bash
# shellcheck disable=SC2154
# SC2154: terraform variables are referenced but not assigned.
function create_extra_disk() {
  echo "Adding sdc"
  for ((i = 0; i < 10; ++i)); do # wait for disk to be created (sometimes slow...)
    for host in /sys/class/scsi_host/*; do echo "- - -" >"$host/scan"; done
    for device in /sys/class/scsi_disk/*; do echo "1" >"$device/device/rescan"; done
    fdisk -l /dev/sdc 2>&1 && break
    sleep 5
  done
  echo ',,8e;' | sfdisk /dev/sdc 2>&1
  pvcreate /dev/sdc1 2>&1
  vgextend vg_rhel /dev/sdc1 2>&1
}

if [ "$1" == "precustomization" ]; then
  # shellcheck disable=SC2154
  ${pre_script}
  echo "Started doing pre-customization steps..."
  # shellcheck disable=SC2154
  if [[ ${extra_disk} != 0 ]]; then create_extra_disk; fi
  echo "Setting facts"
  # shellcheck disable=SC2154
  mkdir -p /etc/facter/facts.d
  {
    cat <<FACTS >/etc/facter/facts.d/host-info.txt
dc=${dc}
hostgroup=${hostgroup}
instance=${instance}
role=${role}
subgroup=${subgroup}
zone=${zone}
FACTS
    mkdir -p /etc/ansible/facts.d
    cat <<FACTS >/etc/ansible/facts.d/host-info.fact
[general]
datacenter=${dc}
hostgroup=${hostgroup}
instance=${instance}
role=${role}
subgroup=${subgroup}
zone=${zone}
environment=${zone}
FACTS
    mkdir -p /etc/puppetlabs/puppet/
    echo "environment=${hostgroup}_${zone}" >>/etc/puppetlabs/puppet/puppet.conf
  }
  echo "Finished setting facts"
  echo "Create provisioning user"
  if [[ ${provisioning_user} != "ansible" ]]; then
    adduser -G wheel -u 3000 "${provisioning_user}" 2>&1
  fi
  echo "Add public key in provisioning user"
  export PROVISIONING_USER_SSH_CONFIG_DIR="/home/${provisioning_user}/.ssh"
  mkdir -p "$PROVISIONING_USER_SSH_CONFIG_DIR"
  echo "${provisioning_user_ssh_pub_key}" >>"$PROVISIONING_USER_SSH_CONFIG_DIR/authorized_keys"
  chown -R "${provisioning_user}" "$PROVISIONING_USER_SSH_CONFIG_DIR"
  echo "Finished doing pre-customization steps."
elif [ "$1" == "postcustomization" ]; then
  echo "Started doing post-customization steps..."
  mkdir -p /etc/salt
  hostname -f >/etc/salt/minion_id
  # shellcheck disable=SC2154
  ${post_script}
  echo "Finished doing post-customization steps."
fi
exit 0
