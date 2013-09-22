# URL Magic awesomeness
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# rename using previous word
bindkey "^[m" copy-prev-shell-word

