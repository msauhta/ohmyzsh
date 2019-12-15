##change dir
alias cdmoi='cd ~/code/ims/msauhta'
alias cdhad='cd ~/code/ims/Hadoop/'
alias cdphx='cd ~/code/ims/usx'

# open oh-my-zsh
alias ohmyzsh="code ~/.oh-my-zsh"

#dir-copy curr dir in clipboard
alias pwc='pwd | pbcopy'
#dir-change to directory in clipboard
alias cdp='cd `pbpaste`'

#maven
alias mci='mvn clean install -DskipTests=true'
alias mcr='mvn clean scoverage:report'
alias mi='mvn install -DskipTests=true'
alias mcim='mvn clean install -DskipTests=true -am -pl'
alias mcip='mvn clean install -DskipTests=true -pl'
alias mim='mvn install -am -pl'

#alias ls - In addition to what's setup in zsh lib
alias llt='ls -aptl'
alias llth='ls -aptl | head'
#python
alias py3env='source ~/code/py3_env/bin/activate'
alias py3='source ~/code/py3_env/bin/activate; python'
alias py2='source ~/code/py2_env/bin/activate; python'

#docker
alias dh='docker help'


#terraform/terragrunt
alias tf='terraform'
alias tg='terragrunt'
alias tgpa='terragrunt plan-all'
alias tgaa='terragrunt apply-all'
alias tgda='terragrunt destroy-all'
alias tgca='find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;'



alias killNotifs='killall NotificationCenter'

#Environment for Phoenix
alias env_sct='source ~/bin/export_sct'
