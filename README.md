# Notebooks

Home to jupyter notebooks for all my projects

## Installation

First you need to install Pandoc
```shell
sudo apt-get update
sudo apt-get install pandoc -y
```
then move on to the Python dependencies using pip:
```shell
pip install .
```

## Usage
```shell
make torchcam-notebooks
```

For a fixed set of classifier failures and successful controls, run the
[TorchCAM validation audit](torch-cam/validation_audit.ipynb). It saves per-sample
explanations and a JSON report with scores, group counts, blank maps, and extraction
errors. Run its setup cell to install the tested TorchCAM revision.
