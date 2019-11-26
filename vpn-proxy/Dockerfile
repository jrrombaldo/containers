FROM    alpine:latest

ARG DANTE_VER=1.4.2
ARG DANTE_URL=https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz
ARG DANTE_SHA=4c97cff23e5c9b00ca1ec8a95ab22972813921d7fbf60fc453e3e06382fc38a7

ARG S6_OVERLAY_VERSION=v1.22.1.0


ENV VPN_USER=""
ENV VPN_PASS=""
ENV VPN_CRED /vpn-cred.txt

RUN     apk add --no-cache --virtual .build-deps \
            build-base \
            curl \
            linux-pam-dev && \
        install -v -d /src && \
        curl -sSL $DANTE_URL -o /src/dante.tar.gz && \
        echo "$DANTE_SHA */src/dante.tar.gz" | sha256sum -c && \
        tar -C /src -vxzf /src/dante.tar.gz && \
        cd /src/dante-$DANTE_VER && \
        # https://lists.alpinelinux.org/alpine-devel/3932.html
        ac_cv_func_sched_setscheduler=no ./configure && \
        make -j install && \
        cd / && rm -r /src && \
        apk del .build-deps linux-pam-dev build-base && \
        ls
#       installing overlay
RUN \
        apk add --no-cache linux-pam openvpn curl && \
        curl -J -L -o /tmp/s6-overlay-arm.tar.gz \
            https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz && \
        tar xzf /tmp/s6-overlay-arm.tar.gz -C /

COPY root/ /

EXPOSE  1080

ENTRYPOINT ["/init"]

HEALTHCHECK --interval=15s --start-period=2m --timeout=3s --retries=20 CMD /usr/local/bin/healthcheck.sh || exit 1
