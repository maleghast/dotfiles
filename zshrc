# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

plugins=(git)

source "__DOTFILES__/language"

source "__DOTFILES__/exports"

source "__DOTFILES__/aliases"

source "__DOTFILES__/proxies"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/sth/.rvm/gems/ruby-1.9.3-p194/bin:/Users/sth/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/sth/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/sth/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/sth/.rvm/bin
