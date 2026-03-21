CDI_PROJECTS=$(cat $HOME/.projects)
#######START OF CDI AUTOCOMPLET###################################################

_cdi() 
{
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _alternative \
        "projects:list of projects:($CDI_PROJECTS)"
}

compdef _cdi cdi

#######END OF CDI AUTOCOMPLETE###################################################
cdi()
{
    # increase the number $1 by in the .projects file and sort the file
    # by number followed by project name
    cat $HOME/.projects |\
            awk -v project="$1" '{if ($2 == project) {print $1+1 "\t" $2} else {print $1 "\t" $2}}' > /tmp/.list_projects
    cat /tmp/.list_projects |\
        sort -k1,1nr -k2,2 |\
        awk '!seen[$2]++' > $HOME/.projects
    CDI_PROJECTS=$(cat $HOME/.projects)
    cd "$HOME/code/$1"
}

cdir() {
  tmp_new="/tmp/.list_projects.new"
  tmp_old="/tmp/.list_projects.old"

  # Generate new authoritative list (default priority = 0)
  "$HOME/go/bin/list_projects" \
    | awk '{ print 0 "\t" $0 }' \
    > "$tmp_new"

  # Load existing projects (if any)
  if [ -f "$HOME/.projects" ]; then
    cp "$HOME/.projects" "$tmp_old"
  else
    : > "$tmp_old"
  fi

  # Merge:
  # - keep only projects present in the new list
  # - retain old priority when project exists
  # - assign 0 to newly discovered projects
  awk -F'\t' '
    NR == FNR {
      exists[$2] = 1
      next
    }

    exists[$2] {
      pr[$2] = $1
    }

    END {
      for (p in exists) {
        printf "%s\t%s\n", (p in pr ? pr[p] : 0), p
      }
    }
  ' "$tmp_new" "$tmp_old" \
    | sort -k1,1nr -k2,2 \
    > "$HOME/.projects"

  CDI_PROJECTS="$(cat "$HOME/.projects")"
}