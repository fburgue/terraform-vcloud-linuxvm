# Terraform module for vcloud

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| catalog | Name of the catalog | string | `"PUBLIC-CAT"` | no |
| cpus | The number of virtual CPUs to allocate to the VM. Socket count is a result of: virtual logical processors/cores per socket. | number | `"1"` | no |
| dc | Name of the dc where this VM is running | string | `"sibelga"` | no |
| extra\_disk\_size | Number of megabytes to allocate in one extra disk | number | `"0"` | no |
| hostgroup | Puppet/Ansible hostgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | string | n/a | yes |
| hostname | Hostname of the machine | string | n/a | yes |
| instance | Puppet/Ansible instance of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | string | n/a | yes |
| memory | The amount of RAM (in MB) to allocate to the VM | number | `"1024"` | no |
| network | Name of the network to use for this VM | string | n/a | yes |
| post\_script | Script to run on initial boot | string | `""` | no |
| quantity | Number of VM to manage | number | `"1"` | no |
| role | Puppet/Ansible role of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | string | n/a | yes |
| srv\_size | Number of megabytes to allocate for /srv partition | number | `"10240"` | no |
| storage\_profile | Storage profile name | string | n/a | yes |
| subgroup | Puppet/Ansible subgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | string | `""` | no |
| template | Name of the template to start from | string | `"RHEL7.7_Template_v_3.0.1"` | no |
| vapp | Name of the VApp | string | n/a | yes |
| zone | Puppet/Ansible zone of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | string | n/a | yes |
| metadata | A hash containing the vm metadata | hash | `{}`| yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | VM Ips |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
