locals {
  json_facts = jsonencode({
    "role" : var.role
    "subgroup" : var.subgroup
    "hostgroup" : var.hostgroup
    "zone" : var.zone
    "instance" : var.instance
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

output "ip" {
  value       = vcd_vapp_vm.vm[*].network[0].ip
  description = "VM Ips"
}
