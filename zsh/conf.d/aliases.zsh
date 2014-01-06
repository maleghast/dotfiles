# Pipe my public key to my clipboard.
function pubkey() {
  cat /Users/sth/Dropbox/Certificates/SSH\ Keys/$@/id_rsa.pub | pbcopy
}

function keypair() {
  mkdir $@
  ssh-keygen -f ~/Dropbox/Certificates/SSH\ Keys/$@/id_rsa
  cat ~/Dropbox/Certificates/SSH\ Keys/$@/id_rsa.pub | pbcopy
}

function sha() {
  echo -n $@ | openssl sha
}

function md5() {
  echo -n $@ | openssl md5
}

function fcl() {
  curl --cacert $DEV_CA_PATH --cert $DEV_CERT_PATH $@
}

alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -U -e -m '$method'"
done

alias hosts="sudo $EDITOR /etc/hosts"
