DEFAULT_USER=$USER

export GOBIN=$HOME/go/bin
export IDEA_PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH=$GOBIN:$IDEA_PATH:$PATH
source ~/.iterm2_shell_integration.zsh
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


export PATH="~/.jenv/shims:$PATH"
