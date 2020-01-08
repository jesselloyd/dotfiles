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

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# set term environment
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

# vim editor and neovim aliasing setup
alias vim="nvim -d"
export EDITOR=nvim

# rust enviroment setup
export PATH=$HOME/.cargo/bin:$PATH

# go environment setup
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# tmux autostart on open
if [ -z "$TMUX" ]; then
    base_session='dev'
    # Create a new session if it doesn't exist
    tmux has-session -t $base_session || tmux new-session -d -s $base_session
    # Attach to a client if it already exists
    client_cnt=$(tmux list-clients | wc -l)
    if [ $client_cnt -ge 1 ]; then
        session_name=$base_session"-"$client_cnt
        tmux new-session -d -t $base_session -s $session_name
        tmux -2 attach-session -t $session_name \; set-option destroy-unattached
    else
        tmux -2 attach-session -t $base_session
    fi
fi

