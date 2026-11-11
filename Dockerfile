ARG CADDY_VERSION=2.11.9
# No caddy-l4 release includes caddy.packetconns.layer4 yet;
# pin the master commit that registers the UDP packet conn wrapper.
ARG CADDY_L4_VERSION=eafc300ef23bcb2a28cc329a18e1e98bcd2b7cee

FROM caddy:${CADDY_VERSION}-builder AS builder
ARG CADDY_VERSION
ARG CADDY_L4_VERSION
RUN xcaddy build v${CADDY_VERSION} \
    --with github.com/mholt/caddy-l4@${CADDY_L4_VERSION}

FROM caddy:${CADDY_VERSION}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
