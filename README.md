# Terraform module for vcloud

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| vcd | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| vcd | 3.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| catalog | Name of the catalog | `string` | `"LINUX-CAT"` | no |
| cpus | The number of virtual CPUs to allocate to the VM. Socket count is a result of: virtual logical processors/cores per socket. | `number` | `1` | no |
| dc | Name of the dc where this VM is running | `string` | `"sibelga"` | no |
| extra\_disk\_size | Number of megabytes to allocate in one extra disk | `number` | `0` | no |
| hostgroup | Puppet/Ansible hostgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | n/a | yes |
| hostname\_app\_description | Application description (refer to 'Server naming convention v7.0) | `string` | n/a | yes |
| hostname\_index | VM unique ID | `number` | `1` | no |
| hostname\_type | Server type (refer to 'Server naming convention v7.0) | `string` | `"application"` | no |
| instance | Puppet/Ansible instance of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | `""` | no |
| ip | Set a static ip address to the vm. | `string` | `""` | no |
| memory | The amount of RAM (in MB) to allocate to the VM | `number` | `1024` | no |
| metadata | A hash containing the vm metadata | `map` | `{}` | no |
| network | Name of the network to use for this VM | `string` | n/a | yes |
| post\_script | Script to run at the end of the initial boot | `string` | `""` | no |
| power\_on | A boolean value stating if this VM should be powered on | `bool` | `true` | no |
| pre\_script | Script to run at the beginning of the initial boot | `string` | `""` | no |
| role | Puppet/Ansible role of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | n/a | yes |
| srv\_size | Number of megabytes to allocate for /srv partition | `number` | `10240` | no |
| storage\_profile | Storage profile name | `string` | `""` | no |
| storage\_profile\_template | Storage profile name for the template | `string` | `""` | no |
| subgroup | Puppet/Ansible subgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | `""` | no |
| template | Name of the template to start from | `string` | `"linux-rhel-8-tpl"` | no |
| vapp | Name of the VApp | `string` | n/a | yes |
| zone | Puppet/Ansible zone of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | VM Ips |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
