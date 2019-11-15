docker run -it --rm \
--name vpn \
--hostname vpn \
-v /Users/junicarl/Downloads/canada.ovpn:/client.ovpn \
-e VPN_USER=openvpn \
-e VPN_PASS=changeme \
-p