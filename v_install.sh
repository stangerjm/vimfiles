# Install NeoVim because it's awesome!
sudo mkdir -m 0755 /nix && sudo chown $USER /nix
curl https://nixos.org/nix/install | sh
source $HOME/.nix-profile/etc/profile.d/nix.sh
nix-env -i neovim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo npm -g install typescript
sudo npm -g install neovim

mkdir ~/.config

cp -R ./nvim ~/.config

nvim +PlugInstall +qall
