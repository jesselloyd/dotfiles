#!/usr/bin/env bash

BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/plugged"
COLORS_DIR="$BASE_DIR/colors"
AUTOLOAD_DIR="$BASE_DIR/autoload"
PLUGINS=(
  "junegunn/fzf"
  "jremmen/vim-ripgrep"
  "tpope/vim-fugitive"
  "airblade/vim-gitgutter"
  "scrooloose/nerdtree"
  "vim-airline/vim-airline"
  "tpope/vim-commentary"
  "neoclide/coc.nvim/tree/release"
  "vim-airline/vim-airline-themes"
  "chriskempson/base16-vim"
  "sheerun/vim-polyglot"
  "editorconfig/editorconfig-vim"
)

echo "Setting up Alacritty..."

mkdir -p $HOME/.config/alacritty/
wget https://raw.githubusercontent.com/jesselloyd/dotfiles/master/alacritty.yml -O $HOME/.config/alacritty

echo "Alacritty setup complete."

echo "Setting up ZSH..."

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://github.com/morhetz/jesselloyd/dotfiles/master/.zshrc -O $HOME/.zshrc

echo "ZSH setup complete."

echo "Setting up Vim..."

mkdir -p $PLUGIN_DIR
mkdir -p $COLORS_DIR
mkdir -p $AUTOLOAD_DIR

wget https://raw.githubusercontent.com/jesselloyd/dotfiles/master/.vimrc -O $HOME/.vimrc

# Add vim-plug to $HOME/.vim/autoload and corresponding dirs.
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install all plugins to correct folder.
for PLUGIN in ${PLUGINS[@]}; do
   DIRNAME="$(basename $PLUGIN)"
   git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

echo "Vim setup complete."

