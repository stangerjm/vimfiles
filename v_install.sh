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
  # Ensure the current directory is in the path of the script
  cd "`dirname \"$0\"`"

  ScriptPath="$(pwd)"
  AppimagePath="$ScriptPath/squashfs-root"
  NeoVimPath="$(command -v nvim)"
  LocalExecutablePath="/usr/local/bin"
  AppimageUrl="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"

  # Ensure executing user has access to the local executable directory
  if ! [ -r "$LocalExecutablePath" ] || ! [ -w "$LocalExecutablePath" ]
  then
    echo "Access to $LocalExecutablePath is required, please run with elevated permissions."
    exit 1
  fi

  echo "Installing NeoVim..."

  # Remove the current appimage if exists
  if [ -d "$AppimagePath" ]; then rm -r "$AppimagePath"; fi

  # Remove the current NeoVim executable
  rm "$NeoVimPath"

  # Download the latest stable appimage of nvim
  curl -o ./nvim.appimage -L "$AppimageUrl"

  chmod u+x ./nvim.appimage

  ./nvim.appimage --appimage-extract

  ln -s "$AppimagePath/usr/bin/nvim" "$LocalExecutablePath"

  rm ./nvim.appimage
fi

#########################################
# RELOAD NEOVIM CONFIG
#########################################
echo "Reloading NeoVim config"

[ ! -d ~/.config ] && mkdir ~/.config

NeoVimConfigPath="~/.config/nvim"
# Copy NeoVim config to global config directory (refresh if already exists)
if [ -d "$NeoVimConfigPath" ]; then rm -r "$NeoVimConfigPath"; fi
cp -R ./nvim ~/.config

#########################################
# INSTALL PLUGINS
#########################################
# If not requested, don't install any plugins
if [ "$InstallPlugins" = false ]; then exit 0; fi

if ! [ -x "$(command -v node)" ]
then
  echo "Installing NeoVim plugins requires Node, please install NodeJS"
fi

GlobalNodeModules="$(npm get prefix)/lib/node_modules"
if ! [ -r "$GlobalNodeModules" ] || ! [ -w "$GlobalNodeModules" ]
then
  echo "Access to $GlobalNodeModules is required, please run with elevated permissions."
  exit 1
fi

# Install TS and NeoVim NPM modules
NpmPackages=(typescript neovim)

for package in ${NpmPackages[@]}; do
  if [ `npm list -g | grep -c $package` -eq 0 ]; then
    npm -g install $package
  fi
done
