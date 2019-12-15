
alias vt='export VAULT_TOKEN='

#######START OF PASSC AUTOCOMPLETE###################################################

PWD_FILE="$HOME/.oh-my-zsh/custom/resources/.passwords"
tenants=($(cat $PWD_FILE | cut -f1 -d,|sort|uniq))
passwords=($(cat $PWD_FILE | cut -f1-3 -d,|sort))
typeset -A tenant_map
for tenant in $tenants;
do
    tenant_map[$tenant]=$(cat $PWD_FILE | grep "^${tenant}," |cut -f2- -d,)
done

_psc() 
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
                $tenants
            )
            _describe -t commands 'psc' subcommands
        ;;

        (options)
            _psc-tenant $line[1]
        ;;
    esac
}

_psc-tenant()
{
    tenant=$1
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "passwords:list of passwords:($(echo $tenant_map[$tenant] |cut -f1-2 -d,))"

}


compdef _psc psc

#######END OF PSC AUTOCOMPLETE###################################################

psc() {
    tenant=$1
    system=$(echo $2|cut -f1 -d,)
    user=$(echo $2|cut -f2 -d,)

    echo $tenant_map[$tenant] | grep "^$system,$user" |cut -f3 -d, |pbcopy
    echo "Password for $tenant,$system,$user stored in clipboard"
}