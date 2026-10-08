# TorchCAM Notebooks

The current TorchCAM examples are maintained directly in this directory. Open a pull request in this repository to update them.

The legacy `make torchcam-notebooks` converter only writes the filenames listed in `rst-files.txt`. It does not generate or overwrite `validation_audit.ipynb` or `shortcut_repair.ipynb`; edit those notebooks here.

- [Shortcut diagnosis and repair](shortcut_repair.ipynb): a three-seed training experiment with matched
  edits, a no-shortcut control, failed attempts, and null results. Run all cells in order; setup pins
  the merged TorchCAM revision and tested Linux CPU dependencies.
