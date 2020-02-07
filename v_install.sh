curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo npm -g install typescript
sudo npm -g install neovim

mkdir ~/.config

cp -R ./nvim ~/.config

nvim +PlugInstall +qall
