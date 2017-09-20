#!/usr/bin/env bash

ZSHRC_SETTINGS="${HOME}/.zshrc"
SETTINGS=".zshrc"

cp -fr "${SETTINGS}" "${ZSHRC_SETTINGS}"

################# POWERLINE FONTS #################
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
