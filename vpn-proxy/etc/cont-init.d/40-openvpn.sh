#!/usr/bin/with-contenv sh

# creating openvpn credentials file for a headless start
echo -e "${VPN_USER}\n${VPN_PASS}" > ${VPN_CRED}


exec s6-setuidgid root openvpn \
    --config /client.ovpn \
    --auth-user-pass ${VPN_CRED} \
    --log-append /var/log/openvpn.log \
    --daemon openvpn