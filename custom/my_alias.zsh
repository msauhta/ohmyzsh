##change dir
alias cdmoi='cd ~/code/ims/msauhta'
alias cdims='cd ~/code/ims/'
alias cdhad='cd ~/code/ims/Hadoop/'
alias cdphx='cd ~/code/ims/usx'
alias cdftpa='cd ~/code/ims/FTPA_Reporting'
alias cdbe='cd ~/code/ims/FTPA/BE'
alias cdbdf='cd ~/code/ims/BigDataFactory/'
alias cddl='cd ~/code/ims/Datalake/'
alias cdda='cd ~/code/ims/DataArchitecture/'
alias cdng='cd ~/code/github/pinc/pcdng'
alias cdsais='cd ~/code/ims/presentation/spark_summit_2018'
alias cdpinc='cd ~/code/pinc/'

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

#proxy
alias proxyon='export http_proxy=http://$USER:${password}@uscdtcpxy.internal.imsglobal.com:8080; export https_proxy=$http_proxy'
alias proxyoff="export http_proxy=''; export https_proxy=''"

#python
alias py3env='source ~/code/py3_env/bin/activate'
alias py3='source ~/code/py3_env/bin/activate; python'
alias py2='source ~/code/py2_env/bin/activate; python'

#docker
alias dh='docker help'


#Triton
alias tnpl='triton profiles'
alias tnps='triton profile set'
alias tnil='triton instances'
alias tnig='triton instance get'
alias tnssh='triton ssh'
#terraform
alias tf='terraform'


#Environment for Phoenix
alias env_phx='source ~/bin/export_env_phx'