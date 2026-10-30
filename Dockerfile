FROM python:3.12-slim
RUN pip install --no-cache-dir wisp-python
COPY --from=caddy:2 /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY start.sh /start.sh
CMD ["sh", "/start.sh"]