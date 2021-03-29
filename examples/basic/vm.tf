resource "vcd_vapp" "terraform_dev" {
  name     = "terraform-dev"
  power_on = true
}

data "vcd_network_direct" "ci" {
  name = "CI-IMZ-DEV"
}

resource "vcd_vapp_org_network" "direct-network-ci" {
  vapp_name        = vcd_vapp.terraform_dev.name
  org_network_name = data.vcd_network_direct.network-vapp.name
}

module "basic" {
  source = "../.."
  vapp   = vcd_vapp.terraform_dev.name
  nics = [{
    network = data.vcd_network_direct.ci.name
    ip      = ""
    primary = true
  }]
  zone                     = "dev"
  hostname_app_description = "tf"
  role                     = "testing"
  hostgroup                = "cicd"
  post_script              = <<EOF
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMwb1QEzYKaola6hYvkBelVXOvWYfi62lHMSGO6Zn+kQ cicd_team" >> /root/.ssh/authorized_keys
EOF
}

output "ip" {
  value       = module.basic.ip
  description = "VM Ip"
}
