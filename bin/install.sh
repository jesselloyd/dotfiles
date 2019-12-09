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
  "junegunn/vim-peekaboo"
  "jiangmiao/auto-pairs"
  "shougo/echodoc"
  "neoclide/coc.nvim/tree/release"
  "vim-airline/vim-airline-themes"
  "morhetz/gruvbox"
  "pangloss/vim-javascript"
  "leafgarland/typescript-vim"
  "posva/vim-vue"
  "fatih/vim-go"
  "editorconfig/editorconfig-vim"
  "janko/vim-test"
)

echo "setting up zsh..."

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://github.com/morhetz/jesselloyd/dotfiles/master/.zshrc -O $HOME/.zshrc

echo "zsh setup complete"

echo "setting up vim..."

mkdir -p $PLUGIN_DIR
mkdir -p $COLORS_DIR
mkdir -p $AUTOLOAD_DIR

# Get config
wget https://raw.githubusercontent.com/jesselloyd/dotfiles/master/.vimrc -O $HOME/.vimrc

# Add vim-plug to $HOME/.vim/autoload and corresponding dirs
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add colorscheme to colors folder
wget https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim -O $COLORS/gruvbox.vim

# Install all plugins to correct folder
for PLUGIN in ${PLUGINS[@]}; do
   DIRNAME="$(basename $PLUGIN)"
   git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

echo "vim setup complete"

echo "setting up alacritty..."

mkdir -p $HOME/.config/alacritty/
wget https://raw.githubusercontent.com/jesselloyd/dotfiles/master/alacritty.yml -O $HOME/.config/alacritty

echo "alacritty setup complete"

