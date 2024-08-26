#!/bin/bash
resolvedIP=$(nslookup "google.com" localhost | awk -F':' '/^Address: / { matched = 1 } matched { print $2}' | xargs)

[[ -z "$resolvedIP" ]] && exit 1 || exit 0
