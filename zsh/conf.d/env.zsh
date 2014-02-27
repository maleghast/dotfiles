# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make vim the default editor
export EDITOR="vim"

export TERM="screen-256color"

export GITHUB_USER="sthulb"

export PATH="/usr/local/share/npm/bin:/usr/local/bin:$PATH"

# Set language to British
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

export DEV_CA_PATH="/Users/sth/Documents/Certificates/BBC Developer/ca.pem"
export DEV_CERT_PATH="/Users/sth/Documents/Certificates/BBC Developer/dev.bbc.co.uk.pem"

export CC=gcc

if [ -d "/Applications/VMware Fusion.app" ]; then
  export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
fi

export HOMEBREW_CASK_OPTS='--appdir=/Applications --force'

export DOCKER_HOST='localhost:4243'
