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

For a trained controlled experiment, run
[TorchCAM shortcut diagnosis and repair](torch-cam/shortcut_repair.ipynb). It tests CAM proposals with
label-preserving edits and matched controls, then compares unchanged training, ordinary augmentation,
provisional CAM-guided erasing, and a gated repair across three seeds. The executed notebook preserves
an unsuccessful first attempt and reports a null repair advantage on a fresh test set, with a no-shortcut
control, pinned dependencies, and runnable acceptance checks.
