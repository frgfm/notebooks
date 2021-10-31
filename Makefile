.PHONY: torchcam-notebooks

torchcam-notebooks:
	# Get the list of files to convert, download & convert them
	python convert.py https://raw.githubusercontent.com/frgfm/torch-cam/rst-nb/docs/source/notebooks/ torch-cam
