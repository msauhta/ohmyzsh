CACHE_HDSC_ENVIRONMENTS="$HOME/.cdp/hdsc_environments"

#######START OF HDSC AUTOCOMPLETE###################################################
hdsc_environments=`cat $CACHE_HDSC_ENVIRONMENTS |awk '{FS=","; OFS=","; print $1}'`

_hdsc() 
{
    local curcontext="$curcontext" state
    typeset -A opt_args

    _arguments -C \
        ':command:->command'

    case $state in
        (command)

            local -a subcommands
            subcommands=(
                'list-clusters:List all the clusters'
            )
            _describe -t commands 'hdsc' subcommands
        ;;
    esac
}


compdef _hdsc hdsc

#######END OF HDSC AUTOCOMPLETE###################################################
# This function updates the list of Triton instances for each configure profile
hdscrp()
{
    ## TODO fill out details to refresh CACHE_HDSC_ENVIRONMENTS
}


hdsc()
{
    cmd=$1
    case $cmd in
        (list-clusters)
           { 
               echo 'Cluster\tStatus\tNodes' &
               cdp datahub list-clusters |jq -r '.clusters[] | [.clusterName,.status,.nodeCount] | @tsv' 
           } | column -t -s $'\t'
        ;;
        (*)
            triton $@
        ;;
    esac
}

