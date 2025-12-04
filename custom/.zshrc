# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws  
  # globalias
  git
  gradle
  golang
  terraform
  conda
  $(ls $HOME/.oh-my-zsh/custom/plugins |grep -v 'README.md$')
)

# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

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

###########My Old settings from Bash###################
# export PATH="$HOME/bin:$PATH"
# export PYTHONSTARTUP=~/.pythonrc
# export SBT_OPTS=-Dsbt.override.build.repos=true

#To install thrift
# export PATH="/usr/local/opt/bison/bin:$PATH"


#complete -o nospace -C /usr/local/bin/terraform terraform
# complete -o nospace -C $HOME/bin/vault vault

# HOMEBREW_PREFIX="$(brew --prefix)"
# autoload bashcompinit && bashcompinit
# source "${HOMEBREW_PREFIX}/etc/bash_completion.d/az"

#export paths for python
export PATH="/Users/msauhta/.pyenv/versions/3.7.10/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH=$(pyenv root)/shims:$PATH
export PATH="/usr/local/opt/m4/bin:$PATH"


#pull in passwords
source ~/.passwords

export AZURE_STORAGE_ACCOUNT=usxpspn
export AZURE_STORAGE_AUTH_MODE=login

#auto complete for cdas
#source /opt/cdas/bin/cdas_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate
# <<< conda initialize <<<

#setup for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Autocomplete for poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit && compinit

# define the order in compdef (see example for cdi plugin)
zstyle ':completion:*' sort false
zstyle ':completion:*' menu select

# Added by Antigravity
export PATH="/Users/mohitsauhta/.antigravity/antigravity/bin:$PATH"
