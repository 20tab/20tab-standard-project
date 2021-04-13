self_documenting:
	@echo "[Help] Makefile list commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check:  ## Check code formatting and import sorting
	black --check .
	isort --check .
	flake8
	mypy .

dev: ## Install development requirements
	python3 -m pip install -q -U pip~=21.0.0 pip-tools~=6.0.0

fix:  ## Fix code formatting and import sorting
	black .
	isort .
	flake8
	mypy .

outdated:  ## Check outdated requirements and dependencies
	python3 -m pip list --outdated

pip:  ## Compile requirements and dependencies
	python3 -m pip install -q -U pip~=21.0.0 pip-tools~=6.0.0
