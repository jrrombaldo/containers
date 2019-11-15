# cloudflare
# openDNS
# google
echo "
nameserver 1.1.1.1
nameserver 208.67.222.222
nameserver 208.67.220.220
nameserver 8.8.8.8
" > /etc/resolv.conf

echo "DNS config adjusted..."