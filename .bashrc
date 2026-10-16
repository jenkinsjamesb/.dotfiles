# Set prompt
export PS1="\[\e[1;31m\]\u\[\e[1;90m\]@\[\e[1;32m\]\H\[\e[1;90m\]:\[\e[1;34m\]\w\[\e[0m\]\n\$ "

# Set unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Export PATH extensions
export PATH="$PATH:$HOME/go/bin:$HOME/.local/bin"

# Make a quick-connect tmux alias
alias t='tmux new-session -A -s main'

function tnew() {
    name="$1"

    if [ -z "$name" ]; then
        name="main"
    fi

    tmux new-session -A -s "$name"
}

function tsplit() {
    path="$1"
    [ -z "$path" ] && path="$PWD"
    cd "$path" || return
    tmux split-window -h
    tmux split-window
}

function gprune() {
    del="-d"
    [ "$1" == "-f" ] || [ "$1" == "--force" ] && del="-D"

    git fetch --prune
    git branch -r |
        awk "{print \$1}" |
        grep -E -v -f /dev/fd/0 <(git branch -vv | grep origin) |
        awk "{print \$1}" |
        xargs git branch $del
}
