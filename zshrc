# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -*- sh -*-

# Execute tmux if available and if we have some configuration for it
[ -t 1 ] && (( $+commands[tmux] )) && \
      [[ -f ~/.tmux.conf && \
               $PPID != 1 && \
               $$ != 1 && \
               $TERM != dumb &&
               $TERM != linux && \
               $TERM != screen* && \
               -z $TMUX ]] && \
      exec tmux

() {
    local config_file
    for config_file ($ZSH/rc/*.zsh) source $config_file
}

:

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
