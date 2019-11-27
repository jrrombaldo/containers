#!/bin/sh -e
curl \
    --connect-timeout 15 \
    --silent \
    --show-error \
    --fail \
    -x socks5h://127.0.0.1:1080 \
    https://google.com  >/dev/null