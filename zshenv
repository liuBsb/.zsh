# -*- sh -*-

if [ -z "$ZSH_VERSION" ]; then
    unset LC_ALL
    eval export $(zsh -c \
                  "typeset PATH
                   typeset LC_ALL $(locale 2> /dev/null | sed 's/=.*//' | tr '\n' ' ')
                  ")
    return
fi
ZSH=${ZSH:-${ZDOTDIR:-$HOME}/.zsh}

