#!/usr/bin/env bash

echo "Installing package manager..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "Package manager installed."

echo "Installing version manager..."
brew install asdf
echo "Version manager installed."

echo "Installing search tool..."
brew install ripgrep
echo "Search tool installed."

echo "Installing formatting daemon..."
brew install fsouza/prettierd/prettierd
echo "Formatting daemon installed."

echo "Installing terminal..."
mkdir -p $HOME/.config/alacritty/
wget https://raw.githubusercontent.com/jesselloyd/dotfiles/master/alacritty.yml -O $HOME/.config/alacritty
echo "Terminal installed."

echo "Installing shell..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://github.com/morhetz/jesselloyd/dotfiles/master/.zshrc -O $HOME/.zshrc
source $HOME/.zshrc
echo "Shell installed."

echo "Installing editor..."
brew install neovim
wget https://raw.githubusercontent.com/jesselloyd/dotfiles/master/.config -O $HOME/.config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c :PlugInstall
echo "Editor installed."

echo "Happy developing!"
