source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

function rb() {
  ruby-build $1 /opt/rubies/$1
}
