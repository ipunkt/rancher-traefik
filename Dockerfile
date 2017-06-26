FROM busybox

COPY traefik.toml /opt/traefik.toml
COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /opt/etc/traefik/ ; chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
