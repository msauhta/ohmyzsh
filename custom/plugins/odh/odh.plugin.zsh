
#######START OF ODH AUTOCOMPLETE###################################################

_odh() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _arguments -C \
        ':command:->command' \
        '*::options:->options'

    case $state in
        (command)

            local -a subcommands
            subcommands=(
                'datalakes:List Datalakes'
                'datahubs:List Datahubs'
                'print_mapping:Print Mapping'
            )
            _describe -t commands 'odh' subcommands
        ;;

        (options)
            case $line[1] in
                (datalakes)
                    _alternative \
                        "datalakes:list datalakes:(odh all)"
                ;;

                (datahubs)
                    _alternative \
                        "datahubs:list datahubs:(odh all)"
                ;;

                (print_mapping)
                    __odh-print_mapping
                ;;
            esac
        ;;
    esac
}

__odh-print_mapping()
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _arguments -C \
        ':command:->command' \
        '*::options:->options'

    case $state in
        (command)

            local -a subcommands
            subcommands=(
                'list:List the instances in current or provided profile'
                'create:Create the instance in current or provided profile'
                'get:Get the information about the instance'
                'ssh:Ssh into the instance'
                'ip:Get the ip address of the instance'
                'stop:Stop the instance'
                'start:Start the instance'
                'reboot:Reboot the instance'

            )
            _describe -t commands 'tn instance' subcommands
        ;;
        (options)
            case $line[1] in
                (list|create)
                    _alternative \
                        "profile:list of profiles:($profiles)"
                ;;
                (*)
                    _alternative \
                        "instance:list of instance:($instances)"
                ;;
            esac
        ;;
    esac

}

compdef _odh odh

#######END OF TN AUTOCOMPLETE###################################################
odh()
{
    cmd=$1
    case $cmd in
        (datalakes)
            odh_datalakes ${@:2}
            ;;

        (datahubs)
            odh_datahubs ${@:2}
            ;;

        (*)
            echo "Command $cmd is not supported"    
            ;;
    esac

}




