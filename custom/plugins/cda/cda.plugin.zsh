PROJECT_FILE="$HOME/.abacus_projects"
CDA_PROJECTS=$(cat $PROJECT_FILE)
#######START OF CDA AUTOCOMPLET###################################################

_cda() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:($CDA_PROJECTS)"
}

compdef _cda cda

#######END OF CDA AUTOCOMPLETE###################################################
cda()
{

    cd "$HOME/code/$1"
}

cdar()
{
    $HOME/go/bin/list_projects |grep ^abacus > $PROJECT_FILE
    CDA_PROJECTS=$(cat $PROJECT_FILE)
}