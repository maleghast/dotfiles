source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

function rb() {
  ruby-build $1 /opt/rubies/$1
}
