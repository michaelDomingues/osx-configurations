#!/usr/bin/env bash

SETTINGS_FILE="settings.json"
VSC_DIR="/Library/Application Support/Code"
SETTINGS_TARGET_DIR="${HOME}${VSC_DIR}/User/"

if [ ! -d ${VSC_DIR}]; then
    echo "${HOME}${VSC_DIR} does not exist yet."
    echo "Start VS Code first and copy settings after"
    exit 1
fi

# Copy settings 
cp -f "./${SETTINGS_FILE}" "${SETTINGS_TARGET_DIR}"
