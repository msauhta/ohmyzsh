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
    # select projects that start with abacus or ln/ng
    $HOME/go/bin/list_projects | grep -E '^(abacus|ln/ng)' |sort > $PROJECT_FILE
    CDA_PROJECTS=$(cat $PROJECT_FILE)
}