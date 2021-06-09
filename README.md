## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_vcd"></a> [vcd](#requirement\_vcd) | 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcd"></a> [vcd](#provider\_vcd) | 3.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcd_vapp_vm.vm](https://registry.terraform.io/providers/nixpkgs/vcd/3.2.0/docs/resources/vapp_vm) | resource |
| [vcd_vm_internal_disk.sdc](https://registry.terraform.io/providers/nixpkgs/vcd/3.2.0/docs/resources/vm_internal_disk) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog"></a> [catalog](#input\_catalog) | Name of the catalog | `string` | `"LINUX-CAT"` | no |
| <a name="input_cpus"></a> [cpus](#input\_cpus) | The number of virtual CPUs to allocate to the VM. Socket count is a result of: virtual logical processors/cores per socket. | `number` | `1` | no |
| <a name="input_dc"></a> [dc](#input\_dc) | Name of the dc where this VM is running | `string` | `"sibelga"` | no |
| <a name="input_extra_disk_size"></a> [extra\_disk\_size](#input\_extra\_disk\_size) | Number of megabytes to allocate in one extra disk | `number` | `0` | no |
| <a name="input_hostgroup"></a> [hostgroup](#input\_hostgroup) | Puppet/Ansible hostgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | n/a | yes |
| <a name="input_hostname_app_description"></a> [hostname\_app\_description](#input\_hostname\_app\_description) | Application description (refer to 'Server naming convention v7.0) | `string` | n/a | yes |
| <a name="input_hostname_index"></a> [hostname\_index](#input\_hostname\_index) | VM unique ID | `number` | `1` | no |
| <a name="input_hostname_type"></a> [hostname\_type](#input\_hostname\_type) | Server type (refer to 'Server naming convention v7.0) | `string` | `"application"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | Puppet/Ansible instance of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | `""` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of RAM (in MB) to allocate to the VM | `number` | `1024` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | A hash containing the vm metadata | `map` | `{}` | no |
| <a name="input_nics"></a> [nics](#input\_nics) | VM Network Interfaces | <pre>list(object({<br>    network = string<br>    ip      = string<br>    primary = bool<br>  }))</pre> | n/a | yes |
| <a name="input_post_script"></a> [post\_script](#input\_post\_script) | Script to run at the end of the initial boot | `string` | `""` | no |
| <a name="input_power_on"></a> [power\_on](#input\_power\_on) | A boolean value stating if this VM should be powered on | `bool` | `true` | no |
| <a name="input_pre_script"></a> [pre\_script](#input\_pre\_script) | Script to run at the beginning of the initial boot | `string` | `""` | no |
| <a name="input_provisioning_user"></a> [provisioning\_user](#input\_provisioning\_user) | User name that will be used to provision the VM | `string` | `"cicd"` | no |
| <a name="input_provisioning_user_ssh_pub_key"></a> [provisioning\_user\_ssh\_pub\_key](#input\_provisioning\_user\_ssh\_pub\_key) | Public SSH key that will be used by the provisioning user | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | Puppet/Ansible role of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | n/a | yes |
| <a name="input_srv_size"></a> [srv\_size](#input\_srv\_size) | Number of megabytes to allocate for /srv partition | `number` | `10240` | no |
| <a name="input_storage_profile"></a> [storage\_profile](#input\_storage\_profile) | Storage profile name | `string` | `""` | no |
| <a name="input_storage_profile_template"></a> [storage\_profile\_template](#input\_storage\_profile\_template) | Storage profile name for the template | `string` | `""` | no |
| <a name="input_subgroup"></a> [subgroup](#input\_subgroup) | Puppet/Ansible subgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | `""` | no |
| <a name="input_template"></a> [template](#input\_template) | Name of the template to start from | `string` | `"linux-rhel-8-tpl"` | no |
| <a name="input_vapp"></a> [vapp](#input\_vapp) | Name of the VApp | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Puppet/Ansible zone of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | VM Ip |
| <a name="output_name"></a> [name](#output\_name) | VM name |
