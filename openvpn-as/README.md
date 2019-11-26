# openvpn-as

[![Build Status](https://travis-ci.org/jrrombaldo/openvpn-as.svg?branch=master)](https://travis-ci.org/jrrombaldo/openvpn-as)
[![](https://images.microbadger.com/badges/version/jrromb/openvpn-as.svg)](https://microbadger.com/images/jrromb/openvpn-as "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/jrromb/openvpn-as.svg)](https://microbadger.com/images/jrromb/openvpn-as "Get your own image badge on microbadger.com")

This is a containerisation of the OpenvpnAS server, it run the opensoruce version.
run with the following command:

```shell script
docker run -d \
    -e EXTERNAL_HOST="" \
    -e OVPN_PASS="changeme" \
    -e DNS_PRIMARY="1.1.1.1" \
    -e DNS_SECONDARY="8.8.8.8" \
    -p 8443:8443
    --privileged \
    jrromb/openvpn-as:latest
```

### Notes:
* Currently both server console, UDP VPN and TCP VPN are *all listening on port 8443*
* `EXTERNAL_HOST` represent the DNS/FQND used to access the server, if none specified the container will compute its internet IP at first starting time.
* `/openvpnas_config` all the serevr configuration and keys are stored on the this volume, if required to preserve/backup server config mount this volume with `-v <local_folder>/openvpnas_config` parameter. Other wise, it will not be persisted when the container is crashed.
