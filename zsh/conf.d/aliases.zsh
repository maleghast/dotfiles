# Pipe my public key to my clipboard.
function pubkey() {
  cat "$HOME/Documents/Certificates/SSH Keys/$@/id_rsa.pub" | pbcopy
}

function keypair() {
  mkdir -p "$HOME/Documents/Certificates/SSH Keys/$@"
  ssh-keygen -f "$HOME/Documents/Certificates/SSH Keys/$@/id_rsa"
  cat "$HOME/Documents/Certificates/SSH Keys/$@/id_rsa.pub" | pbcopy
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


function pem-p12() {
  openssl pkcs12 -export -in $1 -out $2 -passout pass:password
}

function p12-pem() {
  openssl pkcs12 -in $1 -out $2 -clcerts -nodes
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
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -U -e -m '$method'"
done

alias hosts="sudo $EDITOR /etc/hosts"

function mount() {
  hdiutil attach -mountpoint /Users/sth/Documents/Certificates ~/Google\ Drive/Certificates.dmg > /dev/null
}

function rr() {
  if [ $# -ne 1 ]; then
    echo "Please provide a network interface"
    return 0
  fi

  GATEWAY_ADDR=`netstat -nr | grep default | grep $1 | awk '{print $2}'`

  sudo route -n add 10.0.0.0/8 $GATEWAY_ADDR
}

function gif() {
  echo "Converting to MP4"

  name=`basename $@ .gif`
  mkdir -p /tmp/__gif
  convert "$@" /tmp/__gif/gif%05d.jpg > /dev/null 2>&1

  ffmpeg -r 10 -i /tmp/__gif/gif%05d.jpg $name.mp4 > /dev/null 2>&1
}
