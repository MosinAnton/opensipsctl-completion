#/usr/bin/env bash

# Copyright (C) 2019 Anton Mosin <anton@mosin.org>
# Distributed under the GNU General Public License, version 2.0.

_opensipsctl_completions()
{
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "dispatcher fifo monitor ps" -- $cur) )
  elif [ $COMP_CWORD -eq 2 ]; then
    case "$prev" in
      "dispatcher")
        COMPREPLY=($(compgen -W "show reload dump addgw rmgw" -- $cur) )
        ;;
      "fifo")
	COMPREPLY=($(compgen -W "$(opensipsctl fifo which)" -- $cur) )
        ;;
      *)
        ;;
    esac
  fi
}

complete -F _opensipsctl_completions opensipsctl
