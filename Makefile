.PHONY: torchcam-notebooks

torchcam-notebooks:
	# Get the list of files to convert, download & convert them
	python convert.py https://raw.githubusercontent.com/frgfm/torch-cam/rst-nb/docs/source/notebooks/ torch-cam

# this target runs checks on all files
quality:
	isort . -c
	flake8
	black --check .

# this target runs checks on all files and potentially modifies some of them
style:
	isort .
	black .
