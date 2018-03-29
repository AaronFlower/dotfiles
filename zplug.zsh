# Use zplug to manage on-my-zsh plugins

source ~/.zplug/init.zsh

# Make sure to use double quotes

# Disable updates using the "frozen" tag 
zplug "k4rthik/git-cal", as:command, frozen:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

