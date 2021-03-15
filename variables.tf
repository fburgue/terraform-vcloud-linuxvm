variable "catalog" {
  description = "Name of the catalog"
  type        = string
  default     = "LINUX-CAT"
}

variable "template" {
  description = "Name of the template to start from"
  type        = string
  default     = "linux-rhel-8-tpl"
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
  default     = ""
}


variable "zone" {
  description = "Puppet/Ansible zone of the machine (refer to http://docs.cicd.cirb.lan/puppet/overview.html#_5_essential_machine_code_facts_code for more information)"
  type        = string
  validation {
    condition     = can(regex("^(dev|testing|staging|prod)", var.zone))
    error_message = "The zone must be either 'dev', 'testing', 'staging', 'prod'."
  }
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
  description = "Script to run at the end of the initial boot"
  type        = string
  default     = ""
}

variable "pre_script" {
  description = "Script to run at the beginning of the initial boot"
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

variable "dc" {
  description = "Name of the dc where this VM is running"
  type        = string
  default     = "sibelga"
  validation {
    condition     = can(regex("^(art|sibelga)", var.dc))
    error_message = "The zone must be either 'art' or 'sibelga'."
  }
}

variable "storage_profile" {
  description = "Storage profile name"
  type        = string
  default     = ""
}

variable "storage_profile_template" {
  description = "Storage profile name for the template"
  type        = string
  default     = ""
}

variable "hostname_app_description" {
  description = "Application description (refer to 'Server naming convention v7.0)"
  type        = string
}

variable "hostname_type" {
  description = "Server type (refer to 'Server naming convention v7.0)"
  type        = string
  default     = "application"
}

variable "hostname_index" {
  description = "VM unique ID"
  type        = number
  default     = 1
}

variable "power_on" {
  description = "A boolean value stating if this VM should be powered on"
  type        = bool
  default     = true
}

variable "metadata" {
  description = "A hash containing the vm metadata"
  type        = map
  default     = {}
}

variable "ip" {
  description = "Set a static ip address to the vm."
  type        = string
  default     = ""
}
