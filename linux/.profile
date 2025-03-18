# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    # personal bashrc
    if [ -f "$HOME/Documents/Projects/dotfiles/linux/.export_profile" ]; then
        . "$HOME/Documents/Projects/dotfiles/linux/.export_profile"
        . "$HOME/Documents/Projects/dotfiles/linux/wsl/.wsl"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
