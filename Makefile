default: plan

module := "base"

docs:
	cd infrastructure/stages/$(module) && terraform-docs markdown document --output-file README.md --output-mode inject .

fmt:
	cd infrastructure/stages/$(module) && terraform fmt -recursive

init:
	cd infrastructure/stages/$(module) && \
		terraform init --upgrade && \
		terraform -v && \
		terraform providers

validate:
		cd infrastructure/stages/$(module) && terraform validate

plan: fmt validate docs
		cd infrastructure/stages/$(module) && terraform plan