#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

declare -i -r CONTADOR=5
if [[ $CONTADOR -gt 3 ]]; then
    echo "Es mayor"
fi