DEFAULT_USER=$USER

export GOBIN=$HOME/go/bin
export IDEA_PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH=$GOBIN:$IDEA_PATH:$PATH
source ~/.iterm2_shell_integration.zsh

# Keep shims on PATH, but defer shell hook initialization until needed.
export JENV_ROOT="$HOME/.jenv"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$JENV_ROOT/shims:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

_load_jenv() {
	if command -v jenv >/dev/null 2>&1; then
		eval "$(jenv init -)"
	fi
}

_load_pyenv() {
	if command -v pyenv >/dev/null 2>&1; then
		eval "$(pyenv init --path)"
		eval "$(pyenv init -)"
		eval "$(pyenv virtualenv-init -)"
	fi
}

jenv() { unfunction jenv; _load_jenv; jenv "$@"; }
pyenv() { unfunction pyenv; _load_pyenv; pyenv "$@"; }