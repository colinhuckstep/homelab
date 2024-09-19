#!/bin/bash
curl -k https://localhost

[[ $? -eq 0 ]] && exit 0 || exit 1