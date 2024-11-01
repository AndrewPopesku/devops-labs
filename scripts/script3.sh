#!/bin/bash

DIRECTORY=""
SEARCH_TEXT=""

while getopts ":p:s:" opt; do
  case $opt in
    p)
      DIRECTORY=$OPTARG
      ;;
    s)
      SEARCH_TEXT=$OPTARG
      ;;
    \?)
      echo "Unknown parameter: -$OPTARG"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG needs value."
      exit 1
      ;;
  esac
done

./script2.sh "$DIRECTORY" "$SEARCH_TEXT"
