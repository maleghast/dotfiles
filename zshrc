# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# this will change depending on the bootstrap.sh exec
export dotfiles="__DOTFILEPATH__"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

plugins=(git)

# import language
source "__DOTFILEPATH__/language"

# import exports
source "__DOTFILEPATH__/exports"

# import aliases
source "__DOTFILEPATH__/aliases"

# import proxies
source "__DOTFILEPATH__/proxies.zsh"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/sth/.rvm/gems/ruby-1.9.3-p194/bin:/Users/sth/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/sth/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/sth/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/sth/.rvm/bin
