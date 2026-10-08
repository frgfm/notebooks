# TorchCAM Notebooks

The current TorchCAM examples are maintained directly in this directory. Open a pull request in this repository to update them.

The legacy `make torchcam-notebooks` converter only writes the filenames listed in `rst-files.txt`. It does not generate or overwrite `validation_audit.ipynb` or `shortcut_repair.ipynb`; edit those notebooks here.

- [Validation audit](validation_audit.ipynb): collect fixed-probe explanations and preserve failed extractions.
- [Shortcut diagnosis and repair](shortcut_repair.ipynb): train a controlled classifier, test CAM hypotheses
  with matched edits, and measure several training interventions across seeds. The committed execution
  reports a null advantage for guided repair and keeps the initial failed protocol and unresolved diagnoses.
  Run all cells in order; setup pins a merged TorchCAM revision and the tested Linux CPU dependencies.
