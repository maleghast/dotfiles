# this will change depending on the bootstrap.sh exec --test (revert later)
export dotfiles="__DOTFILEPATH__"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# adds tab completion for SSH
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh



# import exports
source "__DOTFILEPATH__/exports"

# import aliases
source "__DOTFILEPATH__/aliases"

# import language settings
source "__DOTFILEPATH__/language"

# import BBC proxies
source "__DOTFILEPATH__/proxies.bash"
