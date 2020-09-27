GO_PROJECTS=$(cat $HOME/.go_projects)

# Reference: 
#  Build executables for multiple executables for different architecture
#       https://www.digitalocean.com/community/tutorials/how-to-build-go-executables-for-multiple-platforms-on-ubuntu-16-04#step-4-%E2%80%94-building-executables-for-different-architectures

#######START OF GO-BUILD custom (gobc) AUTOCOMPLET###################################################
goos_list=(
    darwin
    linux
    window
)
typeset -A goos_map
goos_map[darwin]='amd64'
goos_map[linux]='amd64 arm64'
goos_map[windows]='amd64 386'


_gobc() 
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
                $goos_list
            )
            _describe -t commands 'gob' subcommands
        ;;

        (options)
            _gobc-arch $line[1]
        ;;
    esac
}

_gobc-arch()
{
    target_os=$1
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _arguments -C \
        ':command:->command' \
        '::filename:_files' \

    case $state in
        (command)

            local -a subcommands
            subcommands=(
                $(echo $goos_map[$target_os])
            )
            _describe -t commands 'gob' subcommands
        ;;

    esac

}

compdef _gobc gobc

#######END  OF GO-BUILD custom (gobc) AUTOCOMPLET###################################################

gobc()
{
        target_os=$1
        target_arch=$2
        package_import_path=$3

        echo env GOOS=$target_os GOARCH=$target_arch go build $package_import_path
        env GOOS=$target_os GOARCH=$target_arch go build $package_import_path
}