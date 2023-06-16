export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

. /usr/local/opt/asdf/libexec/asdf.sh

plugins=(
  git
  yarn
  docker
  docker-compose
  asdf
)

zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh
fpath=(~/.zsh $fpath)

alias vim="nvim -d"
export EDITOR=nvim

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/node_modules/*,.git/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws
export PATH=/usr/local/aws/bin:$PATH

eval $(twilio autocomplete:script zsh) &> /dev/null


# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete() 
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet
