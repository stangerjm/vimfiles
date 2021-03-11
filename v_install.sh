if which node > /dev/null
then
  if which nvim > /dev/null
  then
    echo "NeoVim is already installed, skipping installation"
  else
    # Install NeoVim because it's awesome!
    curl -o ./nvim.appimage -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    sudo mv ./nvim.appimage /usr/local/bin/nvim
    chmod u+x /usr/local/bin/nvim
  fi

  if [ ! -f ~/.vim/autoload/plug.vim ]
  then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  sudo npm -g install typescript
  sudo npm -g install neovim

  [ ! -d ~/.config ] && mkdir ~/.config

  cp -R ./nvim ~/.config
  cp ./vimrc ~/.vim

  nvim +PlugInstall +qall
else
  echo "Node is not installed. Please install Node"
fi
