_devcontainer_base_completion() {
  local cur prev
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ ${COMP_CWORD} -eq 1 ]]; then
    local bases
    bases="$("${COMP_WORDS[0]}" --list-bases 2>/dev/null)"
    COMPREPLY=( $(compgen -W "${bases}" -- "${cur}") )
    return 0
  fi

  if [[ ${COMP_CWORD} -eq 2 ]]; then
    COMPREPLY=( $(compgen -d -- "${cur}") )
    return 0
  fi
}

complete -F _devcontainer_base_completion devcontainer-base
