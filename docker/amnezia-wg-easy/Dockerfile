FROM ghcr.io/deckersu/amnezia-wg-easy:latest

RUN apk update && apk add --no-cache \
    linux-headers \
    wireguard-tools-wg-quick \
    wireguard-tools \
    iptables \
    iproute2 \
    curl \
    bash \
    openresolv \
    tcpdump \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# RUN addgroup -g 1099 wg-group && \
#     adduser -u 1099 -G wg-group -s /bin/sh -D wg-user

# USER wg-user

# ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/dumb-init", "node", "server.js"]
