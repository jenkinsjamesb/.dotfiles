# Load ~/.bashrc regardless of shell type
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

[ -f $HOME/.bash_profile_extras ] && . $HOME/.bash_profile_extras
