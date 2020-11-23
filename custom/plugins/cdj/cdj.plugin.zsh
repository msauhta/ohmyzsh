CDJ_PROJECTS=$(cat $HOME/.gradle_projects)
#######START OF CDJ AUTOCOMPLET###################################################

_cdj() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:($CDJ_PROJECTS)"
}

compdef _cdj cdj

#######END OF CDJ AUTOCOMPLETE###################################################
cdj()
{

    cd "$HOME/code/$1"
}

cdjr()
{
    $HOME/go/bin/list_projects -language gradle > $HOME/.gradle_projects
    CDJ_PROJECTS=$(cat $HOME/.gradle_projects)
}