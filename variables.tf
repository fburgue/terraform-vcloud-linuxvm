variable "catalog" {
  description = "Name of the catalog"
  type        = string
  default     = "PUBLIC-CAT"
}

variable "template" {
  description = "Name of the template to start from"
  type        = string
  default     = "RHEL7.7_Template_v_3.0.1"
}

variable "hostname" {
  description = "Hostname of the machine"
  type        = string

  #  validation {
  #    condition     = can(regex("^dvvla[0-9]{4}", var.hostname))
  #    error_message = "The hostname must be a valid hostname maching ^dvvla[0-9]{4}"
  #  }
}

variable "vapp" {
  description = "Name of the VApp"
  type        = string
}

variable "role" {
  description = "Puppet/Ansible role of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information)"
  type        = string
}

variable "subgroup" {
  description = "Puppet/Ansible subgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information)"
  type        = string
  default     = ""
}

variable "hostgroup" {
  description = "Puppet/Ansible hostgroup of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information)"
  type        = string
}

variable "instance" {
  description = "Puppet/Ansible instance of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information)"
  type        = string
}


variable "zone" {
  description = "Puppet/Ansible zone of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information)"
  type        = string
  #  validation {
  #    condition     = can(regex("^(dev|testing|staging|prod)", var.zone))
  #    error_message = "The zone must be either 'dev', 'testing', 'staging', 'prod'"
  #  }
}

variable "memory" {
  description = "The amount of RAM (in MB) to allocate to the VM"
  type        = number
  default     = 1024
}

variable "cpus" {
  description = "The number of virtual CPUs to allocate to the VM. Socket count is a result of: virtual logical processors/cores per socket."
  type        = number
  default     = 1
}

variable "post_script" {
  description = "Script to run on initial boot"
  type        = string
  default     = ""
}

variable "srv_size" {
  description = "Number of megabytes to allocate for /srv partition"
  type        = number
  default     = 10240
}

variable "extra_disk_size" {
  description = "Number of megabytes to allocate in one extra disk"
  type        = number
  default     = 0
}

variable "network" {
  description = "Name of the network to use for this VM"
  type        = string
}

variable "quantity" {
  description = "Number of VM to manage"
  type        = number
  default     = 1
}
