#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <dir path> <file extension>"
    exit 1
fi

DIRECTORY=$1
EXTENSION=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory $DIRECTORY does not exist"
    exit 1
fi

find "$DIRECTORY" -type f -name "*.$EXTENSION"
