# Inlucde any preinstalled system binaries in path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# zsh specific config and theme choice
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

autoload -U +X bashcompinit && bashcompinit
plugins=(
  git
  docker
  docker-compose
  asdf
)

source $ZSH/oh-my-zsh.sh
fpath=(~/.zsh $fpath)

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
ssh-add ~/.ssh/fortyau_gitlab &> /dev/null

# Jenv setup (Java)
export PATH=$HOME/.jenv/bin:$PATH
eval "$(jenv init -)"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# vim editor and neovim aliasing setup
alias vim="nvim -d"
export EDITOR=nvim


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Joust make path fix for generating compile_commands.json with: $ bear make
# https://github.com/rizsotto/Bear/issues/199
export PATH=/usr/local/opt/make/libexec/gnubin:$PATH

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/node_modules/*,.git/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
