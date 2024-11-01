#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <dir path> <extension>"
    exit 1
fi

DIRECTORY=$1
EXTENSION=$2

./script1.sh "$DIRECTORY" "$EXTENSION" | wc -l

