if which node > /dev/null
then
  if which nvim > /dev/null
  then
    echo "NeoVim is already installed, skipping installation"
  else
    # Install NeoVim because it's awesome!
    sudo mkdir -m 0755 /nix && sudo chown $USER /nix
    curl https://nixos.org/nix/install | sh
    source $HOME/.nix-profile/etc/profile.d/nix.sh
    echo "Please add the following to your shell profile:\n source $HOME/.nix-profile/etc/profile.d/nix.sh"
    nix-env -i neovim
  fi

  if [ ! -f ~/.vim/autoload/plug.vim ]
  then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  sudo npm -g install typescript
  sudo npm -g install neovim

  [ ! -d ~/.config ] && mkdir ~/.config

  cp -R ./nvim ~/.config

  nvim +PlugInstall +qall
else
  echo "Node is not installed. Please install Node"
fi
