.PHONY: help dev-apply prod-apply dev-destroy prod-destroy

.DEFAULT_GOAL := help

git: ## git pull and terraform local state clean
	git pull
	rm -f .terraform/terraform.tfstate
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST)
dev-apply: git ## Terraform DEV env apply
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars
prod-apply: git ## Terraform PROD env apply
	terraform init -backend-config=env-prod/state.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars
dev-destroy: git ## Terraform DEV env destroy
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars
prod-destroy: git ## Terraform PROD env destroy
	terraform init -backend-config=env-prod/state.tfvars
	terraform destroy -auto-approve -var-file=env-prod/main.tfvars
