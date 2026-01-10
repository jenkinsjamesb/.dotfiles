# Set prompt
export PS1="\[\e[1;31m\]\u\[\e[1;90m\]@\[\e[1;32m\]\H\[\e[1;90m\]:\[\e[1;34m\]\w\[\e[0m\]\n\$ "

# Set unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Alias vi to nvim
alias vi=nvim

alias su="tmux detach && su"

# Load machine-specific bashrc
[ -f $HOME/.bashrc_extras ] && . $HOME/.bashrc_extras

# Attach to tmux if the default session exists
[ ! "$TMUX" ] && tmux attach -t default

# Start tmux if not running
[ ! "$TMUX" ] && tmux new -s default
