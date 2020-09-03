alias tni='tn instance'
alias tnp='tn profile'

#instance
alias tnssh='tn instance ssh'
alias tnil='tn instance list'
alias tnig='tn instance get'
alias tnilc='tn instance like compute'
#profile
alias tnpl='tn profile list'
alias tnps='tn profile set'
#package
alias tnpkl='tn package list'
#package
alias tnpkl='tn package list'
alias tniml='tn image list'

CACHE_PROFILE_INSTANCES="$HOME/.triton/tnrp_profile_instances"
CACHE_PROFILE_IMAGES="$HOME/.triton/tnrp_profile_images"

#######START OF TN AUTOCOMPLETE###################################################
instances=`cat $CACHE_PROFILE_INSTANCES |awk '{FS=","; OFS=","; print $1,$2}'`
profiles=`triton profiles -o name |sed -e '1d'`

_tn() 
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
                'profile:Sub-command for profile'
                'instance:Sub-command for Instance'
            )
            _describe -t commands 'tn' subcommands
        ;;

        (options)
            case $line[1] in
                (profile)
                    __tn-profile
                ;;

                (instance)
                    __tn-instance
                ;;
            esac
        ;;
    esac
}

__tn-profile()
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
                'list:List the profiles'
                'set:Set the profile.'
                'get:Get the information about the profile'
            )
            _describe -t commands 'tn profile' subcommands
        ;;
        (options)
            case $line[1] in
                (set|get|refresh)
                    _alternative \
                        "profile:set profile:($profiles)"
                ;;
            esac
        ;;
    esac

}

__tn-instance()
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

compdef _tn tn

#######END OF TN AUTOCOMPLETE###################################################
# This function updates the list of Triton instances for each configure profile
tnrp()
{
    # Save current profile to revert back
    curr_profile=`triton profiles -o name,curr |grep \* |cut -f1 -d' '`


    # If user provides a profile as input arg
    #  1. validate that the profile is valid
    #  2. update profiles array so only the user selected profile is updated
    # profiles=(`triton profiles -o name | sed -e '1d'|sort`)
    # above line was not getting converted into list/array
    profiles=(`triton profiles -o name | sed -e '1d'|sort |sed -e 'H;$!d;x;s/\n/ /g' |cut -c2-`)
    if [ $# -eq 1 ]; then
        do_one=1
        arg_profile=$1
        if (($profiles[(Ie)$arg_profile])); then
            # profile is valid so update the profiles array
            profiles=($arg_profile)
        else
            echo "Profile $arg_profile not found in existing profiles listed below\n\t$profiles"
            return 1
        fi
    else
        # Get list of profiles
        do_one=0
    fi


    touch $CACHE_PROFILE_INSTANCES
    touch $CACHE_PROFILE_IMAGES
    for profile in $profiles;
    do
      echo "Fetching >>$profile<<"
      triton profile set $profile >/dev/null
      # Create a new cache with list of instance name for the profile being processed
      triton instances -o name,primaryIp | sort | sed -e '1d' -e "s/^/${profile},/"  -e 's/  */,/' > ${CACHE_PROFILE_INSTANCES}_${profile} &
      # Create a new cache with list of image name for the profile being processed
      triton images -o name | sort | sed -e '1d' -e "s/^/${profile},/" > ${CACHE_PROFILE_IMAGES}_${profile} &
    done
    echo "Waiting to let all processes complete"
    wait
    echo "All profiles fetched"
  
    echo "Backup all stuff"
    cp $CACHE_PROFILE_INSTANCES ${CACHE_PROFILE_INSTANCES}_bkp
    cp $CACHE_PROFILE_IMAGES ${CACHE_PROFILE_IMAGES}_bkp
  
    if [ $do_one -eq 1 ]; then
      echo "Updating $profile"
      # Transfer remaining profiles from cache to new cache
      cat $CACHE_PROFILE_INSTANCES |grep -v "^$profile" >> ${CACHE_PROFILE_INSTANCES}_${profile}
      mv ${CACHE_PROFILE_INSTANCES}_${profile} $CACHE_PROFILE_INSTANCES

      # Transfer remaining profiles from cache to new cache
      cat $CACHE_PROFILE_IMAGES |grep -v "^$profile" >> ${CACHE_PROFILE_IMAGES}_${profile}
      # update active profile with new profile
      mv ${CACHE_PROFILE_IMAGES}_${profile} $CACHE_PROFILE_IMAGES
    else
        rm -f $CACHE_PROFILE_INSTANCES
        rm -f $CACHE_PROFILE_IMAGES
        for profile in $profiles;
        do
            echo "Updating $profile"
            cat ${CACHE_PROFILE_INSTANCES}_${profile} >> $CACHE_PROFILE_INSTANCES
            cat ${CACHE_PROFILE_IMAGES}_${profile} >> $CACHE_PROFILE_IMAGES
            rm -f ${CACHE_PROFILE_INSTANCES}_${profile}
            rm -f ${CACHE_PROFILE_IMAGES}_${profile}
        done    
    fi

    #Update the instance list
    instances=`cat $CACHE_PROFILE_INSTANCES |awk '{FS=","; OFS=","; print $1,$2}'`

    # Revert back to the current profile
    triton profile set $curr_profile    
}


tn()
{
    cmd=$1
    case $cmd in
        (instance)
            subcmd=$2
            case $subcmd in
                (list)
                    triton $@
                ;;
                (*)
                    #tn instance ssh profile_name,instance_name
                    IFS=',' fields=($(echo $3))
                    if [ $#fields -eq 2 ];
                    then
                        profile_name=$fields[1]
                        triton profile set $profile_name 2>/dev/null
                        instance_name=$fields[2]
                    else
                        instance_name=$fields[1]
                    fi
                    triton instance $subcmd $instance_name
                ;;
            esac            
        ;;

        (*)
            triton $@
        ;;
    esac

}




