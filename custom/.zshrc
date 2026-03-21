# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"


plugins=(
  git
  $(ls $HOME/.oh-my-zsh/custom/plugins |grep -v 'README.md$')
)

# https://docs.brew.sh/Shell-Completion
# Hardcode brew prefix to avoid slow subprocess on every shell start
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

# fpath additions must be before oh-my-zsh source so compinit picks them up
fpath+=~/.zfunc

# Skip compaudit security check on every startup
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

#pull in passwords
source ~/.passwords

#setup for nvm (lazy-loaded to speed up shell startup)
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { unfunction nvm; _load_nvm; nvm "$@"; }
node() { unfunction node; _load_nvm; node "$@"; }
npm() { unfunction npm; _load_nvm; npm "$@"; }
npx() { unfunction npx; _load_nvm; npx "$@"; }


source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# define the order in compdef (see example for cdi plugin)
zstyle ':completion:*' sort false
zstyle ':completion:*' menu select

# Added by Antigravity
export PATH="/Users/mohitsauhta/.antigravity/antigravity/bin:$PATH"

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/mohitsauhta/.bun/_bun" ] && source "/Users/mohitsauhta/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

