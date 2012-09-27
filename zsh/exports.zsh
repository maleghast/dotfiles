# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make vim the default editor
export EDITOR="vim"

export NETWORK_LOCATION="$(/usr/sbin/scselect 2>&1 | egrep '^ \* ' | sed 's:.*(\(.*\)):\1:')"

export TERM="xterm-256color"

export GITHUB_USER="sthulbourn"
