PY_DIR = .
PYPROJECT_FILE = ${PY_DIR}/pyproject.toml

.PHONY: help install install-quality lint-check lint-format precommit typing-check quality style torchcam-notebooks

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

########################################################
# Install & Setup
########################################################

venv:
	uv venv --python 3.11

install: ${PY_DIR} ${PYPROJECT_FILE} ## Install the core library
	uv pip install -e ${PY_DIR}

########################################################
# Code checks
########################################################

install-quality: ${PY_DIR} ${PYPROJECT_FILE} ## Install with quality dependencies
	uv pip install -e '${PY_DIR}[quality]'

lint-check: ${PYPROJECT_FILE} ## Check code formatting and linting
	ruff format --check . --config ${PYPROJECT_FILE}
	ruff check . --config ${PYPROJECT_FILE}

lint-format: ${PYPROJECT_FILE} ## Format code and fix linting issues
	ruff format . --config ${PYPROJECT_FILE}
	ruff check --fix . --config ${PYPROJECT_FILE}

precommit: ${PYPROJECT_FILE} .pre-commit-config.yaml ## Run pre-commit hooks
	pre-commit run --all-files

typing-check: ${PYPROJECT_FILE} ## Check type annotations
	uvx ty check .

# this target runs checks on all files
quality: lint-check typing-check ## Run all quality checks

style: precommit ## Format code and run pre-commit hooks

########################################################
# Notebooks
########################################################

torchcam-notebooks:
	# Get the list of files to convert, download & convert them
	python convert.py https://raw.githubusercontent.com/frgfm/torch-cam/rst-nb/docs/source/notebooks/ torch-cam
