locals {
  short_zone = substr(var.zone, 0, 1)
  short_type = substr(var.hostname_type, 0, 1)
  json_facts = jsonencode({
    "role" : var.role
    "subgroup" : var.subgroup
    "hostgroup" : var.hostgroup
    "zone" : var.zone
    "instance" : var.instance
    "dc" : var.dc
  })
}

resource "vcd_vapp_vm" "vm" {
  vapp_name       = var.vapp
  name            = format("%svvl%s%s%02s", local.short_zone, local.short_type, var.hostname_app_description, var.hostname_index)
  computer_name   = format("%svvl%s%s%02s", local.short_zone, local.short_type, var.hostname_app_description, var.hostname_index)
  storage_profile = var.storage_profile
  catalog_name    = var.catalog
  template_name   = var.template
  memory          = var.memory
  cpus            = var.cpus
  power_on        = var.power_on

  customization {
    initscript = templatefile("${path.module}/scripts/initscript.tpl.sh",
      {
        json_facts  = local.json_facts,
        hostgroup   = var.hostgroup,
        zone        = var.zone,
        dc          = var.dc,
        instance    = var.instance,
        role        = var.role,
        subgroup    = var.subgroup,
        pre_script  = var.pre_script,
        post_script = var.post_script,
        extra_disk  = var.extra_disk_size
    })

  }

  override_template_disk {
    bus_type        = "paravirtual"
    size_in_mb      = var.srv_size
    bus_number      = 0
    unit_number     = 1
    iops            = 0
    storage_profile = var.storage_profile_template
  }

  metadata = merge({
    role      = var.role
    subgroup  = var.subgroup
    hostgroup = var.hostgroup
    zone      = var.zone
    dc        = var.dc
    instance  = var.instance
  }, var.metadata)

  network {
    type               = "org"
    name               = var.network
    ip_allocation_mode = "POOL"
    is_primary         = true
  }

  lifecycle {
    #prevent_destroy = true
    ignore_changes = [
      initscript,
      template_name,
      catalog_name
    ]
  }

}

resource "vcd_vm_internal_disk" "sdc" {
  count           = var.extra_disk_size != 0 ? 1 : 0
  vapp_name       = var.vapp
  vm_name         = vcd_vapp_vm.vm.name
  bus_type        = "paravirtual"
  size_in_mb      = var.extra_disk_size
  bus_number      = 0
  unit_number     = 2
  storage_profile = var.storage_profile
  allow_vm_reboot = "false"
}

output "ip" {
  value       = vcd_vapp_vm.vm.network[0].ip
  description = "VM Ips"
}
