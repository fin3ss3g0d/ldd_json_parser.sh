#!/bin/bash

# Check if file path is provided
if [ $# -lt 2 ]; then
    echo "You must provide a file path and a target (users or computers)"
    exit 1
fi

# Check if file exists
if [ ! -f $1 ]; then
    echo "File not found!"
    exit 1
fi

TARGET=$2

# Choose jq parameter based on target
case $TARGET in
    "users")
        JQ_PARAM='.[].attributes.sAMAccountName'
        ;;
    "computers")
        JQ_PARAM='.[].attributes.dNSHostName'
        ;;
    *)
        echo "Invalid target. Please choose either users or computers"
        exit 1
        ;;
esac

# Extract values, remove quotes and brackets, and remove leading spaces and blank lines
cat $1 | jq -r "$JQ_PARAM" | tr -d '"[]' | sed 's/^ *//; /^$/d' | grep -vi null
