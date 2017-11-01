#!/usr/bin/env bash

ZSHRC_SETTINGS="${HOME}/"
SETTINGS=".zshrc"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Copy settings
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
