# Copyright (C) 2021, François-Guillaume Fernandez.

# This program is licensed under the Apache License version 2.
# See LICENSE or go to <https://www.apache.org/licenses/LICENSE-2.0.txt> for full license details.

"""
RST to notebook conversion
"""

import argparse
import os
import urllib
from pathlib import Path

import requests


def main(args):

    dest_folder = Path(args.dest)
    if not dest_folder.is_dir():
        raise FileNotFoundError(f"unable to access: {dest_folder}")
    # Read the file list
    with open(dest_folder.joinpath("rst-files.txt"), "r") as f:
        rst_files = [line.strip() for line in f.readlines()]

    # Download all the files
    for file in rst_files:
        # Download the RST file to a temp dir
        file_url = urllib.parse.urljoin(args.origin, str(file))
        response = requests.get(file_url, allow_redirects=True)
        # Check URL
        if (response.status_code // 100) != 2:
            raise ValueError(f"Unable to retrieve {file_url}")
        tmp_file = f"tmp_{file}"
        with open(tmp_file, "wb") as f:
            f.write(response.content)
        dest_file = os.path.join(args.dest, str(file).replace(".rst", ".ipynb"))
        # Convert it
        os.system(f"rst2ipynb {tmp_file} -o {dest_file}")
        # Delete tmp file
        os.remove(tmp_file)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="RST to notebook conversion", formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument("origin", type=str, help="URL to the folder with RST files")
    parser.add_argument("dest", type=str, help="Where the converted files should be places")
    args = parser.parse_args()

    main(args)
