#!/usr/bin/env bash

# This script uses arg $1 (name of *.jsonnet file to use) to generate the manifests/*.yaml files.

set -e
set -x
# only exit with zero if all commands of the pipeline exit successfully
set -o pipefail

# build json, convert to yaml and create a common file for all documents.
jsonnet -J grafonnet -o td.json "${1}"
