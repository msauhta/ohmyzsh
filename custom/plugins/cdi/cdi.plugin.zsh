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

    cd "$HOME/code/$1"
}

cdir()
{
    $HOME/go/bin/list_projects > $HOME/.projects
    CDI_PROJECTS=$(cat $HOME/.projects)
}