resource "vcd_vapp" "terraform_dev" {
  name     = "terraform-dev"
  power_on = true
}

data "vcd_network_direct" "ci" {
  name = "CI-IMZ-DEV"
}

resource "vcd_vapp_org_network" "direct-network-ci" {
  vapp_name        = vcd_vapp.terraform_dev.name
  org_network_name = data.vcd_network_direct.ci.name
}

data "vault_generic_secret" "ssh_key" {
  path = "kv_cirb_cicd/provisioning/ssh-key"
}

module "basic" {
  source = "../.."
  vapp   = vcd_vapp.terraform_dev.name
  nics = [{
    network = data.vcd_network_direct.ci.name
    ip      = ""
    primary = true
  }]
  zone                          = "dev"
  hostname_app_description      = "tf"
  role                          = "testing"
  hostgroup                     = "cicd"
  provisioning_user_ssh_pub_key = data.vault_generic_secret.ssh_key.data["cicd.pub"]
}

output "ip" {
  value       = module.basic.ip
  description = "VM Ip"
}
