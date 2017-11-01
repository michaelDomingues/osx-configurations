#!/usr/bin/env bash

SETTINGS_FILE="settings.json"
SETTINGS_TARGET_DIR="${HOME}/Library/Application Support/Code/User/${SETTINGS_FILE}"

cp -f "${SETTINGS_TARGET_DIR}" .
