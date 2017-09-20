#! /usr/bin/env bash

EXTENSIONS=extensions.txt

"/Applications/Visual Studio Code.app//Contents/Resources/app/bin/code" --list-extensions >> ${EXTENSIONS}
