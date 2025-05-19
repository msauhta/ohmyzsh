CDI_PROJECTS=$(cat $HOME/.projects)
#######START OF CDI AUTOCOMPLET###################################################

_cdi() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:($CDI_PROJECTS)"
}

compdef _cdi cdi

#######END OF CDI AUTOCOMPLETE###################################################
cdi()
{
    # increase the number $1 by in the .projects file and sort the file
    # by number followed by project name
    cat $HOME/.projects |\
            awk -v project="$1" '{if ($2 == project) {print $1+1 "\t" $2} else {print $1 "\t" $2}}' > /tmp/.list_projects
    cat /tmp/.list_projects |\
        sort -k1,1nr -k2,2 |\
        awk '!seen[$2]++' > $HOME/.projects
    CDI_PROJECTS=$(cat $HOME/.projects)
    cd "$HOME/code/$1"
}

cdir()
{

    $HOME/go/bin/list_projects | sed -e 's/^/0\t/' > /tmp/.list_projects
    if [ -f $HOME/.projects ]; then
        cat $HOME/.projects >> /tmp/.list_projects
    fi    
    cat /tmp/.list_projects |\
     sort -k1,1nr -k2,2 |\
      awk '!seen[$2]++' > $HOME/.projects
    CDI_PROJECTS=$(cat $HOME/.projects)
}