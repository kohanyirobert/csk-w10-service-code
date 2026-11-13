FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:0.11 /uv /bin/

WORKDIR /app
COPY . .
RUN uv sync --locked

EXPOSE 8080
CMD ["uv", "run", "--locked", "--no-sync", "python", "app.py" ]
