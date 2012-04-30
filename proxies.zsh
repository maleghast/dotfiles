echo $NETWORK_LOCATION

if [ $NETWORK_LOCATION = 'BBC On Network'  ]; then
        export http_proxy='http://www-cache.reith.bbc.co.uk:80'
        export https_proxy='http://www-cache.reith.bbc.co.uk:80'
        export ftp_proxy='ftp-gw.reith.bbc.co.uk:21'
        export socks_proxy='socks-gw.reith.bbc.co.uk:1085'

        export HTTP_PROXY='http://www-cache.reith.bbc.co.uk:80'
        export HTTPS_PROXY='http://www-cache.reith.bbc.co.uk:80'
        export FTP_PROXY='ftp-gw.reith.bbc.co.uk:21'
        export SOCKS_PROXY='socks-gw.reith.bbc.co.uk:1085'
else
        unset http_proxy
        unset https_proxy
        unset ftp_proxy
        unset socks_proxy

        unset HTTP_PROXY
        unset HTTPS_PROXY
        unset FTP_PROXY
        unset SOCKS_PROXY
fi;
