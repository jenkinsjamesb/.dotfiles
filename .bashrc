# Set prompt
export PS1="\[\e[1;35m\][\u@\H:\w]\n\$ \[\e[0m\]"

# Set unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Load machine-specific bashrc
[ -f $HOME/.bashrc_extras ] && . $HOME/.bashrc_extras

# Start tmux if not running
[ ! "$TMUX" ] && tmux
