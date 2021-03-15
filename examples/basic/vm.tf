module "basic" {
  source                   = "../.."
  zone                     = "dev"
  hostname_app_description = "tf"
  role                     = "testing"
  network                  = "CD-IMZ-DEV"
  vapp                     = "puppet"
  hostgroup                = "cicd"
  post_script              = <<EOF
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMwb1QEzYKaola6hYvkBelVXOvWYfi62lHMSGO6Zn+kQ cicd_team" >> /root/.ssh/authorized_keys
EOF
}

output "ip" {
  value       = module.basic.ip
  description = "VM Ip"
}
