# this will change depending on the bootstrap.sh exec
export dotfiles='~/Development/dotfiles'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# adds tab completion for SSH
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh



# import exports
source "$dotfiles/exports"

# import aliases
source "$dotfiles/aliases"

# import language settings
source "$dotfiles/language"

# import BBC proxies
source "$dotfiles/proxies"

unset $dotfiles