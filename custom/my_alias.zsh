##change dir
alias cdmoi='cd ~/code/ims/msauhta'
alias cdhad='cd ~/code/ims/Hadoop/'
alias cdphx='cd ~/code/ims/usx'
alias cdo='cd ~/code/rwts/rds/oct/oct-data-hub'

# open oh-my-zsh
alias ohmyzsh="code ~/.oh-my-zsh"

# Login with ssh key
alias sshu='ssh -o PubkeyAuthentication=no' 
#dir-copy curr dir in clipboard
alias pwc='pwd | pbcopy'
#dir-change to directory in clipboard  
#alias cdp='cd `pbpaste`'    =>> Comment to avoid conflict with CDP command line

#maven
# commented out to use ~/bin
#alias mi='mvn install -DskipTests=true'
#alias mci='mvn clean install -DskipTests=true'
alias mcr='mvn clean scoverage:report'
alias mcim='mvn clean install -DskipTests=true -am -pl'
alias mcip='mvn clean install -DskipTests=true -pl'
alias mim='mvn install -am -pl'

# gradle
alias gwb='./gradlew clean build'
alias gwbt='./gradlew clean build -x test'
alias gwbr='./gradlew clean build --refresh-dependencies'
alias gwi='./gradlew clean build publishToMavenLocal'
alias gwit='./gradlew clean build publishToMavenLocal -x test'
alias gws='./gradlew clean shadowJar'
alias gwst='./gradlew clean shadowJar -x test'
#gradle 
#not using alias since it gets auto-expanded by globalalias plugin
# func gw(){
# 	if [ -f ./gradlew ] ; then
# 		echo "executing gradlew instead of gradle";
# 		./gradlew "$@";
# 	else
# 		gradle "$@";
# 	fi
# }

#alias ls - In addition to what's setup in zsh lib
alias llt='ls -aptl'
alias llth='ls -aptl | head'
#python
alias py3env='source ~/code/py3_env/bin/activate'
alias py3='~/code/py3_env/bin/python'
alias py3cenv='source ~/code/py3_cdp_env/bin/activate'
alias py3c='~/code/py3_cdp_env/bin/python'
alias py2='~/code/py2_env/bin/python'

#docker
alias dh='docker help'

#kubernetes
alias kc='kubectl'

#terraform/terragrunt
alias tf='terraform'
alias tg='terragrunt'
alias tgpa='terragrunt plan-all'
alias tgaa='terragrunt apply-all'
alias tgda='terragrunt destroy-all'
alias tgca='find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;'


#scala with more more
alias scalabig='scala -J-Xms2048m -J-Xmx2048m'

alias killNotifs='killall NotificationCenter'

#Environment for Phoenix
alias env_sct='source ~/bin/export_sct'
