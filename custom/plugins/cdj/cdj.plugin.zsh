PROJECTS=$(cat $HOME/.gradle_projects)
#######START OF CDI AUTOCOMPLET###################################################

_cdj() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:($PROJECTS)"
}

compdef _cdj cdj

#######END OF CDG AUTOCOMPLETE###################################################
cdj()
{

    cd "$HOME/code/$1"
}

cdjr()
{
    $HOME/go/bin/list_projects -language gradle > $HOME/.gradle_projects
    PROJECTS=$(cat $HOME/.gradle_projects)
}