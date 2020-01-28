#!/usr/bin/env bash
set -x
echo "Bootstraping machine using initscript"

echo "Setting facts"
# shellcheck disable=SC2154
{
  cat <<FACTS >/etc/facter/facts.d/host-info.json
${json_facts}
FACTS
  mkdir -p /etc/ansible/facts.d
  cp /etc/facter/facts.d/host-info.json /etc/ansible/facts.d/cirb.fact
  echo "environment=${hostgroup}_${zone}" >>/etc/puppetlabs/puppet/puppet.conf
}
echo "Finished setting facts"

# shellcheck disable=SC2154
${post_script}
