#!/usr/bin/env bash

SETTINGS_FILE="settings.json"
SETTINGS_TARGET_DIR="${HOME}/Library/Application Support/Code/User/"

cp -f "./${SETTINGS_FILE}" "${SETTINGS_TARGET_DIR}"
