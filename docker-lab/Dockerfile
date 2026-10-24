# Stage 1: Builder
FROM python:3.14.4-slim AS builder

WORKDIR /atlas-app

COPY requirements.txt .

RUN python -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime
FROM python:3.14.4-slim

WORKDIR /atlas-app

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY app.py .

EXPOSE 8080

CMD ["python", "app.py"]