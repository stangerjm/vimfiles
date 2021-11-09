#!/bin/bash -
#===============================================================================
#
#          FILE: v_install_2.sh
#
#         USAGE: ./v_install_2.sh
#
#   DESCRIPTION: Installs the latest stable version of NeoVim and some nice nvim plugins
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: James Stanger, 
#       CREATED: 07/13/2021 06:46:03 PM
#      REVISION:  ---
#===============================================================================

set -o nounset # Treat unset variables as an error

programname=$0
function usage {
  echo "usage: $programname"
  echo "  -u | --update"
  echo "    Update the current version of NeoVim to the latest stable build"
  echo "  -p | --plugins"
  echo "    Install NeoVim plugins"
  exit 1
}

IsUpdate=false
InstallPlugins=false

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -u|--update)
      IsUpdate=true
      shift # past argument
      ;;
    -p|--plugins)
      InstallPlugins=true
      shift # past argument
      ;;
    *) # unknown option
      usage # show usage
      ;;
  esac
done

#########################################
# INSTALL NEOVIM
#########################################
if [ -x "$(command -v nvim)" ] && [ "$IsUpdate" = false ]
then
  echo "NeoVim is already installed, skipping installation"
else
  if [ -x "$(command -v brew)" ]
  then
    echo "Installing NeoVim"
    brew install neovim
  else
    echo "Brew not installed, just install Brew. Trust me."
    echo "You can install it for Linux, WSL, or Mac. Don't mess around, just install Brew."
  fi
fi

#########################################
# RELOAD NEOVIM CONFIG
#########################################
echo "Reloading NeoVim config"

[ ! -d ~/.config ] && mkdir ~/.config

# Copy NeoVim config to global config directory (refresh if already exists)
NeoVimConfigPath="$HOME/.config/nvim"

# Ensure nvim config directory exists
[ ! -d $NeoVimConfigPath ] && mkdir $NeoVimConfigPath

# Reload/copy lua config files
[ -d "$NeoVimConfigPath/lua" ] && rm -rf "$NeoVimConfigPath"/lua
cp -R ./lua "$NeoVimConfigPath"

# Reload/copy lua init
[ -f "$NeoVimConfigPath/init.lua" ] && rm "$NeoVimConfigPath"/init.lua
cp ./init.lua "$NeoVimConfigPath"

# Prompt to remove init.vim if exists
if [ -f "$NeoVimConfigPath/init.vim" ]
then
  read -r -p "Detected init.vim in $NeoVimConfigPath, which will interfere with this config. Do you want to delete $NeoVimConfigPath/init.vim? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      rm "$NeoVimConfigPath"/init.vim
      ;;
    *)
      echo "Did not remove init.vim. Please remove init.vim for this setup to work properly."
      ;;
  esac
fi

#########################################
# INSTALL PLUGINS
#########################################
# If not requested, don't install any plugins
if [ "$InstallPlugins" = false ]; then exit 0; fi

if ! [ -x "$(command -v node)" ]
then
  echo "Installing NeoVim plugins requires Node, please install NodeJS"
fi

GlobalNodeModules="$(npm get prefix)/bin"
if ! [ -r "$GlobalNodeModules" ] || ! [ -w "$GlobalNodeModules" ]
then
  echo "Access to $GlobalNodeModules is required, please run with elevated permissions."
  exit 1
fi

# Install TS and NeoVim NPM modules
NpmPackages=(typescript neovim diagnostic-languageserver typescript-language-server)

for package in ${NpmPackages[@]}; do
  if [ `npm list -g | grep -c $package` -eq 0 ]; then
    npm -g install $package
  fi
done
