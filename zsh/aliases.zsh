alias r="source ~/.zshrc"
alias e="$EDITOR $dotfiles && r"

alias svn='rlwrap svn'

# Sublime
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo 'Public key copied to pasteboard.'"

alias vos="vagrant destroy && vagrant up"
alias adpasswd="smbpasswd -U thulbs01 -r bgb01dc1101.national.core.bbc.co.uk"

function sha() {
  echo -n $@ | openssl sha
}

function md5() {
  echo -n $@ | openssl md5
}

function fcl() {
  curl --cacert /Users/sth/.certs/ca.pem --cert /Users/sth/.certs/dev.bbc.co.uk.pem $@
}

function candy() {
  curl --cacert /Users/sth/.certs/ca.pem --cert /Users/sth/.certs/dev.bbc.co.uk.pem "https://api.$1.bbc.co.uk/content/asset/news/$2" -i -H 'X-Candy-Platform: EnhancedMobile' -H 'X-Candy-Audience: domestic' -H 'Accept: application/json'
}

alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias tmux='TERM=screen-256color-bce tmux'
