if which node > /dev/null
then
  if which nvim > /dev/null
  then
    echo "NeoVim is already installed, skipping installation"
  else
    # Install NeoVim because it's awesome!
    curl -o ./nvim.appimage -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x ./nvim.appimage

    ./nvim.appimage --appimage-extract

    sudo ln -s /home/jastange/.vim/squashfs-root/usr/bin/nvim /usr/local/bin

    rm ./nvim.appimage
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
