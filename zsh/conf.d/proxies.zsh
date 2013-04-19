function mac_network_location() {
  echo "$(/usr/sbin/scselect 2>&1 | egrep "^ \* " | sed "s:.*(\(.*\)):\1:")"
}

function bbc_proxies_enable() {
  export http_proxy="http://www-cache.reith.bbc.co.uk:80"
  export https_proxy="http://www-cache.reith.bbc.co.uk:80"

  export socks_proxy="socks-gw.reith.bbc.co.uk:1085"

  export HTTP_PROXY="http://www-cache.reith.bbc.co.uk:80"
  export HTTPS_PROXY="http://www-cache.reith.bbc.co.uk:80"
  export FTP_PROXY="ftp-gw.reith.bbc.co.uk:21"
  export SOCKS_PROXY="socks-gw.reith.bbc.co.uk:1085"

  export no_proxy="localhost,127.0.0.1,*.sandbox.dev.bbc.co.uk,*.national.core.bbc.co.uk"
  export NO_PROXY="localhost,127.0.0.1,*.sandbox.dev.bbc.co.uk,*.national.core.bbc.co.uk"
}

function universal_proxies_disable() {
  unset http_proxy https_proxy socks_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY SOCKS_PROXY no_proxy NO_PROXY
}

function bbc_proxies_auto() {
  local network="`mac_network_location`"

  if [[ $network == *On* ]]; then
    bbc_proxies_enable
  else
    if [[ $network == *Off* ]] && [[ ! $http_proxy == *.bbc.co.uk* ]]; then
      # do nothing
    else
      universal_proxies_disable
    fi
  fi
}

if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$precmd_functions" == *bbc_proxies_auto* ]]; then
    precmd_functions+=("bbc_proxies_auto")
  fi
fi
