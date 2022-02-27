#!/usr/bin/env bash
set -euf -o pipefail

wget "$(cat .tsv-url)" -O text/vending_inventory.tsv
echo "$(wc -l text/vending_inventory.tsv | sed -e 's/ / lines fetched to /')"
