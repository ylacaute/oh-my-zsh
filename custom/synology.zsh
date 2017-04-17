#!/bin/zsh

# Verify if emacs exist, use zile if not
hash emacs >/dev/null 2>&1
if [[ "$?" -ne "0" ]]; then
  alias emacs='zile'
fi
