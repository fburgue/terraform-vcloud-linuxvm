locals {
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
  count           = var.quantity
  vapp_name       = var.vapp
  name            = format("%s%04s", "${var.hostname}", "${count.index}")
  computer_name   = format("%s%04s", "${var.hostname}", "${count.index}")
  power_on        = true
  storage_profile = "SILVER"
  catalog_name    = var.catalog
  template_name   = var.template
  memory          = var.memory
  cpus            = var.cpus

  initscript = templatefile("${path.module}/scripts/initscript.tpl.sh",
    {
      json_facts  = local.json_facts,
      hostgroup   = var.hostgroup,
      zone        = var.zone,
      post_script = var.post_script,
      extra_disk  = var.extra_disk_size
  })

  override_template_disk {
    bus_type        = "paravirtual"
    size_in_mb      = var.srv_size
    bus_number      = 0
    unit_number     = 1
    iops            = 0
    storage_profile = "SILVER"
  }

  metadata = {
    role      = var.role
    subgroup  = var.subgroup
    hostgroup = var.hostgroup
    zone      = var.zone
    dc        = var.dc
    instance  = var.instance
  }

  network {
    type               = "org"
    name               = var.network
    ip_allocation_mode = "POOL"
    is_primary         = true
  }

  lifecycle {
    #prevent_destroy = true
    ignore_changes = [
      initscript
    ]
  }

}

resource "vcd_vm_internal_disk" "sdc" {
  count           = var.quantity != 0 && var.extra_disk_size != 0 ? 1 : 0
  vapp_name       = var.vapp
  vm_name         = vcd_vapp_vm.vm[0].name
  bus_type        = "paravirtual"
  size_in_mb      = var.extra_disk_size
  bus_number      = 0
  unit_number     = 2
  storage_profile = "SILVER"
  allow_vm_reboot = "false"
}

output "ip" {
  value       = vcd_vapp_vm.vm[*].network[0].ip
  description = "VM Ips"
}
