#!/usr/bin/env bash

VSCODE_BIN="/Applications/Visual Studio Code.app//Contents/Resources/app/bin/code"

if [[ -z "${1}" ]]; then
	echo "Provide the extension file path:".
	echo "./install_extensions.sh <extension_file_path>"
else
	cat ${1} | while read line
	do
		"${VSCODE_BIN}" --install-extension ${line}
	done
fi

