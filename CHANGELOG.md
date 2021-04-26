<a name="unreleased"></a>
## [Unreleased]


<a name="v2.0.0"></a>
## [v2.0.0] - 2021-04-26
### Ci
- add linter

### Feat
- connect vm to multiple networ

### BREAKING CHANGE

Network configuration is configured using the `nics` variable.
`network` and `ip` variables have been removed.

refs CICDITS-1640


<a name="v1.0.0"></a>
## [v1.0.0] - 2021-03-15
### Chore
- update readme
- add helper script to upload releases
- update pre-commit config & fix lint
- go vendoring
- add validation for zone and dc variables

### Feat
- add defaults for storage profile
- set rhel 8 as default template
- breaking change: enable cpu/memory hot add

### Fix
- instance fact is empty by default

### Test
- use vault to get vcloud credentials
- create/test/destroy vm using basic example

### BREAKING CHANGE

You will need to upgrade the vcd provider version in
your code as well. Use `pkgs.unstable.terraform-provider-vcd` instead of
`pkgs.terraform-provider-vcd` in your `shell.nix'.


<a name="v0.9.0"></a>
## [v0.9.0] - 2021-02-15
### Chore
- add helper files to release

### Feat
- **ansible:** add environment fact in ansible

### Fix
- missing default puppet directories
- salt is not always in the template


<a name="v0.8"></a>
## [v0.8] - 2020-11-17
### Feat
- Create ip variable to be able to set one to a vm

### Fix
- lint


<a name="v0.7"></a>
## [v0.7] - 2020-11-10

<a name="v0.6"></a>
## [v0.6] - 2020-10-19
### Feat
- enable user to define extra metadata


<a name="v0.5"></a>
## [v0.5] - 2020-06-05

<a name="v0.4"></a>
## [v0.4] - 2020-06-05

<a name="v0.3"></a>
## [v0.3] - 2020-03-16
### Feat
- add parameter to power on/off the vm

### Fix
- ignore changest to the template/catalog


<a name="v0.2"></a>
## [v0.2] - 2020-02-25
### Chore
- store puppet and ansible facts as ini file

### Feat
- add pre_script variable

### Fix
- **fdisk:** do not print anything on stderr while testing
- **salt:** override the default minion_id

### Lint
- fmt


<a name="v0.1"></a>
## v0.1 - 2020-02-20
### Feat
- add ip in output
- follow cirb hostname naming convention
- enable usage of an extra disk
- **customization:** run user post script in postcustomization
- **metadata:** add dc metadata
- **storage profile:** add variable to define the storage profile

### Fix
- missing instance metadata in vcloud metadata
- **internal-disk:** wait for disk to be created


[Unreleased]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v2.0.0...HEAD
[v2.0.0]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v1.0.0...v2.0.0
[v1.0.0]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.9.0...v1.0.0
[v0.9.0]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.8...v0.9.0
[v0.8]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.7...v0.8
[v0.7]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.6...v0.7
[v0.6]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.5...v0.6
[v0.5]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.4...v0.5
[v0.4]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.3...v0.4
[v0.3]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.2...v0.3
[v0.2]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.1...v0.2
