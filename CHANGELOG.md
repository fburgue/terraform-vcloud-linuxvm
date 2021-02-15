<a name="unreleased"></a>
## [Unreleased]


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


[Unreleased]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.9.0...HEAD
[v0.9.0]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.8...v0.9.0
[v0.8]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.7...v0.8
[v0.7]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.6...v0.7
[v0.6]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.5...v0.6
[v0.5]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.4...v0.5
[v0.4]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.3...v0.4
[v0.3]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.2...v0.3
[v0.2]: http://stash.cirb.lan/projects/CICD/repos/terraform-vcloud-linux-vm/compare/v0.1...v0.2
