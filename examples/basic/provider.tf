terraform {
  required_providers {
    vcd = {
      source  = "nixpkgs/vcd"
      version = "3.1.0"
    }

  }
  required_version = ">= 0.13"
}

provider "vcd" {
  org                  = "CICD"
  url                  = "https://mycloud.cirb.brussels/api"
  vdc                  = "OVDC-CICD-DEV-SIB"
  allow_unverified_ssl = "true"
}
