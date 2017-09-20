#!/usr/bin/env bash

SETTINGS_FILE="com.googlecode.iterm2.plist"
SETTINGS_TARGET_DIR="${HOME}/Library/Preferences"

cp -f "./${SETTINGS_FILE}" "${SETTINGS_TARGET_DIR}"
