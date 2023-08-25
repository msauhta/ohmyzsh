MAVEN_POM_FILE="$HOME/.maven_poms"
MAVEN_POMS=$(cat $MAVEN_POM_FILE)
#######START OF CDM AUTOCOMPLET###################################################

_pom() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:(${MAVEN_POMS})"
}

compdef _pom pom
#######END OF POM AUTOCOMPLETE###################################################
pom()
{
    code "$HOME/.m2/repository/$1"
}

pomr()
{
    # select projects that start with abacus or ln/ng
    cd $HOME/.m2/repository
    find . -type f -name '*.pom' | cut -c3- | sort > $MAVEN_POM_FILE
    MAVEN_POMS=$(cat $PROJECT_FILE)
}
