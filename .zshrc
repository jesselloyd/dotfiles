# Inlucde any preinstalled system binaries in path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# zsh specific config and theme choice
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# SSH 
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set term environment for tmux compatibility
export TERM="xterm-256color"

# NVM setup (Node versioning)
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Jenv setup (Java)
export PATH=$HOME/.jenv/bin:$PATH
eval "$(jenv init -)"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Neovim aliasing setup
alias vim="nvim -d"
export EDITOR=nvim

# rust enviroment setup
export PATH=$HOME/.cargo/bin:$PATH

# go environment setup
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

