DEFAULT_USER=$USER
export PATH=~/go/bin:$PATH
source ~/.iterm2_shell_integration.zsh
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#Terrafrom - Triton
export TF_VAR_triton_key_id=e9:e4:cd:ae:55:27:56:a1:b1:07:eb:3c:bb:da:e4:49

export PATH="~/.jenv/shims:$PATH"

#User: usxdusr (Phoenix)
export DEVL_USX_VAULT_TOKEN=s.2wdLzN1uvqylR2WHq12EwsrE
#User: usxpusr (Phoenix)
export PROD_USX_VAULT_TOKEN=s.2wdLzN1uvqylR2WHq12EwsrE


##Gitlab API Token  : https://git.rxcorp.com/profile/personal_access_tokens
export GITLAB_CREATE_PERSONAL_REPO=GVv2AqR7SZzG9HY4T6yS