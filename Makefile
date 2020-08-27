.DEFAULT_GOAL := help
.PHONY: help

build: ## Build an application
	@pipenv run python setup.py sdist

install: ## Install application to Pip environment
	@pipenv run python setup.py install

clean: ## Remove build files
	@rm -R build/ dist/ *.egg-info

test: ## Run code tests
	@echo "No tests yet!"

sync: ## Sync with Pipfile packages list
	@pipenv sync

help: ## Show this message
	@echo "Application management"
	@echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'