#!/bin/sh -e
curl \
    --connect-timeout 15 \
    --silent \
    --show-error \
    --fail
    --socks5-hostname 127.0.0.1:1080
    https://google.com  >/dev/null