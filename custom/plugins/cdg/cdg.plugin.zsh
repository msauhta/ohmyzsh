GO_PROJECTS=$(cat $HOME/.go_projects)
#######START OF Change Dir GO Projects (cdg) AUTOCOMPLET###################################################

_cdg() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:($GO_PROJECTS)"
}

compdef _cdg cdg

#######END OF Change Dir GO Projects (cdg) AUTOCOMPLET###################################################

# This function changes the directory to Go project
cdg()
{

    cd "$HOME/go/src/$1"
}

## refresh list of go projects
cdgr()
{
    $HOME/go/bin/list_projects -language=go -file=$HOME/.go_projects
    GO_PROJECTS=$(cat $HOME/.go_projects)
}