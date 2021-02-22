terraform {
  required_providers {
    vcd = {
      source  = "nixpkgs/vcd"
      version = "3.1.0"
    }

  }
  required_version = ">= 0.13"
}

data "vault_generic_secret" "vcd_credentials" {
  path = "kv_cirb_cicd/vcloud/cicd/terraform"
}

provider "vault" {
  address = "https://hashivault.cirb.lan"
}

provider "vcd" {
  org                  = "CICD"
  url                  = "https://mycloud.cirb.brussels/api"
  vdc                  = "OVDC-CICD-DEV-SIB"
  allow_unverified_ssl = "true"
  user                 = data.vault_generic_secret.vcd_credentials.data["username"]
  password             = data.vault_generic_secret.vcd_credentials.data["password"]
}
