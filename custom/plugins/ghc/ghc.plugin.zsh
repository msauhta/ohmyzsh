_ghc_autocomplete() {
  local commands=("alias" "config" "explain" "suggest")
  compadd "${commands[@]}"
}

compdef _ghc_autocomplete ghc

def ghc() {
  local command="$1"
  shift
  gh copilot "$command" "$@"
}