# POC
.PHONY: test

lint:  ## Static verifications
	pre-commit run --all --color always

doc:  ## Autogenerate documentation
	terraform-docs markdown table .

fmt:  ## Format go and terraform code
	terraform fmt -recursive
	gofumpt -w test/*.go


.DEFAULT_GOAL:=help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

changelog:  ## Generate changelog
	git-chglog -o CHANGELOG.md
	git commit -m "Update changelog" CHANGELOG.md

bump:  ## Bump the current version
	bump2version $(RELEASE_TYPE)
	echo "New version: $$(cat version.txt)"

release: changelog bump ## Create a release of the module (require RELEASE_TYPE to be major, minor, patch)
	tar -cvjf vcloud-terraform-$(shell cat version.txt).tar.bz2 *.tf *.txt *.md scripts

test: check-vault-token  ## Run terratest to test creation/connection/destruction of a VM using this terraform module
	cd test && go test -timeout 30m -mod=vendor

check-artifactory:
ifndef ARTIFACTORY_USERNAME
	$(error ARTIFACTORY_USERNAME is undefined)
endif
ifndef ARTIFACTORY_PASSWORD
	$(error ARTIFACTORY_PASSWORD is undefined)
endif

upload: check-artifactory  ## Upload the builded varnish module to our nexus
	curl -v --fail -u "$(ARTIFACTORY_USERNAME):$(NEXUS_PASSWORD)" --upload-file "$(ARTIFACT)" "https://artifactory.imio.be/repository/terraform-modules/$(ARTIFACT)"

install-git-hooks:  ## Install git hooks (pre-commit, pre-push, commit-msg)
	@pre-commit install -f -t commit-msg
	@pre-commit install -f -t pre-push
	@pre-commit install -f -t pre-commit

lint-jenkinsfile:  ## Lint jenkinsfile
	docker run --rm -v $(PWD)/ruleset.groovy:/opt/ruleset.groovy -v $(PWD):/ws -u `id -u`:`id -g` cicd-docker.repository.irisnet.be/abletonag/groovylint python3 /opt/run_codenarc.py -- -includes='./Jenkinsfile'

check-vault-token:
	@token_ttl="$(shell vault token lookup -format=json | jq '.data.ttl')"; \
	if [[ $$token_ttl -le 0 ]]; then \
		echo 'Vault token expired or invalid. Please log into vault first.'; \
		echo -e 'Run: export VAULT_TOKEN=$$(vault login -method=ldap -path=ldap-adinfra -field token username=${LOGINID})\n'; \
		exit 1; \
	fi
