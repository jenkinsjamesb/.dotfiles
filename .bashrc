# Set prompt
export PS1="\[\e[1;31m\]\u\[\e[1;90m\]@\[\e[1;32m\]\H\[\e[1;90m\]:\[\e[1;34m\]\w\[\e[0m\]\n\$ "

# Set unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

alias su="tmux detach && su"

[ -n $(command -v tmux) ] && [ -z "$TMUX" ] && exec tmux new-session -A -s main
