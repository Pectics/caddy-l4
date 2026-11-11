ARG CADDY_VERSION=2.11.9
ARG CADDY_L4_VERSION=v0.1.2

FROM caddy:${CADDY_VERSION}-builder AS builder
ARG CADDY_VERSION
ARG CADDY_L4_VERSION
RUN xcaddy build v${CADDY_VERSION} \
    --with github.com/mholt/caddy-l4@${CADDY_L4_VERSION}

FROM caddy:${CADDY_VERSION}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
