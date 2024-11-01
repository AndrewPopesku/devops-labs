#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <dir path> <text for search>"
    exit 1
fi

DIRECTORY=$1
SEARCH_TEXT=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory $DIRECTORY does not exist"
    exit 1
fi

grep -rl "$SEARCH_TEXT" "$DIRECTORY"