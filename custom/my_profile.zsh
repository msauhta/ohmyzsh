DEFAULT_USER=$USER

export GOBIN=$HOME/go/bin
export PATH=$GOBIN:$PATH
source ~/.iterm2_shell_integration.zsh
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#Terrafrom - Triton
export TF_VAR_triton_key_id=e9:e4:cd:ae:55:27:56:a1:b1:07:eb:3c:bb:da:e4:49


#For Phoenix terraform projec
export GITLAB_API_TOKEN=ghc8Rbs1vD7BM54UMj3y
export VAULT_ADDR=https://vault.rxcorp.com:8200

export PATH="~/.jenv/shims:$PATH"

##Gitlab API Token  : https://git.rxcorp.com/profile/personal_access_tokens
export GITLAB_CREATE_PERSONAL_REPO=GVv2AqR7SZzG9HY4T6yS

##Github API Token  : https://github.com/settings/tokens
export GITHUB_CREATE_PERSONAL_REPO=8ed84056f7976d764728e3a9d163fd0c5aa983dd