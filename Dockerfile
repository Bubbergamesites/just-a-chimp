FROM python:3.12-slim
RUN pip install --no-cache-dir wisp-python
COPY --from=caddy:2 /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
CMD ["sh", "-c", "python -m wisp.server --host 127.0.0.1 --port 4000 --limits & exec caddy run --config /etc/caddy/Caddyfile"]
