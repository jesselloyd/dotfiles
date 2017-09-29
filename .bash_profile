# Powerline
function _update_ps1() {
	PS1="$(~/Library/powerline-shell/powerline-shell.py --cwd-max-depth=3 $? 2> /dev/null)"
}

code() {
	open -a /Applications/Visual\ Studio\ Code.app $1 
}

subl() {
	open -a /Applications/Sublime\ Text.app $1
}

if [ "$TERM" != "linux" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Alias
alias lsp-all='sudo lsof -i -n -P'
alias lsp='lsof -i'

# Terminal colors (works when powerline not enabled)
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
# export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\W\[$(tput sgr0)\]\$(parse_git_branch)\[\033[00m\] $ "

# Branch auto-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Go Programming Language Support (added to path)
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Node Version Manager loader
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# personal scripts
export PATH=$PATH:~/Code/scripts

if command -v brew >/dev/null 2>&1; then
# Load rupa's z if installed
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jesselloyd/.sdkman"
[[ -s "/Users/jesselloyd/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jesselloyd/.sdkman/bin/sdkman-init.sh"

# added by Anaconda3 4.3.1 installer
export PATH="/Users/jesselloyd/anaconda/bin:$PATH"

# Android SDK
export ANDROID_HOME=${HOME}/Library/Android/sdk

# rbenv include
eval "$(rbenv init -)"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

eval $(thefuck --alias)

alias vim="nvim"
alias vi="nvim"
