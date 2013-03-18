# allow the use of the Home/End keys
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# allow the use of the Delete/Insert keys
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert

# alternate mappings for "page up" and "page down" to search the history
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward

# mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# set completion-ignore-case on

# set mark-symlinked-directories on

# set show-all-if-ambiguous on

# Control-j: menu-complete
# Control-k: menu-complete-backward

# set completion-prefix-display-length 2
